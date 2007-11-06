Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IpXtb-0001Ps-FJ
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 18:31:53 -0500
Date: Wed, 7 Nov 2007 00:26:51 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: [PATCH] MTD: fix s3c2410 error correction
Message-ID: <20071106232650.GI25953@lazybastard.org>
References: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
	<f383264b0710251116v8847c64i871ba7675106e04f@mail.gmail.com>
	<f383264b0711060909r43cd9d38t2653785cb79e3a65@mail.gmail.com>
	<20071106181121.GH25953@lazybastard.org>
	<f383264b0711061434gc0d9f44ibcefae70da1fa70f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f383264b0711061434gc0d9f44ibcefae70da1fa70f@mail.gmail.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 November 2007 14:34:54 -0800, Matt Reimer wrote:
> 
> The explanation is that the s3c hardware ECC gives us the bits in that
> order, and this order is what Samsung recommends.
> 
> "For more information, compare the s3c2440a or s3c2410 manuals with
> page 8 of the following documentation:
> http://www.samsung.com/global/business/semiconductor/products/flash/downloads/applicationnote/ecc_algorithm_for_web_512b.pdf

Can you send me a copy of those manuals or a URL?

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix,
I am limited only by my knowledge.
-- Peter J. Schoenster
