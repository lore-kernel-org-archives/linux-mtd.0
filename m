Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD0DC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 13:10:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7089720830
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 13:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quOAahtA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cSQ5+f4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7089720830
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3RnLeiqOHySdizqrLwC6MCIxJ1DYaeHW7bTrHeenR4=; b=quOAahtAzM0sNS
	yuJ1bUu5Tj8XcX5yzfzVHLyUZP1m94Jip8O4w7fUQfddNo65ac3q7KzWqrsDSnvr3v2hoV1yvmWlm
	jD3pZoPDUdkiRlKTpP6cvrMulz4UhSFRywXW8BANONImrz9v2WsnNnGPD358dPyBcWgR+m81J0Vrx
	RDBd08NABVme7QXBp1ghpWceta64F/S+rycSVcdrbf5THJJ/MsyReUAh5MnN8BWscMRAYrGRdicB/
	tyaRz9hkIRJoOGpW9J+Nx0/N7mzv7TS7cvDoDnf/g8I+xi8YgCdit07oYAePI0Hs2OU3PiTdHSpxJ
	8O0442RQkAwpqBwcqWTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8PMc-0002lS-8S; Mon, 25 Mar 2019 13:10:06 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8PMW-0002KW-Or; Mon, 25 Mar 2019 13:10:02 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2PD9nlQ043189;
 Mon, 25 Mar 2019 08:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553519389;
 bh=IxbMSmB9fWUk28Qr+hYgtEhPGpHFWiMIqwBf+ODBVPI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cSQ5+f4KE9OmXRYN4G5024Bi0IYuo0jbpH/1UowrZUuOdXQ9haVwwOvG9hAZOshBv
 tw0SOeaWrVktBmIOBSrl6rrFhanv8E2WC2QH8yX3DnxVivtv4XNh9gloceZqninyol
 gCzXtBtM2CgpDQmnzhMF7QVM0U2CdtyaZv37z91M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2PD9nWZ019112
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Mar 2019 08:09:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 25
 Mar 2019 08:09:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend Transport;
 Mon, 25 Mar 2019 08:09:49 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2PD9hmO020477;
 Mon, 25 Mar 2019 08:09:44 -0500
Subject: Re: [RFC PATCH v2 2/5] dt-bindings: mtd: Add binding documentation
 for Hyperbus memory devices
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-3-vigneshr@ti.com>
 <ca3326cb-1b37-cf9a-f196-3288a539d064@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <43af4200-7734-733a-a227-f3b75bf40457@ti.com>
Date: Mon, 25 Mar 2019 18:40:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <ca3326cb-1b37-cf9a-f196-3288a539d064@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_061000_896325_A98FD7A2 
X-CRM114-Status: GOOD (  19.41  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 24/03/19 9:48 PM, Sergei Shtylyov wrote:
> Hello!
> 
> On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:
> 
>> Add DT binding documentation for Hyperbus memory devices. Only
>> Hyperflash is supported at the moment.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
>> new file mode 100644
>> index 000000000000..cb408f80b868
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
>> @@ -0,0 +1,6 @@
>> +Bindings for Hyperflash NOR flash chips compliant with Cypress Hyperbus
>> +specification and supports Cypress CFI specification 1.5 command set.
>> +
>> +Required properties:
>> +- compatible : "cypress,hyperflash" for Hyperflash NOR chips
> 
>    What about "cfi-flash", shouldn't it be also specified?

Oh, right. I missed that. Hyperflash is CFI compliant.
Will add that next time. Thanks!

> 
>> +- reg : Address where flash's memory mapped space
> 
> MBR, Sergei
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
