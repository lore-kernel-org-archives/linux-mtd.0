Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195kH6-0004Ja-4A
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 11:36:20 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDF00MV5MRUJ8@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 16 Apr 2003 12:35:55 +0200 (MEST)
Date: Wed, 16 Apr 2003 13:35:50 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200304161204.32557.esn@cotas.dk>
To: esn@cotas.dk, =?iso-8859-1?q?J=F6rn=20Engel?=
	<joern@wohnheim.fh-wedel.de>, Jasmine Strong <jasmine@regolith.co.uk>
Message-id: <200304161335.50367.tglx@linutronix.de>
MIME-version: 1.0
References: <20030415171123.GH7721@wohnheim.fh-wedel.de>
 <200304161204.32557.esn@cotas.dk>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: Database on JFFS2?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 16 April 2003 12:04, Esben Nielsen wrote:
> I did try to follow it and as far as I can see it JFFS2 _only_ writes to
> flash in the GC thread? That contradicts the manual page for fsync():
> "fsync copies all in core parts of a file to disk, and waits  until  the
> device  reports that all parts are on stable storage."

No, JFFS2 writes all data immidiately to the FLASH chip. GC takes care of 
reusing blocks, where obsolete information is stored. This happens, if you 
change the contents of a file. This space is garbage collected at some point 
and valid nodes, which reside on the same block are moved to a different 
block. If the block, which is gc'ed contains no more valid information it is 
erased and can be used for writing again.

> I am not much into flash technology itself (NOR contra NAND), but I know
> that on our device one write erases and rewrites one block of 128k. Each
> block can only be erased between 1E5 and 1E6 times. We thus have to be
> carefull as our device have to live for 20 years (yes, that is what a
> promise our customers!).

Erase is always a full block (e.g. 128K), but writes happen in small chunks. 

Have you really thought about the numbers ?
20 years, 365 days
Erasecycles max. 10E5:	13,6 erases per day
Erasecycles max. 10E6:	136 erases per day

I assume a compressed database size of 1MB and a FLASH size of 8MB.
Even if you have to write the full database every time you will be allowed
to do it 
108,8 times for max. Erasecycles of 10E5 and
1088 times for  max. Erasecycles of 10E6

which means a write every
13 minutes  for max. Erasecycles of 10E5 and
1,3 minutes  for max. Erasecycles of 10E6

assumed, that your device operates 20 years, 365 days/year and 24h /day.

If you buffer your small changes in sqlite or on a ramfs, which maybe located 
in a buffered SRAM, you can reduce the write cycles further and expand the 
lifetime beyond your retirement age. :)

> If JFFS2 does do a real write on fsync() we will get too many physical
> writes unless we buffer our inserts/updates into one big transaction in the
> application layer above the database. On the other hand if JFFS2 doesn't
> commit changes we risc getting our database file inconsistant if we loose
> power in the middle :-(

JFSS2 does no write on fsync, as data are already written.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
