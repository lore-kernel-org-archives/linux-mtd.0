Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5MjB-0001XD-U9
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 01:35:47 +0000
Received: by mail-pf0-x242.google.com with SMTP id b23so14038536pfc.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 18:35:25 -0700 (PDT)
Date: Mon, 1 May 2017 18:35:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Ludovic Barre <ludovic.Barre@st.com>
Subject: Re: [PULL v2] mtd: spi-nor: changes for 4.12
Message-ID: <20170502013522.GA142129@google.com>
References: <071e87fd-f55c-b7ad-7554-cd6f426f07c8@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <071e87fd-f55c-b7ad-7554-cd6f426f07c8@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, May 01, 2017 at 05:04:21PM +0200, Cyrille Pitchen wrote:
> Hi Brian,
> 
> this is a new spi-nor PR for 4.12. Just few bug fixes in some (Q)SPI controller
> drivers and support to new memory parts.
> Only one new driver for the STM32 QSPI controller.
> 
> I didn't include any of my patches upgrading the spi-nor framework
> since they didn't spend enough time in linux-next.
> 
> Best regards,
> 
> Cyrille
> 
> 
> ChangeLog:
> 
> v1 -> v2
> - squash Arnd's patch into Ludovic's original commit:
> dc5e400611c5 ("mtd: spi-nor: add driver for STM32 quad spi flash controller")
> to remove the MODULE_ALIAS() line.

All looks good to me.

> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://github.com/spi-nor/linux.git tags/spi-nor/for-4.12-v2
> 
> for you to fetch changes up to 8abe904dc82772bf1635fcc5765433c672f0a875:
> 
>   mtd: mtk-nor: set controller's address width according to nor flash (2017-05-01 16:45:40 +0200)

Pulled into l2-mtd.git. Thanks!

Brian
