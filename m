Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fv7eV-00038A-HU
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 03:06:39 -0400
Message-ID: <44A0D8D3.4020908@yandex.ru>
Date: Tue, 27 Jun 2006 11:05:55 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: DataFlash & writesize
References: <4497A89F.4010202@yandex.ru>
	<1151058432.27505.60.camel@fuzzie.sanpeople.com>
	<1151059415.16043.45.camel@sauron.oktetlabs.ru>
	<200606261333.11632.david-b@pacbell.net>
In-Reply-To: <200606261333.11632.david-b@pacbell.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

David Brownell wrote:
> What are the intended semantics for "writesize" by the way?

Design-wise, it an attempt to generalize MTD. Different flashes have 
different minimal I/O unit size, like 1 byte in case of NOR, 16 bytes in 
case of ECCed NOR, 512/2K in case of NAND, etc. There were no such a 
field before and we had to do ugly things like


switch (mtd->type) {
	case MTD_NORFLASH:
		blah();
		break;
	case MTD_NANDFLASH:
		blah1();

etc.

Here is a comment from include/linux/mtd.h:

/* Minimal writable flash unit size. In case of NOR flash it is 1 (even
  * though individual bits can be cleared), in case of NAND flash it is
  * one NAND page (or half, or one-fourths of it), in case of ECC-ed NOR
  * it is of ECC block size, etc. It is illegal to have writesize = 0.
  * Any driver registering a struct mtd_info must ensure a writesize of
  * 1 or larger.
  */

> I noticed I was getting that first BUG_ON in mtdcore:add_mtd_device
> since, with NOR CFI cmdset 1 flash, with current GIT.  Seems like
> writesie should have been set up already.

We fixed all drivers and now it should be fine - see commit 
17ffc7ba6d7ea68b8d5f55a5ca1b87163e69720d

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
