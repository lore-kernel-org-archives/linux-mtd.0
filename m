Received: from rn-out-0910.google.com ([64.233.170.185]
	helo=rn-out-0102.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4eeU-0006g0-ES
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 15:46:45 +0000
Received: by rn-out-0102.google.com with SMTP id e25so398614rng.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Dec 2007 07:46:37 -0800 (PST)
Message-ID: <79ac09b60712180746o7f1fb8d1hc37c2f7eaa043fda@mail.gmail.com>
Date: Tue, 18 Dec 2007 09:46:36 -0600
From: Duke <ezbonites@gmail.com>
To: "Nicolas Ferre" <nicolas.ferre@atmel.com>
Subject: Re: SPI Flash
In-Reply-To: <79ac09b60712180745u475839b6q98de2a8500a6f483@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60712180702v724b20cetb4070b53466efcba@mail.gmail.com>
	<4767E995.2050100@atmel.com>
	<79ac09b60712180745u475839b6q98de2a8500a6f483@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/18/07, Duke <ezbonites@gmail.com> wrote:
> On 12/18/07, Nicolas Ferre <nicolas.ferre@atmel.com> wrote:
> > Duke :
> > > Hi all,
> > > Has anyone use ST's SPI flash and Atmels SPI DataFlash suscessfully?
> >
> > Atmel DataFlash are working on Linux with this configuration in your
> > .config :
> > CONFIG_MTD_DATAFLASH=y
> >
> > > How does the interface look from userspace? Is it still an mtdblockX
> > > device or is it a spi device node?
> >
> > It is seen as a mtd device :
> > # cat /proc/mtd
> > dev:    size   erasesize  name
> > [..]
> > mtd2: 00840000 00000420 "spi0.0-AT45DB642x"
> >
> > So you can mount is using mtdblockx interface.
>
> Thanks,
> Various DataFlash cards have different size alterable, is this
> supported my the mtd driver? Let say I want to have a section that I
> never want altered, do I need to do partition the dataflash
> accordingly so this section wouldn't be erased, or I don't need to do
> that? Taken into consideration the filesystem limit on block sizes.
>
> Do you know if this is the same for all spi flash chips that may not
> be from atmel?
>

Sorry, I ment Chips, not Cards (I don't indent to use DataFlash Cards).
