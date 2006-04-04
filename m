Received: from uproxy.gmail.com ([66.249.92.192])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQaW0-0003ZK-RF
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 21:39:37 -0400
Received: by uproxy.gmail.com with SMTP id j3so660332ugf
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Apr 2006 18:39:25 -0700 (PDT)
Message-ID: <625fc13d0604031839i25de2e8et8bd7e05a58fd5280@mail.gmail.com>
Date: Mon, 3 Apr 2006 20:39:25 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060403131840.GB7659@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060331100709.GD14713@wohnheim.fh-wedel.de>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<20060331122055.GK14713@wohnheim.fh-wedel.de>
	<442D207D.9030903@yandex.ru>
	<Pine.LNX.4.64.0603311221070.14923@localhost.localdomain>
	<20060403130619.GA7659@wohnheim.fh-wedel.de>
	<20060403131840.GB7659@wohnheim.fh-wedel.de>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Artem B. Bityutskiy" <dedekind@yandex.ru>, Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/3/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> On Mon, 3 April 2006 15:06:19 +0200, J=F6rn Engel wrote:
> >
> > As a step in that direction, please take a look at this patchset:
> > http://wh.fh-wedel.de/~joern/mtd_type.tgzwh.fh-wedel.de/~joern/mtd_type=
.tgz
>
> Taking a closer look at the code, reader should notice three
> interesting things, btw:
>
> 1. Nico is a lazy moron,
> 2. Artem is a lazy moron and
> 3. J=F6rn is a lazy moron.

There should also be a Josh is a lazy moron.  I merged the NOR ECC
stuff in JFFS2.

> Nico, you didn't notice that the Sibley flashes are just another
> iteration of ST's ECC NOR flashes.  Special code for both flash types
> is nearly identical, except for the field used to store the writesize
> in struct mtd_info.

I've been thinking about that for a while now.  Real life has
intervened for the most part.

>
> J=F6rn, I didn't notice that ECC NOR has the exact same cleanup routine
> as NAND flash.  And for the initialization code, that could be shared
> as well.

And a large majority of the ECC NOR stuff could have just been merged
into cfi_cmdset_0001.c instead of writing a whole new file.  Indeed,
it really has to be because the larger 16MiB chips _report_ a command
set of 0001 even though they aren't.  I have code that does all this,
but it's based on old MTD and wants sanitizing.

> Nico, can you take a close look at the Sibley part of the patches and
> checker whether I broke anything?  Combining ECC NOR and Sibley was
> the low hanging fruit, so I already picked it.  Combining the three
> remaining sets is harder.  Maybe someone else is feeling the urge to
> combine those.

See above :).  I'm off traveling for work at the moment, but I'll try
to look at the patchset at some point next week.

josh
