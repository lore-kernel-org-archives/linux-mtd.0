Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DD3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9IciJffL1FDJw3gvchoS/z2rmyJ29F7L4zzoe7vcrA=; b=cS1Tmogq5FwFW9
	7j660FF+XeqTR9gQtUYbfx9Vdv8WgwSCclUwSw08vwLK5kLMbN30tCRYD15ghOMT1o/24q+3fqSNR
	82PaXNfEekzfQwnPHMkw40iyNY+AcsitSSaTUu3JhY5T7sIxg6DAKYEBdN67ap7ny/iM6Q2G4Awgh
	sL8d4zHMJUy0OMcyrLfj55CvqUn0E15VQy9udCq0h16/UN8jpTPzyz2/1IahAWP9GG+c4H55f5yop
	wUULTyeQxwZicgfWaK/xTrtOgRA67Elb7ieCqbj5SgGSl//60r5a/zy9hJH7HgaNIDgu7aJINOTar
	Jg511Is30rz9swNR7wVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnx9-003rou-Up; Tue, 19 Apr 2022 13:31:36 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngn2P-003W4x-Bl
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 12:32:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23JCWlVZ090706;
 Tue, 19 Apr 2022 07:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650371567;
 bh=7pUxGX1NMNsUpg+kjZ7UPIQay8LquMeobEccHiyqJ3o=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Pu9Srcn5KCAPnw35f14Zdc8hpSi44oYqdO/0I6BZbbNUhSU4wZEg8gfxlTbGDaqaq
 YTaMUbMihF3MKH7iiEzdyIksndNvyYCuWXiiaoEjhLCxD24gMqN6efRpIFYM+qxB94
 XEBbOv+Ojw5QK6hbXiFn3DjMq2ZMRbXF6vwrLuDM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23JCWlGT037011
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Apr 2022 07:32:47 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 07:32:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 07:32:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23JCWkpC008529;
 Tue, 19 Apr 2022 07:32:46 -0500
Date: Tue, 19 Apr 2022 18:02:45 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 6/9] mtd: spi-nor: core: Add helpers to read/write any
 register
Message-ID: <20220419123245.zu4hypebz77ckygn@ti.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-7-tudor.ambarus@microchip.com>
 <0e4ec58c21490dcd9cf82ab89bd8c34c@walle.cc>
 <e21b0d76bf778f78f432ba27a673222d@walle.cc>
 <f318dbd9-d4bf-301a-b5c9-556d04d5bfe6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f318dbd9-d4bf-301a-b5c9-556d04d5bfe6@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_053258_387413_83155B8F 
X-CRM114-Status: GOOD (  24.43  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 19/04/22 12:08PM, Tudor.Ambarus@microchip.com wrote:
> On 4/19/22 14:46, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > Am 2022-04-19 13:19, schrieb Michael Walle:
> >> Am 2022-04-11 11:10, schrieb Tudor Ambarus:
> >>> There are manufacturers that use registers indexed by address. Some of
> >>> them support "read/write any register" opcodes. Provide core methods
> >>> that
> >>> can be used by all manufacturers. SPI NOR controller ops are
> >>> intentionally
> >>> not supported as we intend to move all the SPI NOR controller drivers
> >>> under the SPI subsystem.
> >>>
> >>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>> Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> >>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> >>
> >> I still don't like it because the function doesn't do
> >> anything what the function name might suggest. The read
> >> just executes an op, the write executes an op with a
> >> write enable before. All the behavior is determined by the
> >> 'op' argument.
> >>
> >> Anyway,
> >> Reviewed-by: Michael Walle <michael@walle.cc>
> >>
> >>> ---
> >>> v3: no changes
> >>>
> >>> =A0drivers/mtd/spi-nor/core.c | 41
> >>> ++++++++++++++++++++++++++++++++++++++
> >>> =A0drivers/mtd/spi-nor/core.h |=A0 4 ++++
> >>> =A02 files changed, 45 insertions(+)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >>> index 6165dc7bfd17..42794328d3b6 100644
> >>> --- a/drivers/mtd/spi-nor/core.c
> >>> +++ b/drivers/mtd/spi-nor/core.c
> >>> @@ -307,6 +307,47 @@ ssize_t spi_nor_write_data(struct spi_nor *nor,
> >>> loff_t to, size_t len,
> >>> =A0=A0=A0=A0 return nor->controller_ops->write(nor, to, len, buf);
> >>> =A0}
> >>>
> >>> +/**
> >>> + * spi_nor_read_reg() - read register to flash memory
> >>> + * @nor:=A0=A0=A0=A0=A0=A0=A0 pointer to 'struct spi_nor'.
> >>> + * @op:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SPI memory operation. op=
->data.buf must be DMA-able.
> >>> + * @proto:=A0 SPI protocol to use for the register operation.
> >>> + *
> >>> + * Return: zero on success, -errno otherwise
> >>> + */
> >>> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum spi_nor_protoc=
ol proto)
> >>> +{
> >>> +=A0=A0=A0 if (!nor->spimem)
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EOPNOTSUPP;
> >>> +
> >>> +=A0=A0=A0 spi_nor_spimem_setup_op(nor, op, proto);
> >>> +=A0=A0=A0 return spi_nor_spimem_exec_op(nor, op);
> >>> +}
> >>> +
> >>> +/**
> >>> + * spi_nor_write_reg() - write register to flash memory
> >>> + * @nor:=A0=A0=A0=A0=A0=A0=A0 pointer to 'struct spi_nor'
> >>> + * @op:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SPI memory operation. op=
->data.buf must be DMA-able.
> >>> + * @proto:=A0 SPI protocol to use for the register operation.
> >>> + *
> >>> + * Return: zero on success, -errno otherwise
> >>> + */
> >>> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum spi_nor_pro=
tocol proto)
> >>> +{
> >>> +=A0=A0=A0 int ret;
> >>> +
> >>> +=A0=A0=A0 if (!nor->spimem)
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EOPNOTSUPP;
> >>> +
> >>> +=A0=A0=A0 ret =3D spi_nor_write_enable(nor);
> >>> +=A0=A0=A0 if (ret)
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> >>> +=A0=A0=A0 spi_nor_spimem_setup_op(nor, op, proto);
> >>> +=A0=A0=A0 return spi_nor_spimem_exec_op(nor, op);
> > =

> > After seeing your next two patches. Shouldn't the
> > spi_nor_wait_until_ready() call be here too?
> > =

> =

> I thought of this too, but seems that for a reason that I don't
> remember, we don't call for spi_nor_wait_until_ready after we
> write the octal DTR bit. Pratyush, do you remember why?

We are not sure the protocol changed correctly so we can't rely on =

spi_nor_wait_until_ready(). We read the ID instead to be sure.

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
