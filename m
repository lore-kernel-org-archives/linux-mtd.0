Received: from rv-out-0910.google.com ([209.85.198.185])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISGCN-0003lf-1M
	for linux-mtd@lists.infradead.org; Mon, 03 Sep 2007 13:59:32 -0400
Received: by rv-out-0910.google.com with SMTP id c24so983241rvf
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Sep 2007 10:58:53 -0700 (PDT)
Message-ID: <8bd0f97a0709031058g3d0b5e8dodbb5fa5f35366b4f@mail.gmail.com>
Date: Mon, 3 Sep 2007 13:58:53 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Clemens Koller" <clemens.koller@anagramm.de>
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
In-Reply-To: <46DBDE75.90203@anagramm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1188804323.29566.6.camel@roc-laptop> <46DBDE75.90203@anagramm.de>
Cc: bryan.wu@analog.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/3/07, Clemens Koller <clemens.koller@anagramm.de> wrote:
> Bryan Wu schrieb:
> > This is the driver for latest Blackfin BF54x nand flash controller
> >
> >  - use nand_chip and mtd_info common nand driver interface
> >  - provide both PIO and dma operation
> >  - compiled with ezkit bf548 configuration
> >  - use hardware 1-bit ECC
> >  - tested with YAFFS2 and can mount YAFFS2 filesystem as rootfs
>
> Looks great!
>
> Will this driver also work for the new BF52x series of the Blackfin Series?
> (Or is it planned to make it work for... anytime soon.)

the order for porting of new chips is:
u-boot -> core kernel -> peripherals

we generally dont bother looking at peripherals until the earlier stuff is done
-mike
