Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98683C433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 08:59:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB1F206C3
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 08:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/2dVUbJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m5Qq5qb7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB1F206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uq+4FyaIvbfqgGzK1+p5gYKA110jH3VaFUGkaYK8BEI=; b=W/2dVUbJkOQnSb
	blhJnS8SN8gBPsy94JzqXpokwD2+4najcYL5TdZkXVmN0q/lXnKcZyc65658kuc3yyl0jZsSHNadm
	tIPBF9koL9UajUhVcC9G4De3WNxxLxkePgsUptGttM0YprFIph074jwMKFZ4ru1RBz23lN90qNA23
	Wq+X401eZPSr2cqruEX7dpqS9Un4caquJiWGpaYmYNeNfoTHKj3DipOUEyBuwE9M4zc3L054OGt/c
	iJ0lO5BWUqxpLTqWCQg7O7IEDRAtJP9gGxfy/4Qzt24ad2x4mBXMWu44NkUb/wQ8W3XkazNtQEI4O
	m6BC98kY6zxCpUWw73LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgI3-00020h-DD; Mon, 01 Jun 2020 08:59:27 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgHs-0001cl-0q; Mon, 01 Jun 2020 08:59:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0518wsLQ099629;
 Mon, 1 Jun 2020 03:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591001934;
 bh=lGlyZcBPTfIHV1CPcNrc05ZOhHwMY7+8yiwU4k+Xhg0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=m5Qq5qb7OFtWluux14ydZvYIB+t2mYHHOthas1jkOapNLeJlaFRvONQYEkz26llr9
 EFGeFBlqJEAHl4OeX/VV2UTqZi5O9lrZ5mjMMnXcpcxzL+ItRg7yv/dVP7HVzsLlgO
 BOIF2Pr24g5StH8GbC7rs1773ZevkHhWdx8O9Zzw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0518wsv0092753
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jun 2020 03:58:54 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Jun
 2020 03:58:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Jun 2020 03:58:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0518wqOG104672;
 Mon, 1 Jun 2020 03:58:53 -0500
Date: Mon, 1 Jun 2020 14:28:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v9 13/19] mtd: spi-nor: sfdp: do not make invalid quad
 enable fatal
Message-ID: <20200601085850.um32giucfcvh5oke@ti.com>
References: <20200525091544.17270-1-p.yadav@ti.com>
 <20200525091544.17270-14-p.yadav@ti.com>
 <2267830.vuSd8QnXzO@192.168.0.120>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2267830.vuSd8QnXzO@192.168.0.120>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_015916_187246_2FF60562 
X-CRM114-Status: GOOD (  20.47  )
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
Cc: alexandre.belloni@bootlin.com, masonccyang@mxic.com.tw, vigneshr@ti.com,
 richard@nod.at, nsekhar@ti.com, Nicolas.Ferre@microchip.com,
 boris.brezillon@collabora.com, michal.simek@xilinx.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 30/05/20 06:42PM, Tudor.Ambarus@microchip.com wrote:
> On Monday, May 25, 2020 12:15:38 PM EEST Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
> > The Micron MT35XU512ABA flash does not support the quad enable bit. But
> > instead of programming the Quad Enable Require field to 000b ("Device
> > does not have a QE bit"), it is programmed to 111b ("Reserved").
> > 
> > While this is technically incorrect, it is not reason enough to abort
> > BFPT parsing. Instead, continue BFPT parsing assuming there is no quad
> > enable bit present.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index 052cabb52df9..9fd3d8d9a127 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> > @@ -576,10 +576,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> > 
> >         /* Quad Enable Requirements. */
> >         switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
> > -       case BFPT_DWORD15_QER_NONE:
> > -               params->quad_enable = NULL;
> > -               break;
> > -
> >         case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
> >                 /*
> >                  * Writing only one byte to the Status Register has the
> > @@ -616,8 +612,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >                 params->quad_enable = spi_nor_sr2_bit1_quad_enable;
> >                 break;
> > 
> > +       case BFPT_DWORD15_QER_NONE:
> >         default:
> > -               return -EINVAL;
> > +               params->quad_enable = NULL;
> > +               break;
> 
> I would just add a dev_dbg message and break the switch.
> 	dev_dbg(nor->dev, "BFPT QER reserved value used.\n");
> 	break;
> 
> You will then have to set params->quad_enable = NULL; in a post_bfpt hook.

Ok. Will re-roll.

BTW, are you planning to pick up the xSPI/8D support for 5.8? It has 
been outstanding for quite some time now and it would be great if it can 
make it through this merge window.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
