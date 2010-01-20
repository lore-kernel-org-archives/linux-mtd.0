Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXbxa-0006uJ-0K
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 14:55:10 +0000
Date: Wed, 20 Jan 2010 15:54:55 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Liu Hui <onlyflyer@gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
In-Reply-To: <2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001201548170.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
	<20100120133315.GB30789@shareable.org>
	<2c3b11251001200625l4f4ee64emcfe43045913954c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
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


On Wed, 20 Jan 2010, Liu Hui wrote:

>> It's good, but not perfect: In principle a power-failed write could
>> successfully store the correct bits including ECC so they read back
>> correctly, but with the cell charges not completely stable. =A0But I
>> guess that's rare enough that it is just included in the normal NAND
>> bad block possibilities.
> Ok, ECC can detect partial write but can't detect unstable cell
> charges, I think this is enough since NAND flash is unstable media.

ECC is designed to correct a small number of bits (1 bit for the software=
=20
ECC algorithm used by mtd) and detect failure if a couple of more bits are=
=20
bad (2 bits for the mtd algorithm). Beyond that, the results cannot be=20
trusted. That means, that if there are, say, 16 incorrect bits in the=20
data, the ECC algorithm will not necessarily indicate that there is a=20
failure. It might very well indicate that there is a single bit that needs=
=20
correction, or that all bits are correct. It is not a CRC.

The end result is that you can't say "if the ECC says it's ok, the data=20
hasn't been corrupted" (which you could with a CRC). The only thing you=20
can say (in the case of the mtd ECC algorithm) is "if there is a one-bit=20
error in the data, the ECC will correct it" and "if there is a two-bit=20
error in the data, the ECC will detect it".

If you really need that kind of check for data integrity, I suppose you=20
could add a CRC algorithm to the ECC calculations already being performed=
=20
by mtd, so that any change in the data would be flagged due to a=20
mismatching CRC.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
