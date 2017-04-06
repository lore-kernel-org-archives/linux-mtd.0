Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwD5p-0004Oj-KF
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 19:29:21 +0000
Received: by mail-wr0-x22a.google.com with SMTP id o21so49415197wrb.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2017 12:28:57 -0700 (PDT)
Subject: Re: [PATCH 05/10] mtd: spi-nor: Add support for Macronix mx66l1g45g
 spi flash
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-6-git-send-email-clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8901690a-4a04-374d-19f9-70ee3fdbc7ad@gmail.com>
Date: Thu, 6 Apr 2017 21:21:29 +0200
MIME-Version: 1.0
In-Reply-To: <1491497808-25487-6-git-send-email-clg@kaod.org>
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
> These modules are used on the OpenPOWER Witherspoon systems to hold
> the POWER9 host firmware image. The SPI_NOR_DUAL_READ flags is added
> for the Aspeed SoCs which do not support QUAD reads.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Completely unrelated, should be sent as a separate patch.

-- 
Best regards,
Marek Vasut
