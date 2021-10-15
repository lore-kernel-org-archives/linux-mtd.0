Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E1BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 09:31:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC0161151
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 09:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BC0161151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aycMyqCGyEhQ3zr+BExnKFbPOMsj6u9p8LHWkJk4DkQ=; b=uJ0Bc8w7+644zoeP6ZaxxLh9pJ
	h7Ol6fdEcH0HPvztVF7qFdpIsbNf5Qd6wJI028AGRjQm46FE5o2XSoW3LbFM690XonKcOuuxi+0YY
	BWXfmdv8mQcJxAnDWf3/BfL3WV9sWZ/mHMdZ2o/p68TgxACb5jAvtnyVgOTiBBzvVNZQODbnABma6
	I1jqdudvhsQ2O8gaogajmwBDuCN0vezlCg9Uj1C5bsxIWeR6LTd4tgQsK0feunFfQncq3+tZCk435
	hGq4XzgakpqwyRRxJjPPHaXZCTBBvyKeYS0qvbzLfd726gmBhKoS0NX8UnWXWwRTsiUuD5GguDlgg
	T1kuGc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbJXj-006ILa-0G; Fri, 15 Oct 2021 09:30:23 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbJUq-006H0z-11
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 09:27:26 +0000
Date: Fri, 15 Oct 2021 10:27:08 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] mtd: rawnand: Export nand_read_page_hwecc_oob_first()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 list@opendingux.net, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <89I01R.QTBARVYLTBT02@crapouillou.net>
In-Reply-To: <20211015105146.3d2fbd08@xps13>
References: <20211009184952.24591-1-paul@crapouillou.net>
 <20211009184952.24591-3-paul@crapouillou.net>
 <20211015081313.60018976@xps13> <70G01R.2VROMW06O3O83@crapouillou.net>
 <20211015105146.3d2fbd08@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_022724_273306_5B73E2A3 
X-CRM114-Status: GOOD (  36.00  )
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



Le ven., oct. 15 2021 at 10:51:46 +0200, Miquel Raynal =

<miquel.raynal@bootlin.com> a =E9crit :
> Hi Paul,
> =

> paul@crapouillou.net wrote on Fri, 15 Oct 2021 09:38:31 +0100:
> =

>>  Hi Miquel,
>> =

>>  Le ven., oct. 15 2021 at 08:13:13 +0200, Miquel Raynal =

>> <miquel.raynal@bootlin.com> a =E9crit :
>>  > Hi Paul,
>>  >
>>  > paul@crapouillou.net wrote on Sat,  9 Oct 2021 20:49:51 +0200:
>>  >
>>  >>  Move the function nand_read_page_hwecc_oob_first() (previously
>>  >>  nand_davinci_read_page_hwecc_oob_first()) to nand_base.c, and =

>> >> export it
>>  >>  as a GPL symbol, so that it can be used by more modules.
>>  >> >>  Cc: <stable@vger.kernel.org> # v5.2
>>  >>  Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for =

>> the >> JZ4740")
>>  >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  >>  ---
>>  >>   drivers/mtd/nand/raw/davinci_nand.c | 70 >> =

>> +----------------------------
>>  >>   drivers/mtd/nand/raw/nand_base.c    | 69 >> =

>> ++++++++++++++++++++++++++++
>>  >>   include/linux/mtd/rawnand.h         |  2 +
>>  >>   3 files changed, 72 insertions(+), 69 deletions(-)
>>  >> >>  diff --git a/drivers/mtd/nand/raw/davinci_nand.c >> =

>> b/drivers/mtd/nand/raw/davinci_nand.c
>>  >>  index 89de24d3bb7a..45fec8c192ab 100644
>>  >>  --- a/drivers/mtd/nand/raw/davinci_nand.c
>>  >>  +++ b/drivers/mtd/nand/raw/davinci_nand.c
>>  >>  @@ -371,74 +371,6 @@ static int =

>> nand_davinci_correct_4bit(struct >> nand_chip *chip, u_char *data,
>>  >>   	return corrected;
>>  >>   }
>>  >> >>  -/**
>>  >>  - * nand_read_page_hwecc_oob_first - hw ecc, read oob first
>>  >>  - * @chip: nand chip info structure
>>  >>  - * @buf: buffer to store read data
>>  >>  - * @oob_required: caller requires OOB data read to =

>> chip->oob_poi
>>  >>  - * @page: page number to read
>>  >>  - *
>>  >>  - * Hardware ECC for large page chips, require OOB to be read =

>> >> first. For this
>>  >>  - * ECC mode, the write_page method is re-used from ECC_HW. =

>> These >> methods
>>  >>  - * read/write ECC from the OOB area, unlike the =

>> ECC_HW_SYNDROME >> support with
>>  >>  - * multiple ECC steps, follows the "infix ECC" scheme and >> =

>> reads/writes ECC from
>>  >>  - * the data area, by overwriting the NAND manufacturer bad =

>> block >> markings.
>>  >>  - */
>>  >>  -static int nand_davinci_read_page_hwecc_oob_first(struct =

>> nand_chip >> *chip,
>>  >>  -						  uint8_t *buf,
>>  >>  -						  int oob_required, int page)
>>  >>  -{
>>  >>  -	struct mtd_info *mtd =3D nand_to_mtd(chip);
>>  >>  -	int i, eccsize =3D chip->ecc.size, ret;
>>  >>  -	int eccbytes =3D chip->ecc.bytes;
>>  >>  -	int eccsteps =3D chip->ecc.steps;
>>  >>  -	uint8_t *p =3D buf;
>>  >>  -	uint8_t *ecc_code =3D chip->ecc.code_buf;
>>  >>  -	unsigned int max_bitflips =3D 0;
>>  >>  -
>>  >>  -	/* Read the OOB area first */
>>  >>  -	ret =3D nand_read_oob_op(chip, page, 0, chip->oob_poi, >> =

>> mtd->oobsize);
>>  >>  -	if (ret)
>>  >>  -		return ret;
>>  >>  -
>>  >>  -	ret =3D nand_read_page_op(chip, page, 0, NULL, 0);
>>  >>  -	if (ret)
>>  >>  -		return ret;
>>  >>  -
>>  >>  -	ret =3D mtd_ooblayout_get_eccbytes(mtd, ecc_code, =

>> chip->oob_poi, 0,
>>  >>  -					 chip->ecc.total);
>>  >>  -	if (ret)
>>  >>  -		return ret;
>>  >>  -
>>  >>  -	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D =

>> eccsize) {
>>  >>  -		int stat;
>>  >>  -
>>  >>  -		chip->ecc.hwctl(chip, NAND_ECC_READ);
>>  >>  -
>>  >>  -		ret =3D nand_read_data_op(chip, p, eccsize, false, false);
>>  >>  -		if (ret)
>>  >>  -			return ret;
>>  >>  -
>>  >>  -		stat =3D chip->ecc.correct(chip, p, &ecc_code[i], NULL);
>>  >>  -		if (stat =3D=3D -EBADMSG &&
>>  >>  -		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
>>  >>  -			/* check for empty pages with bitflips */
>>  >>  -			stat =3D nand_check_erased_ecc_chunk(p, eccsize,
>>  >>  -							   &ecc_code[i],
>>  >>  -							   eccbytes, NULL, 0,
>>  >>  -							   chip->ecc.strength);
>>  >>  -		}
>>  >>  -
>>  >>  -		if (stat < 0) {
>>  >>  -			mtd->ecc_stats.failed++;
>>  >>  -		} else {
>>  >>  -			mtd->ecc_stats.corrected +=3D stat;
>>  >>  -			max_bitflips =3D max_t(unsigned int, max_bitflips, stat);
>>  >>  -		}
>>  >>  -	}
>>  >>  -	return max_bitflips;
>>  >>  -}
>>  >>  -
>>  >>   >> =

>> /*----------------------------------------------------------------------
>>  */
>>  >> >>   /* An ECC layout for using 4-bit ECC with small-page flash, =

>> storing
>>  >>  @@ -648,7 +580,7 @@ static int davinci_nand_attach_chip(struct =

>> >> nand_chip *chip)
>>  >>   			} else if (chunks =3D=3D 4 || chunks =3D=3D 8) {
>>  >>   				mtd_set_ooblayout(mtd,
>>  >>   						  nand_get_large_page_ooblayout());
>>  >>  -				chip->ecc.read_page =3D =

>> nand_davinci_read_page_hwecc_oob_first;
>>  >>  +				chip->ecc.read_page =3D nand_read_page_hwecc_oob_first;
>>  >>   			} else {
>>  >>   				return -EIO;
>>  >>   			}
>>  >>  diff --git a/drivers/mtd/nand/raw/nand_base.c >> =

>> b/drivers/mtd/nand/raw/nand_base.c
>>  >>  index 3d6c6e880520..cb5f343b9fa2 100644
>>  >>  --- a/drivers/mtd/nand/raw/nand_base.c
>>  >>  +++ b/drivers/mtd/nand/raw/nand_base.c
>>  >>  @@ -3160,6 +3160,75 @@ static int nand_read_page_hwecc(struct =

>> >> nand_chip *chip, uint8_t *buf,
>>  >>   	return max_bitflips;
>>  >>   }
>>  >> >>  +/**
>>  >>  + * nand_read_page_hwecc_oob_first - Hardware ECC page read =

>> with ECC
>>  >>  + *                                  data read from OOB area
>>  >>  + * @chip: nand chip info structure
>>  >>  + * @buf: buffer to store read data
>>  >>  + * @oob_required: caller requires OOB data read to =

>> chip->oob_poi
>>  >>  + * @page: page number to read
>>  >>  + *
>>  >>  + * Hardware ECC for large page chips, require OOB to be read =

>> >> first. For this
>>  >
>>  > requires
>>  >
>>  > With this ECC configuration?
>>  >
>>  >>  + * ECC mode, the write_page method is re-used from ECC_HW. =

>> These >> methods
>>  >
>>  > I do not understand this sentence nor the next one about =

>> syndrome. I
>>  > believe it is related to your engine and should not leak into the =

>> > core.
>>  >
>>  >>  + * read/write ECC from the OOB area, unlike the =

>> ECC_HW_SYNDROME >> support with
>>  >>  + * multiple ECC steps, follows the "infix ECC" scheme and >> =

>> reads/writes ECC from
>>  >>  + * the data area, by overwriting the NAND manufacturer bad =

>> block >> markings.
>>  >
>>  > That's a sentence I don't like. What do you mean exactly?
>>  >
>>  > What "Infix ECC" scheme is?
>>  >
>>  > Do you mean that unlike the syndrome  mode it *does not* =

>> overwrite the
>>  > BBM ?
>> =

>>  I don't mean anything. I did not write that comment. I just moved =

>> the function verbatim with no changes. If something needs to be =

>> fixed, then it needs to be fixed before/after this patch.
> =

> Well, this comment should be adapted because as-is I don't think it's
> wise to move it around.

OK.

I think it says that BBM can be overwritten with this configuration, =

but that would be if the OOB layout covers the BBM area.

>> =

>>  >>  + */
>>  >>  +int nand_read_page_hwecc_oob_first(struct nand_chip *chip, =

>> uint8_t >> *buf,
>>  >>  +				   int oob_required, int page)
>>  >>  +{
>>  >>  +	struct mtd_info *mtd =3D nand_to_mtd(chip);
>>  >>  +	int i, eccsize =3D chip->ecc.size, ret;
>>  >>  +	int eccbytes =3D chip->ecc.bytes;
>>  >>  +	int eccsteps =3D chip->ecc.steps;
>>  >>  +	uint8_t *p =3D buf;
>>  >>  +	uint8_t *ecc_code =3D chip->ecc.code_buf;
>>  >>  +	unsigned int max_bitflips =3D 0;
>>  >>  +
>>  >>  +	/* Read the OOB area first */
>>  >>  +	ret =3D nand_read_oob_op(chip, page, 0, chip->oob_poi, >> =

>> mtd->oobsize);
>>  >>  +	if (ret)
>>  >>  +		return ret;
>>  >>  +
>>  >>  +	ret =3D nand_read_page_op(chip, page, 0, NULL, 0);
>>  >
>>  > Definitely not, your are requesting the chip to do the read_page
>>  > operation twice. You only need a nand_change_read_column I =

>> believe.
>> =

>>  Again, this code is just being moved around - don't shoot the =

>> messenger :)
> =

> haha
> =

> Well, now you touch the core, so I need to be more careful, and the
> code is definitely wrong, so even if we don't move that code off, you
> definitely want to fix it in order to improve your performances.

I don't see the read_page being done twice?

There's one read_oob, one read_page, then read_data in the loop.

>>  >>  +	if (ret)
>>  >>  +		return ret;
>>  >>  +
>>  >>  +	ret =3D mtd_ooblayout_get_eccbytes(mtd, ecc_code, =

>> chip->oob_poi, 0,
>>  >>  +					 chip->ecc.total);
>>  >>  +	if (ret)
>>  >>  +		return ret;
>>  >>  +
>>  >>  +	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D =

>> eccsize) {
>>  >>  +		int stat;
>>  >>  +
>>  >>  +		chip->ecc.hwctl(chip, NAND_ECC_READ);
>>  >>  +
>>  >>  +		ret =3D nand_read_data_op(chip, p, eccsize, false, false);
>>  >>  +		if (ret)
>>  >>  +			return ret;
>>  >>  +
>>  >>  +		stat =3D chip->ecc.correct(chip, p, &ecc_code[i], NULL);
>>  >>  +		if (stat =3D=3D -EBADMSG &&
>>  >>  +		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
>>  >>  +			/* check for empty pages with bitflips */
>>  >>  +			stat =3D nand_check_erased_ecc_chunk(p, eccsize,
>>  >>  +							   &ecc_code[i],
>>  >>  +							   eccbytes, NULL, 0,
>>  >>  +							   chip->ecc.strength);
>>  >>  +		}
>>  >>  +
>>  >>  +		if (stat < 0) {
>>  >>  +			mtd->ecc_stats.failed++;
>>  >>  +		} else {
>>  >>  +			mtd->ecc_stats.corrected +=3D stat;
>>  >>  +			max_bitflips =3D max_t(unsigned int, max_bitflips, stat);
>>  >>  +		}
>>  >>  +	}
>>  >>  +	return max_bitflips;
>>  >>  +}
>>  >>  +EXPORT_SYMBOL_GPL(nand_read_page_hwecc_oob_first);
>>  >>  +
>>  >>   /**
>>  >>    * nand_read_page_syndrome - [REPLACEABLE] hardware ECC =

>> syndrome >> based page read
>>  >>    * @chip: nand chip info structure
>>  >>  diff --git a/include/linux/mtd/rawnand.h >> =

>> b/include/linux/mtd/rawnand.h
>>  >>  index b2f9dd3cbd69..5b88cd51fadb 100644
>>  >>  --- a/include/linux/mtd/rawnand.h
>>  >>  +++ b/include/linux/mtd/rawnand.h
>>  >>  @@ -1539,6 +1539,8 @@ int nand_read_data_op(struct nand_chip =

>> *chip, >> void *buf, unsigned int len,
>>  >>   		      bool force_8bit, bool check_only);
>>  >>   int nand_write_data_op(struct nand_chip *chip, const void *buf,
>>  >>   		       unsigned int len, bool force_8bit);
>>  >>  +int nand_read_page_hwecc_oob_first(struct nand_chip *chip, =

>> uint8_t >> *buf,
>>  >>  +				   int oob_required, int page);
>>  >
>>  > You certainly want to add this symbol closer to the other =

>> read/write
>>  > page helpers?
>> =

>>  Where would that be? The other read/write page helpers are all =

>> "static" so they don't appear in any header.
> =

> I believe we should keep this header local as long as there are no
> other users.

I'll move it to internal.h then.

Cheers,
-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
