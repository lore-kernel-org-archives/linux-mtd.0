Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1NBX-0008Mg-BR
 for linux-mtd@lists.infradead.org; Sat, 06 Jun 2015 23:07:28 +0000
Received: by obbqz1 with SMTP id qz1so58349081obb.3
 for <linux-mtd@lists.infradead.org>; Sat, 06 Jun 2015 16:07:05 -0700 (PDT)
Message-ID: <55737D16.6020709@gmail.com>
Date: Sat, 06 Jun 2015 16:07:02 -0700
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] ARM: BCM5301X: add NAND flash chip description
References: <1432935587-17949-1-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1432935587-17949-1-git-send-email-hauke@hauke-m.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, arnd@arndb.de, rjui@broadcom.com,
 zajec5@gmail.com, jogo@openwrt.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 05/29/15 14:39, Hauke Mehrtens a écrit :
> This adds the NAND flash chip description for a standard chip found
> connected to this SoC. This makes use of generic Broadcom NAND driver
> with the iProc interface.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied to devicetree/next, thanks!
-- 
Florian
