Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4WDq-00077f-Bq
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 08:23:29 +0000
Date: Thu, 14 May 2009 10:23:11 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
Message-ID: <20090514102311.56495bb0@hskinnemoen-d830>
In-Reply-To: <200905132212.11923.david-b@pacbell.net>
References: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<200905132212.11923.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org,
	Troy Kisky <troy.kisky@boundarydevices.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell wrote:
> On Wednesday 13 May 2009, Troy Kisky wrote:
> > atmel should not need to override default  
> 
> Doesn't this break compatibility with every system now
> in the field?  As in, "install a new kernel, trash all
> the data now in your NAND flash"??

I also suspect it will break hardware ECC. The ECC controller is a bit
picky about the OOB layout, which is why the defaults were overriden in
the first place.

Haavard
