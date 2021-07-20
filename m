Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE49AC07E9B
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 14:14:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46F760D07
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 14:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B46F760D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VCSAc686lN3e1uepqbjjebfbODwZ5Ih0mrvYBT4t9FQ=; b=1Lv1JrEyKgXPjQ0/0MNeeRp9QC
	5/uIPFPoY1DmHT1fMxRQAB4imsg5BqDZC26Zumfl02d13O9otNsF3r1YsNMyM5vDMC42PQyoz2TpA
	BzpVeivHJLkKAB0aDtE+4U9fMZEuiR2FVdkHlVwKf46mvQhlErRgLswXdIX6+j+X46ADAkZnXPpKW
	0eeTio7sJIyQciVg2GSkwFb81tiWVJZdqGxOARwWwygFMXVQ7f+fbkycXRUW4G8XNfstTUOn7jWpu
	DzBqNAY9DssoyrjQ6k0ncDuQ6gbEWUhHoHehtZOBx3Uu5Wpejc+0PwiTyUujrXi+y9WlK0iEzIWFx
	ifkCt7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5qVJ-00D7kI-8x; Tue, 20 Jul 2021 14:13:49 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5qVE-00D7jL-KB
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 14:13:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16KEDbRn089496;
 Tue, 20 Jul 2021 09:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626790417;
 bh=iiYeMeyFkrKOch2McMFiTZRBVD68ZbhGYOg+JJfCxuw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZBWJ0R4ELhDtxzGEWOwO3tMwTCPzOiue4Wwr2Z19xjCvDG1UYq75fcVZsmiAQ6//Q
 fXcCg79kI8XZ10q4cyhOMOUHsPqoANFEV7W0FYB/OG3v86tKjrIMZTwlHF3+OCJFyI
 P8I1NMF2c6PeEh1Urr85TeKCO2ifFyAfMFBBVUL0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16KEDbuu115074
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Jul 2021 09:13:37 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 20
 Jul 2021 09:13:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 20 Jul 2021 09:13:36 -0500
Received: from [10.250.234.142] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16KEDWI6098672;
 Tue, 20 Jul 2021 09:13:33 -0500
Subject: Re: [PATCH] dt-bindings: mtd: spi-nand: Convert to DT schema format
To: Rob Herring <robh@kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Vignesh
 Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20210718004125.733-1-a-nandan@ti.com>
 <1626702448.437777.1811203.nullmailer@robh.at.kernel.org>
From: "Nandan, Apurva" <a-nandan@ti.com>
Message-ID: <18c17c21-82de-32d5-912b-3158a037ec8c@ti.com>
Date: Tue, 20 Jul 2021 19:43:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626702448.437777.1811203.nullmailer@robh.at.kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_071345_645900_BC8E657C 
X-CRM114-Status: GOOD (  19.79  )
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



On 19-Jul-21 7:17 PM, Rob Herring wrote:
> On Sun, 18 Jul 2021 00:41:25 +0000, Apurva Nandan wrote:
>> Convert spi-nand.txt binding to YAML format with an added example.
>>
>> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
>> ---
>>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
>>  .../devicetree/bindings/mtd/spi-nand.yaml     | 74 +++++++++++++++++++
>>  2 files changed, 74 insertions(+), 5 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml: spi-flash@1: $nodename:0: 'spi-flash@1' does not match '^flash(@.*)?$'

I propose to change the nodename in snps,dw-apb-ssi.yaml from
'spi-flash@1' to 'flash@1', making it similar to the convention followed
by jedec,spi-nor.yaml. Currently, there is no user of snps,dw-apb-ssi
with a spi-nand as child node, so let's make the node name uniform
across different types of flashes i.e. 'flash@*'. What do you suggest?

> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml: spi-flash@1: 'rx-sample-delay-ns' does not match any of the regexes: '^otp(-[0-9]+)?$', '^partition@', 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> \ndoc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1506558
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Yes, yamllint was not installed. I will correct them and send as v2.

Thanks,
Apurva Nandan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
