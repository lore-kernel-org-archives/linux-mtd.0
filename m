Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229BFC07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 10:10:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16AF61C92
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 10:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16AF61C92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LT3Eh7LnmpzJNK2db6X3n5F/2DdwssbEyqObKtj5U/s=; b=QwNvKMojrBsopQ
	VQ4bnTnDPsL79DDVSMu/XiUyL81NlYg3ORlSmkrdRAinBX+neoOGZiFe+1j6zqf/wrVUhdhMFWfCE
	0dOzLTEwx+LTNJqefbMLCIeARAWatWZVWafLVGfeMeVH0toJlXCooR1BdnvzKlYDV14SyeDRbFAVy
	Od+e2CQzmeEbD8/PCPzypAwDpd4/8hHGIz/ctw0pt0OU609sZtRJrMx15yDAyTu/uxhMgTk+Ixorx
	NL1QGvt6EOHNldRdGYZCbZxFjO5TvtV4avOlcrvek4higABFbWfQnSWwuY60ypft442AL/we7REeg
	JovX94u4z3Iv8HRRBoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m14VB-00EPrR-Sx; Wed, 07 Jul 2021 10:09:58 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m13i1-00ED0q-Le
 for linux-mtd@lists.infradead.org; Wed, 07 Jul 2021 09:19:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id B45211BF5
 for <linux-mtd@lists.infradead.org>; Wed,  7 Jul 2021 11:19:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uzRKf6iwEE4 for <linux-mtd@lists.infradead.org>;
 Wed,  7 Jul 2021 11:19:05 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 386BA5E8; Wed,  7 Jul 2021 11:19:04 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Stefan Riedmueller <s.riedmueller@phytec.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dan Brown <dan_brown@ieee.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: nand_bbt: Skip bad blocks when searching
 for the BBT in NAND
Date: Wed, 07 Jul 2021 11:18:53 +0200
Message-ID: <2691583.eailiBHnQg@ada>
In-Reply-To: <20210706181308.1aa21d00@xps13>
References: <20210625123821.207458-1-s.riedmueller@phytec.de>
 <20210706181308.1aa21d00@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_021910_149008_79906A8C 
X-CRM114-Status: GOOD (  48.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hei hei,

Am Dienstag, 6. Juli 2021, 18:13:08 CEST schrieb Miquel Raynal:
> Hi Stefan,
> =

> Stefan Riedmueller <s.riedmueller@phytec.de> wrote on Fri, 25 Jun 2021
> =

> 14:38:21 +0200:
> > The blocks containing the bad block table can become bad as well. So
> > make sure to skip any blocks that are marked bad when searching for the
> > bad block table.
> > =

> > Otherwise in very rare cases where two BBT blocks wear out it might
> > happen that an obsolete BBT is used instead of a newer available
> > version.
> > =

> > This only applies to drivers which make use of a bad block marker in
> > flash.
> > Other drivers won't be able to identify bad BBT blocks and thus can't s=
kip
> > these.
> > =

> > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> =

> Besides the alignment of the helper parameters (nitpick) the patch
> looks good to me. If we can get someone to test it before the merge
> window closes it's perfect. Otherwise I'll apply it and we'll let robots
> do the job.

Added the patch on top of v5.10.21 and booted a SAMA5D27 based board, from =
the =

boot log:

nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
nand: AMD/Spansion S34ML02G1
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table found at page 131008, version 0xFF
Bad block table found at page 130944, version 0xFF
6 cmdlinepart partitions found on MTD device atmel_nand
Creating 6 MTD partitions on "atmel_nand":
0x000000000000-0x000000040000 : "bootstrap"
0x000000040000-0x000000100000 : "uboot"
0x000000100000-0x000000140000 : "env1"
0x000000140000-0x000000180000 : "env2"
0x000000180000-0x000000200000 : "reserved"
0x000000200000-0x000010000000 : "UBI"
NET: Registered protocol family 17
ubi0: attaching mtd5
random: fast init done
ubi0: scanning is finished
ubi0: attached mtd5 (name "UBI", size 254 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 2028, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 4, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 4/1, WL threshold: 4096, image sequence numbe=
r: =

1600812189
ubi0: available PEBs: 0, total reserved PEBs: 2028, PEBs reserved for bad P=
EB =

handling: 36
ubi0: background thread "ubi_bgt0d" started, PID 85

No suspicious other messages. =


Not sure if that device would be affected anyways. No bad blocks are known =
on =

this flash, device behaves as usual.

HTH & Greets
Alex

> =

> > ---
> > =

> > Hi,
> > =

> > this is the second approach of this patch. The first one [1] unfortunat=
ely
> > lead to boot failures on i.MX 27 boards [2] since the i.MX 27 driver us=
es
> > the bad block marker position for the bad block table marker which lead
> > to falsely identifying all BBT blocks as bad.
> > =

> > This new patch now skips the check for bad BBT blocks if the BBT marker
> > position in OOB overlaps with the bad block marker position or if a dri=
ver
> > can't use bad block markers in flash at all (NAND_BBT_NO_OOB_BBM or
> > NAND_NO_BBM_QUIRK are set). This hopefully makes sure we don't break
> > drivers which cannot check for bad BBT blocks due to the limitations
> > mentioned before.
> > =

> > I was only able to test this patch on a phyCORE-i.MX 6 and a phyCARD-i.=
MX
> > 27. Therfore would really appreciate more people testing this to make
> > sure I have not missed another use case where the bad block marker
> > position in OOB is used in a different way than for the BBM.
> > =

> > Regards,
> > Stefan
> > =

> > [1]
> > https://lore.kernel.org/linux-mtd/20210325102337.481172-1-s.riedmueller=
@p
> > hytec.de/ [2]
> > https://lore.kernel.org/linux-mtd/CAOMZO5DufVR=3D+EzCa1-MPUc+ZefZVTXb5K=
gu3W
> > xms7cxw9GmGg@mail.gmail.com/> =

> >  drivers/mtd/nand/raw/nand_bbt.c | 34 +++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > =

> > diff --git a/drivers/mtd/nand/raw/nand_bbt.c
> > b/drivers/mtd/nand/raw/nand_bbt.c index dced32a126d9..2a30714350ee 1006=
44
> > --- a/drivers/mtd/nand/raw/nand_bbt.c
> > +++ b/drivers/mtd/nand/raw/nand_bbt.c
> > @@ -447,6 +447,36 @@ static int scan_block_fast(struct nand_chip *this,
> > struct nand_bbt_descr *bd,> =

> >  	return 0;
> >  =

> >  }
> > =

> > +/* Check if a potential BBT block is marked as bad */
> > +static int bbt_block_checkbad(struct nand_chip *this,
> > +				      struct nand_bbt_descr *td,
> > +				      loff_t offs, uint8_t *buf)
> > +{
> > +	struct nand_bbt_descr *bd =3D this->badblock_pattern;
> > +
> > +	/*
> > +	 * No need to check for a bad BBT block if the BBM area overlaps with
> > +	 * the bad block table marker area in OOB since writing a BBM here
> > +	 * invalidates the bad block table marker anyway.
> > +	 */
> > +	if (!(td->options & NAND_BBT_NO_OOB) &&
> > +	    td->offs >=3D bd->offs && td->offs < bd->offs + bd->len)
> > +		return 0;
> > +
> > +	/*
> > +	 * There is no point in checking for a bad block marker if writing
> > +	 * such marker is not supported
> > +	 */
> > +	if (this->bbt_options & NAND_BBT_NO_OOB_BBM ||
> > +	    this->options & NAND_NO_BBM_QUIRK)
> > +		return 0;
> > +
> > +	if (scan_block_fast(this, bd, offs, buf) > 0)
> > +		return 1;
> > +
> > +	return 0;
> > +}
> > +
> > =

> >  /**
> >  =

> >   * create_bbt - [GENERIC] Create a bad block table by scanning the dev=
ice
> >   * @this: NAND chip object
> > =

> > @@ -560,6 +590,10 @@ static int search_bbt(struct nand_chip *this, uint=
8_t
> > *buf,> =

> >  			int actblock =3D startblock + dir * block;
> >  			loff_t offs =3D (loff_t)actblock << this->bbt_erase_shift;
> > =

> > +			/* Check if block is marked bad */
> > +			if (bbt_block_checkbad(this, td, offs, buf))
> > +				continue;
> > +
> > =

> >  			/* Read first page */
> >  			scan_read(this, buf, offs, mtd->writesize, td);
> >  			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
> =

> Thanks,
> Miqu=E8l
> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
