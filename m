Received: from ms-smtp-03-smtplb.tampabay.rr.com ([65.32.5.133]
	helo=ms-smtp-03.tampabay.rr.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLu5u-0002eF-5W
	for linux-mtd@lists.infradead.org; Fri, 07 May 2004 02:24:06 +0100
Received: from linux.local (6532247hfc158.tampabay.rr.com [65.32.247.158])
	i471NJuI026397	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2004 21:23:19 -0400 (EDT)
From: Burt Bicksler <bbick@ix.netcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1083894588.2408.30.camel@linux.local>
Mime-Version: 1.0
Date: Thu, 06 May 2004 21:49:49 -0400
Content-Transfer-Encoding: 7bit
Subject: mkfs.jffs2 question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've just started working with JFFS2 and I have a couple of questions. 
First some details:

Kernel 2.4.25 running on AMD Au1000 based system with AMD Flash chip.

Using latest zlib from the zlib site.  Currently building mkfs.jffs2 on
SuSE 8.2 (Intel) platform.  Other tools (e.g. fcp) built cross-compiled
for mips32 (little endian).

MTD tools that I've tried:

Snapshot from 'snapgear' mkfs.jffs2 version 1.2 according to the source
file.

This one seems to build a JFFS2 file system that I can boot and access
with no problems.  I fixed problems getting it to build / link with 
the latest zlib version.

The one issue I see with this build is that even though I have specified
a devices file and I can see the device nodes when running jffs2dump on
the created image file, when I mount the file system from Flash the /dev
directory is empty!  

The only thing that spit out during the creation of the file system was
a message about /dev not having a parent directory so it was being 
skipped. But the /dev directory (and the node files from the devices.txt
 file WERE in the resulting image file as mentioned above).

It's probably something that I'm missing on the command line or in the 
file (but I just copied and tweaked the example from the util 
directory).

The other snapshot that I'm working with is the one from 04/30/2004. 
The mkfs.jffs2 version from source code is 1.40.

So far I haven't been able to create a JFFS2 file system that I can boot
 or mount with mkfs.jffs2 built from this snapshot.

Also, mkfs.jffs2 from this snapshot also whines about the /dev directory
not having a parent when building the image.  And the final difference
 is that the created image is nearly twice the size of that built with
 the mkfs.jffs2 from the older snapshot.

I'm using the same current zlib library in both cases, and tweaked the
 source so that it will build/link with zlib.

I suspect that part of the issue with the latest snapshot build may be
 that I'm still running with the older JFFS2 support that is part of the
 2.4.25 Kernel.

My questions:
1) Is there a note somewhere that I've missed saying what snapshots are
reasonably stable so that I know which one to work with for a 
semi-production release?

2) Has anyone else had a similar issue with the 04/30/2004 snapshot as 
far as the created image not mounting and being much larger than that 
created with older snapshots?

I've looked back through the archives and so far have not been able to 
locate anything related to the latest snapshot as applies to what I'm 
seeing.

Thanks,
Burt
