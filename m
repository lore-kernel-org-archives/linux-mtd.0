Received: from mail-px0-f200.google.com ([209.85.216.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXbV5-0000rY-AN
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 14:25:44 +0000
Received: by pxi38 with SMTP id 38so1730199pxi.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 06:25:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100120133315.GB30789@shareable.org>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
	<20100120133315.GB30789@shareable.org>
Date: Wed, 20 Jan 2010 22:25:36 +0800
Message-ID: <2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
From: Liu Hui <onlyflyer@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, In fact, I am a soft developer, I want to find a way to design a
power-cut safe FTL. I can't control the design of hardware, so I have
to find a common way to ensure atomic operation.

> There is no need for an interrupt, if you have a fast GPIO that you
> can read before each write command that tells if the input power has
> not dropped.
This is no good for performance.

> It's good, but not perfect: In principle a power-failed write could
> successfully store the correct bits including ECC so they read back
> correctly, but with the cell charges not completely stable. =C2=A0But I
> guess that's rare enough that it is just included in the normal NAND
> bad block possibilities.
Ok, ECC can detect partial write but can't detect unstable cell
charges, I think this is enough since NAND flash is unstable media.

Thanks for your information!
Hui



2010/1/20 Jamie Lokier <jamie@shareable.org>:
> Liu Hui wrote:
>> Richard,
>>
>> Thank you for your confirmation and good idea.
>>
>> I also think about your idea before, that is, when power failure
>> happens, generate an interrupt and blocks any other write requests in
>> interrupt handler. But this is a little complex.
>
> Ideally, you would design the hardware so that power failure can be
> detected early near the power input, but with enough on-board power
> retention (i.e. capacitor) that there is guaranteed enough continuous
> power for the CPU to react and the NAND chip to have enough stable
> power to complete the write reliably.
>
> There is no need for an interrupt, if you have a fast GPIO that you
> can read before each write command that tells if the input power has
> not dropped.
>
>> Now, I think I can use ECC to check the partial write, if a write was
>> not finished, the ECC should be wrong, so we can detect this partial
>> write and discard this write. Do you think this is a good idea?
>
> It's good, but not perfect: In principle a power-failed write could
> successfully store the correct bits including ECC so they read back
> correctly, but with the cell charges not completely stable. =C2=A0But I
> guess that's rare enough that it is just included in the normal NAND
> bad block possibilities.
>
> -- Jamie
>



--=20
Thanks & Best Regards
Liu Hui
--
