Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F592C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 09:50:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3FA26188B
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 09:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3FA26188B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P7s3zJBddIC+M8nEkPbfVGCPzTBH//MG4YY0jiVtAlw=; b=RzZs1xMTXeVyJvawS1BRcnzwx
	H2QHKI2xajP9Que8czSGIGHs9VT1SfrNCtj5yq+KNnpdWuEzZim/equ6qq87QT7EQ9D3BdjsZgILz
	mrbfK64Q7KwTPQjECfFfbRuXd/lAHGkmtMJtAjGMyaqQb9RNanQuiblLHrYTgiWPofzra9H+TjH65
	4oQTtNoR3ST/5qsO9nLFr6uaSpPj+m+mxF1WCDGh1MkvJKak2F84mFnwCyy7YUPC4/ioyFpYgO7hp
	qbKxBianWM7Y4XEOxOOekqz5qNzMCknnuMddxZ38rLPMclY8VG3YBiXmcmQfAI8vBy9YKxmZD+tvr
	lrocOYw8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRB0L-003INU-TL; Tue, 30 Mar 2021 09:49:46 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAzy-003II6-9q
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 09:49:27 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1CEA02222E;
 Tue, 30 Mar 2021 11:49:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617097759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nm5DXEo0jkIlCPceI4kZgChSiL9E0F8HDcjVbx5UvYY=;
 b=Ra+2dv0u2o5h2cqYRwv6VLqxp430olUEJyjPjzHPuGNstjQcuBt8/d7v0wAxC0OHuum+nV
 V/pqGCbzDbS5KHPNacWlp77/hsY5cLWpviDJym3h+/th8HzUdnZBT61LrXH3TACQRlYI1t
 zuxb6kYN8752fIdk0ZiapELTTbaQnd8=
MIME-Version: 1.0
Date: Tue, 30 Mar 2021 11:49:16 +0200
From: Michael Walle <michael@walle.cc>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>
Subject: Re: [RFC PATCH 0/4] mtd: core: OTP nvmem provider support
In-Reply-To: <ace5b308-d6ea-b301-0d2e-29f95b91fe8b@linaro.org>
References: <20210322181949.2805-1-michael@walle.cc>
 <ace5b308-d6ea-b301-0d2e-29f95b91fe8b@linaro.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e4d6721e8500c85883b0af7ccc96fce6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_104923_614380_FAC0359D 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Srinivas,

Am 2021-03-30 11:42, schrieb Srinivas Kandagatla:
> On 22/03/2021 18:19, Michael Walle wrote:
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
>>      flash@0 {
>>          ..
>> 
>>          otp {
>>              compatible = "mtd-user-otp";
>>              #address-cells = <1>;
>>              #size-cells = <1>;
>> 
>>              serial-number@0 {
>>                  reg = <0x0 0x8>;
>>              };
>>          };
>>      };
>> 
>> (2)
>>      flash@0 {
>>          ..
>> 
>>          otp {
>>              compatible = "mtd-user-otp";
>>              #address-cells = <1>;
>>              #size-cells = <1>;
>> 
>> 			some-useful-name {
>>                  compatible = "nvmem-cells";
>> 
>>                  serial-number@0 {
>>                      reg = <0x0 0x8>;
>>                  };
>> 			};
>>          };
>>      };
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
>> 
> 
> 
> Have you looked at this series[1], are you both trying to do the same 
> thing?

Yes, I've seen these, but they are for MTD partitions. OTP regions are 
not
MTD partitions (and cannot be mapped to them).

-michael

> 
> [1] 
> https://lore.kernel.org/linux-mtd/20210312062830.20548-2-ansuelsmth@gmail.com/T/
> 
> --srini
> 
> 
>> Michael Walle (4):
>>    nvmem: core: allow specifying of_node
>>    dt-bindings: mtd: add YAML schema for the generic MTD bindings
>>    dt-bindings: mtd: add OTP bindings
>>    mtd: core: add OTP nvmem provider support
>> 
>>   .../devicetree/bindings/mtd/common.txt        |  16 +-
>>   .../devicetree/bindings/mtd/mtd.yaml          | 110 +++++++++++++
>>   drivers/mtd/mtdcore.c                         | 149 
>> ++++++++++++++++++
>>   drivers/nvmem/core.c                          |   4 +-
>>   include/linux/mtd/mtd.h                       |   2 +
>>   include/linux/nvmem-provider.h                |   2 +
>>   6 files changed, 267 insertions(+), 16 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/mtd.yaml
>> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
