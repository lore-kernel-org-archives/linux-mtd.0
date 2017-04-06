Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwD5e-0004OR-RJ
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 19:29:08 +0000
Received: by mail-wr0-x230.google.com with SMTP id t20so77683863wra.1
 for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2017 12:28:46 -0700 (PDT)
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
Date: Thu, 6 Apr 2017 21:28:44 +0200
MIME-Version: 1.0
In-Reply-To: <1491497808-25487-11-git-send-email-clg@kaod.org>
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

On 04/06/2017 06:56 PM, Cédric Le Goater wrote:
> This is only for SPI controllers as U-Boot should have done it already
> for the FMC controller using DMAs.
> 
> The algo is based on the one found in the OpenPOWER pflash tool. It
> first reads a golden buffer at low speed and then performs reads with
> different clocks and delay cycles settings to find the fastest
> configuration for the chip.
> 
> It can be deactivated at boot time with the kernel parameter :

Something tells me this is likely gonna be pretty flaky and might lead
to unreliable configurations. The hardware manufacturer should be able
to determine the limits of the hardware and those should be put into DT
at manufacturing time IMO.

-- 
Best regards,
Marek Vasut
