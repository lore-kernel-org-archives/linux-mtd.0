Received: from dsl-64-129-131-125.telocity.com
	([64.129.131.125] helo=mir.outpostsentinel.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dI96-0000p5-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 21:49:56 +0000
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: "Ian" <Relativity@HumanHeuristic.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Kerlen 2.4.13 and ramdisks
Date: Tue, 19 Feb 2002 17:01:00 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKKEILCDAA.cfowler@outpostsentinel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200202192150.HAA24884@singularity.tronunltd.com>
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

Ian,

loopback would not allow me to write to the image while running it.  Making
the flash (upgrade) process more difficult.  The FS is ext2 and I do not use
mount.

The only way the kernel can mount this is by me putting it in memory first.
The only way to do that is with initrd.  It owkrs when initrd only places
that data there.  When I try to download the *same* data from the network
and put there it craps out.  I have to download the data first before I can
place it in /dev/ram7.  TO do that I mount a ram fs at a upper limit of
32mb.  Download the file there then place it in /dev/ram7.  Just by using
that memory as temporary storeage I'm haing problems.  I've read posts that
state that certain 2.4.X kernels have problems repecting the boundaries of a
ramdisk.  They tend to overwrite those areas when needing memory.



lilo.conf:
....
   root=/dev/ram7

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ian
Sent: Tuesday, February 19, 2002 4:51 PM
To: Chris Fowler
Cc: linux-mtd@lists.infradead.org
Subject: Re:Kerlen 2.4.13 and ramdisks



If you have loopback support compiled in you can mount it directly through
the loopback driver, without creating a ramdisk ...

What was the error that mount gave?  You probably only need to specify
the "-o" parameter ... mount doesn't usually detect fancy filesystems ...


  ----- Original Message -----
>From: "Chris Fowler" <cfowler@outpostsentinel.com>
>To: <linux-mtd@lists.infradead.org>
>Subject:  Kerlen 2.4.13 and ramdisks
>Date: Tue, 19 Feb 2002 10:33:33 -0500
>
> You guys might have ran across a ramdisk problem.  I have a feeling that
kernel 2.4.13 is
not respecting my ramdisks.
>
>
> dd if=/etc/user.img of=/dev/ram6
>
> mount /dev/ram6  fails.
>
>
> Is this a problem?
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
