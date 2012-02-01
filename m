Received: from 14.mo3.mail-out.ovh.net ([188.165.43.98]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RsXfG-0005I9-K2
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 10:43:47 +0000
Received: from mail176.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 0BBE3100C911
 for <linux-mtd@lists.infradead.org>; Wed,  1 Feb 2012 11:45:44 +0100 (CET)
Date: Wed, 1 Feb 2012 11:43:35 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix access to 16 bit NAND devices
Message-ID: <20120201114335.485040b9@eb-e6520>
In-Reply-To: <4F265B7E.6060806@atmel.com>
References: <201201251217.q0PCHmRe027024@gatekeeper.vosshq.de>
 <1327670996.26648.43.camel@sauron.fi.intel.com>
 <EF2E73589CA71846A15D0B2CDF79505D08AD3E5453@wm021.weinmann.com>
 <4F265B7E.6060806@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Voss, Nikolaus" <N.Voss@weinmann.de>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "'dedekind1@gmail.com'" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good morning,

Le Mon, 30 Jan 2012 09:57:34 +0100,
Nicolas Ferre <nicolas.ferre@atmel.com> a =E9crit :

> On 01/30/2012 08:57 AM, Voss, Nikolaus :
> > Artem Bityutskiy wrote on 2012-01-27:
> >> On Wed, 2012-01-18 at 10:16 +0100, Nikolaus Voss wrote:
> >>> commit fb5427508abbd635e877fabdf55795488119c2d6 optimizes PIO
> >>> NAND accesses by using IO memcpy instead of IO read/write
> >>> repeated functions.
> >>>
> >>> This breaks access to 16 bit NAND devices as memcpy_fromio()/toio()
> >>> _always_ use byte accesses (see arch/arm/kernel/io.c), so with
> >>> 16 bit NAND, one byte gets lost per NAND access cycle and NAND
> >>> address count is wrong.
> >>>
> >>> Using memcpy() instead of the IO memcpy functions fixes this, but
> >>> depends on correct word alignment of the buffer and length has to
> >>> be a multiple of four, otherwise it might issue byte accesses and
> >>> possibly break 16 bit NAND access (cf arch/arm/lib/copy_template.S).
> >>>
> >>> Memcpy variants seem to be the wrong approach here, since the
> >>> NAND controller doesn't make the NAND appear as truely randomly
> >>> accessible memory (as opposed to the DRAM controller which does
> >>> exactly that).
> >>>
> >>> So, my proposal is to use 32 bit IO read/write (and let SMC
> >>> map it to 8 bit or 16 bit NAND accesses) and account for
> >>> length % 4 > 0 with two additional IO read/writes.
> >>>
> >>> Signed-off-by: Nikolaus Voss <n.voss@weinmann.de>
> >>
> >> Why not to revert fb5427508abbd635e877fabdf55795488119c2d6 instead, it
> >> is in my opinion a bit more readable?
> >=20
> > No objections. I've tried to save the idea of
> > fb5427508abbd635e877fabdf55795488119c2d6 but that length % 4 > 0 stuff
> > uglifies it a little bit...
>=20
> After double checking with designers, I must admit that I misunderstood
> the way of optimizing accesses to SMC. 16 bit nand is not so common
> those days...
>=20
> So yes, Nikolaus your correction makes sense.
>=20
> What I would have liked is to optimize the possibility to trigger
> incremental bursts from the processor to the SMC on internal bus. I
> suspect that this will need further investigation (moreover, note that
> if we use assembly code, we should also think about AVR32).
>=20
> In conclusion, maybe simply reverting the initial commit will allow us
> to rework this part of code from simpler basis.
>=20
> Artem, do you want me to prepare a patch for reverting initial commit or
> you just need my "Acked-by" (feel free to add though)?
>=20
I confirm this patch breaks 16 bits NAND flash (tested on a SAM9G45
with linux-3.2.2) and that reverting it solves the problem.

Best regards
Eric
http://eukrea.com/en/news/104-2012
