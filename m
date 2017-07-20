Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dYI0w-0005WG-4m
 for linux-mtd@lists.infradead.org; Thu, 20 Jul 2017 20:25:39 +0000
Received: by mail-ua0-x22f.google.com with SMTP id 35so31800093uax.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2017 13:25:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170327160524.29019-1-jglauber@cavium.com>
References: <20170327160524.29019-1-jglauber@cavium.com>
From: Karl Beldan <karl.beldan@gmail.com>
Date: Thu, 20 Jul 2017 20:25:14 +0000
Message-ID: <CACYmx9NQCBSFJZTYhrw6J5G=rr5A3pAvFBLwm7d06-DoJdbtTg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Cavium NAND flash driver
To: Jan Glauber <jglauber@cavium.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Mar 27, 2017 at 4:05 PM, Jan Glauber <jglauber@cavium.com> wrote:
> This series adds a driver for the nand flash controller as found on Cavium's
> ARM64 SOCs. For details about the controller see description of patch #2.
>
> The nand flash chip on the board I used for testing is:
>
> [   12.775877] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
> [   12.782242] nand: Macronix MX30LF1GE8AB
> [   12.786072] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
>
> This chip has internal on-die ECC (which cannot be disabled). Data
> sheet can be found here:
> http://www.macronix.com/en-us/products/NAND-Flash/SLC-NAND-Flash/Pages/spec.aspx?p=MX30LF1GE8AB
>

I have some prototypes with this nand at hand.
I wonder if anybody could get their hands on more information than
what's on the datasheet or the archives on the site ?
On the site are available:
- a lld zip (low level driver) (no ondie ECC)
- a verilog zip (only ondie ECC timings simulation)
- a datasheet pdf (ambiguous, among other things ECC status vs sub pages)


Karl
