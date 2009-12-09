Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIJb8-0003O1-BN
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 10:16:46 +0000
Subject: Re: UBIFS read-only rootfs needs 1 or more eraseblocks to mount
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910DFAAE18A@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910DFAAE18A@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 12:16:28 +0200
Message-Id: <1260353788.19669.1265.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-12-08 at 16:09 -0800, Darwin Rambo wrote:
> On a read-only UBIFS rootfs, why do you need at least 1 eraseblock?
>  There is nothing to replace since nothing is ever written to this
> partition on the fly and a block that goes bad cannot be recovered
> anyways?
> 
> UBI error: ubi_eba_init_scan: no enough physical eraseblocks (0, need
> 1)
> UBI error: ubi_init: cannot attach mtd6
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -28

This is UBI error, not UBIFS. UBI does not really have a notion of
read-only UBI device, so it always reserves some amount of eraseblocks.

There is a compile-time option about amount of eraseblocks to reserve,
in percent. You can make it 0%, then UBI will not reserve anything.
Probably it will not work out of the box (I never tried that), and
you'll need to do some small investigation / fixing.

> Note that adding room for a single bad block PEB allows the mount to
> work, and you get a warning like this:
> "UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad
> PEB handling, reserved 0, need 19"

This is again UBI warning, not UBIFS.

> It looks like the normal read/write code is reserving/requiring blocks
> that the read-only mode doesn't actually use?

R/O stuff is on UBIFS level, you get warning at UBI level, and UBI does
assumes everything is R/W.

>  All this is probably just a future suggestion to support read-only
> mode a little bit better with less block wastage.

Ok, you might as well just come up with a patch or patches!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
