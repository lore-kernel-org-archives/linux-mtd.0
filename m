Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741D6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 13:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4767260F6D
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 13:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4767260F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nk71RXZRQz2kSmf6L/ojZEkdyPr6LdSeOGUPGajR8Aw=; b=QQGjmXR/myBJwd0TvjxtMDmvG1
	b7CnBZdnbTF9XGrVy0GmBa1HWXFp778hZSFb8T5uwyl+QVNgndasrAPkQ4VOVFz8R/6GBv/tSLUM4
	MlDLR6tn2MjtlfIqgWrC3QbQGnh1jumyDXYKxHuqx+iV9M+gchbppnJ2F1kEvUxaqNRI+19QA9xeu
	f7i4uzXc6ePxyZktD752Yet6+dKvpVLAG4UATROWaWss3JcY0x3PgDtriUUWPQly+Aa4/uePzVQU+
	rRMT5y9rJ2BPV+yIchpyJhO1EnS+j6oio4pDfYCqz89Njqtmv3MxBwC7/59OpjNTpLTb5nmBVyZBq
	MogBiFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSgA5-004evH-Bl; Tue, 21 Sep 2021 13:50:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSg4k-004byV-9X
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 13:44:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18LDigMU006925;
 Tue, 21 Sep 2021 08:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632231882;
 bh=9/0CIvgoXoNw6Uen/PE86wIdMfBIuYgmLDb8VlnIav0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BFJP5YFFVhDp+nh/dlHvCeL9SoaNRHQGefPUcH3JJS7HiTgVxTB250Ic1Elh/qwz7
 KUg18hW7VgHq+c4PdQJNJEVrpY6REIPjc0BLQwBxdOlYwsXCKlvNLUprkcqfa7SQT7
 kWwfMmllrMDxBGbggbxwVCR8JhF/a7yTwgHe2Zlc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18LDif9u079754
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Sep 2021 08:44:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Sep 2021 08:44:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Sep 2021 08:44:41 -0500
Received: from [10.250.233.5] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18LDiapY003451;
 Tue, 21 Sep 2021 08:44:37 -0500
Subject: Re: [PATCH v2 2/2] dt-bindings: snps,dw-apb-ssi: Use 'flash' node
 name instead of 'spi-flash' in example
To: Rob Herring <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Serge Semin
 <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <michael@walle.cc>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-3-a-nandan@ti.com>
 <YUj6yUBx0xCY9QGj@robh.at.kernel.org>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <408954fa-aa71-6f35-3b02-0e7a078658f0@ti.com>
Date: Tue, 21 Sep 2021 19:14:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUj6yUBx0xCY9QGj@robh.at.kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_064446_464104_954DBE1C 
X-CRM114-Status: GOOD (  17.69  )
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


On 21/09/21 2:49 am, Rob Herring wrote:
> On Mon, Sep 20, 2021 at 07:57:13PM +0530, Apurva Nandan wrote:
>> Change the nodename in the example with spi-nand from 'spi-flash@1'
>> to 'flash@1' to make the schema uniform with both spi-nand and spi-nor
>> flashes. jedec,spi-nor.yaml uses 'flash@' nodename for spi-nor flashes,
>> so make the spi-nand examples in dt-bindings use it too for uniformity.
>>
>> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
>> ---
>>   Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Fixes should come first. Maybe Mark can apply this before you respin.
>
> Acked-by: Rob Herring <robh@kernel.org>
Please tell if I need to re-roll this series for changing the order of 
the two patches.
>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> index ca91201a9926..d7e08b03e204 100644
>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> @@ -171,7 +171,7 @@ examples:
>>         cs-gpios = <&gpio0 13 0>,
>>                    <&gpio0 14 0>;
>>         rx-sample-delay-ns = <3>;
>> -      spi-flash@1 {
>> +      flash@1 {
>>           compatible = "spi-nand";
>>           reg = <1>;
>>           rx-sample-delay-ns = <7>;
>> -- 
>> 2.25.1
>>
>>
Thanks,
Apurva Nandan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
