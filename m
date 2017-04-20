Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CBm-0002IN-Sh
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:32:08 +0000
Received: by mail-wr0-x22e.google.com with SMTP id z109so35743662wrb.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 06:31:42 -0700 (PDT)
Subject: Re: [PATCH 2/4] mtd: spi-nor: aspeed: add support for SPI dual IO
 read mode
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-3-git-send-email-clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Robert Lippert <roblip@gmail.com>,
 Robert Lippert <rlippert@google.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9f2f9272-bd1b-78ba-6752-c1a3ab7a4d67@gmail.com>
Date: Thu, 20 Apr 2017 15:28:41 +0200
MIME-Version: 1.0
In-Reply-To: <1492689397-4704-3-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/20/2017 01:56 PM, Cédric Le Goater wrote:
> From: Robert Lippert <roblip@gmail.com>
> 
> Implements support for the dual IO read mode on aspeed SMC/FMC
> controllers which uses both MISO and MOSI lines for data during a read
> to double the read bandwidth.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>
> [clg: adapted to mainline driver ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
