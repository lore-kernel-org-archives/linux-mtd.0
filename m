Received: from tele-post-20.mail.demon.net ([194.217.242.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D6XP-0006Ph-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 16:38:32 +0100
Reply-To: <chris.read@clrassociates.co.uk>
From: "Chris Read" <chris.read@clrassociates.co.uk>
To: "'Vipin Malik'" <vipin@embeddedlinuxworks.com>,
   "'Abraham vd Merwe'" <abraham@2d3d.co.za>
Cc: "'MTD for Linux'" <linux-mtd@lists.infradead.org>
Subject: RE: safe flash filesystem
Date: Thu, 21 Jun 2001 16:36:27 +0100
Message-ID: <001601c0fa67$f0097120$4001a8c0@clrassociates.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <5.1.0.14.0.20010621094855.00a87480@mail.spewey.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I would also be very interested in this.

The ability to retain consistency after multiple power outages
is crucial to many of the types of project upon which I work.

The problem can be quite complex if you get a power fail in a garbage
collection started as a result of a power fail during a previous GC.

Chris Read
CLR Associates Limited

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Vipin Malik
> Sent: Thursday, June 21, 2001 4:05 PM
> To: Abraham vd Merwe
> Cc: MTD for Linux
> Subject: Re: safe flash filesystem
> 
> 
> 
> >
> >That's exactly what I've started writing today (:
> 
> Have you written a spec for it?
> 
> >I don't know if merging something like this with jffs2 would 
> solve the
> >problem like you said. I was more thinking of a completely 
> different user
> >MTD driver to provide an uncached block device and slap a 
> file system on top
> >of that. Or we can sync() all the time from the file system.
> 
> Nooooo.... ;)
> 
> JFFS2 already provides for:
> 
> 1. Interface to MTD
> 2. Flash wear levelling
> 3. Compression/decompression on the fly
> 4. "always sync()" data to flash before your write() returns 
> functionality
> 5. handling of erase paritions, GC, a file system interface etc.
> 6. tested for power fail reliability of the fs metadata.
> 7. Extensive usage by others even if they do not need this (our) 
> functionality- hence minimal hidden bugs.
> 
> My initial feel is that I really don't think that reinventing 
> the wheel is 
> the right answer.
> What we need is a "layer" on top of JFFS2 to provide the 2 
> features that it 
> lacks. Namely:
> 
> 1. Roll back and recover to last data if your write did not 
> complete and 
> power failed
> 2. 0 latency writes. Reads are no problem as they can always 
> be cached in 
> memory by reading the entire (it's not a database) database 
> on startup.
> 
> Alan Cox called this "transactional level" functionality.
> 
> An implementation based on a transaction cache solves the 
> issue of having 
> to duplicate all the members and CRC them thus supporting 
> quite a large 
> database without the need for twice the space on the flash 
> device, as well 
> as the issue of "roll back and recover" or "complete 
> transaction" on the 
> next power up if the complete transaction is available. There 
> is a reason 
> that transactional logs are the preferred choice even for 
> large databases 
> that need to support fail safe.
> 
> 
> >I have to agree that it's probably better to write a 
> library/utilities first
> >to do a preliminary thing. That way we'd get a functional 
> thing quite fast
> >and figure out what we did wrong in the first place.
> 
> My thoughts exactly.
> 
> 
> > > Maybe you may want to subscribe to the development list on the
> > > www.EmbeddedLinuxWorks site and we can take this 
> discussion there. I am
> >
> >Where do I subscribe?
> 
> http://www.embeddedlinuxworks.com/lists.html
> 
> 
> 
> > > looking for user input to define the feature set of this 
> "config system"
> > > (not database :) And I want to make it LGPL (if it does 
> become a lib or
> > > task) so that users can link to it without releasing the 
> source of their
> > > own code.
> >
> >I'm in the fortunate position of being able to work on this 
> fulltime for
> >the next week or so, so if we can figure out a useful 
> specification for this
> >in a short time, I'm really keen on helping to implement 
> this and LGPL/BSD
> >license is just fine.
> 
> That suits me just fine. We need to start working on a spec 
> first. Maybe a 
> clearly defined requirement spec, then a design document. If 
> you like I can 
> elaborate on the above thoughts a bit and start something- or 
> feel free to 
> send me something if you like.
> 
> 
> > > I can't believe that you and I are the only folks that may be 
> > interested in
> > > this. Maybe there is an existing solution- we just don't 
> know about it- or
> > > other's have not thought about this issue just yet ;)
> >
> >That's why I mailed here in the first place :P
> 
> 
> But I haven't heard from anyone else yet :(
> 
> Regards,
> 
> Vipin
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
