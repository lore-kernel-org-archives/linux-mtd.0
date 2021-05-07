Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2F1C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 17:03:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D3161460
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 17:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21D3161460
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XwODH5KusxqoYBt1BemG9bVA5DwvZmoA+mTWS5t5IuI=; b=aotFbk/iBfObHdMmMp5+n4o1P
	LVETDf6Y5at3U2mrIF8f8N6zYCsmFAKAu5JVQVRXRZBfwWQ2w52bG8UcLAbUmq4rczir1N/XhgkHL
	RD3u6ahH52bKK2vC2uacC5fDgJMwofI0+MbwZnQ23t7hiWfmX4wEgYZzscEq6IDu4Qnd/8wGrL5jn
	H3YuDlWOFhcIQN0TjQZMXomvP73tn5dhZmbzQCAYJIb6BdNNDYWB2QwJxOw5lAIKtZT3YgYjjNDyV
	jxqkJ2SLMnru4PpXdQWD2T/ApwmzJjso31MzpZw852QfqgKu3AA3tMDKpaMsjLlFnvVYAi9ecnvv8
	sr8AG/lsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf3rj-007dPE-KI; Fri, 07 May 2021 17:02:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf3rf-007dOi-QO
 for linux-mtd@desiato.infradead.org; Fri, 07 May 2021 17:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M9uXcU0z2Uxrjv02IUufwWOXXNfDJkZ+Xvp1k7QuVUU=; b=SUFXosAMKF+IiacmTyrAmH+SHB
 K42FHk2RnJ7qjdrlGJmoU9E5dq2g/3XkpopvlUOacBXdyuzJYSmbITqdf7tBSEVC0soDmXPj2txBK
 49MyglnALIIbvmRBnMhTtcA0mjHWUXBI5hlcn5kOiaO3qNKQYFCEBHeTtrJ/6LD4nMDatiT7u8tSE
 wSKV7k+3LYqkFMntEV/SMOTw8sVMp0sxGws6LlJzQ0NiqAQYsJ0S2/n7W4EJaERYxxsIQNKwaWVNH
 UgbOXLaAWlR6Vr5zripni2A1q9Hf3qoSAXXl5+LYmpYWMkq/fJuoKEcBv9dZzig/OrCHoMcezbSoM
 RVu6lb3w==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf3rc-0071UG-OW
 for linux-mtd@lists.infradead.org; Fri, 07 May 2021 17:02:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 147H22iv059092;
 Fri, 7 May 2021 12:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620406922;
 bh=M9uXcU0z2Uxrjv02IUufwWOXXNfDJkZ+Xvp1k7QuVUU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=AUua5s/LQ1EJd6xUjnDciG57BGBLGpfZtpDVZNXA609FISiorrefrKPLA/HrswyXM
 f305tnc5NA87K79DSE1K8VoYVq07FPvw+nwVT7wa/SyWIWkui8yBTb6VrAanNkXBf0
 3SeLujy+6ljaAn94moYhtcRCYUWh1IcP8lM72M/0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 147H21X6009412
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 May 2021 12:02:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 12:02:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 12:02:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 147H21ba064377;
 Fri, 7 May 2021 12:02:01 -0500
Date: Fri, 7 May 2021 22:32:00 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 6/6] mtd: spi-nor: core; avoid odd length/address writes
 in 8D-8D-8D mode
Message-ID: <20210507170158.s76lebxn7v2wyvfy@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
 <20210506191829.8271-7-p.yadav@ti.com>
 <497da81bb1531b085941ea2e711cf9b6@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <497da81bb1531b085941ea2e711cf9b6@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_100208_902866_13AD8BAB 
X-CRM114-Status: GOOD (  42.96  )
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

On 07/05/21 05:56PM, Michael Walle wrote:
> Am 2021-05-06 21:18, schrieb Pratyush Yadav:
> > On Octal DTR capable flashes like Micron Xcella the writes cannot start
> > or end at an odd address in Octal DTR mode. Extra 0xff bytes need to be
> > appended or prepended to make sure the start address and end address are
> > even. 0xff is used because on NOR flashes a program operation can only
> > flip bits from 1 to 0, not the other way round. 0 to 1 flip needs to
> > happen via erases.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > 
> > ---
> > 
> >  drivers/mtd/spi-nor/core.c | 72 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 3d66cc34af4d..265d8b25fc7f 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2022,6 +2022,71 @@ static int spi_nor_read(struct mtd_info *mtd,
> > loff_t from, size_t len,
> >  	return ret;
> >  }
> > 
> > +/*
> > + * On Octal DTR capable flashes like Micron Xcella the writes cannot
> > start or
> > + * end at an odd address in Octal DTR mode. Extra 0xff bytes need to
> > be appended
> > + * or prepended to make sure the start address and end address are
> > even. 0xff is
> > + * used because on NOR flashes a program operation can only flip bits
> > from 1 to
> > + * 0, not the other way round. 0 to 1 flip needs to happen via erases.
> > + */
> > +static int spi_nor_octal_dtr_write(struct spi_nor *nor, loff_t to,
> > size_t len,
> > +				   const u8 *buf)
> > +{
> > +	u8 *tmp_buf;
> > +	size_t bytes_written;
> > +	loff_t start, end;
> > +	int ret;
> > +
> > +	if (IS_ALIGNED(to, 2) && IS_ALIGNED(len, 2))
> > +		return spi_nor_write_data(nor, to, len, buf);
> > +
> > +	tmp_buf = kmalloc(nor->page_size, GFP_KERNEL);
> > +	if (!tmp_buf)
> > +		return -ENOMEM;
> > +
> > +	memset(tmp_buf, 0xff, nor->page_size);
> 
> This could be replaced by just setting the first and the
> last byte to 0xff. But this might be easier to read. I am
> fine with both.

First, yes. Not the last. The buffer is allocated to nor->page_size for 
simplicity but the write could be smaller than nor->page_size. So you'd 
need to calculate the position of the other 0xff byte. It is much 
simpler to just initialize the whole buffer. It will be around 256 or 
512 bytes so not a big overhead.

> 
> > +
> > +	start = round_down(to, 2);
> > +	end = round_up(to + len, 2);
> > +
> > +	memcpy(tmp_buf + (to - start), buf, len);
> > +
> > +	ret = spi_nor_write_data(nor, start, end - start, tmp_buf);
> > +	if (ret == 0) {
> > +		ret = -EIO;
> > +		goto out;
> > +	}
> else if ? I've missed this in the other patch.

Following the style used in spi_nor_read(). Anyway, I've seen 
conflicting advice on which style to be used. Some people don't like 
else if when the if ends in a return since it is effectively an else if. 
Others like it the other way round. Dunno...

> 
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	/*
> > +	 * More bytes are written than actually requested, but that number
> > can't
> > +	 * be reported to the calling function or it will confuse its
> > +	 * calculations. Calculate how many of the _requested_ bytes were
> > +	 * written.
> > +	 */
> > +	bytes_written = ret;
> > +
> > +	if (to != start)
> > +		ret -= to - start;
> > +
> > +	/*
> > +	 * Only account for extra bytes at the end if they were actually
> > +	 * written. For example, if for some reason the controller could only
> > +	 * complete a partial write then the adjustment for the extra bytes at
> > +	 * the end is not needed.
> > +	 */
> > +	if (start + bytes_written == end)
> > +		ret -= end - (to + len);
> > +
> > +	if (ret < 0)
> > +		ret = -EIO;
> 
> can this happen?

I don't think so. IIRC this is left over from when I tried a different 
approach. Maybe I should change it to WARN_ON() to catch future 
programming errors? Though I don't mind if we drop it entirely.

> 
> > +
> > +out:
> > +	kfree(tmp_buf);
> > +	return ret;
> > +}
> > +
> >  /*
> >   * Write an address range to the nor chip.  Data must be written in
> >   * FLASH_PAGESIZE chunks.  The address range may be any size provided
> > @@ -2066,7 +2131,12 @@ static int spi_nor_write(struct mtd_info *mtd,
> > loff_t to, size_t len,
> >  		if (ret)
> >  			goto write_err;
> > 
> > -		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
> > +		if (nor->write_proto == SNOR_PROTO_8_8_8_DTR)
> > +			ret = spi_nor_octal_dtr_write(nor, addr, page_remain,
> > +						      buf + i);
> > +		else
> > +			ret = spi_nor_write_data(nor, addr, page_remain,
> > +						 buf + i);
> >  		if (ret < 0)
> >  			goto write_err;
> >  		written = ret;
> 
> -michael

Thanks for reviewing.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
