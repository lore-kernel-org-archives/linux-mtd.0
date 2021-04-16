Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EEBC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 19:26:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3A760FF1
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 19:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3A760FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qZQywMpq5gZFqYKBL42LVp6brvKifasuXvPQrnXBCPE=; b=PNHLSy4/K/yEAgzLOuBsBwpSk
	KBglhvk4UPRAembgHVuCAv9zkXWhI6oNTDq/AusMxOZ05cM92/UOZVhI8RIjHZ6yqqbmtXT4BQf9+
	kQfZS9FfYjpenGX6O/7DwClb7EMHEc38W4XWUMWEfMlxPftm76E541wwmsBQVotiIwO4Zn0XCr+1k
	PraZzFJi6MlrDLWuJlVRpUOUyIWqL+QCrk8C3jB1Y8cw8+7rY96F74c8fY/cZlzTIRtwhQ36LAWT1
	edVbUvRFvipNELwXz0Y05O9NXG07FhVnEqPTI1xituCTK6DSEROUBRXjgVYJxdSGo34aBSHz4BuLs
	C52AQts+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXU6d-003DaO-KL; Fri, 16 Apr 2021 19:26:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU6b-003DZn-5G
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 19:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=iOKsLNHAvUNt6FOKX0n36qA6s7ZucezMgWOSW4v76s8=; b=NyLTLXz4cfEkYyLTms1n1sX59S
 r8rZi3jdT8s/FrvpB/i5Jck/9vs5FLHMilpgqcsgpuBs/Y4Fuaunbw89/HuxDMKNjtprRYvXv8vQH
 E14GJ4Oo9P1Tz3au3Wemnd5aE8Cg5fG3TuSoNiu7rLNVXC8IxGoyACGKcIIooaBQwVl5SfpNDZiUM
 32uqqv4NpYC74q2aIduez9deGfn8E3cWpRs2ClSgVg6SxWVM/OdgvfmNk/PHVHHZUWY61adzTLmYI
 PGmm4ZUrtgmSu7aBOg7ibuhJSsK6SCc1fPtt54PYlnPhH8cZEXWiqDW025hqfDBSpIodkbhOQjCQM
 RTR1EzLw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU6V-009ehu-Pk
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 19:26:15 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 01C1022253;
 Fri, 16 Apr 2021 21:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618601164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOKsLNHAvUNt6FOKX0n36qA6s7ZucezMgWOSW4v76s8=;
 b=Hb1xtI/WzADiaRibdpmonxBtIdj9F1hpRIoWgSNvarzwJvNlayCeXjwOHk4k/q5vapGRy0
 mZ4MWe8zwkie5eb66+W6rIaiyGkCEb3cCFQga8gMElsiMmwCxqHLmjmrU3+LW7L9M/xtGG
 VEhMEaxzSx5188bB+2nPXjtvkdJNma0=
MIME-Version: 1.0
Date: Fri, 16 Apr 2021 21:26:03 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/5] mtd: core: OTP nvmem provider support
In-Reply-To: <20210416184423.GA3715339@robh.at.kernel.org>
References: <20210416114928.27758-1-michael@walle.cc>
 <20210416184423.GA3715339@robh.at.kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9f33229a8fe83b49210289fc93a8554e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_122612_024899_2834A1D2 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Rob,

Am 2021-04-16 20:44, schrieb Rob Herring:
> On Fri, Apr 16, 2021 at 01:49:23PM +0200, Michael Walle wrote:
>> The goal is to fetch a (base) MAC address from the OTP region of a SPI 
>> NOR
>> flash.
>> 
>> This is the first part, where I try to add the nvmem provider support 
>> to
>> the MTD core.
>> 
>> I'm not sure about the device tree bindings. Consider the following 
>> two
>> variants:
>> 
>> (1)
>>     flash@0 {
>>         ..
>> 
>>         otp {
>>             compatible = "mtd-user-otp";
> 
> mtd is a linuxism. Why not just 'nvmem-cells' here or as a fallback if
> we come up with a better name?

There are two different compatibles: "mtd-user-otp" and 
"mtd-factory-otp"
to differentiate what kind of OTP should be used (and both are possible
at the same time). Thus nvmem-cells alone won't be enough. We could drop
the "mtd-" prefix though.

Is there a benefit of having the following?
   compatible = "user-otp", "nvmem-cells";


>>             #address-cells = <1>;
>>             #size-cells = <1>;
>> 
>>             serial-number@0 {
>>                 reg = <0x0 0x8>;
>>             };
>>         };
>>     };
>> 
>> (2)
>>     flash@0 {
>>         ..
>> 
>>         otp {
>>             compatible = "mtd-user-otp";
>>             #address-cells = <1>;
>>             #size-cells = <1>;
>> 
>> 			some-useful-name {
>>                 compatible = "nvmem-cells";
>> 
>>                 serial-number@0 {
>>                     reg = <0x0 0x8>;
>>                 };
>> 			};
>>         };
>>     };
>> 
>> Both bindings use a subnode "opt[-N]". We cannot have the nvmem cells 
>> as
>> children to the flash node because of the legacy partition binding.
>> 
>> (1) seems to be the form which is used almost everywhere in the 
>> kernel.
>> That is, the nvmem cells are just children of the parent node.
>> 
>> (2) seem to be more natural, because there might also be other 
>> properties
>> inside the otp subnode and might be more future-proof.
>> 
>> At the moment this patch implements (1).
> 
> I think approach (1) seems fine.

ok

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
