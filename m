Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2FAC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 11:57:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8EAC21481
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 11:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opw84bMG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K0v0C7Rd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8EAC21481
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZaxEPjiqBWu2o15uiINcmv4iWpgvMi4fIBhX5kVH2zE=; b=opw84bMGlelW146Mqcg4fI5+f
	X6ToJGXeVAFFVSflOwVKxAmrKkkmMgshiLqZlVOhNNlW9qQL1Avp+h+PyA9N4Yoj954m7JFLMLn+B
	wKi0r1zJxltKqTIHE0iPSfCpRRxMms5uzbs1gtlQPbSno9v9IrO5zsC0o9G0xgTQgyvAAcZgvwqXc
	xX5IXtC8sSZA2/qJzoOUJcFEv8v3XeFAU7pFAbxG2/fcKUGCcBEHxlvQo0Uvk1nOG1BwX7cnag2N0
	Bn+5xgxBrjDDBIZsz2KqEgvYdC9MZyVsk2gRRRWwHFXmFmQYM8W0L9LAhFDMKZEk5YdD02SkjzbX2
	A5ozC5Hvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNxCC-00004s-EP; Thu, 01 Oct 2020 11:56:24 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNxCA-0008Vs-2z
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 11:56:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091BuGJv084959;
 Thu, 1 Oct 2020 06:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601553376;
 bh=CVKY5T/YKKZG90aaeqafF0OA/PsmDSYnTFMbTSYWs44=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=K0v0C7RdqkYGQvWpbcxjqQDYwj/G38eHeRaDouqxWWlg7BEmCfnSRjZ2SKWs/iU2k
 bN3u2FNjWgS+enMz1uuDV8znWSNY6SBkc3EPQYjpukeyTTgz/4qZWS78ky0lnPC9oe
 ud24s1Yo7vLCFpbPiN/IOa0nlg8nr32/AHJnzjGE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091BuG7v002616
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 06:56:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 06:56:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 06:56:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091BuFIC046820;
 Thu, 1 Oct 2020 06:56:15 -0500
Date: Thu, 1 Oct 2020 17:26:14 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v14 10/15] mtd: spi-nor: Parse SFDP SCCR Map
Message-ID: <20201001115612.7i4d2wmeinv2kyz5@ti.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-11-p.yadav@ti.com>
 <81fa2331-d808-fed6-232f-f8b67e7e9dac@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81fa2331-d808-fed6-232f-f8b67e7e9dac@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_075622_213604_8071FAC2 
X-CRM114-Status: GOOD (  22.45  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/10/20 08:20AM, Tudor.Ambarus@microchip.com wrote:
> On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> > Parse just the 22nd dword and look for the 'DTR Octal Mode Enable
> > Volatile bit'.
> > 
> > SPI_NOR_IO_MODE_EN_VOLATILE should be set just for the flashes
> > that don't define the optional SFDP SCCR Map. For the others,
> > let the SFDP do its job and fill the SNOR_F_IO_MODE_EN_VOLATILE
> > flag. We avoid this way polluting the flash flags when declaring
> > one.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 52 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index ebc1188f7533..0b5b9ea44cfc 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> >         return ret;
> >  }
> > 
> > +#define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE             BIT(31)
> > +
> > +/**
> > + * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
> > + *                        Map.
> > + * @nor:               pointer to a 'struct spi_nor'
> > + * @sccr_header:       pointer to the 'struct sfdp_parameter_header' describing
> > + *                     the SCCR Map table length and version.
> > + * @params:            pointer to the 'struct spi_nor_flash_parameter' to be.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spi_nor_parse_sccr(struct spi_nor *nor,
> > +                             const struct sfdp_parameter_header *sccr_header,
> > +                             struct spi_nor_flash_parameter *params)
> > +{
> > +       u32 *dwords, addr;
> > +       size_t len;
> > +       int ret;
> > +       u8 io_mode_en_volatile;
> 
> would a bool work here?

It should. I'll change it.
 
> > +
> > +       len = sccr_header->length * sizeof(*dwords);
> > +       dwords = kmalloc(len, GFP_KERNEL);
> > +       if (!dwords)
> > +               return -ENOMEM;
> > +
> > +       addr = SFDP_PARAM_HEADER_PTP(sccr_header);
> > +       ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> > +       if (ret)
> > +               goto out;
> > +
> > +       le32_to_cpu_array(dwords, sccr_header->length);
> > +
> > +       io_mode_en_volatile = FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
> > +                                       dwords[22]);
> > +
> > +       if (io_mode_en_volatile)
> > +               nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> > +
> > +out:
> > +       kfree(dwords);
> > +       return ret;
> > +}
> > +
> >  /**
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
