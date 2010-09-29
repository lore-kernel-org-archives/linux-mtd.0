Received: from ipmail05.adl6.internode.on.net ([150.101.137.143])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0nRx-0003li-PA
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 03:35:22 +0000
Message-ID: <4CA2B3E9.3030707@call-direct.com.au>
Date: Wed, 29 Sep 2010 13:35:05 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>	<1284308851.1783.23.camel@brekeke>	<AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>	<1284358990.27765.154.camel@localhost>	<AANLkTin4u=jQOxxuTwzMHrEEg=vDc2TSTah_=_Li02xx@mail.gmail.com>	<1284441967.2084.18.camel@brekeke>	<AANLkTin+2ocUT_NMToGHoAhX5=Trn2CdLFmiMBmvSVuC@mail.gmail.com>	<1285139570.7512.137.camel@localhost>
	<AANLkTi=ssyUrvaic86hx8tT0TvZiMzyDa_KL0SfU144J@mail.gmail.com>
In-Reply-To: <AANLkTi=ssyUrvaic86hx8tT0TvZiMzyDa_KL0SfU144J@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> i'm open to logic, but i cant figure out your side.  all i can see is
> "it's been this way" and "we shouldnt write bad blocks".  but both
> sound like policies that the end user should have control over rather
> than the userspace utils always enforcing.  so if you feel i've missed
> something, please highlight it.

Hi Mike,

while I agree with the philosophy to allow users to shoot
themselves in the foot if they really like that sort of thing,
the "don't touch bad blocks" rule makes sense and it's not
necessarily obvious.

Flash memory is only 'digital' in an idealised sense. Like
every other 'digital' device, the real thing is analogue.

The read value of a flash memory cell depends on the amount
of charge stored in a insulated transistor gate when compared
to a threshold voltage derived from the power supply. The
comparison is also temperature dependent.

In other words, a bit being read correctly depends on voltage
and temperature during both writing and reading.

Bad cells can be caused by impurities in the gate insulation
(slow discharge), incorrect insulation thickness, marginal
transistors, etc. The degree of 'badness' also depends on
voltage and temperature.

The upshot of this is that blocks are marked as bad by the
manufacturer based on corner case testing. Like erasing at
high temperature / low voltage and reading back at low
temperature / high voltage. The manufacturer can also
access pads on the naked die that are not connected to pins
during packaging.

This means that the manufacturer can catch marginal cases,
where a cell 'works', but will flip a bit within a month.

Depending on the damage, it may even require special tricks
to mark a block as bad.

Either way, as a user of the device, you may not be able
tell if a block is bad, or fully erase a bad block, or even
reliably mark it as bad again.

Thus the rule about not touching bad blocks. It's the only
way to make sure that you don't end up with a batch of products
that will die on the shelf, after you successfully tested them.


Best regards,

Iwo
