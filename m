Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcCY8-0004Jk-Ui
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 08:24:38 +0000
Received: by vxd3 with SMTP id 3so1822773vxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 01:23:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309408494.10500.1.camel@phoenix>
References: <1309408494.10500.1.camel@phoenix>
Date: Thu, 30 Jun 2011 12:23:45 +0400
Message-ID: <BANLkTikonD2fcbkBU2ESYm_XncBXNZc_hw@mail.gmail.com>
Subject: Re: [PATCH] mtd: tmio_nand: fix build error
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/30/11, Axel Lin <axel.lin@gmail.com> wrote:
> Fix a mistake introduced by commit 33f4a3b
> "mtd: tmio_nand.c: use mtd_device_parse_register"

Already sumbited 27 June 2011. Strangely Artem remains silent.

>   CC [M]  drivers/mtd/nand/tmio_nand.o
> drivers/mtd/nand/tmio_nand.c:461:35: error: macro "mtd_device_register"
> passed 5 arguments, but takes just 3
> drivers/mtd/nand/tmio_nand.c: In function 'tmio_probe':
> drivers/mtd/nand/tmio_nand.c:459: error: 'mtd_device_register' undeclared
> (first use in this function)
> drivers/mtd/nand/tmio_nand.c:459: error: (Each undeclared identifier is
> reported only once
> drivers/mtd/nand/tmio_nand.c:459: error: for each function it appears in.)
> make[3]: *** [drivers/mtd/nand/tmio_nand.o] Error 1
> make[2]: *** [drivers/mtd/nand] Error 2
> make[1]: *** [drivers/mtd] Error 2
> make: *** [drivers] Error 2

-- 
With best wishes
Dmitry
