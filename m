Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkaYW-0003hl-LR
 for linux-mtd@lists.infradead.org; Thu, 15 Sep 2016 17:34:37 +0000
Received: by mail-pf0-x244.google.com with SMTP id n24so2473221pfb.3
 for <linux-mtd@lists.infradead.org>; Thu, 15 Sep 2016 10:34:16 -0700 (PDT)
Subject: Re: [PATCH v6, 8/8] spi: iproc-qspi: Add Broadcom iProc SoCs support
To: Kamal Dasu <kdasu.kdev@gmail.com>, broonie@kernel.org,
 linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com,
 yendapally.reddy@broadcom.com
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
 <1472076269-4731-9-git-send-email-kdasu.kdev@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8e2f7aaa-3563-1b46-1e2d-7c98ce6f5559@gmail.com>
Date: Thu, 15 Sep 2016 10:34:12 -0700
MIME-Version: 1.0
In-Reply-To: <1472076269-4731-9-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

On 08/24/2016 03:04 PM, Kamal Dasu wrote:
> This spi driver uses the common spi-bcm-qspi driver and implements iProc
> SoCs specific interrupt controller. The common driver now calls the SoC
> handlers when present. Adding support for both muxed l1 and unmuxed interrupt
> sources.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>

I think this patch should be applied by you as well, since it touches
the SPI driver exclusively. If you are still reviewing it, sorry for the
nag.
-- 
Florian
