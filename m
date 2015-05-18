Received: from spornkuller.de ([5.45.105.28])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuRo3-0004Ut-BI
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 20:38:36 +0000
Received: from [192.168.1.2]
 (HSI-KBW-149-172-8-84.hsi13.kabel-badenwuerttemberg.de [149.172.8.84])
 by spornkuller.de (Postfix) with ESMTPSA id D577517F432
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 22:38:12 +0200 (CEST)
Message-ID: <555A4DB4.5050405@spornkuller.de>
Date: Mon, 18 May 2015 22:38:12 +0200
From: Johannes Bauer <weolanwaybqm@spornkuller.de>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Wear-leveling peculiarities
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>	<55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
 <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
In-Reply-To: <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry Richard, I meant to reply to the list.

On 18.05.2015 19:58, Richard Weinberger wrote:

> Wear-leveling is done on UBI and UBIFS.
> What is CONFIG_MTD_UBI_WL_THRESHOLD set to?

Ooops. I honestly don't know, will check this out tomorrow. I must admit
that I wasn't aware of this setting at all.

> I suspect that your threshold was never reached.

Yes, I suspect you're right here.

>>From your provided graph it looks like all erase block have been
> erased t most 300 times.
> If your NAND starts dying after 300 erases you're in trouble.

And I fear you're right here as well

Although there's no definitive saying how many page writes the failed
units had because the defective sectors are so broken that the kernel
barfs out I/O errors. That means I can't even read the OOB metadata.

Cheers,
Johannes
