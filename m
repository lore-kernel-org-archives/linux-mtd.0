Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41ADC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:10:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08FEC60BD3
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08FEC60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZcARve5obfpp+XUbh1aC6KfCOZbT5hApUDBRdjmkZg=; b=Sj0MaIPy19PnJP5I8bNFgty+Qh
	N0qzEYBWnjbjIBAz2CH3EBJjZ2GLNaZbsL/mpjRtC8OChD886jHSVjLW/+WV9zPpnL0p96BrRxaJQ
	oYGjIDatPWd0wWq0QjTHf4nK9GjwE+VZ/QQh8ozXUU/cP6n83KYF/PJny0LhLCrgirqX49xaqNqKu
	DBEXV81RYBwjKr3htwj40SjK4VmB2tZMwauSmpDCaUsGZ2wQqDvIKxIqFolU15zlX0bxD4Yzq/Nf3
	MUhRJpZNudoVWJb3kYNvHnEaHtK/PP4EY4rE9UAiVHUowUpnUUjU40AhGiponITBBPP+aWxpCayua
	LCcxAP3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgYL-000Lkt-JB; Thu, 20 May 2021 11:09:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgYG-000Lha-Cg
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 11:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eVUJgs1p5fe+9QkISwzxw/EsNFv7YD+zOveSV6XjbtA=; b=duJ4WFhWnD68da5KR6VMzAEv6+
 hzmyRSEk9nKdgAeKDuqHssnO+1VXGyAHy8mEwgp9TzJ4nBcTIi0KqGqr9cwM21jZRwu6HnfrMC0Bu
 tkwPz1TCsqH9GzgsxxTWPB6GFnvFisOX/G/zsIZK0HjzFyQHvT/0tD9XPylBMn/g7//1F3h6j2Etg
 QDCZcvnjkcePkBhkisHyeL/W38WTQOOyucd5y0xGuV79l0QLKVS4F8Rov3sbWw4uwqTKnCWgrZVZx
 HMqRQ1CItxUkTCRagwKDWvVHg72E9YgcCUnOV5mnL34PM2Y+1pjuzrH6Q5I1JDUf3MDgNlTkviJdz
 p+OTyRHg==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgYC-00GDtr-As
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 11:09:15 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A4BA42224A;
 Thu, 20 May 2021 13:09:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621508946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVUJgs1p5fe+9QkISwzxw/EsNFv7YD+zOveSV6XjbtA=;
 b=oMQeWSoU8mWLMhI/HsaMHaO6dZSrEZ2GheRwV6dVGHEwwXeRRNWbxZc7uZAz+Pk+gFXbaT
 krA80e6rDICmt7OZXFPlZCmGAJRXRClTH4Z16N2fdkCv5u7xw+Y4QBdDr/SKRNke+6eRLV
 QySU/N4cSv8Y1rvVzf7dcdMvhNWW3eU=
MIME-Version: 1.0
Date: Thu, 20 May 2021 13:09:05 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Helmut Grohne <helmut.grohne@intenta.de>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>, Amit Kumar Mahapatra
 <akumarma@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>, Siva Durga Prasad
 Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v20 10/19] dt-binding: memory: pl353-smc: Convert to yaml
In-Reply-To: <20210519182636.1110080-11-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-11-miquel.raynal@bootlin.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <fd29436201e8e5932a8a027472f1064a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_040912_962757_F83DE36A 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-05-19 20:26, schrieb Miquel Raynal:
[..]

> +examples:
> +  - |
> +    smcc: memory-controller@e000e000 {
> +      compatible = "arm,pl353-smc-r2p1", "arm,primecell";
> +      reg = <0xe000e000 0x0001000>,
> +            <0xe1000000 0x5000000>;
> +      clock-names = "memclk", "apb_pclk";
> +      clocks = <&clkc 11>, <&clkc 44>;
> +      ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
> +                0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
> +                0x2 0x0 0xe4000000 0x2000000>; /* SRAM/NOR CS1 region 
> */
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +
> +      nand0: nand-controller@0,0 {

what about nfc (or nfc0) here? If I use this reference on my board it
looks kinda odd:

&nand {
        status = "okay";

        nand@0 {
                reg = <0>;
                nand-use-soft-ecc-engine;
                nand-ecc-algo = "bch";
        };
};

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
