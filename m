Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAbyP-0001Du-QQ
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 19:26:37 -0400
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IM40080514072@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 08:26:24 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0IM40087K13ZIL@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 08:26:24 +0900 (KST)
Date: Thu, 01 Sep 2005 08:26:24 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <4315BD10.80209@gmail.com>
To: 'Bernhard Priewasser' <priewasser@gmail.com>
Message-id: <0IM40087L13ZIL@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND: Update OMAP OneNAND mapping using device driver
 model
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

In previous way. we have to modify omap-onenand.c file itself. and it is
difficult to adapt another omap platform.

But each platform has some different partition configurations and
chip-select.

e.g., OSK use CS2 as OneNAND, But my custom board use CS3. 

So I move the partition information to each platform as NOR does

e.g., linux/arm/arch/mach-omap1/board-*.c

Now we only modify each platform configuation file.

Regrads,

Kyungmin Park

> -----Original Message-----
> From: Bernhard Priewasser [mailto:priewasser@gmail.com] 
> Sent: Wednesday, August 31, 2005 11:22 PM
> To: kyungmin.park@samsung.com
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: [PATCH] OneNAND: Update OMAP OneNAND mapping 
> using device driver model
> 
> Hi Kyungmin,
> 
> what are the advantages in opposite to the existing way, e.g. (why) 
> shall I use it for "porting" the OneNAND stuff to another board?
> 
> Regards,
> Bernhard
> 
> 
