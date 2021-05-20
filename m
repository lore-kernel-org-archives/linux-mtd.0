Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C58C43460
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:23:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87EB61244
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87EB61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hASsS/TtgdTqzkk+Z3VOQhh1S0o5ddLrW1VSZ2QkikM=; b=L+YBRBOe1gwVdZrEAMZYcDTpbg
	e9nYgaz27aLZPhVU6NjjUKiLTsno0FVkcE+vp96U/UYvVA1ZOW17Q7LcBT1r1mmaDSjj9xUTv2si2
	QCRRFp3C8w5cfaE8jg8eHZk5kQFGJ5ZQRo1kXRvy9iOF3Wg6RSzdetuGI86jPV/KGYwjYqM45lUUJ
	koKMx3rbsRUK6DrljnEvJ1Inoh+wnW3xaFHos6vkhIWiovZgX+qceFhqbqSKPo17AfaWYBO5ibbxP
	JsCTjWYBubW8McJFSKVO4tIgiEt6eAe92kYSCFUNZK6nR2ewsdcPrsgt/fgsbSHnUZXwzQGwJH7R3
	267o1Phw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljkUm-001eoE-9m; Thu, 20 May 2021 15:21:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljkUZ-001emh-Op
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 15:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=4mZw769Li8RrpESRx7xXi26AWpGToFQSlDv5uLSxVFM=; b=0kpCHxEMd4NiXr4FnMNzqal/XE
 WjrLEqIHJoBAaDC9qOotOWB+q8Tj3EV/OelRhRWBtUN0o0MTTDVSswJb4tGl+ZSjaSgyn6WGoYa8Z
 YzVGyYlv9aYd3/6bLU6H0HeJQGHD+ddIRiEqxEUiqBCtMdBTMYRxEJpbD6TB2uPbowrVIrI6na0eU
 1DOoOSifzzBqZXiRh49Y08aDEryzSRrihCYNCSvrREJ3ezG03Dixhl3nyWfbYTUYSAd/QT+Gv1aAK
 la52nFPR6SqlCVwzuDvpyiCh6WTj2b+/lT+j/KC5pFsSbaERdaEb9IhgZkCkPn1W3/Mm2rBh9gjyk
 nBy9BvSQ==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljkUV-00GSdV-CP
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 15:21:42 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 445162224A;
 Thu, 20 May 2021 17:21:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621524094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mZw769Li8RrpESRx7xXi26AWpGToFQSlDv5uLSxVFM=;
 b=YVH55aXL69KVBr8AcSFoOJFg7ZZ+rkD3sy6OEZEzRbixvcBB4jlK1QJsFfgkM8XyBKHgTC
 cInnYQEtKLnVrRMgVNAW0ObrDII/MUUZDytqJHjDyceirt+yCfJ6r1nr7Dk0jUtHImjvrh
 VwdLapQiaYOUZHPPm5gHdoPHbIObdK4=
MIME-Version: 1.0
Date: Thu, 20 May 2021 17:21:34 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: implement OTP erase for Winbond and
 similar flashes
In-Reply-To: <20210520134940.fpyt52mwpdotrp4a@ti.com>
References: <20210510202056.30000-1-michael@walle.cc>
 <20210520122256.fhkzpqmu7nxwjoqt@ti.com>
 <20a7e9725d54c9566ca06c062c15f015@walle.cc>
 <20210520134940.fpyt52mwpdotrp4a@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <bdf79e0b9cbe291a48ab27b69f15eb04@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_082139_771077_B92932BF 
X-CRM114-Status: GOOD (  39.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-05-20 15:49, schrieb Pratyush Yadav:
> On 20/05/21 03:20PM, Michael Walle wrote:
>> Am 2021-05-20 14:22, schrieb Pratyush Yadav:
>> > On 10/05/21 10:20PM, Michael Walle wrote:
..
>> > > +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr)
>> > > +{
>> > > +	int ret;
>> > > +
>> > > +	ret = spi_nor_write_enable(nor);
>> > > +	if (ret)
>> > > +		return ret;
>> > > +
>> > > +	if (nor->spimem) {
>> > > +		struct spi_mem_op op =
>> > > +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_ESECR, 0),
>> > > +				   SPI_MEM_OP_ADDR(3, addr, 0),
>> >
>> > Only 3 address bytes needed? Can the OTP region ever require 4 byte
>> > addressing? For example, say the flash is switched to 4 byte addressing
>> > for the main region. Would it still expect 3 byte addressing for OTP
>> > ops?
>> 
>> It seems you're right. Looking at larger flashes there are sometimes
>> 4 bytes. See for example ch 8.2.44
>> 
>> https://www.winbond.com/resource-files/w25m512jwxiq%20spi%20rev%20c%2012242018.pdf
>> 
>> Thus it seems it should be fixed for the programming and reading,
>> too. Unfortunately, I cannot test any of this.
> 
> I don't think any such flash is supported currently, right? So in that
> case we won't at least introduce any new regressions when making this
> untested change. Whenever someone adds support for one of these 
> flashes,
> we can ask them to test this as well.

yep.

..

>> > > +static int spi_nor_mtd_otp_lock_erase(struct mtd_info *mtd, loff_t
>> > > from,
>> >
>> > spi_nor_mtd_otp_lock_or_erase()? Or would it make it too long?
>> 
>> I'm fine with both, its just that the read/write doesn't have an
>> "or" neither ;)
>> 
>> > Anyway, maybe I am bikeshedding too much, but I don't like that you
>> > combine two completely independent operations into the same function
>> > because they have some common parts. You should make them two separate
>> > functions and see how many of the common parts can be split into
>> > independent subroutines.
>> 
>> Given that the whole boilerplate before and after the erase/lock is
>> exactly the same, even the while loop is the same, I don't see how
>> it can easily be split. Well, you could rename the function to some
>> generic spi_nor_mtd_walk() - which would imply it might also be
>> used for read/write, which is not true - and provide a callback
>> function. But I don't see how this is would make it easier to read.
>> And this is just an implemention local to this module.
> 
> My suggestion was to make two copies of the same code, and then see if
> you can consolidate some in a clean subroutine. If that is not 
> possible,
> then you can just leave the code duplicated in two places. It is not
> that much duplication so it should be fine IMO.
> 
> But I won't press too much on this point. I will leave it to your
> judgement on what works better. Just want to make sure you understand 
> my
> point completely.

I get your point. But I really don't like the code duplication.

>> > > +				      size_t len, bool is_erase)
>> > >  {
>> > >  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
>> > >  	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
>> > >  	const size_t rlen = spi_nor_otp_region_len(nor);
>> > >  	unsigned int region;
>> > > +	loff_t rstart;
>> > >  	int ret;
>> > >
>> > >  	if (from < 0 || (from + len) > spi_nor_otp_size(nor))
>> > > @@ -337,7 +382,13 @@ static int spi_nor_mtd_otp_lock(struct mtd_info
>> > > *mtd, loff_t from, size_t len)
>> > >
>> > >  	while (len) {
>> > >  		region = spi_nor_otp_offset_to_region(nor, from);
>> > > -		ret = ops->lock(nor, region);
>> > > +
>> > > +		if (is_erase) {
>> > > +			rstart = spi_nor_otp_region_start(nor, region);
>> > > +			ret = ops->erase(nor, rstart);
>> >
>> > This further highlights my point. There are subtle differences between
>> > erase and lock and having them in the same function might not be the
>> > best idea.

Maybe the argument for the locking is wrong. Future will tell. The
start address of a region and the number of a region is actually
equivalent. So maybe ->lock should also take the start address.
But then you'd go from address -> region -> address -> region.

At the moment its modelled after how winbond and macronix flashes
implement these ops.

See here for an old version of the support for macronix(-like)
flashes:
https://lore.kernel.org/linux-mtd/20200911222634.31804-4-michael@walle.cc/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
