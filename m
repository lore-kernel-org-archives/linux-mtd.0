Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJcDT-0006um-EL
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 23:49:32 +0000
Received: by fxm8 with SMTP id 8so1248044fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Jun 2009 16:49:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A42AD76.8040303@bluewatersys.com>
References: <4A3F017B.2010409@bluewatersys.com>
	<63386a3d0906220122x31d0b23fk7bd86145b719d9b5@mail.gmail.com>
	<4A3FFE02.8020001@bluewatersys.com>
	<63386a3d0906230004m66360f4fhbdc80c8e552a01d0@mail.gmail.com>
	<4A413F8F.6030500@bluewatersys.com>
	<63386a3d0906241543n16da1f0gc988738f9efd8782@mail.gmail.com>
	<4A42AD76.8040303@bluewatersys.com>
Date: Thu, 25 Jun 2009 01:49:21 +0200
Message-ID: <63386a3d0906241649l60142ea2j1a608ce27c0f65cc@mail.gmail.com>
Subject: Re: [PATCH] SST25L (non JEDEC) SPI Flash driver
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: Ryan Mallon <ryan@bluewatersys.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
	mike@steroidmicros.com, spi-devel-general@lists.sourceforge.net,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/6/25 Ryan Mallon <ryan@bluewatersys.com>:
> Linus Walleij wrote:
>> 2009/6/23 Ryan Mallon <ryan@bluewatersys.com>:
>>
>>> BTW, most of my other patches go via the ARM list, which uses the patch
>>> system. Whats the procedure for most other lists, do patches just get
>>> collected by the subsection maintainer when they are okay?
>>
>> That's the most typical procedure, however I think the SPI maintainer
>> (David) has been busy with other things so I merged the PL022
>> driver through the ARM tree instead. Another possibility is to send
>> it off to Andrew Mortons tree I guess.
>
> Can I get your acked-by and then just CC Andrew Morton?

I'm not much of a stakeholder in the SPI subsystem, but FWIW:
Acked-by: Linus Walleij <linus.walleij@stericsson.com>

Yours,
Linus Walleij
