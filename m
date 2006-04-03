Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQOyW-0004jt-4t
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 09:20:15 -0400
Date: Mon, 3 Apr 2006 15:18:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20060403131840.GB7659@wohnheim.fh-wedel.de>
References: <20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<20060331122055.GK14713@wohnheim.fh-wedel.de>
	<442D207D.9030903@yandex.ru>
	<Pine.LNX.4.64.0603311221070.14923@localhost.localdomain>
	<20060403130619.GA7659@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060403130619.GA7659@wohnheim.fh-wedel.de>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 April 2006 15:06:19 +0200, Jörn Engel wrote:
> 
> As a step in that direction, please take a look at this patchset:
> http://wh.fh-wedel.de/~joern/mtd_type.tgzwh.fh-wedel.de/~joern/mtd_type.tgz

Taking a closer look at the code, reader should notice three
interesting things, btw:

1. Nico is a lazy moron,
2. Artem is a lazy moron and
3. Jörn is a lazy moron.

Nico, you didn't notice that the Sibley flashes are just another
iteration of ST's ECC NOR flashes.  Special code for both flash types
is nearly identical, except for the field used to store the writesize
in struct mtd_info.

Artem, you didn't notice that Dataflash has the exact same cleanup
routine as ECC NOR and NAND flash has.  And for the initialization
code, that could be shared as well.

Jörn, I didn't notice that ECC NOR has the exact same cleanup routine
as NAND flash.  And for the initialization code, that could be shared
as well.

Overall, JFFS2 currently has four sets of special setup/cleanup code
for NAND, ECC NOR, Dataflash and Sibley.  Simply because the three of
us were too lazy to read the existing code and didn't notice.  Noone
else seemed to have noticed either, so the "lazy moron" thing seems to
be fairly universal.  Don't take it as an insult, but rather as a
statement about human nature (and a trick to attract attention).

Nico, can you take a close look at the Sibley part of the patches and
checker whether I broke anything?  Combining ECC NOR and Sibley was
the low hanging fruit, so I already picked it.  Combining the three
remaining sets is harder.  Maybe someone else is feeling the urge to
combine those.

Jörn

-- 
He who knows that enough is enough will always have enough.
-- Lao Tsu
