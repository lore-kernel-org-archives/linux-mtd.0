Received: from smtp113.sbc.mail.mud.yahoo.com ([68.142.198.212])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fv8lR-00042w-1T
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 04:17:51 -0400
From: David Brownell <david-b@pacbell.net>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: DataFlash & writesize
Date: Tue, 27 Jun 2006 01:10:59 -0700
References: <4497A89F.4010202@yandex.ru>
	<200606261333.11632.david-b@pacbell.net>
	<44A0D8D3.4020908@yandex.ru>
In-Reply-To: <44A0D8D3.4020908@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606270110.59318.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 27 June 2006 12:05 am, Artem B. Bityutskiy wrote:
> David,
> 
> David Brownell wrote:
> > What are the intended semantics for "writesize" by the way?
> 
> Design-wise, it an attempt to generalize MTD. Different flashes have 
> different minimal I/O unit size, like 1 byte in case of NOR, 16 bytes in 
> case of ECCed NOR, 512/2K in case of NAND, etc.

OK, thanks.  For some reason the "writesize" I found didn't include
the <linux/mtd/mtd.h> comment you mentioned... I guess that was the
one in mtd-abi.h instead.


> > I noticed I was getting that first BUG_ON in mtdcore:add_mtd_device
> > since, with NOR CFI cmdset 1 flash, with current GIT.  Seems like
> > writesie should have been set up already.
> 
> We fixed all drivers and now it should be fine - see commit 
> 17ffc7ba6d7ea68b8d5f55a5ca1b87163e69720d

It's not fixed upstream yet.

- Dave
