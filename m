Received: from devonshire.teligenthost.com ([207.155.249.8])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zhPf-0007uz-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:11:07 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Booting from JFFS2 
Date: Tue, 15 May 2001 09:15:43 -0700
Message-ID: <001101c0dd5a$4afc0780$326c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <27752.989910645@redhat.com>
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


This is for a sh4-based board.  There are two boot loaders
available: lilo and ipl+sh.  From your answer, I assume
that none of the boot loader out there understands JFFS2
yet.

My next option is to partition the flash into three: (1)
bootloader, (2) ext2 for kernel/initrd, (3) JFFS2 for the
rest of the filesystem's mount points.

Thanks.
Bao

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Tuesday, May 15, 2001 12:11 AM
To: Bao C. Ha
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2



baoha@sensoria.com said:
> I would like to partition the Flash into two: (1) boot loader and  (2)
> JFFS2.  Can I put the kernel, zImage, and fs.gz on JFFS2,  and boot
> the kernel from there?

The answer to that question is entirely dependent on the bootloader you
use. But at the moment, I think there are no bootloaders which support this.

There are patches available for Compaq bootldr used on the iPAQ, which make
it capable of loading a kernel from a JFFSv1 filesystem. But nobody's yet
done JFFS2, AFAIK.

We're intending to add this support to RedBoot some time in the near
future, hopefully.

--
dwmw2
