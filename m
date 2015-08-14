Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQGHz-0006bE-8r
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 14:48:59 +0000
Received: by igfj19 with SMTP id j19so14055462igf.0
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 07:48:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1439505965-134748-3-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-3-git-send-email-computersforpeace@gmail.com>
Date: Fri, 14 Aug 2015 16:48:37 +0200
Message-ID: <CAGhQ9VyM6m-y=iYZbshSJMQhqfu2mYKVLKxe_x2JvzJt0RDw+Q@mail.gmail.com>
Subject: Re: [RFT PATCH 2/4] mtd: spi-nor: assign mtd->priv in spi_nor_scan()
From: Joachim  Eastwood <manabian@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Marek Vasut <marex@denx.de>,
 Han Xu <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 August 2015 at 00:46, Brian Norris <computersforpeace@gmail.com> wrote:
> Layering suggests that the SPI NOR layer (not the hardware driver)
> should be initializing the MTD layer.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Boots fine on Hitex LPC4350 Evaluation Board (lpc18xx) with SPI-NOR
NXP SPIFI and JFFS2 root on s25sl064p.

Tested-by: Joachim Eastwood <manabian@gmail.com>


regards,
Joachim Eastwood
