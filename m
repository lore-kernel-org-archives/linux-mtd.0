Received: from port61.vestas.dk ([195.41.59.61] helo=cotas2.cotas.vestas.dom)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195jmj-000471-KS
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 11:04:57 +0100
From: Esben Nielsen <esn@cotas.dk>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
 "Jasmine Strong" <jasmine@regolith.co.uk>
Date: Wed, 16 Apr 2003 12:04:32 +0200
References: <20030415171123.GH7721@wohnheim.fh-wedel.de>
In-Reply-To: <20030415171123.GH7721@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Message-Id: <200304161204.32557.esn@cotas.dk>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
Subject: Re: Database on JFFS2?
Reply-To: esn@cotas.dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I appreciate that you look into my problem and get a good discussion out of it 
:-)

I did try to follow it and as far as I can see it JFFS2 _only_ writes to flash 
in the GC thread? That contradicts the manual page for fsync(): "fsync copies 
all in core parts of a file to disk, and waits  until  the device  reports  
that all parts are on stable storage."

I am not much into flash technology itself (NOR contra NAND), but I know that 
on our device one write erases and rewrites one block of 128k. Each block can 
only be erased between 1E5 and 1E6 times. We thus have to be carefull as our 
device have to live for 20 years (yes, that is what a promise our 
customers!).

If JFFS2 does do a real write on fsync() we will get too many physical writes 
unless we buffer our inserts/updates into one big transaction in the 
application layer above the database. On the other hand if JFFS2 doesn't 
commit changes we risc getting our database file inconsistant if we loose 
power in the middle :-(

Now in our application the most important thing is that our database file is 
self-consistant at reboot such we can get up running again. If we loose the 
last few inserts before the reboot we wont go out of buisness. The most 
optimal was if we could tweak sqlite to syncronice it's fsync with JFFS2 such 
the last written data resides purely in memory until we have enough to erase 
a full page on flash and then we sync it all. That way we can minimalize the 
number of writes and at the same time avoid inconsistant data at boot.

Another option was to have JFFS2 use battery backed up SRAM as temporately 
storage. fsync() would then work "correcty" by just writing to that SRAM. 
Is it in possible to do make JFFS2 use a specific part of memory as "cache" 
before the GC thread writes it to flash? Is it even possible to make JFFS2 
reestablish that cache at mount such no data would be lost if it was synced 
with the cache before a crash?

Esben

On Tuesday 15 April 2003 19:11, Jörn Engel wrote:
> On Tue, 15 April 2003 17:23:59 +0100, Jasmine Strong wrote:
> > On Tuesday, Apr 15, 2003, at 17:14 Europe/London, Jörn Engel wrote:
> > >On Tue, 15 April 2003 17:11:44 +0100, Jasmine Strong wrote:
> > >>Unless it would cause many erases, which would slow things down a
> > >>lot...
> > >
> > >Erases get triggered by garbage collection, which depends on the
> > >amount of data written, not the chunk size.
> >
> > yes.  I think my two points were actually the same point taken twice :-)
> > If you're only updating a few bytes of data you will end up writing
> > a large proportion of log control data.  That'll end up being
> > responsible for most of the erase traffic.
>
> Actually, that shouldn't matter too much. For comparison, I did some
> benchmarks using jffs2 (without compression) as a filesystem for a
> ramdisk.
>
> The benchmark wrote data to jffs2, deleted it and repeated this
> several times to remove statistical noise. Horrible results.
> Then I got a clue and added "sleep 6" after both writing and deleting,
> getting roughly twice the performance. Why?
>
> Under normal operation, the system is idle a lot and the garbage
> collector (GC) has plenty of time to clean up the mess you made. But
> the first benchmark was measuring a system without idle times, so all
> writes were waiting for GC to finally free some space. Wrong.
>
> Back to the Database:
> Even if you write data in very small chunks, the system should have
> enough free time to GC those fragments and reassemble them into larger
> chunks with less overhead, so this doesn't matter.
>
> Unless you permanently operate near the limit. Without the free time
> for GC, this does matter.
>
> > Still, if you need to be powerfail-safe, I can't see any way of not
> > doing this.
>
> Right.
>
> Jörn
