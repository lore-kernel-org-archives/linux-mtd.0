Received: from sheffield.teligenthost.com ([207.155.253.8])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zhy3-0007yg-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:46:40 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Booting from JFFS2 
Date: Tue, 15 May 2001 09:49:46 -0700
Message-ID: <000001c0dd5f$0d818ec0$326c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <32497.989944275@redhat.com>
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

Actually, using the JFFS2 as root will make our life simpler.
We will save on the Ram.

This is great suggestion!

Thanks.
Bao

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Tuesday, May 15, 2001 9:31 AM
To: Bao C. Ha
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2 



baoha@sensoria.com said:
>  I am looking for an easy way to update the kernel and the fs image.
> Ext2 will allow me to mount it, cp/rm the compressed files: linux.gz
> and initrd.gz, umount it and reboot. 

You shouldn't need an initrd - why can't the kernel use the JFFS2 as root 
filesystem? And you can put a kernel onto the flash partition directly, 
without having to use a filesystem.

--
dwmw2
