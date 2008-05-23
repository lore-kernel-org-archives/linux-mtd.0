Received: from mail07.syd.optusnet.com.au ([211.29.132.188])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzQuu-0007wO-6t
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 06:38:16 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 23 May 2008 16:38:04 +1000
Message-Id: <1211524684.6203.13.camel@torchwood>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Fri, 2008-05-23 at 08:26 +0200, Richard Genoud wrote:
> I didn't have those kind of problems with the sam9263-ek
> have you tried to erase the device, mount it with jffs2 or yaffs2,
> write a file, unmount, mount and read back the file ?

Yup.  I have used the examples from linux4sam.org, which use a jffs2
file system.

The NAND flash was erased and root jffs2 image written using the SAM-BA
utility, then boot the kernel to use this as its rootfs.  It mounts ok
to begin with, then I get heaps of jffs2 warnings and finally a kernel
bug, I think at fs/jffs2/file.c:251 (I don't have the system here at
home.)

What version of kernel, patches and compiler are you using?

I did try briefly with yaffs2, but I don't think the problem is in the
file system, more the underlying access to the NAND flash.  Maybe in the
chip timing, or something.  I haven't yet investigated that properly.

Regards,
James.
