Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B140C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 08:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58F120757
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 08:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pfddKlMf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LCwSPwdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B58F120757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxqC+71zZzR6Io0F9tiA1gjvr0rFB14/7SHmRpvyH54=; b=pfddKlMfsGOlKK
	46sxOL6DXpKAfXL0NLDLH+4LqcYzZB72BGo51g3zKUepYHAEiHpCCnc9/PNvbfRkmWIGdf4aQ9Pu3
	CGx2c+uZWc874sarDVEgGOas2MHW784xjn3ioqYAbIGscm9D3Rj7qBlAT+Rra944QOEpEDzrD/++2
	cTU0//V7QbElx0srZ35RjS7rGQEBLJXqxAIeuNq+3PMKNocMiOqhPvVKs55oETy4Cnm7K4q4OJKLR
	9Ye8EUKJB9QwxbIFZku0RFDjj4AR6paMMfofZjk8xgV9wnZz+w0vPJ7POkmsevPQi+z5/cdK9lW67
	CjRT+mzFww2d6BcGClog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc3Ct-0005mE-B4; Fri, 22 May 2020 08:39:07 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc3Bb-0004qC-7k; Fri, 22 May 2020 08:37:49 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04M8bcmh118407;
 Fri, 22 May 2020 03:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590136658;
 bh=yF4xwwVycaty1YYtrvz7tn0azR2eb+OYgNKHjKytnkc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=LCwSPwdXFLyyOmJwtl+CdoShpJ5fp9tEao2X9/zf2kbnHkrfB6daeZc+naZsHvv10
 kiw+7ivb0aZ9ids8iQc7RtWrDqU/qMfeuR0E1icglIzgqW8EySon+4xkhX8cnKfZl5
 zCPoF810ubD13ZCtI79ERZZo13Wjwa8lPZlnB+gI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04M8bc0U071990
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 May 2020 03:37:38 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 22
 May 2020 03:37:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 22 May 2020 03:37:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04M8baqV054658;
 Fri, 22 May 2020 03:37:37 -0500
Date: Fri, 22 May 2020 14:07:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v5 05/19] mtd: spi-nor: add support for DTR protocol
Message-ID: <20200522083734.hs4wmfplch7icecv@ti.com>
References: <20200519142642.24131-1-p.yadav@ti.com>
 <20200519142642.24131-6-p.yadav@ti.com>
 <OFAC48157A.F337A12A-ON48258570.0021F23B-48258570.0023CB62@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFAC48157A.F337A12A-ON48258570.0021F23B-48258570.0023CB62@mxic.com.tw>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_013747_388792_BDBA40FA 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/05/20 02:30PM, masonccyang@mxic.com.tw wrote:
> 
> Hi Pratyush,
> 
> 
> > +/**
> > + * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem 
> op.
> > + * @nor:      pointer to a 'struct spi_nor'
> > + * @op:         pointer to the 'struct spi_mem_op' whose properties
> > + *         need to be initialized.
> > + * @proto:      the protocol from which the properties need to be set.
> > + */
> > +void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> > +              struct spi_mem_op *op,
> > +              const enum spi_nor_protocol proto)
> > +{
> > +   u8 ext;
> > +
> > +   op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
> > +
> > +   if (op->addr.nbytes)
> > +      op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> > +
> > +   if (op->dummy.nbytes)
> > +      op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> > +
> > +   if (op->data.nbytes)
> > +      op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
> > +
> > +   if (spi_nor_protocol_is_dtr(proto)) {
> 
> As mentioned before that I am also patching mx25* which supports 8S-8S-8S 
> and 
> 8D-8D-8D mode.
> 
> please patch to spi_nor_protocol_is_8_8_8(proto) for 8S-8S-8S mode 
> support.

Like I said before, we should try to avoid creeping up the scope of this 
series. This series aims to add 8D support. Once this lands, I don't see 
why you can't 8S support on top. Unless we make a fundamental change 
that makes it impossible to add 8S support, it should stay as-is.

All that said, I fail to see why 8S would have any problems with this 
function. We just fill in the buswidths from the protocol, and adjust 
the op if it is DTR. So in case of 8S mode, this function as it is will 
fill in the buswidths to 8 for all phases. And it won't hit the if block 
here so this code is of no concern to 8S mode.
 
> > +      /*
> > +       * spi-mem supports mixed DTR modes, but right now we can only
> > +       * have all phases either DTR or STR. IOW, spi-mem can have
> > +       * something like 4S-4D-4D, but spi-nor can't. So, set all 4
> > +       * phases to either DTR or STR.
> > +       */
> 
>         if (spi_nor_protocol_is_8D_8D_8D(proto) {

No. The adjustments below apply to _all_ DTR ops, not just 8D-8D-8D 
ones. So in case someone wants to use 4D-4D-4D mode, they won't have to 
touch this code at all.
 
> > +      op->cmd.dtr = op->addr.dtr = op->dummy.dtr
> > +                = op->data.dtr = true;
> > +
> > +      /* 2 bytes per clock cycle in DTR mode. */
> > +      op->dummy.nbytes *= 2;
> 
>         }
> 
> > +
> > +      ext = spi_nor_get_cmd_ext(nor, op);
> > +      op->cmd.opcode = (op->cmd.opcode << 8) | ext;
> > +      op->cmd.nbytes = 2;
> > +   }
> > +}
> > +

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
