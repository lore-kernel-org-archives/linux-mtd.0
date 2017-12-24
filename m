Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSyJg-0000jn-NA
 for linux-mtd@lists.infradead.org; Sun, 24 Dec 2017 04:55:18 +0000
Received: by mail-pl0-x242.google.com with SMTP id bi12so15146031plb.6
 for <linux-mtd@lists.infradead.org>; Sat, 23 Dec 2017 20:55:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87bmipb10z.fsf@belgarion.home>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-4-miquel.raynal@free-electrons.com>
 <87608ycwx5.fsf@belgarion.home>
 <20171222230444.2c952ea0@bbrezillon> <87bmipb10z.fsf@belgarion.home>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 24 Dec 2017 01:55:04 -0300
Message-ID: <CAAEAJfCFCAAeWNzK3+TTn3qq3-p1aQYZnJ=e4nf8SZ=T1qouKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mtd: nand: replace pxa3xx_nand driver by its
 rework called marvell_nand
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Andrew Lunn <andrew@lunn.ch>, Catalin Marinas <catalin.marinas@arm.com>,
 Hanna Hawa <hannah@marvell.com>, Will Deacon <will.deacon@arm.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Marek Vasut <marek.vasut@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Ofer Heifetz <oferh@marvell.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Miao <eric.y.miao@gmail.com>,
 =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Neta Zur Hershkovits <neta@marvell.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 December 2017 at 18:13, Robert Jarzmik <robert.jarzmik@free.fr> wrote=
:
> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>
>>> What I would propose instead is :
>>>  - keep both the new marvell nand driver and the old pxa3xx_nand driver
>>>  - switch pxa_defconfig to compile them both
>>
>> Didn't notice you were suggesting to compile both, which doesn't work
>> because both drivers match the same devices, and only one of them
>> can actually claim the device (likely the first one to register to the
>> device model). So, to make it safe you need to have a
>>
>>       depends on !MTD_NAND_PXA3xx
>>
>> in your MTD_NAND_MARVELL entry, which means only one driver can be
>> compiled.
> Mmm... that is I didn't explain to you what pxa_defconfig is designed for=
.
> This defconfig is not for any board actually, it rather is a build covera=
ge
> tool.
>
>> So let's find a way to fix the remaining issues you have instead of dela=
ying
>> the inevitable.
> It's up to you of course, as long as my boards don't break, and nothing b=
reaking
> them is merged, I'm fine with it. It's just not the approach I usually ch=
oose,
> I'm rather a 2-step guy, ie. merge the new one, then merge the switch (wh=
ich can
> be reverted easilly).
>

I agree with Boris on this. Let's get this new driver tested as much
as possible; then, once everyone is fairly happy with it, merge it.

It won't be completely stable on day-one, but that is why we
have -rc cycles. Plus, distributions and appliances use -stable.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
