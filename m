Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE6DC47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 13:30:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B01613C3
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 13:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B01613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sn01fh4D/4g8UEYMzzRufL758Sj/angBgfFIB5HAcQA=; b=0flVKdyQmmYHbO
	aXhMQim+5/Mgsy4wzHqOKznAzYNJ2iohZ62IFWrY6YHwnCWBksIM9dF1hTrY4jayDbgRWYw+x1khp
	EmI4jmGT0BdLvjUTZUBn9BFovz0AeVljG0rhCzgTm295VUfZhgCFX9ENktZcdsmkOthJgeO5NBaRL
	NvjCjLaejrFnpbnhZFocRrizpGK9ys3nZClQ8ebEHgekDC6aDSoQB5LISa+splCm5cqSfSfBXQLZ9
	iGT8jkMAlOkRYqod7Azc4+SKydP0P77SsEzaZK/VSws9Uw9iduy5yABxM5NbIijhiDLOX2IS8joQv
	ibw5rmmd8VPpGFh4EiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lltbW-00ERbk-58; Wed, 26 May 2021 13:29:46 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llrTr-00DSPD-C9
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 11:13:45 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QBDakQ106453;
 Wed, 26 May 2021 06:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622027616;
 bh=pkpy5vS1CMdOrnrcbFOZKe7b5M6sZdb+h+9h4pGCWLk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=eC1vcZUVNuLToFVk4BZXRvQrtlEPxnf44ThLsYbK036/eQ0oBOC5utpI7udRbVKwJ
 Hw/+79bPQiY+cyz9NC2R5piRPZk8u5zFpq4kGmLGXzcy7WVitV1FIYey6szQ37LNzu
 +xfKrVq7ugLmK4vyhP0y8diFbRZuDWpn0ESaZHMU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QBDakc001847
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 May 2021 06:13:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 06:13:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 06:13:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QBDZat034249;
 Wed, 26 May 2021 06:13:36 -0500
Date: Wed, 26 May 2021 16:43:35 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: otp: return -EROFS if region is
 read-only
Message-ID: <20210526111333.suxmmtkngqeyuz62@ti.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-4-michael@walle.cc>
 <20210525193323.xdvbq3tab6oxk6yh@ti.com>
 <ca81f21648e55229c8d4533881566471@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca81f21648e55229c8d4533881566471@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_041343_609829_7E0C595D 
X-CRM114-Status: GOOD (  48.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 26/05/21 12:41PM, Michael Walle wrote:
> Am 2021-05-25 21:33, schrieb Pratyush Yadav:
> > On 21/05/21 09:40PM, Michael Walle wrote:
> > > SPI NOR flashes will just ignore program commands if the OTP region is
> > > locked. Thus, a user might not notice that the intended write didn't
> > > end
> > > up in the flash. Return -EROFS to the user in this case. From what I
> > > can
> > > tell, chips/cfi_cmdset_0001.c also return this error code.
> > > 
> > > One could optimize spi_nor_mtd_otp_range_is_locked() to read the
> > > status
> > > register only once and not for every OTP region, but for that we would
> > > need some more invasive changes. Given that this is
> > > one-time-programmable memory and the normal access mode is reading, we
> > > just live with the small overhead.
> > 
> > Ok.
> > 
> > > 
> > > Fixes: 069089acf88b ("mtd: spi-nor: add OTP support")
> > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > ---
> > >  drivers/mtd/spi-nor/otp.c | 35 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> > > index 3898ed67ba1c..b87f96593c13 100644
> > > --- a/drivers/mtd/spi-nor/otp.c
> > > +++ b/drivers/mtd/spi-nor/otp.c
> > > @@ -249,6 +249,31 @@ static int spi_nor_mtd_otp_info(struct mtd_info
> > > *mtd, size_t len,
> > >  	return ret;
> > >  }
> > > 
> > > +static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor,
> > > loff_t ofs,
> > > +					   size_t len)
> > > +{
> > > +	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
> > > +	unsigned int region;
> > > +	int locked;
> > > +
> > > +	if (!len)
> > > +		return 0;
> > 
> > I was inclined to say that the loop conditional below would take care of
> > this but it can cause an underflow when ofs and len are both 0.
> 
> Correct. I didn't want to put an extra check to the caller, because
> as you noticed, it is checked by the loop there later.
> 
> > > +
> > > +	/*
> > > +	 * If any of the affected OTP regions are locked the entire range is
> > > +	 * considered locked.
> > > +	 */
> > > +	for (region = spi_nor_otp_offset_to_region(nor, ofs);
> > > +	     region <= spi_nor_otp_offset_to_region(nor, ofs + len - 1);
> > > +	     region++) {
> > > +		locked = ops->is_locked(nor, region);
> > > +		if (locked)
> > > +			return locked;
> > > +	}
> > 
> > Ok.
> 
> Btw I didn't know if I should put a comment here that this if () handles
> both locked state and errors. But it seems you've already found out by
> looking at the caller ;) I'm not sure if this is obvious, though.

I didn't catch this on the first read. I only figured it out when I 
looked at the return check below. So it is certainly not obvious.

> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t
> > > ofs,
> > >  				      size_t total_len, size_t *retlen,
> > >  				      const u8 *buf, bool is_write)
> > > @@ -271,6 +296,16 @@ static int spi_nor_mtd_otp_read_write(struct
> > > mtd_info *mtd, loff_t ofs,
> > >  	/* don't access beyond the end */
> > >  	total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
> > > 
> > > +	if (is_write) {
> > > +		ret = spi_nor_mtd_otp_range_is_locked(nor, ofs, total_len);
> > > +		if (ret < 0) {
> > > +			goto out;
> > > +		} else if (ret) {
> > > +			ret = -EROFS;
> > 
> > I wonder if we should have a dev_info() or dev_err() here. I think this
> > warrants a dev_dbg() at least.
> 
> Are you sure? Reporting something to the user via an error code is
> enough IMHO. I wouldn't want my syslog to be cluttered with messages
> I already know. I mean the program tell me "hey, you aren't allowed
> to write there". Why would the kernel still need to tell me that again?
> Without any connection to the caller, I don't get much out of the kernel
> message by looking at it alone, just that someone tried to write there.
> 
> So definetly no dev_info() or dev_err(). But IMHO no dev_dbg() either.
> Tudor, Vingesh, any opinions?

Either is fine by me.

> 
> 
> > > +			goto out;
> > > +		}
> > 
> > So it returns -errno when the check for is_locked() fails and 1 or 0
> > when it is locked or not. Ok.
> > 
> > It would be nice if you add a dev_dbg or dev_err() or dev_info() above.
> > Nonetheless,
> > 
> > Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
> Thanks for reviewing!
> 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
