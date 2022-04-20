Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4464C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 04:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCPogq5MQwq2NfmRjhg4G00WdNK2br8W0wqdZbfS4iY=; b=YbYjCOTDQ+6NMZ
	LdSBc5NH5WrIUEEkuopeqF8N1dQP/NCAeJN+Nfm+9YSNkS8ZnSI8qgZH+eB8LpoorpFbsNCa/yvaO
	tOqxzqkYvCR3zx5s99CY3rzOWpoRV791S0sOZTx9jbylj2VcVZxueLQubopMoTaoqM9E76WwHk3zS
	ohgQ4ItNK+/GFZJDFWswlB6LAsZHKKW+XPzCBwXsn7xO/wcnBUFP+ohtbKoEbizELritcHc4Bj2GX
	KJv6WIsTPBUqiZGKGQjJSs8SkW9+i+2JjH/QTAKA/f+HF3K7fsJZ9Crenk1lNegT/Fi4oY3YtNZMd
	mvCHqOYXmLZyKoKj6bgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh236-007JOI-Ii; Wed, 20 Apr 2022 04:34:40 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh233-007JMW-HG
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 04:34:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23K4YRx9068607;
 Tue, 19 Apr 2022 23:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650429267;
 bh=Zz+ZwW1u2a70e9a3ZpME/yjw+6sAVF1thEFIAtUbgN4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RBgGVJDyBjWYmbVrTOOmdX637J1Ci7SlUxmmUma/MBes9P5OgDTpR3NVPI3unbmT8
 jCoPQgIhpbXgoQX/2u7jukbcIOcRQZTG5ludikDJwuLCnlPZZuDz4l6ZXUWlZcz1u5
 yzaMTDEnV4fJq82K5cR4jrS52juqlWRk6hjVQzJI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23K4YRox026463
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Apr 2022 23:34:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 23:34:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 23:34:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23K4YQLe006258;
 Tue, 19 Apr 2022 23:34:26 -0500
Date: Wed, 20 Apr 2022 10:04:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 6/9] mtd: spi-nor: core: Add helpers to read/write any
 register
Message-ID: <20220420043425.l77hmc4zm7cwfwdn@ti.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-7-tudor.ambarus@microchip.com>
 <0e4ec58c21490dcd9cf82ab89bd8c34c@walle.cc>
 <e21b0d76bf778f78f432ba27a673222d@walle.cc>
 <f318dbd9-d4bf-301a-b5c9-556d04d5bfe6@microchip.com>
 <20220419123245.zu4hypebz77ckygn@ti.com>
 <996f36b1303d191e472f56393aa6398e@walle.cc>
 <89083a31-b862-de50-fdca-d427fb908a08@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89083a31-b862-de50-fdca-d427fb908a08@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_213437_780603_4A601395 
X-CRM114-Status: GOOD (  31.54  )
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

On 19/04/22 12:56PM, Tudor.Ambarus@microchip.com wrote:
> On 4/19/22 15:46, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > Am 2022-04-19 14:32, schrieb Pratyush Yadav:
> >> On 19/04/22 12:08PM, Tudor.Ambarus@microchip.com wrote:
> >>> On 4/19/22 14:46, Michael Walle wrote:
> >>> > EXTERNAL EMAIL: Do not click links or open attachments unless you k=
now the content is safe
> >>> >
> >>> > Am 2022-04-19 13:19, schrieb Michael Walle:
> >>> >> Am 2022-04-11 11:10, schrieb Tudor Ambarus:
> >>> >>> There are manufacturers that use registers indexed by address. So=
me of
> >>> >>> them support "read/write any register" opcodes. Provide core meth=
ods
> >>> >>> that
> >>> >>> can be used by all manufacturers. SPI NOR controller ops are
> >>> >>> intentionally
> >>> >>> not supported as we intend to move all the SPI NOR controller dri=
vers
> >>> >>> under the SPI subsystem.
> >>> >>>
> >>> >>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>> >>> Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> >>> >>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> >>> >>
> >>> >> I still don't like it because the function doesn't do
> >>> >> anything what the function name might suggest. The read
> >>> >> just executes an op, the write executes an op with a
> >>> >> write enable before. All the behavior is determined by the
> >>> >> 'op' argument.
> >>> >>
> >>> >> Anyway,
> >>> >> Reviewed-by: Michael Walle <michael@walle.cc>
> >>> >>
> >>> >>> ---
> >>> >>> v3: no changes
> >>> >>>
> >>> >>>=A0 drivers/mtd/spi-nor/core.c | 41
> >>> >>> ++++++++++++++++++++++++++++++++++++++
> >>> >>>=A0 drivers/mtd/spi-nor/core.h |=A0 4 ++++
> >>> >>>=A0 2 files changed, 45 insertions(+)
> >>> >>>
> >>> >>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/cor=
e.c
> >>> >>> index 6165dc7bfd17..42794328d3b6 100644
> >>> >>> --- a/drivers/mtd/spi-nor/core.c
> >>> >>> +++ b/drivers/mtd/spi-nor/core.c
> >>> >>> @@ -307,6 +307,47 @@ ssize_t spi_nor_write_data(struct spi_nor *n=
or,
> >>> >>> loff_t to, size_t len,
> >>> >>>=A0=A0=A0=A0=A0 return nor->controller_ops->write(nor, to, len, bu=
f);
> >>> >>>=A0 }
> >>> >>>
> >>> >>> +/**
> >>> >>> + * spi_nor_read_reg() - read register to flash memory
> >>> >>> + * @nor:=A0=A0=A0=A0=A0=A0=A0 pointer to 'struct spi_nor'.
> >>> >>> + * @op:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SPI memory operation=
. op->data.buf must be DMA-able.
> >>> >>> + * @proto:=A0 SPI protocol to use for the register operation.
> >>> >>> + *
> >>> >>> + * Return: zero on success, -errno otherwise
> >>> >>> + */
> >>> >>> +int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
> >>> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum spi_nor_pr=
otocol proto)
> >>> >>> +{
> >>> >>> +=A0=A0=A0 if (!nor->spimem)
> >>> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EOPNOTSUPP;
> >>> >>> +
> >>> >>> +=A0=A0=A0 spi_nor_spimem_setup_op(nor, op, proto);
> >>> >>> +=A0=A0=A0 return spi_nor_spimem_exec_op(nor, op);
> >>> >>> +}
> >>> >>> +
> >>> >>> +/**
> >>> >>> + * spi_nor_write_reg() - write register to flash memory
> >>> >>> + * @nor:=A0=A0=A0=A0=A0=A0=A0 pointer to 'struct spi_nor'
> >>> >>> + * @op:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SPI memory operation=
. op->data.buf must be DMA-able.
> >>> >>> + * @proto:=A0 SPI protocol to use for the register operation.
> >>> >>> + *
> >>> >>> + * Return: zero on success, -errno otherwise
> >>> >>> + */
> >>> >>> +int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
> >>> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum spi_nor=
_protocol proto)
> >>> >>> +{
> >>> >>> +=A0=A0=A0 int ret;
> >>> >>> +
> >>> >>> +=A0=A0=A0 if (!nor->spimem)
> >>> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EOPNOTSUPP;
> >>> >>> +
> >>> >>> +=A0=A0=A0 ret =3D spi_nor_write_enable(nor);
> >>> >>> +=A0=A0=A0 if (ret)
> >>> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> >>> >>> +=A0=A0=A0 spi_nor_spimem_setup_op(nor, op, proto);
> >>> >>> +=A0=A0=A0 return spi_nor_spimem_exec_op(nor, op);
> >>> >
> >>> > After seeing your next two patches. Shouldn't the
> >>> > spi_nor_wait_until_ready() call be here too?
> >>> >
> >>>
> >>> I thought of this too, but seems that for a reason that I don't
> >>> remember, we don't call for spi_nor_wait_until_ready after we
> >>> write the octal DTR bit. Pratyush, do you remember why?
> >>
> >> We are not sure the protocol changed correctly so we can't rely on
> >> spi_nor_wait_until_ready(). We read the ID instead to be sure.
> > =

> > So besides the fact that the write_reg only works with the 'correct'
> > op parameter, it is also tailored to the special use case. For real
> > write_reg(), the user would actually has to poll the status bit
> > afterwards? :(
> > =

> Don't be sad :D. Are the octal DTR methods an exception?
> If yes, let's add the call to spi_nor_wait_until_ready() in the
> read/write_any_reg() methods, and let the octal methods handle
> the specific write themselves, without calling for ready()

It has been a while, but IIRC I asked Cypress about this, because I was =

worried about reading ID while the switch to 8D mode was still in =

progress. They said that volatile register writes are instant and do not =

need any status polling. So the switch to 8D-8D-8D mode would be instant =

and there is no need to wait for anything.

The Cypress S28 flash datasheet does not say this explicitly. It does =

say that writing to non-volatile registers takes time and you need to =

wait for ready for those, but makes no mention of volatile registers. We =

don't ever want to write non-volatile registers so we can ignore that =

problem.

I see the Micron MT35 datasheet say this explicitly, that changes to =

volatile registers are instant.

So I would say that based on my limited sample size, volatile register =

writes for Cypress and Micron flashes do _not_ need =

spi_nor_wait_until_ready().

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
