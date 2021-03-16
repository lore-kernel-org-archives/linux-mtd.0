Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D557DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 18:08:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E046650ED
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 18:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E046650ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SFB5q9WvgpjVtPZ0yAWhKEzrBMDT8FqqLwl1FQmRV8I=; b=ow6fnbB1l0uqNGnThIq17w3sr
	0XfhbWTCJjnrw8lnnrmoMA79IosuMGORsU1bQ19r7buIpcjeX/485zFRRG6FYosvHyq/QC+7iwTjV
	7F/h9JNSZOdvVmH31lS9t8dvSxZ1gKtRUwhqd+VTPD4A+0VoH0/7Fz8fG9A+bBon2qMq8WIy3cAXS
	hnDSIEMSHfoISolnGdaA5Io2qE6GQardQqpMbur9pxbirpbNeoHvvSPTg562r9yXgP3Fx835a3Pzj
	swlhKO8vk1jtulEcXuK2r8dRXs6KAV7RcdLDCDKep3Gr9Y4ZC3swa3Yh+W5OFP9Fb235vo7uxC/nW
	m8gUTUXlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lME6T-001YLi-Oi; Tue, 16 Mar 2021 18:07:38 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lME5v-001Y1r-W0
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 18:07:08 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GI6xuZ071441;
 Tue, 16 Mar 2021 13:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615918019;
 bh=2r9YstoNEEa/M6gol0Amif0/Vm23LBs3Ked7QXVENQY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Nu54O/l0X+v6dYIjZoHxoOk2mNpYPd3via5MJmGXOj5YF/59/sPKbl3LOfSjO5ICF
 UiLY+O/cRXEpwpt9QfZR/oupLZg62Zxw8ZxNylFo/W4CXJvuY8PkDKVv8U1KTgab1j
 E0irDDFjZvwWdeLr3FMN5LA4iS7eAppnamVKi6z0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GI6xjn075564
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Mar 2021 13:06:59 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 16
 Mar 2021 13:06:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 16 Mar 2021 13:06:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GI6wdx045156;
 Tue, 16 Mar 2021 13:06:59 -0500
Date: Tue, 16 Mar 2021 23:36:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Kuldeep Singh <kuldeep.singh@nxp.com>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean
 <olteanv@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: spi: Convert Freescale DSPI to json schema
Message-ID: <20210316180655.6oidvffum7yuwknr@ti.com>
References: <20210315121518.3710171-1-kuldeep.singh@nxp.com>
 <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
 <067c42f3726578ebe60d201a141dfdb6@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <067c42f3726578ebe60d201a141dfdb6@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_180704_608691_C8126B30 
X-CRM114-Status: GOOD (  11.17  )
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

On 16/03/21 06:45PM, Michael Walle wrote:
> Am 2021-03-15 19:30, schrieb Pratyush Yadav:
> 
> ..
> > > +patternProperties:
> > > +  "@[0-9a-f]+":
> 
> Shouldn't this be "^.*@[0-9a-f]+$"?

The pattern has to match _anywhere_ in the string so both should match 
the flash node. Your pattern is more "strict" or "precise". See the note 
at [0].

[0] https://json-schema.org/understanding-json-schema/reference/string.html#regular-expressions

> 
> > > +    type: object
> > > +
> > > +    properties:
> > > +      fsl,spi-cs-sck-delay:
> > > +        description:
> > > +          Delay in nanoseconds between activating chip select and
> > > the start of
> > > +          clock signal, at the start of a transfer.
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +      fsl,spi-sck-cs-delay:
> > > +        description:
> > > +          Delay in nanoseconds between stopping the clock signal and
> > > +          deactivating chip select, at the end of a transfer.
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> ..
> 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
