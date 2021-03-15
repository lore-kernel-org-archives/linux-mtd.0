Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4821C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:28:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A66564E89
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A66564E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J5bjJtHUg5moAnp5HlUvnwJ4CfpvjxRvgog0UiwJSJg=; b=PcWXZefm9Dk/36doXqtSM5PLk
	jbkqyLlKYwBEfUrbZRIzSgIb9/w9S9z+GBdZZZqEr6EjWnQoYdbY4j2D/7zHm3POcQyQOpJulH3RK
	uWay/8IsWXfFDsZgjCo0IhfCqj/HIgYmO25zghm1WDqlUzZHIaDgAJOIIpTWf7rH1jPYYM4sfBvjx
	GUn++YJCFMAj/M9Fk65CVXikt4/VUq1gAzt3hGFNKTSnA6GJHgySjc2UclBxWawl1QCmUCPKutg+t
	Sc6D/ekhRcmpI2dYUShLk7peZhD/GG28RmO1dn/A7O8vqeRxpt7jEtLxQoWL12dorKVownmvgWt+f
	DcOPY3neg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLiZW-00FDqL-0j; Mon, 15 Mar 2021 08:27:30 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLiZN-00FDol-4C
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 08:27:25 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12F8RELR106326;
 Mon, 15 Mar 2021 03:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615796834;
 bh=ThVlhMXeZ2BXtsWAnaBf+g8M4+4//YJhVJ5l/5E+JAM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Eeuq8+1AVXCDE8ZKGrEn+7JASnlayaeHo+OAenh7Ndgj8z/bOaxq2QRQ+ybkwZe5f
 PFlRtDJRwwrebx5oKVb3N8stN6Q0894IGzsFIhttvOnXtl17Fayb9qjYaekNO3DNMT
 RS2QhH+uS7ZScIdkdYlU3OOujPDymmYqp/iQLSEc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12F8REtc088419
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 03:27:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 03:27:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 03:27:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12F8RCux108246;
 Mon, 15 Mar 2021 03:27:13 -0500
Date: Mon, 15 Mar 2021 13:57:12 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection
 logic out of the core
Message-ID: <20210315082710.l7esv3kwickj6yg3@ti.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <7fb8af561eda06444ee0e0c592147af7@walle.cc>
 <65691b2a-134d-b1f2-617e-5ef09df9a742@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65691b2a-134d-b1f2-617e-5ef09df9a742@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_082721_698488_413B5E20 
X-CRM114-Status: GOOD (  20.55  )
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

On 15/03/21 06:09AM, Tudor.Ambarus@microchip.com wrote:
> On 3/6/21 1:19 PM, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > Am 2021-03-06 10:50, schrieb Tudor Ambarus:
> >> It makes the core file a bit smaller and provides better separation
> >> between the Software Write Protection features and the core logic.
> >> All the next generic software write protection features (e.g.
> >> Individual
> >> Block Protection) will reside in swp.c.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> > =

> > [..]
> > =

> >> @@ -3554,6 +3152,9 @@ int spi_nor_scan(struct spi_nor *nor, const char
> >> *name,
> >> =A0=A0=A0=A0=A0 if (ret)
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> >>
> >> +=A0=A0=A0=A0 if (nor->params->locking_ops)
> > =

> > Should this be in spi_nor_register_locking_ops(), too? I.e.
> > =

> > void spi_nor_register_locking_ops() {
> > =A0=A0=A0 if (!nor->params->locking_ops)
> > =A0=A0=A0=A0=A0=A0=A0 return;
> > ..
> > }
> =

> Yes, the checking should be done inside spi_nor_register_locking_ops,
> will move it.
> =

> Btw, what do you find a better name, spi_nor_register_locking_ops or
> spi_nor_init_locking_ops? Applies to OTP as well.

On a quick glance, spi_nor_register_locking_ops() can be mistaken to =

mean "Register locking ops". That is, ops to lock/unlock flash =

registers. If you do want to keep using "register", IMO =

spi_nor_locking_ops_register() would be better.

> =

> Thanks,
> ta
> =

> > =

> > I don't have a strong opinion on that so far. I just noticed because
> > I put the check into spi_nor_otp_init() for my OTP series. They should
> > be the same though.
> > =

> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spi_nor_register_locking_ops(nor=
);
> > =

> > -michael
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
