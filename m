Received: from fed1rmmtao01.cox.net ([68.230.241.38])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ehvsp-00036Z-LN
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2005 16:22:32 -0500
Received: from [192.168.123.165] (really [68.7.81.85]) by fed1rmmtao01.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051201212148.ZLCX15695.fed1rmmtao01.cox.net@[192.168.123.165]>
	for <linux-mtd@lists.infradead.org>; Thu, 1 Dec 2005 16:21:48 -0500
From: rick adams <rgadams@cox.net>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1EhVJd-0007G5-8R@canuck.infradead.org>
References: <E1EhVJd-0007G5-8R@canuck.infradead.org>
Content-Type: text/plain
Date: Thu, 01 Dec 2005 12:22:59 -0800
Message-Id: <1133468579.16137.152.camel@laptop.sandiego.IdealSolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: mounting jffs2 image on nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-11-30 at 12:00 -0500, linux-mtd-request@lists.infradead.org
wrote:
> Message: 2
> Date: Wed, 30 Nov 2005 10:06:20 +0100
> From: "David Huelves" <david.huelves@negone.com>
> Subject: mounting jffs2 image on nand.
>
>  we have create
> the image using mkfs.jffs2 on a i386 host computer (mkfs.jffs2 -d
> <root_dir> -e 16384 <image file>) our target is PXA255 and ST

When you run mkfs.jffs2 on an 1386 host it makes a file system for the
i386 architecture and kernel and jffs version on the host. This may not
be appropriate for your target system. If you run the utility on the
host the utility needs to be for your target and jffs version. Just like
the gcc compiler. You wouldn't expect an executable built to run on the
i386 host to run on the target. But you can run a gcc cross compiler on
the host to generate an executable that will run on the target. If you
don't have a host utility for your target see the two suggestions below.

>     If we do such with an ext3 everything works fine.

I assume from this statement that you can NFS mount a ext3 root file
system on the target. If this is true here are two ways to create your
jffs2 file system.
1) With the root file system NFS mounted, login to the target as root
and run the target version of mkfs.jffs2 on the target. Then use the
generated file to write to flash.
2) With the root file system NFS mounted and an erased JFFS2 file system
mounted (not as root file system). Login to the target as root and copy
the root file system from the NFS mount to the jffs2 mount. I'd use the
cp -a command. The copy command will use the MTD/jffs2 layer to compress
the files when it writes to a jffs2 partition.

Which one is "better" depends on several issues that are dependent on
your installation and personnel preference. I leave that up to you to
decide.

Rick Adams
