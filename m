Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VY2u-0008I8-1l
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 15:48:20 +0100
Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 19VXbR-00052Q-00
	for linux-mtd@lists.infradead.org; Thu, 26 Jun 2003 15:19:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: adaly@kwic.com
In-Reply-To: <jUsT.aNoTheR.mEsSaGe.iD.10566364287676@webmail.kwic.com>
References: <jUsT.aNoTheR.mEsSaGe.iD.10566364287676@webmail.kwic.com>
Message-Id: <1056637156.27553.183.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 26 Jun 2003 15:19:17 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: 2 mtd devices with DiskOnChip or
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-26 at 15:06, Alan Daly wrote:
> My question is how do I either:
> a) create 2 mtd devices with DiskOnChip
> (I found an old patch http://pficheux.free.fr/eyrolles/linux_embarque/docs_externes/jffs2_on_doc.html)

Oooh; thanks -- I'd forgotten about this long ago.

> b) boot the DiskOnChip using just JFFS2

I want this working in the long run -- indeed even the the medium term.
Since JFFS2 is already working in eCos, I think I'd be inclined to put
RedBoot into the DiskOnChip as firmware instead of Grub, and add the
appropriate DiskOnChip hardware support to eCos/RedBoot.

> This build had some issues being hard powered on and off. 

Just the normal issues you'd expect for using ext2? Or bugs in the NFTL
driver? The former are boring; the latter would interest me.

> /dev/mtd0 -> /dev/nftla -> /dev/nftla1 /boot ext2 1.5 MB (read-only)
> /dev/mtd1 (/dev/mtdblock1)  / (root) jffs2 14.5 MB.
> 
> I thought that this way:
> 1) I can still use the grub_firmware
> 2) not worry about the ext2 partition as it is mounted read-only
> 3) still get the benifits of jffs2 on the volatile data.

That makes sense. The partitioning bits of the patch you found should
give you this, I'm just about to play with the other details about
JFFS2/NAND on DiskOnChip anyway, as it happens.

-- 
dwmw2
