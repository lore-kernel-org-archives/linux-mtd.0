Received: from renown.teligenthost.com ([207.155.250.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zhcV-0007wZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:24:23 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Booting from JFFS2 
Date: Tue, 15 May 2001 09:28:51 -0700
Message-ID: <001201c0dd5c$210d8dc0$326c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <30807.989943389@redhat.com>
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

I am looking for an easy way to update the kernel and
the fs image.  Ext2 will allow me to mount it, cp/rm
the compressed files: linux.gz and initrd.gz, umount
it and reboot.

It is probably not much different from flashing the
files on the JFFS2 partition then.  And initrd.gz
can be stored on the JFFS2 since the kernel knows
how to access it during bootup.

Thanks.
Bao

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Tuesday, May 15, 2001 9:16 AM
To: Bao C. Ha
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2 




baoha@sensoria.com said:
>  (1) bootloader, (2) ext2 for kernel/initrd, (3) JFFS2 for the rest of
> the filesystem's mount points.

Why ext2 for the second partition? Why not just 
 1. Bootloader
 2. Kernel
 3. JFFS2

--
dwmw2
