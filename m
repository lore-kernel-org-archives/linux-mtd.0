Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zhf9-0007wz-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:27:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001201c0dd5c$210d8dc0$326c020a@SENSORIA> 
References: <001201c0dd5c$210d8dc0$326c020a@SENSORIA> 
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 May 2001 17:31:15 +0100
Message-ID: <32497.989944275@redhat.com>
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

baoha@sensoria.com said:
>  I am looking for an easy way to update the kernel and the fs image.
> Ext2 will allow me to mount it, cp/rm the compressed files: linux.gz
> and initrd.gz, umount it and reboot. 

You shouldn't need an initrd - why can't the kernel use the JFFS2 as root 
filesystem? And you can put a kernel onto the flash partition directly, 
without having to use a filesystem.

--
dwmw2
