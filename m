Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E093C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 18:24:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F52861460
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 18:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F52861460
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CHOpe7CxTwFsBX4WRdgsc7FKzvgDeFr6FzRnsV4sAG4=; b=Ms3XCWODsBexBivJ1NObMx8BE
	3wFyyNUFi3KEpSJdyxWbcHiepHIrYh406cvuln0iK/EDVaTHcbR8ci4MnN0mdrxV17rjUT5udljRI
	Hi+R3EDVtsT6zYp1TLw42STxSNJ9G1zpt8D1o5HdfqYbwGtMtjUqyU5YSWDcBx0yoKoJqZPw+QJ5U
	DBORgNgzIS0y96Sudvk/i0RjiHTYuvCXYKAlzZL6ala+5PEdDjikyJs+x1vhw3X7YlXaevuiWatnI
	WN+raQ0hwAQe4A7neXP1DAaiWoj6hTd12rms/uYK2oZC0CNrsXJiWsF+hezb57bUA1l4iYU3h44sN
	RK/B4l+cg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf58m-007mFr-EF; Fri, 07 May 2021 18:23:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf58k-007mFf-6L
 for linux-mtd@desiato.infradead.org; Fri, 07 May 2021 18:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pd1p/XdApN8ywhme/JPeieeHHLI5ICCqEJK/+zrXP0Y=; b=A86yvfa/r7O0a1+EbsvdPzb7zi
 PVXgODOUKgg/SiueM2OU5Y/pfUYa/lknGVIeLZhLFws7Q1CO5t2kD5DdrJsGIXOHEhzyuL2haL4c9
 +GckN1uCl1vCncCE9JyHbIP1VphDPd+u4JE+R3IjCEuteRQPtvoP/uKxg5CXtSp+9afX57/NfV9ks
 X2Rw30lcNfuhcsTAosVPHGr/JZRtH5O+B7yijpCg0nr2Vs2Bca27juCjSl5pSG/yQ+59ToMIBefSg
 u6JDh1VW5oK/eR6kDBPTnu1PCOB+qxvrkUANa34WeeYuIjcyZAHE31WZ94BjYPdngUW7QwrmmZdr+
 fHcW5dFA==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf58h-0074xh-1K
 for linux-mtd@lists.infradead.org; Fri, 07 May 2021 18:23:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 147INkKk088265;
 Fri, 7 May 2021 13:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620411826;
 bh=pd1p/XdApN8ywhme/JPeieeHHLI5ICCqEJK/+zrXP0Y=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=my1WieGO9J9NusPJJugu1lt91/WiwX28HCAbZoMxTt4UJWRgokyBnl7XIGGbc8gWG
 v1U4yMak2Be0wMxa1t4i4C06aGrOz1ACb5mJlc1C0VeXmDwxCqWkPFyyG2B+ESFs/M
 Hpba469DbbhL8X3kJMq4qkdSuZJPYfuvtccB7ZMA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 147INkvb082699
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 May 2021 13:23:46 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 13:23:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 13:23:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 147INjYM036385;
 Fri, 7 May 2021 13:23:46 -0500
Date: Fri, 7 May 2021 23:53:45 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 5/6] mtd: spi-nor: core; avoid odd length/address reads
 on 8D-8D-8D mode
Message-ID: <20210507182343.3rykt2ydyj74qfxn@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
 <20210506191829.8271-6-p.yadav@ti.com>
 <3daadf43ef4743f13ebbdd000ba5ec4a@walle.cc>
 <20210507180424.kj7c4rfjbycjagxm@ti.com>
 <50b07a065455b93b78ee43ba665083ee@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50b07a065455b93b78ee43ba665083ee@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_112351_188813_EAF1217C 
X-CRM114-Status: GOOD (  48.12  )
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

On 07/05/21 08:14PM, Michael Walle wrote:
> Am 2021-05-07 20:04, schrieb Pratyush Yadav:
> > On 07/05/21 05:51PM, Michael Walle wrote:
> > > Am 2021-05-06 21:18, schrieb Pratyush Yadav:
> > > > On Octal DTR capable flashes like Micron Xcella reads cannot start or
> > > > end at an odd address in Octal DTR mode. Extra bytes need to be read at
> > > > the start or end to make sure both the start address and length remain
> > > > even.
> > > >
> > > > To avoid allocating too much extra memory, thereby putting unnecessary
> > > > memory pressure on the system, the temporary buffer containing the extra
> > > > padding bytes is capped at PAGE_SIZE bytes. The rest of the 2-byte
> > > > aligned part should be read directly in the main buffer.
> > > >
> > > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > > ---
> > > >
> > > >  drivers/mtd/spi-nor/core.c | 81 +++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 80 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > > > index 5cc206b8bbf3..3d66cc34af4d 100644
> > > > --- a/drivers/mtd/spi-nor/core.c
> > > > +++ b/drivers/mtd/spi-nor/core.c
> > > > @@ -1904,6 +1904,82 @@ static const struct flash_info
> > > > *spi_nor_read_id(struct spi_nor *nor)
> > > >  	return ERR_PTR(-ENODEV);
> > > >  }
> > > >
> > > > +/*
> > > > + * On Octal DTR capable flashes like Micron Xcella reads cannot start
> > > > or
> > > > + * end at an odd address in Octal DTR mode. Extra bytes need to be read
> > > > + * at the start or end to make sure both the start address and length
> > > > + * remain even.
> > > > + */
> > > > +static int spi_nor_octal_dtr_read(struct spi_nor *nor, loff_t from,
> > > > size_t len,
> > > > +				  u_char *buf)
> > > > +{
> > > > +	u_char *tmp_buf;
> > > > +	size_t tmp_len;
> > > > +	loff_t start, end;
> > > > +	int ret, bytes_read;
> > > > +
> > > > +	if (IS_ALIGNED(from, 2) && IS_ALIGNED(len, 2))
> > > > +		return spi_nor_read_data(nor, from, len, buf);
> > > > +	else if (IS_ALIGNED(from, 2) && len > PAGE_SIZE)
> > > > +		return spi_nor_read_data(nor, from, round_down(len, PAGE_SIZE),
> > > > +					 buf);
> > > > +
> > > > +	tmp_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
> > > > +	if (!tmp_buf)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	start = round_down(from, 2);
> > > > +	end = round_up(from + len, 2);
> > > > +
> > > > +	/*
> > > > +	 * Avoid allocating too much memory. The requested read length might
> > > > be
> > > > +	 * quite large. Allocating a buffer just as large (slightly bigger, in
> > > > +	 * fact) would put unnecessary memory pressure on the system.
> > > > +	 *
> > > > +	 * For example if the read is from 3 to 1M, then this will read from 2
> > > > +	 * to 4098. The reads from 4098 to 1M will then not need a temporary
> > > > +	 * buffer so they can proceed as normal.
> > > > +	 */
> > > > +	tmp_len = min_t(size_t, end - start, PAGE_SIZE);
> > > > +
> > > > +	ret = spi_nor_read_data(nor, start, tmp_len, tmp_buf);
> > > > +	if (ret == 0) {
> > > > +		ret = -EIO;
> > > > +		goto out;
> > > > +	}
> > > > +	if (ret < 0)
> > > > +		goto out;
> > > > +
> > > > +	/*
> > > > +	 * More bytes are read than actually requested, but that number can't
> > > > be
> > > > +	 * reported to the calling function or it will confuse its
> > > > calculations.
> > > > +	 * Calculate how many of the _requested_ bytes were read.
> > > > +	 */
> > > > +	bytes_read = ret;
> > > > +
> > > > +	if (from != start)
> > > > +		ret -= from - start;
> > > > +
> > > > +	/*
> > > > +	 * Only account for extra bytes at the end if they were actually read.
> > > > +	 * For example, if the total length was truncated because of temporary
> > > > +	 * buffer size limit then the adjustment for the extra bytes at the
> > > > end
> > > > +	 * is not needed.
> > > > +	 */
> > > > +	if (start + bytes_read == end)
> > > > +		ret -= end - (from + len);
> > > > +
> > > > +	if (ret < 0) {
> > > > +		ret = -EIO;
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	memcpy(buf, tmp_buf + (from - start), ret);
> > > > +out:
> > > > +	kfree(tmp_buf);
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
> > > >  			size_t *retlen, u_char *buf)
> > > >  {
> > > > @@ -1921,7 +1997,10 @@ static int spi_nor_read(struct mtd_info *mtd,
> > > > loff_t from, size_t len,
> > > >
> > > >  		addr = spi_nor_convert_addr(nor, addr);
> > > >
> > > > -		ret = spi_nor_read_data(nor, addr, len, buf);
> > > > +		if (nor->read_proto == SNOR_PROTO_8_8_8_DTR)
> > > > +			ret = spi_nor_octal_dtr_read(nor, addr, len, buf);
> > > > +		else
> > > > +			ret = spi_nor_read_data(nor, addr, len, buf);
> > > >  		if (ret == 0) {
> > > >  			/* We shouldn't see 0-length reads */
> > > >  			ret = -EIO;
> > > 
> > > Reviewed-by: Michael Walle <michael@walle.cc>
> > 
> > Thanks.
> > 
> > > 
> > > I wonder how much performance is lost if this would just split
> > > one transfer into up to three ones: 2 byte, size - 2, 2 bytes.
> > 
> > This case is not really possible since it would try to read PAGE_SIZE
> > whenever it can. But there is a situation possible where one transfer is
> > split into three. It would look something like: 4096 bytes, size - 4096
> > bytes, 2 bytes.
> 
> Ah no, I wasn't talking about your implementation, but just having a naive
> one where you don't move around up to PAGE_SIZE of data but just read
> 2 bytes in the beginning (if unaligned) and 2 bytes at the end (if
> unaligned)
> and reading the part in between just as usual because its then aligend.
> 
> > I am trying to find a balance between minimizing number of reads while
> > keeping the size of the temporary buffer to a reasonable limit. This is
> > the best I could come up with. It optimizes for smaller transfers so
> > while the absolute amount of overhead remains roughly the same, the
> > ratio of it relative to read size is smaller.
> 
> Yes, with this you will have that memcpy() and one transfer for transfers
> up to PAGE_SIZE; the "naive" one above would have up to three depending on
> the aligment.

Right. Smaller transfers lose much more performance to the overhead than 
the larger ones do. So I think the optimization is worth the extra code 
complexity.

> 
> > You can optimize for read performance if you are willing to waste memory
> > by simple allocating a size + 2 bytes long buffer. Then the read can
> > proceed in one transaction. But IMO memory is much more important
> > compared to read throughput.
> 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
