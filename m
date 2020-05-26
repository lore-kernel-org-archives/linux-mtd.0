Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E733C433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 680E520787
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q9+mfqFu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GUDC0wrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 680E520787
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAQyFP+faPwULoegriMDKf5JcaExwmC/OujdSPVSNE8=; b=Q9+mfqFu4eFMJI
	xK2egeAuoCUNGy58CmwC44MBQPy1NX5wyBllZcp2I4IatqTEooVTa/atVDryLLrbwAWv2j6SvNC/a
	36zHpAzMcADHnEBeC6NIZ8eMZoGSJigixOf1fzm6C91/67pWB2PIGMNTRQOGHnPxKUFH+T0eVjS2k
	emezLbeDsCIy09linlsQHo9oO0nktXc+d92DqxvSmlGqULiUlRwKMmw15oApvg++JLJdiou+XwhRw
	ORfbNOrrZcFtB274BP2BpeenOAvbuTf1mRVxsIqEsG/A2AVcC0tu3wXgez9qNkoXWhVVnuTp7WGdQ
	nBn4cNOKZPhWxhaBK13g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdVvv-0000I1-5N; Tue, 26 May 2020 09:31:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdVvs-0000HY-3n
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 09:31:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04Q9VOEb096081;
 Tue, 26 May 2020 04:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590485484;
 bh=jD7sXlwKitwGx0YhJeaqEQlLnyjhXpd8mxOdk7QooZY=;
 h=From:Subject:To:CC:References:Date:In-Reply-To;
 b=GUDC0wrP0Ch5wK7qYXrkHjfCuwrjhH7Tc4woRZ0YGuBScfA9Bpv4xBUWTexJdnfV3
 jwosfFsjV/yLgrlIx87iIbjPaOPwZ1W7AelQeN8QuhO01ssHvZ7Yx43DWeHlLLZSlU
 c4p13kIklbbKQQMbejyk0Ls75gMfIAeKg3A11SkQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04Q9VOqX038751;
 Tue, 26 May 2020 04:31:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 04:31:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 04:31:24 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04Q9VJ4V008663;
 Tue, 26 May 2020 04:31:20 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/6] mtd: spi-nor: cadence-quadspi: Drop
 cdns,is-decoded-cs property
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
References: <20200508185411.487-1-vigneshr@ti.com>
 <20200508185411.487-2-vigneshr@ti.com>
Message-ID: <7ea8e0fd-9709-42b1-66d5-8976b73dd82a@ti.com>
Date: Tue, 26 May 2020 15:01:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508185411.487-2-vigneshr@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_023136_236200_0FE18DF9 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: "marex@denx.de" <marex@denx.de>, Boris Brezillon <bbrezillon@kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 09/05/20 12:24 am, Vignesh Raghavendra wrote:
> Cadence QSPI provides a way to automatically decode CS based on the
> offset accessed within memory map window. This feature cannot be
> supported in spi-mem framework as controller driver would not have
> access to flash geometry. Therefore drop this feature in preparation to
> moving to spi-mem.
> =

> Note that, this feature never worked in the driver (Direct/Indirect mode
> accesses did not take into account size of flash on other CSs) and there
> are no users of this feature in kernel. Therefore dropping this should
> not cause a regression
> =


I realized cdns,is-decoded-cs property does not depend on
cqspi_configure_cs_and_sizes() and can still be supported w/o knowing
flash geometry... Will respin..=A0

Regards
Vignesh

> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>=A0 .../mtd/spi-nor/controllers/cadence-quadspi.c | 59 +++----------------
>=A0 1 file changed, 9 insertions(+), 50 deletions(-)
> =

> diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/=
mtd/spi-nor/controllers/cadence-quadspi.c
> index 494dcab4aaaa..fa54f85e16d7 100644
> --- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> @@ -77,11 +77,7 @@ struct cqspi_st {
>=A0=A0=A0=A0=A0=A0=A0 dma_addr_t=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mm=
ap_phys_base;
>=A0 =

>=A0=A0=A0=A0=A0=A0=A0 int=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 current_cs;
> -=A0=A0=A0=A0 int=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 current_page_size;
> -=A0=A0=A0=A0 int=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 current_erase_size;
> -=A0=A0=A0=A0 int=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 current_addr_width;
>=A0=A0=A0=A0=A0=A0=A0 unsigned long=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 master_r=
ef_clk_hz;
> -=A0=A0=A0=A0 bool=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 is_decoded_cs;
>=A0=A0=A0=A0=A0=A0=A0 u32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 fifo_depth;
>=A0=A0=A0=A0=A0=A0=A0 u32=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 fifo_width;
>=A0=A0=A0=A0=A0=A0=A0 bool=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 rclk_en;
> @@ -715,19 +711,15 @@ static void cqspi_chipselect(struct spi_nor *nor)
>=A0=A0=A0=A0=A0=A0=A0 unsigned int reg;
>=A0 =

>=A0=A0=A0=A0=A0=A0=A0 reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> -=A0=A0=A0=A0 if (cqspi->is_decoded_cs) {
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg |=3D CQSPI_REG_CONFIG_DECODE_MA=
SK;
> -=A0=A0=A0=A0 } else {
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg &=3D ~CQSPI_REG_CONFIG_DECODE_M=
ASK;
> +=A0=A0=A0=A0 reg &=3D ~CQSPI_REG_CONFIG_DECODE_MASK;
>=A0 =

> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Convert CS if without decoder.
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * CS0 to 4b'1110
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * CS1 to 4b'1101
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * CS2 to 4b'1011
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * CS3 to 4b'0111
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 chip_select =3D 0xF & ~(1 << chip_s=
elect);
> -=A0=A0=A0=A0 }
> +=A0=A0=A0=A0 /* Convert CS if without decoder.
> +=A0=A0=A0=A0=A0 * CS0 to 4b'1110
> +=A0=A0=A0=A0=A0 * CS1 to 4b'1101
> +=A0=A0=A0=A0=A0 * CS2 to 4b'1011
> +=A0=A0=A0=A0=A0 * CS3 to 4b'0111
> +=A0=A0=A0=A0=A0 */
> +=A0=A0=A0=A0 chip_select =3D 0xF & ~(1 << chip_select);
>=A0 =

>=A0=A0=A0=A0=A0=A0=A0 reg &=3D ~(CQSPI_REG_CONFIG_CHIPSELECT_MASK
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 << CQSPI_REG_CONFIG_CHIPS=
ELECT_LSB);
> @@ -736,32 +728,6 @@ static void cqspi_chipselect(struct spi_nor *nor)
>=A0=A0=A0=A0=A0=A0=A0 writel(reg, reg_base + CQSPI_REG_CONFIG);
>=A0 }
>=A0 =

> -static void cqspi_configure_cs_and_sizes(struct spi_nor *nor)
> -{
> -=A0=A0=A0=A0 struct cqspi_flash_pdata *f_pdata =3D nor->priv;
> -=A0=A0=A0=A0 struct cqspi_st *cqspi =3D f_pdata->cqspi;
> -=A0=A0=A0=A0 void __iomem *iobase =3D cqspi->iobase;
> -=A0=A0=A0=A0 unsigned int reg;
> -
> -=A0=A0=A0=A0 /* configure page size and block size. */
> -=A0=A0=A0=A0 reg =3D readl(iobase + CQSPI_REG_SIZE);
> -=A0=A0=A0=A0 reg &=3D ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_=
LSB);
> -=A0=A0=A0=A0 reg &=3D ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOC=
K_LSB);
> -=A0=A0=A0=A0 reg &=3D ~CQSPI_REG_SIZE_ADDRESS_MASK;
> -=A0=A0=A0=A0 reg |=3D (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
> -=A0=A0=A0=A0 reg |=3D (ilog2(nor->mtd.erasesize) << CQSPI_REG_SIZE_BLOCK=
_LSB);
> -=A0=A0=A0=A0 reg |=3D (nor->addr_width - 1);
> -=A0=A0=A0=A0 writel(reg, iobase + CQSPI_REG_SIZE);
> -
> -=A0=A0=A0=A0 /* configure the chip select */
> -=A0=A0=A0=A0 cqspi_chipselect(nor);
> -
> -=A0=A0=A0=A0 /* Store the new configuration of the controller */
> -=A0=A0=A0=A0 cqspi->current_page_size =3D nor->page_size;
> -=A0=A0=A0=A0 cqspi->current_erase_size =3D nor->mtd.erasesize;
> -=A0=A0=A0=A0 cqspi->current_addr_width =3D nor->addr_width;
> -}
> -
>=A0 static unsigned int calculate_ticks_for_ns(const unsigned int ref_clk_=
hz,
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const unsigned int n=
s_val)
>=A0 {
> @@ -867,18 +833,13 @@ static void cqspi_configure(struct spi_nor *nor)
>=A0=A0=A0=A0=A0=A0=A0 int switch_cs =3D (cqspi->current_cs !=3D f_pdata->c=
s);
>=A0=A0=A0=A0=A0=A0=A0 int switch_ck =3D (cqspi->sclk !=3D sclk);
>=A0 =

> -=A0=A0=A0=A0 if ((cqspi->current_page_size !=3D nor->page_size) ||
> -=A0=A0=A0=A0=A0=A0=A0=A0 (cqspi->current_erase_size !=3D nor->mtd.erases=
ize) ||
> -=A0=A0=A0=A0=A0=A0=A0=A0 (cqspi->current_addr_width !=3D nor->addr_width=
))
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 switch_cs =3D 1;
> -
>=A0=A0=A0=A0=A0=A0=A0 if (switch_cs || switch_ck)
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cqspi_controller_enable(cqsp=
i, 0);
>=A0 =

>=A0=A0=A0=A0=A0=A0=A0 /* Switch chip select. */
>=A0=A0=A0=A0=A0=A0=A0 if (switch_cs) {
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cqspi->current_cs =3D f_pdat=
a->cs;
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cqspi_configure_cs_and_sizes(nor);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cqspi_chipselect(nor);
>=A0=A0=A0=A0=A0=A0=A0 }
>=A0 =

>=A0=A0=A0=A0=A0=A0=A0 /* Setup baudrate divisor and delays */
> @@ -1145,8 +1106,6 @@ static int cqspi_of_get_pdata(struct platform_devic=
e *pdev)
>=A0=A0=A0=A0=A0=A0=A0 struct device_node *np =3D pdev->dev.of_node;
>=A0=A0=A0=A0=A0=A0=A0 struct cqspi_st *cqspi =3D platform_get_drvdata(pdev=
);
>=A0 =

> -=A0=A0=A0=A0 cqspi->is_decoded_cs =3D of_property_read_bool(np, "cdns,is=
-decoded-cs");
> -
>=A0=A0=A0=A0=A0=A0=A0 if (of_property_read_u32(np, "cdns,fifo-depth", &cqs=
pi->fifo_depth)) {
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&pdev->dev, "couldn'=
t determine fifo-depth\n");
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
