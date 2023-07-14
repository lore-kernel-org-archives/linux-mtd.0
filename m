Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAF9EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUgDGgvVr3lfZ+/jb32MjBJQks1mEyGmTUlq8/rDwnY=; b=QZiRPJdDDgg+5k
	mDVJwNSHGMOmech8MQvMsIUFc8jO2A/gGwfJ0Kw0fSYtavoPpKl3UC3WDoSowUU+0wV/SrHpQUw5e
	pvidUj40vnv8CjlEKe94x6V8ujMDF4dQP+YLV2IzFkmIZOdHH462z7JksF3M+zxFBWTsOK22wVGQz
	jruwZhTMOsv8lqf6d8S5CCrmdFEQ0DewqP0vIr4G/SaSy6YiqpVqlFuIjD77BXWcy5JikNzqaL/PS
	/5/UvcTA/8lxy77dU4Op9L71aFaYLfY7ic0Xkf4McOcCOGss+ABn0INxxxMVGdGOpUzFxijW2y//l
	Lpycc9BiVphnBZHdGBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOSl-0075aA-1l;
	Fri, 14 Jul 2023 19:28:23 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOSh-0075Z1-0e;
	Fri, 14 Jul 2023 19:28:21 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 52498100005;
	Fri, 14 Jul 2023 22:28:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 52498100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689362893;
	bh=Y+EKy5Ok08NhyZskIXQaHaX4WP3np3p1O2H4uO0MI3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=J3nT8QVlHEw0rbCHKaR0Wxo0ubAaFwxu9KdT3g8pPyTfqGPZbKJHwqXgl1DBcDL4B
	 sPm6DJr7iHU7xpU7Qp2+1WC7/h/UZHNDQynAH3+xqvOwNihNt3pmSSN8FhhgwjeewV
	 k3r0RzNOUeGokT3WXIK2e8882vb5JS55vAMaxGvVPNNQJquLDsUuzoG6OHJW4bFMj9
	 vw14id/UjsvZ+B9OHGHOQOqfg0b0CnnWa1APRb8FFUfL3Zm+cvYDY+3FYm5/oI0FVa
	 rhAvnb9LlxEtuLLTwDdKwXKgLWlRvFs+rYieiJ6fol88Rkjl3MoAFeOrAhGROlK9XD
	 Dz6yUrF21FfpQ==
Received: from p-i-exch-sc-m02.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 14 Jul 2023 22:28:13 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 22:27:38 +0300
Message-ID: <840a9364-352d-b79b-6e7a-c54912e2297a@sberdevices.ru>
Date: Fri, 14 Jul 2023 22:22:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v3 2/3] dt-bindings: nand: meson: make ECC properties
 dependent
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
 <20230711122129.2635558-3-AVKrasnov@sberdevices.ru>
 <20230714155553.GA3913802-robh@kernel.org>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230714155553.GA3913802-robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178634 [Jul 14 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m02.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/14 17:22:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/14 17:22:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/14 14:48:00 #21614190
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_122819_616273_D71C5219 
X-CRM114-Status: GOOD (  15.47  )
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



On 14.07.2023 18:55, Rob Herring wrote:
> On Tue, Jul 11, 2023 at 03:21:28PM +0300, Arseniy Krasnov wrote:
>> ECC properties 'nand-ecc-strength' and 'nand-ecc-step-size' depends on
>> each other, so they must be both either set or not set. 
> 
> Is that true for all drivers or just meson?

As Miquel Raynal suggested, this will be implemented only for Meson driver at this moment.
Here is link with reply:
https://lore.kernel.org/linux-mtd/20230705065434.297040-1-AVKrasnov@sberdevices.ru/T/#m88705a0039fb30c18a9bb2b03a1add5f7e212a3b

Thanks, Arseniy

> 
>> In first case
>> ECC core will try to use these values if possible (by checking ECC caps
>> provided by driver), in second case ECC core will select most optimal
>> values for both properties.
>>
>> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>> ---
>>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> index e81757c9e0ed..4f6e56542a7e 100644
>> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>> @@ -58,6 +58,10 @@ patternProperties:
>>              meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
>>              meson-axg-nfc 8
>>  
>> +    dependencies:
>> +      nand-ecc-strength: ['nand-ecc-step-size']
>> +      nand-ecc-step-size: ['nand-ecc-strength']
>> +
>>  required:
>>    - compatible
>>    - reg
>> -- 
>> 2.35.0
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
