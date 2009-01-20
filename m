Received: from 89.6b.364a.static.theplanet.com ([74.54.107.137]
	helo=cathcart.site5.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPB7T-0002Fq-Hi
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 07:33:57 +0000
From: Mike Rapoport <mike@compulab.co.il>
To: eric.miao@marvell.com
Subject: Re: [PATCH] MTD: NAND: pxa3xx_nand: allow building as module
Date: Tue, 20 Jan 2009 09:33:45 +0200
Message-Id: <1232436828-15176-1-git-send-email-mike@compulab.co.il>
In-Reply-To: <f17812d70901191916u3891547ds393942a4e444a351@mail.gmail.com>
References: <f17812d70901191916u3891547ds393942a4e444a351@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is updated version together with a patch that allows platform to
keep NAND flash controller settings defined by the bootloader.


--
Sincerely yours,
	Mike.
