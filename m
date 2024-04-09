Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D781C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1L39c4cD3pjfZUExUjqt53AaDKCWMkx/HNMupFi7uI=; b=bcF6h5ePpC0fDF
	6l4OMmSF8vwhg00LRjOh6cRfu3TzbQJ/GWfYmFJi4SOBUj4gqZgaVklNO7rRPtzcfRRqU9KYNf+WT
	r9arnO4IQprrGnPliDputI6sqHJfZ/Va58+E50E+qMDUEnt3U/rbkQs0R6IjQMnXZEkFnMT9xyj2U
	TRS6YR+ilXout0NXiq/1BmmcA7nBX9LtsrypioK01Eu6GmfCU4+vkAfLeP7zkmfO6xIZx0aJqHMLj
	xGONVu7WP9kLoJdJr7NCnCQ7tlWTjG22srx9ZYej9yOhUyV0f3EjtYqa66t64Z20YWIhwEUvejGvj
	yfAJpGMCF+x8T0zbSpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCLf-00000002ORz-17AO;
	Tue, 09 Apr 2024 14:21:19 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCLZ-00000002OQ4-1QLi;
	Tue, 09 Apr 2024 14:21:16 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9067610004E;
	Tue,  9 Apr 2024 17:21:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9067610004E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712672462;
	bh=PqqwNRBmzHK+DLV9MrZ64lR7K93sMpyqnXfDyXtgkGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=AXB8s412EtfApS8JBXRYpNcDBCIAk+Bj60Eme6Ex5OHAdTHuR7Q2Tb50sbPVdLVnX
	 q7AX0kE+CynjDrR6AsNocwr+RtVRL1+TFDId4nFNNeHzfioyvtg7j/wysx4lP33V+A
	 5cImDkLmY0ar3yfgCWzEZTg1qxG2EosPttgDd4z3dX8Q3AaaDu7ZXWc7rE/besRp1d
	 49GAC5BsCSWwLo9G3qv+0AxP2ymNMS57KMbZV7O4rrrl2Pxn5NsFOoZ9ahgPgUdg8G
	 jSkDjp8cLEWo0oXTo3mrLpqJPfbx5hdFXuFMgAscb6GQWC+5p+qvQjCWxlAHuKPkxn
	 NKZ899P8uJOTA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  9 Apr 2024 17:21:02 +0300 (MSK)
Received: from [172.28.160.201] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Apr 2024 17:21:01 +0300
Message-ID: <c9fa6376-a88d-278a-7c20-813f0e8975d8@salutedevices.com>
Date: Tue, 9 Apr 2024 17:10:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>
References: <20240408085931.456337-1-avkrasnov@salutedevices.com>
 <20240408085931.456337-2-avkrasnov@salutedevices.com>
 <20240409134718.GA1050037-robh@kernel.org>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240409134718.GA1050037-robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184638 [Apr 09 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 15 0.3.15 adb41f89e2951eb37b279104a7abb8e79494a5e7, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/09 12:42:00 #24719205
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_072114_103673_2324874F 
X-CRM114-Status: GOOD (  16.76  )
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



On 09.04.2024 16:47, Rob Herring wrote:
> On Mon, Apr 08, 2024 at 11:59:30AM +0300, Arseniy Krasnov wrote:
>> Boot ROM code on Meson requires that some pages on NAND must be written
>> in special mode: "short" ECC mode where each block is 384 bytes and
>> scrambling mode is on. Such pages located with the specified interval
>> within specified offset. Both interval and offset are located in the
>> device tree and used by driver if 'nand-is-boot-medium' is set for
>> NAND chip.
>>
>> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
>> ---
>>  .../bindings/mtd/amlogic,meson-nand.yaml           | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> index 57b6957c8415..80ba5003ca70 100644
>> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> @@ -64,11 +64,25 @@ patternProperties:
>>          items:
>>            maximum: 0
>>  
>> +      amlogic,boot-page-last:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          The NFC driver needs this information to select ECC
>> +          algorithms supported by the boot ROM.
>> +
>> +      amlogic,boot-page-step:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          The NFC driver needs this information to select ECC
>> +          algorithms supported by the boot ROM (in pages).
>> +
>>      unevaluatedProperties: false
>>  
>>      dependencies:
>>        nand-ecc-strength: [nand-ecc-step-size]
>>        nand-ecc-step-size: [nand-ecc-strength]
>> +      amlogic,boot-page-last: [nand-is-boot-medium, amlogic,boot-page-step]
>> +      amlogic,boot-page-step: [nand-is-boot-medium, amlogic,boot-page-last]
> 
> You need quotes if using the inline syntax.

IIUC it must look like this:

amlogic,boot-page-last: [nand-is-boot-medium, "amlogic,boot-page-step"]

etc.

> 
> Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
