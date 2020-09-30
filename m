Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50AC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:43:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E382071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJ6ifs/Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PGUux8Zj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E382071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dspO3kEcOOBsvUSr+0bLSV2h9VkIMI9VdJgtTVh5hyE=; b=dJ6ifs/QFwIzJ4u0wPnKRGcSv
	p28vPG0hMBnnBQ7DSO+wIesLrOzpDnWXKw8EcDDIp/CdwgLDsxHdDNCbZW+H9elmiomG5E3+3ST63
	cOXy5T+oSoHBpgtUc50eW6wpBbP+o0ue5xTD8EYH7Ym37DE18P82lFFuamGWOpRGNKKNNKQ0PGi9o
	fwmVIu3ZUTgIfFQBlpDd1mhzSus3pD57UT6A4T+EwEDaajBimEahbaz+aXwjEvXoelteMOAACMHLb
	JQZTShhKJXIeyRH6b990JCXblCX/sM9ATc+etjnihAagiMUrwzlSnxveSfuH1uLcYhEnEgLSD+rHJ
	yKaRltjWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWli-0003tc-PP; Wed, 30 Sep 2020 07:43:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWlg-0003qr-PU
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:43:17 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U7hB0T032138;
 Wed, 30 Sep 2020 02:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601451791;
 bh=ZF9wqdv0lxa8bwgZCPJ8AXia4qC5XXcG4E2TUV5895o=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PGUux8Zj+mGgWNFAn1ICugJ1fZnuQkOnAuLTjeRLzHiA1jROPsP90+p3uOCbdpXit
 K9lMyuZq0/gvgEfd3QwhkC/YfXNt7Wp3F3xQvAuuVWJdD+Qpx4akO2toUIIIiRbRZ4
 mxxS6mLKUaULAVGTWwBL2KRIJycakc//Of/yC9E0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U7hBWD090407
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 02:43:11 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 02:43:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 02:43:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U7hAoo074277;
 Wed, 30 Sep 2020 02:43:11 -0500
Date: Wed, 30 Sep 2020 13:13:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 11/15] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Message-ID: <20200930074307.rdi6352fy3is6gjq@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-12-p.yadav@ti.com>
 <20200929130838.4hfa2y3qoxissdus@ti.com>
 <a32450dc-8db3-597c-34b0-68632ac27184@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a32450dc-8db3-597c-34b0-68632ac27184@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_034316_948724_081FE09C 
X-CRM114-Status: GOOD (  31.66  )
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

On 30/09/20 07:32AM, Tudor.Ambarus@microchip.com wrote:
> On 9/29/20 4:08 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 16/09/20 06:14PM, Pratyush Yadav wrote:
> >> Perform a Soft Reset on shutdown on flashes that support it so that the
> >> flash can be reset to its initial state and any configurations made by
> >> spi-nor (given that they're only done in volatile registers) will be
> >> reset. This will hand back the flash in pristine state for any further
> >> operations on it.
> >>
> >> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.c  | 41 +++++++++++++++++++++++++++++++++++++
> >>  include/linux/mtd/spi-nor.h |  2 ++
> >>  2 files changed, 43 insertions(+)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 6ee93544d72f..853dfa02f0de 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -40,6 +40,9 @@
> >>
> >>  #define SPI_NOR_MAX_ADDR_WIDTH       4
> >>
> >> +#define SPI_NOR_SRST_SLEEP_MIN 200
> >> +#define SPI_NOR_SRST_SLEEP_MAX 400
> >> +
> >>  /**
> >>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
> >>   *                      extension type.
> >> @@ -3174,6 +3177,41 @@ static int spi_nor_init(struct spi_nor *nor)
> >>       return 0;
> >>  }
> >>
> >> +static void spi_nor_soft_reset(struct spi_nor *nor)
> >> +{
> >> +     struct spi_mem_op op;
> >> +     int ret;
> >> +
> >> +     op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 8),
> 
> can we avoid the cast?

No. The compiler complains about "expected expression before '{' token". 
We can avoid it if the assignment is with the declaration but then we 
can't re-use the variable op for the second command.

I like the cast better than using separate variables for the two (or 
more in other cases) commands we execute.
 
> > 
> > The buswidth used here should be 1 instead of 8. It makes no difference
> > in practice because the call to spi_nor_spimem_setup_op() immediately
> > after will over-write it to the correct value anyway, but let's follow
> > the style followed throughout the rest of the codebase. Will fix in the
> > next version.
> 
> or you can just set the buswidth to 0 so that the reader rises his eyebrow
> and search for where it is updated. If you like it better you'll have to change
> throughout the entire code base, maybe in 4/15 where setup_op is introduced.

Ok. Will change it.
 
> > 
> >> +                     SPI_MEM_OP_NO_DUMMY,
> >> +                     SPI_MEM_OP_NO_ADDR,
> >> +                     SPI_MEM_OP_NO_DATA);
> >> +     spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
> Still not a big fan of this, but we can update the op init later on. How
> about some new lines around spi_nor_spimem_setup_op()? First time I read
> the code I haven't seen it.

Ok.
 
> >> +     ret = spi_mem_exec_op(nor->spimem, &op);
> >> +     if (ret) {
> >> +             dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> >> +             return;
> >> +     }
> >> +
> >> +     op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 8),
> > 
> > Same here.
> > 
> >> +                     SPI_MEM_OP_NO_DUMMY,
> >> +                     SPI_MEM_OP_NO_ADDR,
> >> +                     SPI_MEM_OP_NO_DATA);
> >> +     spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> >> +     ret = spi_mem_exec_op(nor->spimem, &op);
> >> +     if (ret) {
> >> +             dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> >> +             return;
> >> +     }
> >> +
> >> +     /*
> >> +      * Software Reset is not instant, and the delay varies from flash to
> >> +      * flash. Looking at a few flashes, most range somewhere below 100
> >> +      * microseconds. So, sleep for a range of 200-400 us.
> >> +      */
> >> +     usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
> >> +}
> >> +
> >>  /* mtd resume handler */
> >>  static void spi_nor_resume(struct mtd_info *mtd)
> >>  {

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
