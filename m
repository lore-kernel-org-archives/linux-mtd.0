Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CBp-0002J5-OA
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:32:08 +0000
Received: by mail-wm0-x232.google.com with SMTP id r190so48428922wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 06:31:45 -0700 (PDT)
Subject: Re: [PATCH 3/4] mtd: spi-nor: aspeed: configure chip window on AHB bus
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-4-git-send-email-clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1ef778ad-30e1-d80a-aaf9-e987c9e23fed@gmail.com>
Date: Thu, 20 Apr 2017 15:30:41 +0200
MIME-Version: 1.0
In-Reply-To: <1492689397-4704-4-git-send-email-clg@kaod.org>
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
> The segment registers of the SMC controller provide a way to configure
> the mapping windows of the chips on the AHB bus. The settings are
> required to be correct when the controller operates in Command mode,
> which is the case for DMAs and the LPC mapping.
> 
> This tries to set the segment registers of each chip depending on the
> size of the flash device and depending on the previous segment
> settings, in order to have a contiguous window across multiple chips.
> 
> Unfortunately, the AST2500 SPI controller has a bug and it is not
> possible to configure a full 128MB window for a chip of the same
> size. The window size needs to be restricted to 120MB. This issue only
> applies to CE0.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
