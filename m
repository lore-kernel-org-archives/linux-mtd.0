Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rM7v-0002T4-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 17:22:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0110101821350.18912-100000@lxserver.deltes.cz> 
References: <Pine.LNX.4.21.0110101821350.18912-100000@lxserver.deltes.cz> 
To: martin.kula@deltaes.cz
Cc: linux-mtd@lists.infradead.org
Subject: Re: Eraseblock size in jffs2 ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 10 Oct 2001 17:31:38 +0100
Message-ID: <22822.1002731498@redhat.com>
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

martin.kula@deltaes.cz said:
>  1. How can I set eraseblock size for mkfs.jffs2 ?
> I have DoC 24MB and line in /proc/mtd is: dev:    size   erasesize
> name mtd0: 01800000 00002000 "DiskOnChip 2000"

	mkfs.jffs2 -e 0x2000


> 2. Must I use erase command when I create jffs2 on the DoC ?

You need to erase the device first. Use the 'eraseall' utility:
	eraseall /dev/mtd0
Then you can use dd to put the image on the device.

Unfortunately, JFFS2 doesn't yet work on the DiskOnChip, because it uses 
NAND flash. JFFS v1 should probably work, or you can fix up JFFS2 to work 
too.

--
dwmw2
