Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A84C2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 12:30:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558632064C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 12:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AjJuoCC0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="CioAcEVV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558632064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VQXicAKyILxjNFETEwmTAiRbwq6quf6e6IGoyhr+KOs=; b=AjJuoCC0K7B044BYaQaEopEfK
	M/NnEEb/cTgUx8g4At/iEao5/qq/KjUn4YuxGeviVcb/xFoSTB0c415p1t5Lj7V6T3nMTuzZ/KYEB
	l0TFCw4XAMhU8fLwgm2bI/gdn+xTRp0zMJ1EIIErzBxGCBsq31CrBTTS3aCeZm9jBlXZBEd40DgkX
	nzjVjGqSz2FGa44p+DUBGt3WdV0lYoe3dJBLBPYuHv+xM1juCtIEBixBITpgqAWrnxWNE4vxPKV4u
	0bJdL7CHHerXO8IWTVm3XfA+Gp4FlZLkkUCur3fL8B4VdtySK8LjsFNkwlEGy7Al/i1/G2FjywSDn
	jcQbtcU7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwQ0U-00088W-Of; Tue, 28 Jan 2020 12:30:14 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwQ0P-0006w8-CJ
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 12:30:13 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 71DCF22FEB;
 Tue, 28 Jan 2020 13:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1580214599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkK7OcD2huaPLr6cdjVyj7AcddR3vQMHYAYd/o5zr/Y=;
 b=CioAcEVVM7JI4UtaphGfFM4e84gRNmGPh1SX2MGGwrkVVpzz1Vp9KEGCRGxwvq61tkCSA1
 u5+pd8ULjedh5ZkBaN8KqJOvDd2f6pnwISs9gEINPQWutDPV27Q4tU0oogcxoPfvQnJyDq
 1HJZdYbYn+x3PYxNjPmVi9lRh1sSXU4=
MIME-Version: 1.0
Date: Tue, 28 Jan 2020 13:29:55 +0100
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: [SPAM] Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection
 support
In-Reply-To: <4fd7374e9362895b5c80d7bfe8a05c6552572243.camel@samsung.com>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <CGME20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef@epcas1p2.samsung.com>
 <20200122193608.3859-1-michael@walle.cc>
 <0c4e70fcf58c93f9b7375d83b50028df225aed82.camel@samsung.com>
 <f4581c4cb231cc4c61b9a146dda5fada@walle.cc>
 <7843bb76c9c3854a4b9fa4b2b69d760e965bbb22.camel@samsung.com>
 <0882ce3e8cf9de25681b475f10154cef@walle.cc>
 <4fd7374e9362895b5c80d7bfe8a05c6552572243.camel@samsung.com>
Message-ID: <2e02aaef6289f24f672f84eadb28f31a@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: ++++++++
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 71DCF22FEB
X-Spamd-Result: default: False [8.90 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DBL_ABUSE_MALWARE(7.50)[infradead.org:url];
 RCPT_COUNT_FIVE(0.00)[5]; DKIM_SIGNED(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,microchip.com,ti.com];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_043009_790312_730CC7F9 
X-CRM114-Status: GOOD (  35.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-01-28 12:01, schrieb Jungseung Lee:
> Hi, Michael
> 
> 2020-01-23 (Thu), 10:31 +0100, Michael Walle:
>> Am 2020-01-23 09:53, schrieb Jungseung Lee:
>> > Hi, Michael
>> >
>> > 2020-01-23 (Thu), 09:10 +0100, Michael Walle:
>> > > Hi Jungseung,
>> > >
>> > > Am 2020-01-23 07:22, schrieb Jungseung Lee:
>> > > > Hi, Michael
>> > > >
>> > > > 2020-01-22 (Wed), 20:36 +0100, Michael Walle:
>> > > > > Hi,
>> > > > >
>> > > > > > Currently, we are supporting block protection only for
>> > > > > > flash chips with 3 block protection bits in the SR
>> > > > > > register.
>> > > > > > This patch enables block protection support for some flash
>> > > > > > with
>> > > > > > 4 block protection bits(bp0-3).
>> > > > > >
>> > > > > > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
>> > > > > > ---
>> > > > > > v3 :
>> > > > > >   Fix wrong ofs calculation on v2 patch
>> > > > > > v2 :
>> > > > > >   Add sample table portion about 4bit block protection on
>> > > > > > the
>> > > > > > comment
>> > > > > >   Trivial coding style change
>> > > > > >
>> > > > > >  drivers/mtd/spi-nor/spi-nor.c | 127
>> > > > > > +++++++++++++++++++++++++++++-
>> > > > > > ----
>> > > > > >  include/linux/mtd/spi-nor.h   |   8 +++
>> > > > > >  2 files changed, 119 insertions(+), 16 deletions(-)
>> > > > > >
>> > > > > > diff --git a/drivers/mtd/spi-nor/spi-nor.c
>> > > > > > b/drivers/mtd/spi-
>> > > > > > nor/spi-nor.c
>> > > > > > index e3da6a8654a8..7e8af6c4fdfa 100644
>> > > > > > --- a/drivers/mtd/spi-nor/spi-nor.c
>> > > > > > +++ b/drivers/mtd/spi-nor/spi-nor.c
>> > > > > > @@ -238,6 +238,14 @@ struct flash_info {
>> > > > > >  					 * status register.
>> > > > > > Must be
>> > > > > > used with
>> > > > > >  					 * SPI_NOR_HAS_TB.
>> > > > > >  					 */
>> > > > > > +#define SPI_NOR_HAS_BP3		BIT(17)	/*
>> > > > > > +					 * Flash SR has 4 bit
>> > > > > > fields
>> > > > > > (BP0-3)
>> > > > > > +					 * for block
>> > > > > > protection.
>> > > > > > +					 */
>> > > > > > +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
>> > > > > > +					 * BP3 is bit 6 of
>> > > > > > status
>> > > > > > register.
>> > > > > > +					 * Must be used with
>> > > > > > SPI_NOR_HAS_BP3.
>> > > > > > +					 */
>> > > > > >
>> > > > > >  	/* Part specific fixup hooks. */
>> > > > > >  	const struct spi_nor_fixups *fixups;
>> > > > > > @@ -1767,23 +1775,47 @@ static void
>> > > > > > stm_get_locked_range(struct
>> > > > > > spi_nor *nor, u8 sr, loff_t *ofs,
>> > > > > >  	struct mtd_info *mtd = &nor->mtd;
>> > > > > >  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>> > > > > >  	u8 tb_mask = SR_TB_BIT5;
>> > > > > > -	int pow;
>> > > > > > +	u8 bp;
>> > > > > > +	int pow = 0;
>> > > > > >
>> > > > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>> > > > > >  		tb_mask = SR_TB_BIT6;
>> > > > > >
>> > > > > > -	if (!(sr & mask)) {
>> > > > > > -		/* No protection */
>> > > > > > -		*ofs = 0;
>> > > > > > -		*len = 0;
>> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
>> > > > > > +		u8 tmp;
>> > > > > > +
>> > > > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
>> > > > > > +			tmp = sr & (mask | SR_BP3_BIT6);
>> > > > > > +		else
>> > > > > > +			tmp = sr & (mask | SR_BP3_BIT5);
>> > > > > > +
>> > > > > > +		if (tmp & SR_BP3_BIT6)
>> > > > > > +			tmp = (tmp & ~BIT(6)) | BIT(5);
>> > > > > > +
>> > > > > > +		bp = tmp >> SR_BP_SHIFT;
>> > > > > > +		if (!bp) {
>> > > > > > +			*ofs = 0;
>> > > > > > +			*len = 0;
>> > > > > > +			return;
>> > > > > > +		}
>> > > > > > +		if (bp <= ilog2(nor->n_sectors))
>> > > > > > +			pow = ilog2(nor->n_sectors) + 1 - bp;
>> > > > > >  	} else {
>> > > > > > -		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
>> > > > > > -		*len = mtd->size >> pow;
>> > > > > > -		if (nor->flags & SNOR_F_HAS_SR_TB && sr &
>> > > > > > tb_mask)
>> > > > > > +		bp = (sr & mask) >> SR_BP_SHIFT;
>> > > > > > +		if (!bp) {
>> > > > > >  			*ofs = 0;
>> > > > > > -		else
>> > > > > > -			*ofs = mtd->size - *len;
>> > > > > > +			*len = 0;
>> > > > > > +			return;
>> > > > > > +		}
>> > > > > > +		pow = bp ^ (mask >> SR_BP_SHIFT);
>> > > > > >  	}
>> > > > > > +
>> > > > > > +	*len = mtd->size >> pow;
>> > > > > > +
>> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
>> > > > > > +		*ofs = 0;
>> > > > > > +	else
>> > > > > > +		*ofs = mtd->size - *len;
>> > > > > >  }
>> > > > > >
>> > > > > >  /*
>> > > > > > @@ -1823,7 +1855,7 @@ static int stm_is_unlocked_sr(struct
>> > > > > > spi_nor
>> > > > > > *nor, loff_t ofs, uint64_t len,
>> > > > > >
>> > > > > >  /*
>> > > > > >   * Lock a region of the flash. Compatible with ST Micro
>> > > > > > and
>> > > > > > similar flash.
>> > > > > > - * Supports the block protection bits BP{0,1,2} in the
>> > > > > > status
>> > > > > > register
>> > > > > > + * Supports the block protection bits BP{0,1,2,3} in the
>> > > > > > status
>> > > > > > register
>> > > > > >   * (SR). Does not support these features found in newer SR
>> > > > > > bitfields:
>> > > > > >   *   - SEC: sector/block protect - only handle SEC=0
>> > > > > > (block
>> > > > > > protect)
>> > > > > >   *   - CMP: complement protect - only support CMP=0 (range
>> > > > > > is
>> > > > > > not
>> > > > > > complemented)
>> > > > > > @@ -1831,7 +1863,7 @@ static int stm_is_unlocked_sr(struct
>> > > > > > spi_nor
>> > > > > > *nor, loff_t ofs, uint64_t len,
>> > > > > >   * Support for the following is provided conditionally for
>> > > > > > some
>> > > > > > flash:
>> > > > > >   *   - TB: top/bottom protect
>> > > > > >   *
>> > > > > > - * Sample table portion for 8MB flash (Winbond w25q64fw):
>> > > > > > + * Sample table portion for 8MB flash (Winbond w25q64fw /
>> > > > > > BP0-
>> > > > > > 2):
>> > > > > >   *
>> > > > > >   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot
>> > > > > > Length  |
>> > > > > > Protected Portion
>> > > > > >   *  ----------------------------------------------------
>> > > > > > ----
>> > > > > > ----
>> > > > > > --------------
>> > > > > > @@ -1851,6 +1883,32 @@ static int stm_is_unlocked_sr(struct
>> > > > > > spi_nor
>> > > > > > *nor, loff_t ofs, uint64_t len,
>> > > > > >   *    0   |   1   |   1   |   0   |   1   |  2
>> > > > > > MB         |
>> > > > > > Lower
>> > > > > > 1/4
>> > > > > >   *    0   |   1   |   1   |   1   |   0   |  4
>> > > > > > MB         |
>> > > > > > Lower
>> > > > > > 1/2
>> > > > > >   *
>> > > > > > + * Sample table portion for 64MB flash (Micron n25q512ax3
>> > > > > > /
>> > > > > > BP0-
>> > > > > > 3):
>> > > > > > + *
>> > > > > > + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot
>> > > > > > Length  |
>> > > > > > Protected Portion
>> > > > > > + *  ----------------------------------------------------
>> > > > > > ----
>> > > > > > ----
>> > > > > > --------------
>> > > > > > +
>> > > > > > *    0   |   0   |   0   |   0   |   0   |  NONE         |
>> > > > > > NONE
>> > > > > > + *    0   |   0   |   0   |   0   |   1   |   64
>> > > > > > KB       |
>> > > > > > Upper
>> > > > > > 1/1024
>> > > > > > + *    0   |   0   |   0   |   1   |   0   |  128
>> > > > > > KB       |
>> > > > > > Upper
>> > > > > > 1/512
>> > > > > > + *    0   |   0   |   0   |   1   |   1   |  256
>> > > > > > KB       |
>> > > > > > Upper
>> > > > > > 1/256
>> > > > > > + *   ...
>> > > > > > + *    0   |   1   |   0   |   0   |   1   |  16
>> > > > > > MB        |
>> > > > > > Upper
>> > > > > > 1/4
>> > > > > > + *    0   |   1   |   0   |   1   |   0   |  32
>> > > > > > MB        |
>> > > > > > Upper
>> > > > > > 1/2
>> > > > > > + *    0   |   1   |   0   |   1   |   1   |  64
>> > > > > > MB        |
>> > > > > > ALL
>> > > > > > + *    0   |   1   |   1   |   0   |   0   |  64
>> > > > > > MB        |
>> > > > > > ALL
>> > > > > > + *   ...
>> > > > > > + *  ------|-------|-------|-------|-------|---------------
>> > > > > > |---
>> > > > > > ----
>> > > > > > ------------
>> > > > > > +
>> > > > > > *    1   |   0   |   0   |   0   |   0   |   NONE        |
>> > > > > > NONE
>> > > > > > + *    1   |   0   |   0   |   0   |   1   |   64
>> > > > > > KB       |
>> > > > > > Lower
>> > > > > > 1/1024
>> > > > > > + *    1   |   0   |   0   |   1   |   0   |  128
>> > > > > > KB       |
>> > > > > > Lower
>> > > > > > 1/512
>> > > > > > + *    1   |   0   |   0   |   1   |   1   |  256
>> > > > > > KB       |
>> > > > > > Lower
>> > > > > > 1/256
>> > > > > > + *   ...
>> > > > > > + *    1   |   1   |   0   |   0   |   1   |  16
>> > > > > > MB        |
>> > > > > > Lower
>> > > > > > 1/4
>> > > > > > + *    1   |   1   |   0   |   1   |   0   |  32
>> > > > > > MB        |
>> > > > > > Lower
>> > > > > > 1/2
>> > > > > > + *    1   |   1   |   0   |   1   |   1   |  64
>> > > > > > MB        |
>> > > > > > ALL
>> > > > > > + *    1   |   1   |   1   |   0   |   0   |  64
>> > > > > > MB        |
>> > > > > > ALL
>> > > > > > + *   ...
>> > > > > > + *
>> > > > > >   * Returns negative on errors, 0 on success.
>> > > > > >   */
>> > > > > >  static int stm_lock(struct spi_nor *nor, loff_t ofs,
>> > > > > > uint64_t
>> > > > > > len)
>> > > > > > @@ -1898,6 +1956,12 @@ static int stm_lock(struct spi_nor
>> > > > > > *nor,
>> > > > > > loff_t ofs, uint64_t len)
>> > > > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>> > > > > >  		tb_mask = SR_TB_BIT6;
>> > > > > >
>> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
>> > > > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
>> > > > > > +			mask = mask | SR_BP3_BIT6;
>> > > > > > +		else
>> > > > > > +			mask = mask | SR_BP3_BIT5;
>> > > > > > +	}
>> > > > > >  	/*
>> > > > > >  	 * Need smallest pow such that:
>> > > > > >  	 *
>> > > > > > @@ -1908,7 +1972,17 @@ static int stm_lock(struct spi_nor
>> > > > > > *nor,
>> > > > > > loff_t ofs, uint64_t len)
>> > > > > >  	 *   pow = ceil(log2(size / len)) = log2(size) -
>> > > > > > floor(log2(len))
>> > > > > >  	 */
>> > > > > >  	pow = ilog2(mtd->size) - ilog2(lock_len);
>> > > > > > -	val = mask - (pow << SR_BP_SHIFT);
>> > > > > > +
>> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
>> > > > > > +		val = ilog2(nor->n_sectors) + 1 - pow;
>> > > > >
>> > > > > Why do you use a new calculation here? As far as I can see,
>> > > > > the
>> > > > > method is
>> > > > > the same except that is has one bit more. That also raises
>> > > > > the
>> > > > > question why
>> > > > > n_sectors is now needed?
>> > > > >
>> > > > > Can't we just initialize the mask with
>> > > > >
>> > > > > mask = SR_BP2 | SR_BP1 | SR_BP0;
>> > > > > if (nor->flags & SNOR_F_HAS_SR_BP3)
>> > > > >     mask |= SR_BP3_BIT5;
>> > > > >
>> > > > > do the calculation and checks and then move the SR_BP3_BIT5
>> > > > > to
>> > > > > SR_BP3_BIT6
>> > > > > if SNOR_F_HAS_SR_BP3_BIT6 is set.
>> > > > >
>> > > >
>> > > > For most of flashes that supporting BP0-2, the smallest
>> > > > protected
>> > > > portion is fixed as 1/64
>> > > > and it can be properly handled by existing
>> > > > calculation. (Actually it's not fully generic, see flashes like
>> > > > w25q40bw or m25p80. Of course, it doesn't have SPI_NOR_HAS_LOCK
>> > > > flag
>> > > > even though it has BP0-2 bit in SR)
>> > >
>> > > No. The rules are always the same wether there are three or four
>> > > BP
>> > > bits (the example in stm_lock() has not enough information on
>> > > this):
>> > >
>> > > (1) the first setting (besides 0) protects one sector. The second
>> > >      protects 2, the third 4 and so on. eg 2^N
>> > > (2) the last setting is _always_ protect all, just like the '0'
>> > > setting
>> > >      is always protect none.
>> > > (3) if there is an overflow because there are no more free slots
>> > > for
>> > >      further settings (for 3 bits with flashes > 32MBit, for 4
>> > >      bits if should be flashes > 16GBit), the first entry will be
>> > >      discarded (eg the very first is the "just one sector"
>> > > entry).
>> > >
>> > > This is true for all flashes which uses this kind of setting,
>> > > have a
>> > > look at the m25p80 or w25q40bw, these are no exception. It is
>> > > just
>> > > the
>> > > notation "lower 1/64" which is only true for flashes which either
>> > > overflows in (3) or fill all entries (eg. with 3bits that would
>> > > be
>> > > the
>> > > 32Mbit version).
>> > >
>> >
>> > Looks like you noticed that we need new calculation method that
>> > would
>> > be based on n_sectors :).
>> 
>> No it will work without that (if I'm not mistaken). Give me some time
>> and I'll post a patch.
> 
> No, it must be based on n_sectors. To make 4bit block protection more
> generic, the lock sector size must NOT fixed as 64KB (as can be checked
> from your patch). See "mt35xu02g" and check the protected area and
> number of sectors from it's datasheet.

There is no public datasheet as far as I can see. And yes, actually
n_sectors is my "mtd-size / sector_size". But I don't see how n_sectors
would help if the sector size changes.

> The rule you mentioned "the first setting (besides 0) protects one
> sector" is alawys true for *4bit* block protection. That's why I choose
> n_sectors for new calculation.

And how does flashes behave once all the free slots are full? It was the
same with the 3bit flashes, they only overflowed with "newer"/bigger
flashes.


>> 
>> > Rule (1) is NOT true for some flashes
>> > supporting BP0-2 and that's why I said that smallest protected
>> > portion
>> > is fixed as '1/64' for these flashes.
>> 
>> No, you have to apply rule (3). (1) is only the starting point. It
>> is
>> kind
>> of a sliding window.
>> 
>> > See this one.
>> >
>> > W25Q20EW	256KB	1/4 ... = 64KB		BP2
>> > W25Q128JV	16MB	1/64 ... = 256KB	BP2 <--
>> > S25FL132K	4MB	1/64 ... = 64KB		BP2 <--
>> > S25FL164K	8MB
>> > 1/64 ... = 128KB	BP2 <--
>> 
>> All these flashes need (3) to be applied, thus (1) doesn't apply
>> anymore.
>> 
>> Let me give you an example for the 64MBit case, the settings would
>> be:
>> 
>> 0 sectors (corresponds to protect none)
>> 1 sector
>> 2 sectors
>> 4 sectors
>> 8 sectors
>> 16 sectors
>> 32 sectors
>> 64 sectors
>> 128 sectors (corresponds to protect all)
>> 
>> Unfortunately, we have only 8 slots (because 3 BP bits), therefore
>> we
>> have
>> to discard some setting. According to rule (2) 0 is always "protect
>> none"
>> and 7 is always "protect all". Thus we have 6 settings left.
>> According
>> to
>> rule (3) we discard the first ones. In this case, this is the "1
>> sector"
>> setting. Thus we end up with the following possible settings:
>> 
>> 0 sectors (corresponds to protect none)
>> 2 sectors
>> 4 sectors
>> 8 sectors
>> 16 sectors
>> 32 sectors
>> 64 sectors
>> 128 sectors (corresponds to protect all)
>> 
>> If you have a 128Mbit flash, the next setting that would be discarded
>> is
>> "2 sectors". Thus it would start with:
>> 
>> 0 sectors (corresponds to protect none)
>> 4 sectors
>> [..]
>> 256 sectors (corresponds to protect all)
>> 
>> 
>> Another example W25Q20EW, following possible settings:
>> 
>> 0 sectors (corresponds to protect none)
>> 1 sector
>> 2 sectors
>> 4 sectors (corresponds to protect all)
>> 
>> We now have less settings then our 8 possible slots. So this is where
>> rule (1) applies, because according to that the "1 sector" setting is
>> the first possible setting besides 0.
>> 
>> And this also applies to the 4 bit protection bits.
>> 
>> 
>> 
>> > W25Q256JV	32MB	1/512 ... =
>> > 64KB	BP3
>> > S25FL128L	16MB	1/256 ... = 64KB	BP3
>> > S25FL256L	32MB	1/512 ... = 64KB	BP3
>> >
>> > In current BP implementation, block protection is just working for
>> > some
>> > flashes that has smallest protected portion as '1/64'.
>> 
>> No its currently working for all except flashes smaller than 32Mbit.
> 
> No. Not working for flashes supporting 4bit block protection.
> 
>> Applied to the 4 bits, this would mean "it works for all except
>> flashes
>> smaller than 8Gbit" which are practially all. As I said, this is a
>> bug
>> and once this bug is fixed, there should be no difference between 3
>> and 4 bits.
>> 
>> -michael
>> 
> 
> The exact fact is that locks operate in two different ways according to
> flash model.
> 
> (1) the smallest protected portion is fixed.
> 	for BP0-2 : 1/64
> 	for BP0-1 : 1/4

As mentioned earlier, the ratio nomenclature is missleading and only 
valid
if the table is completely filled up.

Take a flash with 128kB and three BP bits (or even only two BP bits). 
The
smallest portion will be 64kB (which is one sector and not 1/64).

Thus the smallest portion is always one sector, unless the table is
overflowing, then the smallest will settle to 1/4 (for two), 1/64 (for 
three)
and 1/16384 (for four bits).

> (2) the smallest protected portion is inversely propotional with number
> of sectors.
> 
> For the flashes supporting 3bit block protection, (1) and (2) are mixed
> and used. But all the flashes supporting 4bit block protection listed
> on spi-nor.c, only (2) is used.

It is not mixed it just depends on the flash size (and the number of
protection bits).

> Each method requires each formula. I have no idea how to handle it with
> one formula (probably adding number of exceptional handling?) without
> any sectional flag. "w25q128jv(bp0-2)" is following (1) and
> "n25q128a(bp0-3)" is following (2).

Well one uses three BPs the other four, and they all follow the three 
rules
above. Did you try my patch? Because I've (at least in userspace) tested
it with 4 bits and got the correct results.

And yes, its actually two different formulas, but not for 3 and 4 bits 
like
in your patch. It is rather one formula (A) for flashes which don't 
exhaust
the BP bits (eg. for 3 bits this would be flashes <= 16Mbit and for 4 
bits
this would be for flashes <=8Gbit) and one (B) for the flashes where 
every
BP bit combination is used. What is at the moment in the kernel is the
second one, thus it will fail for flashes <= 16Mbit and 3 BP bits; and 
it
also fails for all flashes with 4 bits. My patch does a fixup on (B) to
match the results of (A), because doing this is less invasive; and as
mentioned in the patch annex, might also be rewritten for a better
understanding.


-michael

> 
>> >
>> > We need new fomula based on n_sectors for BP3 at least.
>> 
>> No they are the same, but yes there is a bug in the current
>> implementation.
>> 
>> -michael
>> 
>> >
>> > > So for the 3 bit case the following flashes are border cases:
>> > >   - 16mbit (less settings than slots)
>> > >   - 32mbit (number of settings and free slots match)
>> > >   - 64mbit (more settings than slots, first setting is discarded)
>> > >
>> > > That being said, I suspect all the 16mbit flashes (and below)
>> > > which
>> > > have
>> > > the _LOCK bit set are broken, because the entries has to be
>> > > shifted.
>> > > I'll
>> > > look into that later. This is the same "issue" you have with the
>> > > 4
>> > > bits.
>> > > So if this is fixed, you should not need another formula for the
>> > > 4
>> > > bit
>> > > case.
>> > >
>> > > > We need new calculation method for 4bit block protection and
>> > > > for
>> > > > making
>> > > > it more generic, I choose n_sectors.
>> > > >
>> > > > On all the flashes I checked, n_sectors is proper value for
>> > > > getting
>> > > > block protected portion.
>> > > >
>> > > > 		density	portion	n_sectors
>> > > > W25M512JV	64MB	1/512	512
>> > > > N25Q128A	16MB	1/256	256
>> > > > N25Q512A	64MB	1/1024	1024
>> > > > MT25QL02GCBB	256MB	1/4096	4096
>> > >
>> > > The rules above apply to these flashes, too. Could you double
>> > > check
>> > > that?
>> > >
>> > > -michael
>> > >
>> > > >
>> > > > > > +		val = val << SR_BP_SHIFT;
>> > > > > > +
>> > > > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
>> > > > > > +			val = (val & ~BIT(5)) | BIT(6);
>> > > > > > +	} else {
>> > > > > > +		val = mask - (pow << SR_BP_SHIFT);
>> > > > > > +	}
>> > > > > > +
>> > > > > >  	if (val & ~mask)
>> > > > > >  		return -EINVAL;
>> > > > > >  	/* Don't "lock" with no region! */
>> > > > > > @@ -1983,6 +2057,13 @@ static int stm_unlock(struct spi_nor
>> > > > > > *nor,
>> > > > > > loff_t ofs, uint64_t len)
>> > > > > >
>> > > > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>> > > > > >  		tb_mask = SR_TB_BIT6;
>> > > > > > +
>> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
>> > > > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
>> > > > > > +			mask = mask | SR_BP3_BIT6;
>> > > > > > +		else
>> > > > > > +			mask = mask | SR_BP3_BIT5;
>> > > > > > +	}
>> > > > > >  	/*
>> > > > > >  	 * Need largest pow such that:
>> > > > > >  	 *
>> > > > > > @@ -1995,13 +2076,20 @@ static int stm_unlock(struct
>> > > > > > spi_nor
>> > > > > > *nor,
>> > > > > > loff_t ofs, uint64_t len)
>> > > > > >  	pow = ilog2(mtd->size) - order_base_2(lock_len);
>> > > > > >  	if (lock_len == 0) {
>> > > > > >  		val = 0; /* fully unlocked */
>> > > > > > +	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
>> > > > > > +		val = ilog2(nor->n_sectors) + 1 - pow;
>> > > > > > +		val = val << SR_BP_SHIFT;
>> > > > > > +
>> > > > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
>> > > > > > +			val = (val & ~BIT(5)) | BIT(6);
>> > > > > >  	} else {
>> > > > > >  		val = mask - (pow << SR_BP_SHIFT);
>> > > > > > -		/* Some power-of-two sizes are not supported */
>> > > > > > -		if (val & ~mask)
>> > > > > > -			return -EINVAL;
>> > > > > >  	}
>> > > > > >
>> > > > > > +	/* Some power-of-two sizes are not supported */
>> > > > > > +	if (val & ~mask)
>> > > > > > +		return -EINVAL;
>> > > > > > +
>> > > > > >  	status_new = (status_old & ~mask & ~tb_mask) | val;
>> > > > > >
>> > > > > >  	/* Don't protect status register if we're fully
>> > > > > > unlocked */
>> > > > > > @@ -4736,6 +4824,7 @@ static void
>> > > > > > spi_nor_info_init_params(struct
>> > > > > > spi_nor *nor)
>> > > > > >  	/* Set SPI NOR sizes. */
>> > > > > >  	params->size = (u64)info->sector_size * info-
>> > > > > > > n_sectors;
>> > > > > >
>> > > > > >  	params->page_size = info->page_size;
>> > > > > > +	params->n_sectors = info->n_sectors;
>> > > > > >
>> > > > > >  	if (!(info->flags & SPI_NOR_NO_FR)) {
>> > > > > >  		/* Default to Fast Read for DT and non-DT
>> > > > > > platform
>> > > > > > devices. */
>> > > > > > @@ -5192,6 +5281,11 @@ int spi_nor_scan(struct spi_nor
>> > > > > > *nor,
>> > > > > > const
>> > > > > > char *name,
>> > > > > >  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>> > > > > >  	if (info->flags & USE_CLSR)
>> > > > > >  		nor->flags |= SNOR_F_USE_CLSR;
>> > > > > > +	if (info->flags & SPI_NOR_HAS_BP3) {
>> > > > > > +		nor->flags |= SNOR_F_HAS_SR_BP3;
>> > > > > > +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
>> > > > > > +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
>> > > > > > +	}
>> > > > > >
>> > > > > >  	if (info->flags & SPI_NOR_NO_ERASE)
>> > > > > >  		mtd->flags |= MTD_NO_ERASE;
>> > > > > > @@ -5199,6 +5293,7 @@ int spi_nor_scan(struct spi_nor *nor,
>> > > > > > const
>> > > > > > char *name,
>> > > > > >  	mtd->dev.parent = dev;
>> > > > > >  	nor->page_size = params->page_size;
>> > > > > >  	mtd->writebufsize = nor->page_size;
>> > > > > > +	nor->n_sectors = params->n_sectors;
>> > > > > >
>> > > > > >  	if (of_property_read_bool(np, "broken-flash-reset"))
>> > > > > >  		nor->flags |= SNOR_F_BROKEN_RESET;
>> > > > > > diff --git a/include/linux/mtd/spi-nor.h
>> > > > > > b/include/linux/mtd/spi-
>> > > > > > nor.h
>> > > > > > index 541c06d042e8..92d550501daf 100644
>> > > > > > --- a/include/linux/mtd/spi-nor.h
>> > > > > > +++ b/include/linux/mtd/spi-nor.h
>> > > > > > @@ -129,7 +129,9 @@
>> > > > > >  #define SR_BP1			BIT(3)	/* Block
>> > > > > > protect 1
>> > > > > > */
>> > > > > >  #define SR_BP2			BIT(4)	/* Block
>> > > > > > protect 2
>> > > > > > */
>> > > > > >  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom
>> > > > > > protect
>> > > > > > */
>> > > > > > +#define SR_BP3_BIT5		BIT(5)	/* Block
>> > > > > > protect 3
>> > > > > > */
>> > > > >
>> > > > > maybe just name it SR_BP3? would also be more consistent with
>> > > > > the
>> > > > > proposal
>> > > > > above.
>> > > > >
>> > > > > >  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom
>> > > > > > protect
>> > > > > > */
>> > > > > > +#define SR_BP3_BIT6		BIT(6)	/* Block
>> > > > > > protect 3
>> > > > > > */
>> > > > > >  #define SR_SRWD			BIT(7)	/* SR write
>> > > > > > protect
>> > > > > > */
>> > > > > >  /* Spansion/Cypress specific status bits */
>> > > > > >  #define SR_E_ERR		BIT(5)
>> > > > > > @@ -248,6 +250,8 @@ enum spi_nor_option_flags {
>> > > > > >  	SNOR_F_HAS_16BIT_SR	= BIT(9),
>> > > > > >  	SNOR_F_NO_READ_CR	= BIT(10),
>> > > > > >  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
>> > > > > > +	SNOR_F_HAS_SR_BP3	= BIT(12),
>> > > > > > +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
>> > > > > >
>> > > > > >  };
>> > > > > >
>> > > > > > @@ -519,6 +523,7 @@ struct spi_nor_locking_ops {
>> > > > > >   *
>> > > > > >   * @size:		the flash memory density in bytes.
>> > > > > >   * @page_size:		the page size of the SPI NOR
>> > > > > > flash
>> > > > > > memory.
>> > > > > > + * @n_sectors:		number of sectors
>> > > > > >   * @hwcaps:		describes the read and page
>> > > > > > program
>> > > > > > hardware
>> > > > > >   *			capabilities.
>> > > > > >   * @reads:		read capabilities ordered by priority:
>> > > > > > the
>> > > > > > higher index
>> > > > > > @@ -541,6 +546,7 @@ struct spi_nor_locking_ops {
>> > > > > >  struct spi_nor_flash_parameter {
>> > > > > >  	u64				size;
>> > > > > >  	u32				page_size;
>> > > > > > +	u16				n_sectors;
>> > > > > >
>> > > > > >  	struct spi_nor_hwcaps		hwcaps;
>> > > > > >  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX
>> > > > > > ];
>> > > > > > @@ -573,6 +579,7 @@ struct flash_info;
>> > > > > >   * @bouncebuf_size:	size of the bounce buffer
>> > > > > >   * @info:		spi-nor part JDEC MFR id and other info
>> > > > > >   * @page_size:		the page size of the SPI NOR
>> > > > > > + * @n_sector:		number of sectors
>> > > > > >   * @addr_width:		number of address bytes
>> > > > > >   * @erase_opcode:	the opcode for erasing a sector
>> > > > > >   * @read_opcode:	the read opcode
>> > > > > > @@ -599,6 +606,7 @@ struct spi_nor {
>> > > > > >  	size_t			bouncebuf_size;
>> > > > > >  	const struct flash_info	*info;
>> > > > > >  	u32			page_size;
>> > > > > > +	u16			n_sectors;
>> > > > > >  	u8			addr_width;
>> > > > > >  	u8			erase_opcode;
>> > > > > >  	u8			read_opcode;
>> > > > > > --
>> > > > > > 2.17.1
>> > > > > >
>> > > > > >
>> > > > > > ______________________________________________________
>> > > > > > Linux MTD discussion mailing list
>> > > > > >
>> > > >
>> > > >
>> >
>> >
> https://protect2.fireeye.com/url?k=06b6dd5d-5b7d5a63-06b75612-0cc47a31309a-83164929001f7741&u=http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> > > > > >
>> > > > >
>> > > > >
>> > >
>> > >
>> 
>> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
