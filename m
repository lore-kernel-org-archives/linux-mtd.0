Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zhQr-0007vE-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:12:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001101c0dd5a$4afc0780$326c020a@SENSORIA> 
References: <001101c0dd5a$4afc0780$326c020a@SENSORIA> 
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 May 2001 17:16:29 +0100
Message-ID: <30807.989943389@redhat.com>
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
>  (1) bootloader, (2) ext2 for kernel/initrd, (3) JFFS2 for the rest of
> the filesystem's mount points.

Why ext2 for the second partition? Why not just 
 1. Bootloader
 2. Kernel
 3. JFFS2

--
dwmw2
