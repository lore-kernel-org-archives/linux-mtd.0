Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6BBC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 10:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70EB42065C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 10:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YgGAzMIj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gZG3x5VZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70EB42065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oai1BKUqCZHNuZT7gBQ4b0/6RchFRpJHZfoxbVBF0nQ=; b=YgGAzMIjRZKK0J
	5sxIKpBoOf5sLpnBXL83LX0IPnjphkGBE378YSBSFLSkK5O9AS4nw57fogoKQshDfZRU5+tktemiJ
	1F34K4s1q/JRNgFqlG4uhTyEcT3nJ1hAblpoTP2QGv53POaFZdaLJ0P4LKYnmJiiednMj91ZP8jJI
	k9Os2z2iJF+TIoocQRZvY1VvGyGwiVnQFMC8Kjglzev9X2ScA6bsbx10o5HveH/tgowTM6+AovWuW
	qhlq6GJd6qPli5nHhg1eUmIvzIWnf5aRogaqH4MN0neCP/qU+rR0fPmGV1/NfWaWv3Qd4jlZzpyfn
	KW9BT1vNAetZJvilVYEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc5Be-0003CF-SV; Fri, 22 May 2020 10:45:58 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc5BR-00030B-1Y; Fri, 22 May 2020 10:45:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04MAjcHd017015;
 Fri, 22 May 2020 05:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590144338;
 bh=+ZG6P8BF3dJ9QHRvqtMY+fgKzn83Sk8LyDmqXrBTqds=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gZG3x5VZ9tES5/HMESW0XZnj+Gjnop5Bkkzsqrh5ftpSGzE4b//BXjEmxHjCxwZRp
 MYdmEh8a+w5hDkWhmBRW3VmWA9gqKS5UD9RwFKQYFrZl/b8NXFki0AfeZ83Nqb7OBv
 KETO8hkfXGbgdvmch/dSPK1FaA/Hdf7a+E/shLOM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04MAjcK1091662;
 Fri, 22 May 2020 05:45:38 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 22
 May 2020 05:45:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 22 May 2020 05:45:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04MAjbIc013302;
 Fri, 22 May 2020 05:45:37 -0500
Date: Fri, 22 May 2020 16:15:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v5 01/19] spi: spi-mem: allow specifying whether an op is
 DTR or not
Message-ID: <20200522104536.4ikmhiaxg7keahdp@ti.com>
References: <20200519142642.24131-1-p.yadav@ti.com>
 <20200519142642.24131-2-p.yadav@ti.com>
 <OF1FE36FB9.9FBEFCD6-ON4825856F.002D767F-4825856F.002E7D42@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF1FE36FB9.9FBEFCD6-ON4825856F.002D767F-4825856F.002E7D42@mxic.com.tw>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_034545_166037_327472F3 
X-CRM114-Status: GOOD (  16.40  )
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

[Seems like I forgot to send this and it stayed in my Drafts folder. 
Anyway, fixed in v7]

Hi Mason,

On 21/05/20 04:27PM, masonccyang@mxic.com.tw wrote:
> 
> Hi Pratyush,
> 
> Given cmd.nbytes a initial value & check it !
> 
> > 
> > [PATCH v5 01/19] spi: spi-mem: allow specifying whether an op is DTR or 
> not
> > 
> > Each phase is given a separate 'dtr' field so mixed protocols like
> > 4S-4D-4D can be supported.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/spi/spi-mem.c       | 3 +++
> >  include/linux/spi/spi-mem.h | 8 ++++++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index 9a86cc27fcc0..93e255287ab9 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -156,6 +156,9 @@ bool spi_mem_default_supports_op(struct spi_mem 
> *mem,
> >                 op->data.dir == SPI_MEM_DATA_OUT))
> >        return false;
> > 
> > +   if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
> > +      return false;
> > +
> 
> +       if (op->cmd.nbytes != 1)
> +               return false;

Good catch. Will fix.
 
> >     return true;
> >  }
> >  EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
> 
> 
>  static int spi_mem_check_op(const struct spi_mem_op *op)
>  {
> -                if (!op->cmd.buswidth)
> +                if (!op->cmd.buswidth || op->cmd.nbytes < 1 || 
> op->cmd.nbytes > 2)
>                                  return -EINVAL;

Will fix.
 
> 
> > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > index af9ff2f0f1b2..e3dcb956bf61 100644
> > --- a/include/linux/spi/spi-mem.h
> > +++ b/include/linux/spi/spi-mem.h
> 
> #define SPI_MEM_OP_CMD(__opcode, __buswidth)                    \
>          {                                                       \
>                  .buswidth = __buswidth,                         \
>                  .opcode = __opcode,                             \
> +                .nbytes = 1,                                    \
>          }

Will fix. Thanks.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
