Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90015C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 16:24:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398E2610CF
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 16:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398E2610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w514y0h+Cb8oSMqIu5k19G46McTB6C2fzi3o495Wep8=; b=aY4aUPZI2u6cWt4nsFMf/QZyU
	vi3fLPzpNWCNNnjVeqUhbqckjl7h6lpybWNbRWcZK3O+IAIlagO5NFibK+Qlvd1GYVQirPXnwvm8w
	c6xFgKL1ceYaEaZp5XMYuSK8vYaZZwniFWWoQv/K/xqR7/jg5hXqV4R5+qkgEPdmMoy5ged03qIFw
	Sk57fG0A0TUHLuPCPX9j3jA4Y0mjEyZ7mBR0APOl36h0so+L5hJ1n5Ft5W5DQIaaXMpTDh1oBvGHd
	xANUw1pSqU/DclhXmviymsUY7PtJLPoaTI7H0dZgsbZ/0IXsuGnyFyYGWMuipZo2OkKuOzvvNpWbL
	MelICRgsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUXQr-008byJ-Hj; Thu, 08 Apr 2021 16:23:01 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUXQk-008bvn-FE
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 16:22:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 138GMf6g128853;
 Thu, 8 Apr 2021 11:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1617898961;
 bh=XWkMpGE8h856lks/KHvVTFdHtdQtsOLBkd/9DmCVBvk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RbVvRcHgK+ml09JdfBMZL8PNnm/reZOgEgiru3KA228p8NGPx5aXkroAfoJJ67X8u
 ZB2LXjSHL6NF96dH8OY0TTzc/k0SD5QG+baqE96icHv4XXaopDkU8xVEfPgzzhMKR+
 UOmg1K8q8bB+T15EeVR+3/lw4y2R7MHSx2YveRxY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 138GMf3X067770
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Apr 2021 11:22:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Apr
 2021 11:22:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Apr 2021 11:22:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 138GMeYL031472;
 Thu, 8 Apr 2021 11:22:41 -0500
Date: Thu, 8 Apr 2021 21:52:40 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: "Yaliang.Wang" <Yaliang.Wang@windriver.com>
CC: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <tkuw584924@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: core: reuse spi_nor_clear_sr function
Message-ID: <20210408162238.7ts64buwfwhlsckk@ti.com>
References: <20210401195012.4009166-1-yaliang.wang@windriver.com>
 <20210401195012.4009166-2-yaliang.wang@windriver.com>
 <20210406110718.y6dacaeqahc7fbpi@ti.com>
 <177cb8e0-8ce1-395d-d181-997fd9e9f749@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177cb8e0-8ce1-395d-d181-997fd9e9f749@windriver.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_172255_191014_284F5635 
X-CRM114-Status: GOOD (  31.20  )
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

On 06/04/21 10:52PM, Yaliang.Wang wrote:
> =

> On 4/6/21 7:07 PM, Pratyush Yadav wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > =

> > On 02/04/21 03:50AM,yaliang.wang@windriver.com  wrote:
> > > From: Yaliang Wang<Yaliang.Wang@windriver.com>
> > > =

> > > spi_nor_clear_fsr() and spi_nor_clear_sr() are almost the same, except
> > > the opcode they used, the codes can be easily reused without much
> > > changing.
> > Honestly, I am not sure how I feel about this. Yes, it would reduce some
> > code duplication but at the same time reduces the readability slightly.
> > spi_nor_clear_fsr(nor) is easier to read than spi_nor_clear_sr(nor, OP_=
CLFSR).
> > I won't blame someone for missing that 'F' and thinking that it actually
> > simply clears the SR. Dunno...
> > =

> > Anyway, if we do decide to go through with this change, the code changes
> > look good to me.
> The reason why am I doing this is quite simple, the contents of the
> function=A0 are relatively=A0 common, no other manufacturer specific codes
> involved, and it can be easily expanded to other manufacturers.=A0 Actual=
ly
> there is an instant example, "is25wp256" chip needs to clear error bits w=
ith
> using CLEAR EXTENDED READ REGISTER OPERATION (CLERP, 82h) [1].

Ok.

> =

> With that said, the name of the function do can be revised, maybe the name
> "spi_nor_clear_status()" is more proper?

Yes, this is certainly better. While you're doing this then you might =

also want to look into spi_nor_read_sr() and spi_nor_read_fsr() and see =

if we can exploit similarities there as well.

> =

> [1]: https://www.issi.com/WW/pdf/25LP-WP256.pdf ; Page21,Page22 ;
> > > Signed-off-by: Yaliang Wang<Yaliang.Wang@windriver.com>
> > > ---
> > >   drivers/mtd/spi-nor/core.c | 40 +++++++----------------------------=
---
> > >   1 file changed, 7 insertions(+), 33 deletions(-)
> > > =

> > > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > > index 6dc8bd0a6bd4..dbd6adb6aa0b 100644
> > > --- a/drivers/mtd/spi-nor/core.c
> > > +++ b/drivers/mtd/spi-nor/core.c
> > > @@ -652,14 +652,15 @@ static int spi_nor_xsr_ready(struct spi_nor *no=
r)
> > >   /**
> > >    * spi_nor_clear_sr() - Clear the Status Register.
> > >    * @nor:     pointer to 'struct spi_nor'.
> > > + * @opcode:  the SPI command op code to clear status register.
> > >    */
> > > -static void spi_nor_clear_sr(struct spi_nor *nor)
> > > +static void spi_nor_clear_sr(struct spi_nor *nor, u8 opcode)
> > >   {
> > >        int ret;
> > > =

> > >        if (nor->spimem) {
> > >                struct spi_mem_op op =3D
> > > -                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
> > > +                     SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
> > >                                   SPI_MEM_OP_NO_ADDR,
> > >                                   SPI_MEM_OP_NO_DUMMY,
> > >                                   SPI_MEM_OP_NO_DATA);
> > > @@ -668,12 +669,12 @@ static void spi_nor_clear_sr(struct spi_nor *no=
r)
> > > =

> > >                ret =3D spi_mem_exec_op(nor->spimem, &op);
> > >        } else {
> > > -             ret =3D spi_nor_controller_ops_write_reg(nor, SPINOR_OP=
_CLSR,
> > > +             ret =3D spi_nor_controller_ops_write_reg(nor, opcode,
> > >                                                       NULL, 0);
> > >        }
> > > =

> > >        if (ret)
> > > -             dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> > > +             dev_dbg(nor->dev, "error %d clearing status\n", ret);
> > >   }
> > > =

> > >   /**
> > > @@ -697,7 +698,7 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
> > >                else
> > >                        dev_err(nor->dev, "Programming Error occurred\=
n");
> > > =

> > > -             spi_nor_clear_sr(nor);
> > > +             spi_nor_clear_sr(nor, SPINOR_OP_CLSR);
> > > =

> > >                /*
> > >                 * WEL bit remains set to one when an erase or page pr=
ogram
> > > @@ -715,33 +716,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
> > >        return !(nor->bouncebuf[0] & SR_WIP);
> > >   }
> > > =

> > > -/**
> > > - * spi_nor_clear_fsr() - Clear the Flag Status Register.
> > > - * @nor:     pointer to 'struct spi_nor'.
> > > - */
> > > -static void spi_nor_clear_fsr(struct spi_nor *nor)
> > > -{
> > > -     int ret;
> > > -
> > > -     if (nor->spimem) {
> > > -             struct spi_mem_op op =3D
> > > -                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),
> > > -                                SPI_MEM_OP_NO_ADDR,
> > > -                                SPI_MEM_OP_NO_DUMMY,
> > > -                                SPI_MEM_OP_NO_DATA);
> > > -
> > > -             spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> > > -
> > > -             ret =3D spi_mem_exec_op(nor->spimem, &op);
> > > -     } else {
> > > -             ret =3D spi_nor_controller_ops_write_reg(nor, SPINOR_OP=
_CLFSR,
> > > -                                                    NULL, 0);
> > > -     }
> > > -
> > > -     if (ret)
> > > -             dev_dbg(nor->dev, "error %d clearing FSR\n", ret);
> > > -}
> > > -
> > >   /**
> > >    * spi_nor_fsr_ready() - Query the Flag Status Register to see if t=
he flash is
> > >    * ready for new commands.
> > > @@ -766,7 +740,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
> > >                        dev_err(nor->dev,
> > >                        "Attempted to modify a protected sector.\n");
> > > =

> > > -             spi_nor_clear_fsr(nor);
> > > +             spi_nor_clear_sr(nor, SPINOR_OP_CLFSR);
> > > =

> > >                /*
> > >                 * WEL bit remains set to one when an erase or page pr=
ogram
> > --
> > Regards,
> > Pratyush Yadav
> > Texas Instruments Inc.
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
