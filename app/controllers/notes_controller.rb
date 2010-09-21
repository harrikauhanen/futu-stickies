class NotesController < ApplicationController
  # GET /notes
  # GET /notes.xml
  def index
    @notes = Note.all.order_by([:created_at, :desc]).limit(100)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
    # find_primes
    
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to(notes_url, :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to(notes_url, :notice => 'Note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(notes_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private

  # http://julesberman.blogspot.com/2008/04/generating-prime-numbers-in-ruby-python.html
  def find_primes
    state = Numeric.new
    print "2,3,"
    (4..50000).each do
       |i|
       (2..(Math.sqrt(i).ceil)).each do
          |thing|
          state = 1
          if (i.divmod(thing)[1] == 0)
             state = 0
             break
          end
       end
       print "#{i}\," unless (state == 0)
    end
  end
  
end
