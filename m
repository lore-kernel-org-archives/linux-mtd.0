Received: from mail-px0-f200.google.com ([209.85.216.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXlzW-0002XZ-Mc
	for linux-mtd@lists.infradead.org; Thu, 21 Jan 2010 01:37:51 +0000
Received: by pxi38 with SMTP id 38so2160861pxi.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 17:37:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1001201646400.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
	<20100120133315.GB30789@shareable.org>
	<2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
	<Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
	<2c3b11251001200711t7dce3b2fg24e17f60ac1078d@mail.gmail.com>
	<Pine.LNX.4.64.1001201646400.32263@lnxricardw.se.axis.com>
Date: Thu, 21 Jan 2010 09:37:43 +0800
Message-ID: <2c3b11251001201737m2dadd594jc6dc2df2002ee62b@mail.gmail.com>
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

Very informative, it expand my view. Thanks!

2010/1/21 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>
> On Wed, 20 Jan 2010, Liu Hui wrote:
>
>> Thanks you very much, CRC is the real solution.
>>
>> But I don't understand, if a partial write happens, we use ECC to
>> correct the data, we will find the data can't be corrected, then
>> -EBADMSG will be returned(see nand_correct_data()), then we can know
>> this page are corrupted. IMHO, this works.
>
> Assuming the ECC algorithm used by mtd, it only produces correct results =
in
> the case of 0, 1 or 2 bit errors in the data. For more bit errors than th=
at,
> the result is undefined.
>
> Let's assume a partial write occurs, which leads to 57 bit errors compare=
d
> to what was originally supposed to be there. Since there are more than 2 =
bit
> errors, the algorthm output is undefined; it may say that the data can't =
be
> corrected, or it may say that the data is ok, or it may say that the data
> can be corrected; it's impossible to tell. As far as I understand, it is =
not
> uncommon for ECC to say the data is correct when it fact it isn't.
>
> A slightly trivial case:
>
> Again assuming the ECC algorithm used by mtd, the ECC bytes for a chunk o=
f
> data where all the bytes have the same value is 0xFFFFFF, regardless of t=
he
> actual value. So, say you have a page full of 0xA3; the ECC is then
> 0xFFFFFFF. Now, assuming a partial write causes bit 2 of all bit cells to
> not change from 1 to 0 when programming. The result is a page full of 0xA=
7,
> in effect, 256 bit errors (assuming a page size of 256 bits, or at least,
> assuming an ECC calculation encompassing that many bytes). But the ECC wi=
ll
> still be 0xFFFFFF, and the corresponding ECC calculation will say that th=
e
> data is correct. That is, as I mentioned before, because the result of an
> ECC calculation on data with >2 bit errors is undefined.
>
> Note that there are other ECC algorithms which can correct more error bit=
s.
> For MLC flash it is recommended to use an algorithm which corrects 4 bit
> errors rather than a single bit error in a block of data. Such algorithms
> require more ECC bits though.
>
> One has a tendency to think of ECC as a checking algorithm. It is not. It
> corrects and detects bit errors under certain circumstances. Outside thos=
e
> circumstances it is worthless. For the case of the software algorithm use=
d
> in mtd, it is worthless if there are more than 2 bit errors. A failed wri=
te
> could cause any number of bit errors, so it is worthless to check the res=
ult
> using the ECC algorithm. The normal failure mode of a nand flash chip is
> random single random bit errors with low probability. ECC handles this
> elegantly.
>
>
> Elaborating on this slightly, a devil's advocate would considere ECC
> worthless as a correction algorithm for a flash chip. Assume one bit erro=
r
> occurs, which is corrected by ECC. Then another bit error occurs in the s=
ame
> page. ECC then detects a failure. Then another bit error occurrs. The ECC
> algorithm is now worthless, it may detect the error, it may say that the
> data is correct, or it may even try to correct it (erroneously).
>
> The reason that all this works in practice is that the probability of a b=
it
> error occurring is so low that the probability of two bit errors occurrin=
g
> in the same page is very low, in some respect lower than other failure mo=
des
> in the system, so that we don't have to worry about it. (For example: Wha=
t
> about bit errors occurring in RAM chips from cosmic radiation? It is a re=
al
> risk, but so small that most systems don't have to worry about it.)
>
> It can be a real concern though, and that is why things like UBI provide
> so-called bit scrubbing: whenever it detects that ECC has done a bit
> correction in a block, it erases that block and rewrites the data [lots o=
f
> details omitted here] so that the chance of two bit errors ever occurring=
 in
> the same page will be very small indeed.
>
> Especially in these days of larger and larger flash chips resulting from
> shrinking chip geometries this is problem that is getting worse and worse=
.
> It also tends to vary hugely among manufacturers.
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
