Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C0BC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 06:41:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4984204FD
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 06:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OTO9Oci2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uvvX8FZS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4984204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Gx2R4nJrqYsrM2VCMq39OLoEnMPSyVezMDwBlbTiCU=; b=OTO9Oci2aKNWCy
	YuJ8Ke44vPb39VJlUaExlcu1+AZfZYcoeSkD8qOSenwNL+yvRMewdxS609gB62xxSjDvhZ8vbPL1j
	Y5B3D9bCRTR/Vc1BGItrwSpwqL0M2ma7xg+GQbckEB7Ab2gCf3V6zCQxK5Lm4LCDY8YHy5hPn58AN
	pVyZ7ccgv8qYBocokgQaS3kT/NuEgoXoMn2ESutp1r9CHy+dH/IoO6oY6ue4qKu4OPmmhvb33ubLt
	t7oOBCyl7FtmwYyRVOK/Grl/R9uJksDTSJ+XjuEng7j5MJAzxPqLC7pmJZY51IGH5LhrMG4p94ayl
	8YNnj14LAtHv0dLe9adQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGeGQ-0004Ye-Ex; Wed, 17 Apr 2019 06:41:46 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGeGK-0004Y8-LV; Wed, 17 Apr 2019 06:41:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3H6fPMl111525;
 Wed, 17 Apr 2019 01:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1555483285;
 bh=R2Cx5MuUP3Z2JrEZohuogTZlzY46Nlk7R6LBb2vEhWc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uvvX8FZSursVCTXiZxqY6QBtNhDhpgyOfuW2oFNvCWHOyEP95DxhiKYPcPntujdUz
 HsvmXPVIeQAu0eGr739jVe2x55abevw5i7gILjaohUX3ufW716viMJZDXTDn2um18s
 BzjivEjCQ+MlHPItr1DeWhfTgZdnumonuMq4OukQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3H6fPO0082475
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Apr 2019 01:41:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Apr 2019 01:41:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Apr 2019 01:41:25 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3H6fJFc060691;
 Wed, 17 Apr 2019 01:41:20 -0500
Subject: Re: [PATCH v3 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 HyperBus memory controller
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
References: <20190412092923.24919-1-vigneshr@ti.com>
 <20190412092923.24919-5-vigneshr@ti.com>
 <6a69ce6f-66c0-3f7c-a326-d76ee717cacf@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <bba45d90-93dd-39c3-1b13-5326956bed89@ti.com>
Date: Wed, 17 Apr 2019 12:12:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6a69ce6f-66c0-3f7c-a326-d76ee717cacf@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_234140_803305_ADB70094 
X-CRM114-Status: GOOD (  20.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 14/04/19 11:25 PM, Sergei Shtylyov wrote:
> On 04/12/2019 12:29 PM, Vignesh Raghavendra wrote:
> 
>> Add binding documentation for TI's HyperBus memory controller present on
>> AM654 SoC.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 31 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 32 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>> new file mode 100644
>> index 000000000000..00888482df25
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>> @@ -0,0 +1,31 @@
> [...]
>> +Optional properties:
>> +- mux-controls: phandle to the multiplexer that controls selection of
>> +		HBMC vs OSPI. Mux state of 1 indicates HBMC is selected.
> 
>    I thought this is usually done with the help of drivers/pinctrl/..
> 

This mux is internal to SoC and not at SoC pad level. Based on this bit
read/write requests at SoC interconnect is routed either to OSPI or
HBMC, hence mmio-mux is a good fit

OSPI and HBMC data pins are themselves at pad level which is handled by
pinctrl-single node.

>> +
>> +Example:
>> +	hbmc: hbmc@47034000 {
>> +		compatible = "ti,am654-hbmc";
>> +		reg = <0x0 0x47034000 0x0 0x100>,
>> +			<0x5 0x00000000 0x1 0x0000000>;
>> +		power-domains = <&k3_pds 55>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
>> +			 <0x1 0x5 0x04000000 0x4000000>; /* CS1 - 64MB
>> +
>> +		/* Slave flash node */
>> +		flash@0{
> 
>    Need space before {.
> 

Will fix.

>> +			compatible = "cypress,hyperflash";
>> +			reg = <0x0 0x4000000>;
>> +		};
>> +	};
> [...]
> 
> MBR, Sergei
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
