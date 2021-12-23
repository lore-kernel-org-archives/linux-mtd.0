Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0967CC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vO3NHj35WyPjQng5ZAd57e7ull2Yrt5VXoBXNft7qY=; b=mGp5w36LYSQHsC
	8r9Hqt6HXkR9FezxjY/fh+Id0KjA183rxHeO1LVrJAiKDXrS3NFr2dwT+6rLgvQQXIAudhMkxbP6X
	+XI/1m0jlDeqtXRzBSAFFlWiEsEiaVKWhHlkJwxUkQEEQRqkY+tx6NDMyRBPIfFpXMrT4gHGO+KRs
	MMB4Us3+bePGFw5cT0RapQitSGGsuFVmcxywC6luABtOggecRYnya4UpOVhegak+Upu9fn4F3v2KZ
	K22+DDMgnTZYt8/ebPrOxw3+C/zFZGD34MrLDVj30ERIsGQchJYG68uXtNhoAtm4YIGRXygt0obpj
	EdUQaDv3aTQDDYjJPbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0MZO-00CcZE-Qo; Thu, 23 Dec 2021 11:47:38 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0MZL-00CcYM-Mz
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 11:47:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BNBlTVq009622;
 Thu, 23 Dec 2021 05:47:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640260049;
 bh=GjgrR2IaDWAPKyeUyGt4U3J1V0cq24+M6uX+UyY98zI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=A7wUHwEZMTHMhqkaAUdUmNZZRfUhyWgqGYH6gzqQZY7NKQzwGFAiNo0ApyzWWh/as
 Ew+NiCtVGjPCPr8nZKrUkQW2gCZFK8vFgOzWCz8m9XhmX+8OhEpHoBhM1onh854dmO
 aFkzDPDf4q4L0MUc1fbU6Lk/Kze02wfbZ06zNMfs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BNBlTK5105017
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Dec 2021 05:47:29 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Dec 2021 05:47:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Dec 2021 05:47:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BNBlSDo108562;
 Thu, 23 Dec 2021 05:47:28 -0600
Date: Thu, 23 Dec 2021 17:17:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] spi: spi-mem: reject partial cycle transfers in
 8D-8D-8D mode
Message-ID: <20211223114725.dplhzthb4jg3ho2v@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-5-p.yadav@ti.com>
 <0e22270e-7c4a-9ba3-e468-963d21ab63a0@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e22270e-7c4a-9ba3-e468-963d21ab63a0@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_034735_862116_3007C63E 
X-CRM114-Status: GOOD (  19.93  )
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

On 23/12/21 11:43AM, Tudor.Ambarus@microchip.com wrote:
> On 5/31/21 9:17 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > In 8D-8D-8D mode two bytes are transferred per cycle. So an odd number
> > of bytes cannot be transferred because it would leave a residual half
> > cycle at the end. Consider such a transfer invalid and reject it.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > 
> > ---
> > 
> > Changes in v2:
> > - Add Mark's R-by (spell corrected).
> > 
> >  drivers/spi/spi-mem.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index 1513553e4080..ab9eefbaa1d9 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -162,7 +162,17 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
> >  bool spi_mem_dtr_supports_op(struct spi_mem *mem,
> >                              const struct spi_mem_op *op)
> >  {
> > -       if (op->cmd.nbytes != 2)
> > +       if (op->cmd.buswidth == 8 && op->cmd.nbytes % 2)
> 
> !IS_ALIGNED(op->cmd.nbytes, 2)?

Ok.

> 
> > +               return false;
> > +
> > +       if (op->addr.nbytes && op->addr.buswidth == 8 && op->addr.nbytes % 2)
> > +               return false;
> > +
> > +       if (op->dummy.nbytes && op->dummy.buswidth == 8 && op->dummy.nbytes % 2)
> > +               return false;
> > +
> > +       if (op->data.dir != SPI_MEM_NO_DATA &&
> > +           op->dummy.buswidth == 8 && op->data.nbytes % 2)
> 
> dummy is sent on the same buswidth as data's indeed, but I would
> s/op->dummy.buswidth/op->data.buswidth for code consistency reasons.

This looks like a typo. It should indeed be data.buswidth.

> 
> >                 return false;
> > 
> >         return spi_mem_check_buswidth(mem, op);
> > --
> > 2.30.0
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
