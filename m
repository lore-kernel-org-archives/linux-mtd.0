Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xei9a-00071M-EZ
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 10:19:31 +0000
Received: by mail-ig0-f176.google.com with SMTP id hn15so19113813igb.3
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 03:19:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E6FE5@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
 <CACna6rw4g1wWPv+VgL8WeA9rz-j8A6k+4bN7D=MQ9OU-BinToA@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6315E6F6F@NTXXIAMBX02.xacn.micron.com>
 <CACna6rxNbPzSYbe9GjQCSAeB8FgVi6ZpgKo=AB=6nYc4QcqN1g@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6315E6FE5@NTXXIAMBX02.xacn.micron.com>
Date: Thu, 16 Oct 2014 12:19:09 +0200
Message-ID: <CACna6ryjvp1F7=u0NSK77G5X8dQgutuQRwg3AX_XCRS=MG_Vcg@mail.gmail.com>
Subject: Re: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: bpqw <bpqw@micron.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 October 2014 10:41, bpqw <bpqw@micron.com> wrote:
> By the way ,I still don't understand why you specify id NULL in you patch:

I guess I needed it for my Broadcom SPI driver, see:
mtd: bcm53xxspiflash: new driver for SPI flahes on Broadcom ARM SoCs
https://patchwork.ozlabs.org/patch/381902/

But I'll need to re-think that and update my patch.
