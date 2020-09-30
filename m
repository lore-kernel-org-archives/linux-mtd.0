Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DE8C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:50:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A76E204FD
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gt9VAE/a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nN47T6h+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C6Jfh4eO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A76E204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YrIO07QL85Z0qJZdHuzKI1vm+Uhm698PUwGwcwlRqQQ=; b=gt9VAE/aEfNq3MiC7ot0ywq9x
	9KoVopwUNszyq+MuNy500+S8Gl2NRKXSJsdfqhOoy7uohMiHOM1IXoJiODpS3yvgiqtoZYr1gRuMe
	sHYytmqyGSHwmiLf7mX3yU2JTVwRwSZpHzBXtPhS98cWpskGyDzBfWH31E2FeNAAMcdhXb1PKVa1B
	U4Q6lN9Cb85xKvf3Dt1aTbSK5rFW67+niSh/LuhpRDgB/ZMPo5D09VAJXhM9PBpdsQgZuA2v+4gue
	TztSchlzBlGK7PuriOadnL93n1peNwo8JUV7L7XMOR9CdLA4fexqudT173iu7ivP78Ku20dL0RVg8
	PcA3Q/ebQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWsJ-0005GZ-Bp; Wed, 30 Sep 2020 07:50:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWsH-0005Fv-UJ
 for linux-mtd@merlin.infradead.org; Wed, 30 Sep 2020 07:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=itvI/CIHIsWpw2HWqaBatszoRYACu5nS402WozX/250=; b=nN47T6h+he2rOVobl917zqO0Rg
 fXTZJlKVSC27kD8EGGDs6AusQqp7kIHNqNLNpoZ+W8fKv0dBVS6e/y+kA/IcpIGOhGil8ynrfKEAo
 eL90M49dv4lYHCvPXRnpSjBZcGLE8Ju/ljSvzDa0thAMjjxtuzBviRfZYCOe2aY09ZfOCenAihjkp
 SEQSJtBOVNRGF1mqSKV/egLz4yXIeNwE4i3Ye2DjfYeobWGviLnPCL+QpVpOqqH6mjs7S4GZDa7dq
 33drlmxtfzQNgpZ7GpEY8SBsl/8pLRM/ZD0NryQMN+5JKXLXZfhD27uWmmx+p6hD+Ybcwoz3vS5ZF
 chT3+wbQ==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWaH-00062e-Gt
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:31:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U7VFMH125005;
 Wed, 30 Sep 2020 02:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601451075;
 bh=itvI/CIHIsWpw2HWqaBatszoRYACu5nS402WozX/250=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=C6Jfh4eOAUFVJ5Pm/4rPpLqX87niwWsMTC7yvV7rvVChlNKx7/HepPZNdmZyRAzHJ
 5Qpr3PtL7OnF2vaZ7qC0WrIzo/ORqmFaFBo3ms/gLdbzM4LnhHBaThdI3HkdpnZC5D
 Nt+rvIKgpAWDEwtvkNbC/eLn3PaErLaAXf5a1Dy0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U7VF01072435
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 02:31:15 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 02:31:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 02:31:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U7VDKw107865;
 Wed, 30 Sep 2020 02:31:14 -0500
Date: Wed, 30 Sep 2020 13:01:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 10/15] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Message-ID: <20200930073111.sk67oqn6hkihmrfd@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-11-p.yadav@ti.com>
 <8346524d-487b-a147-6183-e8055a7ff54a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8346524d-487b-a147-6183-e8055a7ff54a@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_083130_198674_002B43C0 
X-CRM114-Status: GOOD (  17.30  )
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

On 30/09/20 07:23AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > A Soft Reset sequence will return the flash to Power-on-Reset (POR)
> > state. It consists of two commands: Soft Reset Enable and Soft Reset.
> > Find out if the sequence is supported from BFPT DWORD 16.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.h | 1 +
> >  drivers/mtd/spi-nor/sfdp.c | 4 ++++
> >  drivers/mtd/spi-nor/sfdp.h | 2 ++
> >  3 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> > index 6d7243067252..8ae55e98084e 100644
> > --- a/drivers/mtd/spi-nor/sfdp.h
> > +++ b/drivers/mtd/spi-nor/sfdp.h
> > @@ -90,6 +90,8 @@ struct sfdp_bfpt {
> >  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD                (0x4UL << 20)
> >  #define BFPT_DWORD15_QER_SR2_BIT1              (0x5UL << 20) /* Spansion */
> > 
> > +#define BFPT_DWORD16_SOFT_RST                  BIT(12)
> 
> the name is too generic. How about
> 
> #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)

Ok.

> 
> > +
> >  #define BFPT_DWORD18_CMD_EXT_MASK              GENMASK(30, 29)
> >  #define BFPT_DWORD18_CMD_EXT_REP               (0x0UL << 29) /* Repeat */
> >  #define BFPT_DWORD18_CMD_EXT_INV               (0x1UL << 29) /* Invert */

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
