Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F592C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 10:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436CF206E6
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 10:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BvP1FwFG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436CF206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfU58Xp3dpNQbfhGuAUC3JCcdVIt3t23qnq+vx3jK2o=; b=BvP1FwFGtuxT8M
	s0Y/ou0TE4O/6Xe6MlZ6xPefdlZVP8wW9A4nttfnH5yjbiCHZYPHba+XoS107zlBbBJvgZCNwf63c
	O3uDjDNXVweJHodcNeHuUR9hFVyAclyhoMm4AC4E/bUW+BsdRNQA7+D9WTq6IiC/V8+z6ykReu+55
	dMB+Dq4ZFXV8MbdEY7oapWtWqj7WIPQJju81gl3Edp9Wetkhc7E6Zq1hnfh1dhd1fDoYHWsDpdgrb
	O7rIU29adgseHXgQkho9Kdgho2vjLYjqyJZTHfRKi5TCGqbrTTSOvlJcqpEL/JVhp/cFx83Ww/N+A
	69LoO8qJvkpovfvWPgBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIrE4-0000pE-C1; Mon, 30 Mar 2020 10:01:00 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIrE1-0000oJ-Pw
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 10:00:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rSdf3FPJz1rtyc;
 Mon, 30 Mar 2020 12:00:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rSdd50gxz1r0c4;
 Mon, 30 Mar 2020 12:00:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Umm6pyC2bxUh; Mon, 30 Mar 2020 12:00:52 +0200 (CEST)
X-Auth-Info: hHMGdqnHqAE6fvhPm1qMt5QwR23l1fijZnvach0Idkg=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 12:00:52 +0200 (CEST)
Subject: Re: [03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-4-git-send-email-christophe.kerello@st.com>
 <f6a2c766-8ae5-fab7-e2f6-db23f39b5d91@denx.de>
 <93fce520-9269-123c-9523-173e75cdce2e@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <94845952-ae8d-dab1-7bbe-21830d05480b@denx.de>
Date: Mon, 30 Mar 2020 11:30:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <93fce520-9269-123c-9523-173e75cdce2e@st.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_030057_989701_F76D607A 
X-CRM114-Status: GOOD (  14.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/30/20 11:19 AM, Christophe Kerello wrote:
> 
> 
> On 3/30/20 3:24 AM, Marek Vasut wrote:
>> On 3/23/20 3:58 PM, Christophe Kerello wrote:
>>> The driver adds the support for the STMicroelectronics FMC2 EBI
>>> controller
>>> found on STM32MP SOCs.
>>>
>>
>> On DH STM32MP1 SoM in PDK2 carrier board,
>> Tested-by: Marek Vasut <marex@denx.de>
>>
>> btw. it seems this sets BTRx DATLAT and CLKDIV to 0xf , it's "Don't
>> care" in the datasheet for Muxed mode, but then it should probably be
>> set to 0.
> 
> Hi Marek,

Hi,

> Thanks for testing.

Sure

> These 2 bit fields (BTRx DATLAT and CLKDIV) are only needed for
> synchronous transactions. Based on your bindings, the transaction type
> is asynchronous.
> CLKDIV bit fields should not be set to 0x0, as this value is reserved
> for this bit field. The driver keeps the reset value when it is not
> needed to update a bit field.

Then I guess that's fine either way.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
