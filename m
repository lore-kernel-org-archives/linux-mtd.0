Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67548C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 20:11:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0663764E2E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 20:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0663764E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=++rqgF3Y/TxrjErY4jdaze8Ar9emwtVhVYol/4cBKJE=; b=eY7kDD4EkbbVVnH1Pgv/DqZVc
	cBsbfwiWhL4f1AUu7IpQqdktz71EU/56K98aQJODIruNEAaittKHF6uzhNoyIvYp681skKKiMwo+y
	ym6cKE7kBBbUrguMTII9UuX38pVQVBI8yV69aN9lijUztUrj3I9AX7Nwsih34sAuqAQvcgIhoOoUJ
	8byQdzPqC1LWq+HKgDUz2mZfQEELVZhWk6IMqyGk+tK8vWNaG+hKXIOZPvRLIjCR6xAJ+WVdC/M6t
	OYekyEPiytn1d2onf60BQ62+pcWNfPyrsy0Un56n7FW073RSIAj6m0FzGuwXaa4yclmwgeFiF1MlX
	p1VCm2p4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6fWx-0006iP-P2; Mon, 01 Feb 2021 20:10:39 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6fWu-0006hy-S9
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 20:10:37 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 111KAW3U042215;
 Mon, 1 Feb 2021 14:10:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1612210232;
 bh=AUrm1SfdXEViaaLDw2q6D/Ns5sQRftR3ZqHRjenh7k8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nYjYzM3m/++L8k06D078vRa87Rik82XWR17p8z6TlcemJ3wHK4WEPYovXuKyYGxY3
 9XYan62zGU7ByaxTvJ+3fBBYFmQxqbwyyY3HEK7FPhhNOsb202/HZATGfJ2CfDjrUt
 wh8ASbMH5QqumtrXVGdAmSj/3FAEb2pYAVUivIHU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 111KAWHR054120
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Feb 2021 14:10:32 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Feb
 2021 14:10:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Feb 2021 14:10:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 111KAU5K036855;
 Mon, 1 Feb 2021 14:10:31 -0600
Date: Tue, 2 Feb 2021 01:40:30 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] spi: mxic: patch for octal DTR mode support
Message-ID: <20210201201030.5j44t4hjjkhxk4fg@ti.com>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
 <1611908018-29937-3-git-send-email-zhengxunli@mxic.com.tw>
 <20210201154914.3ba94c9d@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201154914.3ba94c9d@xps13>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_151037_103949_46BB428A 
X-CRM114-Status: GOOD (  24.33  )
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
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org, ycllin@mxic.com.tw,
 zhengxunli <zhengxunli@mxic.com.tw>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/02/21 03:49PM, Miquel Raynal wrote:
> Hello,
> =

> zhengxunli <zhengxunli@mxic.com.tw> wrote on Fri, 29 Jan 2021 16:13:37
> +0800:
> =

> > Driver patch for octal 8D-8D-8D mode support.
> > =

> > Signed-off-by: zhengxunli <zhengxunli@mxic.com.tw>
> > ---
> >  drivers/spi/spi-mxic.c | 33 ++++++++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 11 deletions(-)
> > =

> > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> > index 96b4182..821328a 100644
> > --- a/drivers/spi/spi-mxic.c
> > +++ b/drivers/spi/spi-mxic.c
> > @@ -335,8 +335,8 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic=
, const void *txbuf,
> >  static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
> >  				     const struct spi_mem_op *op)
> >  {
> > -	if (op->data.buswidth > 4 || op->addr.buswidth > 4 ||
> > -	    op->dummy.buswidth > 4 || op->cmd.buswidth > 4)
> > +	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
> > +	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
> >  		return false;

Can the controller support mixed DTR modes? For example, can it support =

4S-4D-4D operations? If no, then please add a check for that here. See =

cqspi_supports_mem_op() for an example.

> >  =

> >  	if (op->data.nbytes && op->dummy.nbytes &&
> > @@ -346,7 +346,7 @@ static bool mxic_spi_mem_supports_op(struct spi_mem=
 *mem,
> >  	if (op->addr.nbytes > 7)
> >  		return false;
> >  =

> > -	return spi_mem_default_supports_op(mem, op);
> > +	return true;
> =

> Does not seem correct. Why would you drop this check?

spi_mem_default_supports_op() rejects DTR ops for backward =

compatibility.

But skipping that would mean skipping the spi_check_buswidth_req() calls =

[0]. Maybe we should export that part as a library function so =

controllers can use it and not have to roll their own logic?

[0] They are not _technically_ needed. Not calling them would mean the =

spi-{rx,tx}-bus-width DT properties would be ignored. The negotiation =

for supported opcodes will happen on what the controller _actually_ =

supports and what SPI NOR says the flash supports. So for example you =

can't force a octal capable flash to use quad mode. Not sure if that is =

a good thing or a bad thing.
 =

> >  }
> >  =

> >  static int mxic_spi_mem_exec_op(struct spi_mem *mem,
> > @@ -355,14 +355,15 @@ static int mxic_spi_mem_exec_op(struct spi_mem *m=
em,
> >  	struct mxic_spi *mxic =3D spi_master_get_devdata(mem->spi->master);
> >  	int nio =3D 1, i, ret;
> >  	u32 ss_ctrl;
> > -	u8 addr[8];
> > -	u8 opcode =3D op->cmd.opcode;
> > +	u8 addr[8], cmd[2];
> >  =

> >  	ret =3D mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
> >  	if (ret)
> >  		return ret;
> >  =

> > -	if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
> > +	if (mem->spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL))
> > +		nio =3D 8;
> > +	else if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))

Hmm, shouldn't you be looking at op->*.buswidth?

> >  		nio =3D 4;
> >  	else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
> >  		nio =3D 2;
> > @@ -374,19 +375,25 @@ static int mxic_spi_mem_exec_op(struct spi_mem *m=
em,
> >  	       mxic->regs + HC_CFG);
> >  	writel(HC_EN_BIT, mxic->regs + HC_EN);
> >  =

> > -	ss_ctrl =3D OP_CMD_BYTES(1) | OP_CMD_BUSW(fls(op->cmd.buswidth) - 1);
> > +	ss_ctrl =3D OP_CMD_BYTES(op->cmd.nbytes) |
> > +		  OP_CMD_BUSW(fls(op->cmd.buswidth) - 1) |
> > +		  (op->cmd.dtr ? OP_CMD_DDR : 0);
> >  =

> >  	if (op->addr.nbytes)
> >  		ss_ctrl |=3D OP_ADDR_BYTES(op->addr.nbytes) |
> > -			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
> > +			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1) |
> > +			   (op->addr.dtr ? OP_ADDR_DDR : 0);
> >  =

> >  	if (op->dummy.nbytes)
> >  		ss_ctrl |=3D OP_DUMMY_CYC(op->dummy.nbytes);
> >  =

> >  	if (op->data.nbytes) {
> > -		ss_ctrl |=3D OP_DATA_BUSW(fls(op->data.buswidth) - 1);
> > +		ss_ctrl |=3D OP_DATA_BUSW(fls(op->data.buswidth) - 1) |
> > +			   (op->data.dtr ? OP_DATA_DDR : 0);
> >  		if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> >  			ss_ctrl |=3D OP_READ;
> > +			if (op->data.dtr)
> > +				ss_ctrl |=3D OP_DQS_EN;
> >  	}
> >  =

> >  	writel(ss_ctrl, mxic->regs + SS_CTRL(mem->spi->chip_select));
> > @@ -394,7 +401,10 @@ static int mxic_spi_mem_exec_op(struct spi_mem *me=
m,
> >  	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
> >  	       mxic->regs + HC_CFG);
> >  =

> > -	ret =3D mxic_spi_data_xfer(mxic, &opcode, NULL, 1);
> > +	for (i =3D 0; i < op->cmd.nbytes; i++)
> =

> Can we add a check in mxic_spi_mem_check_op to ensure nbytes is never >
> 2 ?
> =

> > +		cmd[i] =3D op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 1));
> > +
> > +	ret =3D mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
> >  	if (ret)
> >  		goto out;
> >  =

> > @@ -567,7 +577,8 @@ static int mxic_spi_probe(struct platform_device *p=
dev)
> >  	master->bits_per_word_mask =3D SPI_BPW_MASK(8);
> >  	master->mode_bits =3D SPI_CPOL | SPI_CPHA |
> >  			SPI_RX_DUAL | SPI_TX_DUAL |
> > -			SPI_RX_QUAD | SPI_TX_QUAD;
> > +			SPI_RX_QUAD | SPI_TX_QUAD |
> > +			SPI_RX_OCTAL | SPI_TX_OCTAL;
> >  =

> >  	mxic_spi_hw_init(mxic);
> >  =

> =

> Otherwise looks fine.
> =

> Thanks,
> Miqu=E8l
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
