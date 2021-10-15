Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9204AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 09:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E98E60F25
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 09:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E98E60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+meUQBS0aMfrYi/qtLWr5KpPtLn4aZzIcD47wYt6+F8=; b=PDh0m7kfyioKhokuEoqVDm3Pih
	SGXKJ91Ki74Jp/tKlbL8QTHUus6euTLRQy3oGkL6rE2bAzS/PuSncvUSEXtwt4VGH42Do+jdJNOfb
	BtWgb1RuUcBIhP5ojEfpct/A400obmgalmT8IWPxeAfIrI1Yai9QtUdnOoH6rWEQQ8Q0d70IHW/ye
	/A5g7jIHviCR0+F69TsH81+3Dfw/fPC0H2hVX4E1/UfuvexcJo73tkH8xze3l2zwJcdhW+nWkMPeL
	GGf0GtrFo0ePqSJlxwWJPvxT0yiWy1LhHfCu/VpEaWqgE/9K/+CdjGLWDrhqGAoLOyGRb+rxIwvC2
	SEJhZqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbJfb-006L8h-B5; Fri, 15 Oct 2021 09:38:31 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbJfI-006L1u-GE
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 09:38:14 +0000
Date: Fri, 15 Oct 2021 10:38:00 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] mtd: rawnand: Export nand_read_page_hwecc_oob_first()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 list@opendingux.net, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <CRI01R.KF0NPTKK5WYV1@crapouillou.net>
In-Reply-To: <20211015113515.7b10a2d5@xps13>
References: <20211009184952.24591-1-paul@crapouillou.net>
 <20211009184952.24591-3-paul@crapouillou.net>
 <20211015081313.60018976@xps13> <70G01R.2VROMW06O3O83@crapouillou.net>
 <20211015105146.3d2fbd08@xps13> <89I01R.QTBARVYLTBT02@crapouillou.net>
 <20211015113515.7b10a2d5@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_023812_771043_F5DD9664 
X-CRM114-Status: GOOD (  30.43  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Le ven., oct. 15 2021 at 11:35:15 +0200, Miquel Raynal =

<miquel.raynal@bootlin.com> a =E9crit :
> Hi Paul,
> =

>>  >>  */
>>  >>  >> >>   /* An ECC layout for using 4-bit ECC with small-page =

>> flash, >> storing
>>  >>  >>  @@ -648,7 +580,7 @@ static int =

>> davinci_nand_attach_chip(struct >> >> nand_chip *chip)
>>  >>  >>   			} else if (chunks =3D=3D 4 || chunks =3D=3D 8) {
>>  >>  >>   				mtd_set_ooblayout(mtd,
>>  >>  >>   						  nand_get_large_page_ooblayout());
>>  >>  >>  -				chip->ecc.read_page =3D >> =

>> nand_davinci_read_page_hwecc_oob_first;
>>  >>  >>  +				chip->ecc.read_page =3D nand_read_page_hwecc_oob_first;
>>  >>  >>   			} else {
>>  >>  >>   				return -EIO;
>>  >>  >>   			}
>>  >>  >>  diff --git a/drivers/mtd/nand/raw/nand_base.c >> >> =

>> b/drivers/mtd/nand/raw/nand_base.c
>>  >>  >>  index 3d6c6e880520..cb5f343b9fa2 100644
>>  >>  >>  --- a/drivers/mtd/nand/raw/nand_base.c
>>  >>  >>  +++ b/drivers/mtd/nand/raw/nand_base.c
>>  >>  >>  @@ -3160,6 +3160,75 @@ static int =

>> nand_read_page_hwecc(struct >> >> nand_chip *chip, uint8_t *buf,
>>  >>  >>   	return max_bitflips;
>>  >>  >>   }
>>  >>  >> >>  +/**
>>  >>  >>  + * nand_read_page_hwecc_oob_first - Hardware ECC page read =

>> >> with ECC
>>  >>  >>  + *                                  data read from OOB area
>>  >>  >>  + * @chip: nand chip info structure
>>  >>  >>  + * @buf: buffer to store read data
>>  >>  >>  + * @oob_required: caller requires OOB data read to >> =

>> chip->oob_poi
>>  >>  >>  + * @page: page number to read
>>  >>  >>  + *
>>  >>  >>  + * Hardware ECC for large page chips, require OOB to be =

>> read >> >> first. For this
>>  >>  >
>>  >>  > requires
>>  >>  >
>>  >>  > With this ECC configuration?
>>  >>  >
>>  >>  >>  + * ECC mode, the write_page method is re-used from ECC_HW. =

>> >> These >> methods
>>  >>  >
>>  >>  > I do not understand this sentence nor the next one about >> =

>> syndrome. I
>>  >>  > believe it is related to your engine and should not leak into =

>> the >> > core.
>>  >>  >
>>  >>  >>  + * read/write ECC from the OOB area, unlike the >> =

>> ECC_HW_SYNDROME >> support with
>>  >>  >>  + * multiple ECC steps, follows the "infix ECC" scheme and =

>> >> >> reads/writes ECC from
>>  >>  >>  + * the data area, by overwriting the NAND manufacturer bad =

>> >> block >> markings.
>>  >>  >
>>  >>  > That's a sentence I don't like. What do you mean exactly?
>>  >>  >
>>  >>  > What "Infix ECC" scheme is?
>>  >>  >
>>  >>  > Do you mean that unlike the syndrome  mode it *does not* >> =

>> overwrite the
>>  >>  > BBM ?
>>  >> >>  I don't mean anything. I did not write that comment. I just =

>> moved >> the function verbatim with no changes. If something needs =

>> to be >> fixed, then it needs to be fixed before/after this patch.
>>  >
>>  > Well, this comment should be adapted because as-is I don't think =

>> it's
>>  > wise to move it around.
>> =

>>  OK.
>> =

>>  I think it says that BBM can be overwritten with this =

>> configuration, but that would be if the OOB layout covers the BBM =

>> area.
> =

> If the ooblayout prevents the BBM to be smatched I'm fine and this
> sentence should disappear because it's misleading.
> =

>>  >> >>  >>  + */
>>  >>  >>  +int nand_read_page_hwecc_oob_first(struct nand_chip *chip, =

>> >> uint8_t >> *buf,
>>  >>  >>  +				   int oob_required, int page)
>>  >>  >>  +{
>>  >>  >>  +	struct mtd_info *mtd =3D nand_to_mtd(chip);
>>  >>  >>  +	int i, eccsize =3D chip->ecc.size, ret;
>>  >>  >>  +	int eccbytes =3D chip->ecc.bytes;
>>  >>  >>  +	int eccsteps =3D chip->ecc.steps;
>>  >>  >>  +	uint8_t *p =3D buf;
>>  >>  >>  +	uint8_t *ecc_code =3D chip->ecc.code_buf;
>>  >>  >>  +	unsigned int max_bitflips =3D 0;
>>  >>  >>  +
>>  >>  >>  +	/* Read the OOB area first */
>>  >>  >>  +	ret =3D nand_read_oob_op(chip, page, 0, chip->oob_poi, >> =

>> >> mtd->oobsize);
>>  >>  >>  +	if (ret)
>>  >>  >>  +		return ret;
>>  >>  >>  +
>>  >>  >>  +	ret =3D nand_read_page_op(chip, page, 0, NULL, 0);
>>  >>  >
>>  >>  > Definitely not, your are requesting the chip to do the =

>> read_page
>>  >>  > operation twice. You only need a nand_change_read_column I >> =

>> believe.
>>  >> >>  Again, this code is just being moved around - don't shoot =

>> the >> messenger :)
>>  >
>>  > haha
>>  >
>>  > Well, now you touch the core, so I need to be more careful, and =

>> the
>>  > code is definitely wrong, so even if we don't move that code off, =

>> you
>>  > definitely want to fix it in order to improve your performances.
>> =

>>  I don't see the read_page being done twice?
>> =

>>  There's one read_oob, one read_page, then read_data in the loop.
> =

> read_oob and read_page both end up sending READ0 and READSTART so
> they do request the chip to perform an internal read twice. You
> need this only once. The call to nand_read_page_op() should be a
> nand_change_read_column() with no data requested.

OK.

> =

>>  >>  >>   /**
>>  >>  >>    * nand_read_page_syndrome - [REPLACEABLE] hardware ECC >> =

>> syndrome >> based page read
>>  >>  >>    * @chip: nand chip info structure
>>  >>  >>  diff --git a/include/linux/mtd/rawnand.h >> >> =

>> b/include/linux/mtd/rawnand.h
>>  >>  >>  index b2f9dd3cbd69..5b88cd51fadb 100644
>>  >>  >>  --- a/include/linux/mtd/rawnand.h
>>  >>  >>  +++ b/include/linux/mtd/rawnand.h
>>  >>  >>  @@ -1539,6 +1539,8 @@ int nand_read_data_op(struct =

>> nand_chip >> *chip, >> void *buf, unsigned int len,
>>  >>  >>   		      bool force_8bit, bool check_only);
>>  >>  >>   int nand_write_data_op(struct nand_chip *chip, const void =

>> *buf,
>>  >>  >>   		       unsigned int len, bool force_8bit);
>>  >>  >>  +int nand_read_page_hwecc_oob_first(struct nand_chip *chip, =

>> >> uint8_t >> *buf,
>>  >>  >>  +				   int oob_required, int page);
>>  >>  >
>>  >>  > You certainly want to add this symbol closer to the other >> =

>> read/write
>>  >>  > page helpers?
>>  >> >>  Where would that be? The other read/write page helpers are =

>> all >> "static" so they don't appear in any header.
>>  >
>>  > I believe we should keep this header local as long as there are no
>>  > other users.
>> =

>>  I'll move it to internal.h then.
> =

> Why do you want to put it there is there is only one user?

But there are two users: davinci_nand.c and (with patch [3/3]) =

ingenic/ingenic_nand_drv.c.

-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
