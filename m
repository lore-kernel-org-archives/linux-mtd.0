Received: from eppat.qlogic.com ([63.170.40.2] helo=EPEXCH01.qlogic.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D9TI6-00058b-GA
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 14:25:51 -0500
Received: from swahl-linux.qlogic.org (localhost.localdomain [127.0.0.1])
	by swahl-linux.qlogic.org (8.12.8/8.12.8) with ESMTP id j2AJPhj8007701
	for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2005 13:25:44 -0600
Received: (from swahl@localhost)
	by swahl-linux.qlogic.org (8.12.8/8.12.5/Submit) id j2AJPhdB006709
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 13:25:43 -0600
Date: Thu, 10 Mar 2005 13:25:19 -0600
From: Steve Wahl <steve.wahl@qlogic.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310192519.GC18903@qlogic.com>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310152212.GB4910@synertronixx3>
	<Pine.LNX.4.58.0503101554220.5450@phoenix.infradead.org>
	<20050310164024.GD4910@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050310164024.GD4910@synertronixx3>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konsti,

Just a suggestion: Copying, DD, mkfs.jffs2 all will write large
buffers to your flash, probably aligned on nice address boundaries,
too.  The filesystem *may* be writing small buffers of wierd lengths
and perhaps not well aligned; and this may be what causes your
problems to surface.

[ I don't actually know what kind of writes and reads the filesystem
does. I subscribe to this list for the MTD half, not the JFFS
part. :-) ]

Look real closely at bursting with odd lengths and/or alignment; see
if JFFS2 is doing any of these, and then see if that causes your
hardware to react badly.

Since your raw dumps of the flash after the fact appear good(?), I'd
concentrate on the read operations.  (If the dumps were bad, I'd look
at the writes.)

If your hardware screws up with unusual alignment, well, it's not all
that rare of a bug to find.

--> Steve

On Thu, Mar 10, 2005 at 05:40:24PM +0100, Konstantin Kletschke wrote:
> Am 2005-03-10 15:54 +0000 schrieb Artem B. Bityuckiy:
> 
> > OK, why does this mean JFFS2 is guilty of this? Why don't you suspect your 
> > drivers? Why don't you suspect that you flashed your (say, correct) image 
> > incorrectly?
> 
> The image is created in different ways, copied, dd'ed, mkfs.jffs2. Same
> error picture.
> All other constellations in software on this Hardware are working
> perfect.
> Kernel XIP out of this Flash device with this settings runs perfect.
> 
> No matter if partitions are cat'ed or dd'ed or files copied and such:
> identical md5sums read back. 
> 
> I tested cramfs as rootfilesystem which works ok also.
> 
> > Just configure your kernel properly: switch on the "Test driver using RAM" 
> > (MTD_MTDRAM) option in your kernel configuration. Type "modprobe mtdram" 
> > if you have configured it as the kernel module.
> > 
> > If you do this your JFFS2 will work over emulated 4MiB in-RAM flash and 
> > this will help you to exclude driver problems.
> 
> No clue until now. On Host-PC or on the embedded system?
> 
> Konsti
> 
> -- 
> GPG KeyID EF62FCEF
> Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
