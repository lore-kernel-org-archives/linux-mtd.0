Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXd7f-0004Wj-PE
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 16:09:40 +0000
Date: Wed, 20 Jan 2010 17:09:26 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Liu Hui <onlyflyer@gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
In-Reply-To: <2c3b11251001200711t7dce3b2fg24e17f60ac1078d@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001201646400.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
	<20100120133315.GB30789@shareable.org>
	<2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
	<Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
	<2c3b11251001200711t7dce3b2fg24e17f60ac1078d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Jamie Lokier <jamie@shareable.org>,
	=?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <Ricard.Wanderlof@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 20 Jan 2010, Liu Hui wrote:

> Thanks you very much, CRC is the real solution.
>
> But I don't understand, if a partial write happens, we use ECC to
> correct the data, we will find the data can't be corrected, then
> -EBADMSG will be returned(see nand_correct_data()), then we can know
> this page are corrupted. IMHO, this works.

Assuming the ECC algorithm used by mtd, it only produces correct results=20
in the case of 0, 1 or 2 bit errors in the data. For more bit errors than=
=20
that, the result is undefined.

Let's assume a partial write occurs, which leads to 57 bit errors compared=
=20
to what was originally supposed to be there. Since there are more than 2=20
bit errors, the algorthm output is undefined; it may say that the data=20
can't be corrected, or it may say that the data is ok, or it may say that=
=20
the data can be corrected; it's impossible to tell. As far as I=20
understand, it is not uncommon for ECC to say the data is correct when it=
=20
fact it isn't.

A slightly trivial case:

Again assuming the ECC algorithm used by mtd, the ECC bytes for a chunk of=
=20
data where all the bytes have the same value is 0xFFFFFF, regardless of=20
the actual value. So, say you have a page full of 0xA3; the ECC is then=20
0xFFFFFFF. Now, assuming a partial write causes bit 2 of all bit cells to=
=20
not change from 1 to 0 when programming. The result is a page full of=20
0xA7, in effect, 256 bit errors (assuming a page size of 256 bits, or at=20
least, assuming an ECC calculation encompassing that many bytes). But the=
=20
ECC will still be 0xFFFFFF, and the corresponding ECC calculation will say=
=20
that the data is correct. That is, as I mentioned before, because the=20
result of an ECC calculation on data with >2 bit errors is undefined.

Note that there are other ECC algorithms which can correct more error=20
bits. For MLC flash it is recommended to use an algorithm which corrects 4=
=20
bit errors rather than a single bit error in a block of data. Such=20
algorithms require more ECC bits though.

One has a tendency to think of ECC as a checking algorithm. It is not. It=
=20
corrects and detects bit errors under certain circumstances. Outside those=
=20
circumstances it is worthless. For the case of the software algorithm used=
=20
in mtd, it is worthless if there are more than 2 bit errors. A failed=20
write could cause any number of bit errors, so it is worthless to check=20
the result using the ECC algorithm. The normal failure mode of a nand=20
flash chip is random single random bit errors with low probability. ECC=20
handles this elegantly.


Elaborating on this slightly, a devil's advocate would considere ECC=20
worthless as a correction algorithm for a flash chip. Assume one bit error=
=20
occurs, which is corrected by ECC. Then another bit error occurs in the=20
same page. ECC then detects a failure. Then another bit error occurrs. The=
=20
ECC algorithm is now worthless, it may detect the error, it may say that=20
the data is correct, or it may even try to correct it (erroneously).

The reason that all this works in practice is that the probability of a=20
bit error occurring is so low that the probability of two bit errors=20
occurring in the same page is very low, in some respect lower than other=20
failure modes in the system, so that we don't have to worry about it. (For=
=20
example: What about bit errors occurring in RAM chips from cosmic=20
radiation? It is a real risk, but so small that most systems don't have to=
=20
worry about it.)

It can be a real concern though, and that is why things like UBI provide=20
so-called bit scrubbing: whenever it detects that ECC has done a bit=20
correction in a block, it erases that block and rewrites the data [lots of=
=20
details omitted here] so that the chance of two bit errors ever occurring=
=20
in the same page will be very small indeed.

Especially in these days of larger and larger flash chips resulting from=20
shrinking chip geometries this is problem that is getting worse and worse.=
=20
It also tends to vary hugely among manufacturers.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
