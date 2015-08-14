Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQGM9-0003gu-GA
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 14:53:17 +0000
Received: by iodb91 with SMTP id b91so86750482iod.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 07:52:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1439505965-134748-5-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-5-git-send-email-computersforpeace@gmail.com>
Date: Fri, 14 Aug 2015 16:52:55 +0200
Message-ID: <CAGhQ9Vyur84oJ3KtHdLktCPZ49TnB+r36Z35kX9HFvy3x0GnVQ@mail.gmail.com>
Subject: Re: [RFT PATCH 4/4] mtd: spi-nor: embed struct mtd_info within struct
 spi_nor
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
> This reflects the proper layering, so let's do it.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Boots fine on Hitex LPC4350 Evaluation Board (lpc18xx) with SPI-NOR
NXP SPIFI and JFFS2 root on s25sl064p.

Tested-by: Joachim Eastwood <manabian@gmail.com>


regards,
Joachim Eastwood
