Received: from mail-pz0-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXcDM-0004WO-O3
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 15:11:29 +0000
Received: by pzk33 with SMTP id 33so961273pzk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 07:11:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
	<20100120133315.GB30789@shareable.org>
	<2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
	<Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
Date: Wed, 20 Jan 2010 23:11:22 +0800
Message-ID: <2c3b11251001200711t7dce3b2fg24e17f60ac1078d@mail.gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
From: Liu Hui <onlyflyer@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Jamie Lokier <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks you very much, CRC is the real solution.

But I don't understand, if a partial write happens, we use ECC to
correct the data, we will find the data can't be corrected, then
-EBADMSG will be returned(see nand_correct_data()), then we can know
this page are corrupted. IMHO, this works.

Anyway, I will think about CRC seriously.

Thanks,
Hui

2010/1/20 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>
> On Wed, 20 Jan 2010, Liu Hui wrote:
>
>>> It's good, but not perfect: In principle a power-failed write could
>>> successfully store the correct bits including ECC so they read back
>>> correctly, but with the cell charges not completely stable. =C2=A0But I
>>> guess that's rare enough that it is just included in the normal NAND
>>> bad block possibilities.
>>
>> Ok, ECC can detect partial write but can't detect unstable cell
>> charges, I think this is enough since NAND flash is unstable media.
>
> ECC is designed to correct a small number of bits (1 bit for the software
> ECC algorithm used by mtd) and detect failure if a couple of more bits ar=
e
> bad (2 bits for the mtd algorithm). Beyond that, the results cannot be
> trusted. That means, that if there are, say, 16 incorrect bits in the dat=
a,
> the ECC algorithm will not necessarily indicate that there is a failure. =
It
> might very well indicate that there is a single bit that needs correction=
,
> or that all bits are correct. It is not a CRC.
>
> The end result is that you can't say "if the ECC says it's ok, the data
> hasn't been corrupted" (which you could with a CRC). The only thing you c=
an
> say (in the case of the mtd ECC algorithm) is "if there is a one-bit erro=
r
> in the data, the ECC will correct it" and "if there is a two-bit error in
> the data, the ECC will detect it".
>
> If you really need that kind of check for data integrity, I suppose you
> could add a CRC algorithm to the ECC calculations already being performed=
 by
> mtd, so that any change in the data would be flagged due to a mismatching
> CRC.
>
> /Ricard
> --
> Ricard Wolf Wanderl=C3=B6f =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0www.axis.com
> Phone +46 46 272 2016 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fax +46 46 13 61 30
>



--=20
Thanks & Best Regards
Liu Hui
--
