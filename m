Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A47C25B4F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhzcqYEYK76Ei+nUXunq7tbd8twxzeDrztU532OQZLw=; b=RW+j8N+Anc5m1Q
	Lh53jp3rqDvogj6PhnhgLooV/HtLap79udyc1qYx5JjomK9xfewSJYE9WWpsMdjxUxo+ZuKCe+Kkf
	KOZu7CpqNJ0N1+CwBg49VVEjHVshEO6ub0xkBRA663qeRLClAKeFra5SNOuMxhUkeRWB8JGvVmaZQ
	By6fvgvTTUE3ahs2W34u5Wqh4OIjc1iMsz1jWo9nUGlziwLlPNmZ4xrMdkvASsoPK4dhRLcZWt23R
	hBbjfDZI71DUqaRkkeHuABYtEaHwHdhr+ZCR6s6ljQDqquSPzgJDXe0sv+9Vut7lMme544+pX4sgs
	TUl8uBL3NY0pbv8T3qTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mi3-0000000Gfjc-0sfP;
	Wed, 08 May 2024 19:12:11 +0000
Received: from fhigh1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mhz-0000000Gfhu-3XbP
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 19:12:09 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1F6CB11400A3;
	Wed,  8 May 2024 15:12:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 08 May 2024 15:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715195521; x=1715281921; bh=b7o5ZIjvfH
	yrKOMLF/GO7Tf2G5tsfeSYs7cv6FLBodc=; b=YS8pNXld9MoEVFnM3PA+o3jDNH
	/1iECD7yIG0WZhlsEJ6rt4mFOXTstjVkzSEewqD44PVieMviC9D6Dhe/d4K53lT5
	XxYzibeFCH6MPYJ35Fn998iY5CbSbG296s/pv1ypot2Oxm35Inm38uUB0AujAM/+
	LlzQJGoOcd2iYM9RymGrxyt8DBQFX/DY09AzTt/c0FPqTk398xaCEgUjvxRR7Qaz
	ayWrtzCANIgSYGNYXSVOzbgcHlt3yOr8eD0mNHn2wDaMP9VFeknIB2QhciJtL76j
	IuhIsVtMElpp8EeDzZwkigGQcO1JCMbGtGWbbVQ1vVoJMMclFKcmcoa5h9gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715195521; x=1715281921; bh=b7o5ZIjvfHyrKOMLF/GO7Tf2G5ts
	feSYs7cv6FLBodc=; b=jEhofAnshvxHm3cHDrSYvsan3rcETEqNcWFzXM7AQARL
	+IaRm1bCIJ8tkXVjSa/rgeU4DQSEOQ9GSTNsqw9FFcZNbyo+HhYHOW+qZYlCrsUq
	ga04rTtsqHlvRebWTZUyw7Kjj1RjoguWEhOLS1EEDWvPu1tl25/iCYNTgk3RSHNT
	07gKW4kxbP+RxOlzo/Htjp8/ItoBvXGWTc8wyeMDHFBX/4wezX356Cfv1tpTLFpN
	7hA1XsVJiKUUMtb9pR5l+HF6fVjl7kOJn8baa3SMeDFWzYZH+VNUlS7w7MpqPU8i
	wVZZTSHrZMcschDzvYetbICKy7rSpB9l18AMsHWKxA==
X-ME-Sender: <xms:gM47ZkBZqHf9gPXM4RNeSK31Fo1szPR0IFzeyEX8CgvXo7_oop8_gA>
    <xme:gM47Zmic00G1wYJMUg275c_joMszQk90nOsTYzzAKDJPFzC7JOw6h4R8_eSHwPVOs
    jO1bFVqGFzxZ9iJUlc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:gM47Znlg33ysrc70-QyWQgf9ss5EFQZsFOHDfjid6PrDx6mSdL9foA>
    <xmx:gM47Zqw1OP5WWpN3q00fj98TL_8TipdU-F-FFw64Oni4hQYxQgXKCQ>
    <xmx:gM47ZpQm-5wteSX80TnRqWYvr7y4fbyGfRwEMJeGPQmQyDpaDrmLVw>
    <xmx:gM47ZlYB7-R_nuQK4n4t8QEzK_vfF7gTXb0EFCIkaO3wO9p-nTMQfg>
    <xmx:gc47ZqQQfS8gmCMdczs9bb50_3XOzJXeQzW54XeO_HRzWwr0fdBsaxxC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A66F6B6008D; Wed,  8 May 2024 15:12:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <5b29d981-aa8a-413e-8250-5fb33802f32d@app.fastmail.com>
In-Reply-To: <9a26dac6-d776-4b84-830d-6f622719d7eb@kernel.org>
References: <20240414154957.127113-1-krzk@kernel.org>
 <20240414154957.127113-3-krzk@kernel.org>
 <Zju8HpBCiOjjIZ1j@smile.fi.intel.com>
 <6599e2a3-3b04-4ea2-aa5c-a916b66c8009@kernel.org>
 <ZjvEam5paLD0Iv6V@smile.fi.intel.com>
 <9a26dac6-d776-4b84-830d-6f622719d7eb@kernel.org>
Date: Wed, 08 May 2024 21:11:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] eeprom: 93xx46: drop unneeded MODULE_ALIAS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_121208_316953_74062FFF 
X-CRM114-Status: GOOD (  14.97  )
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

On Wed, May 8, 2024, at 20:44, Krzysztof Kozlowski wrote:
> On 08/05/2024 20:28, Andy Shevchenko wrote:
>> On Wed, May 08, 2024 at 08:15:00PM +0200, Krzysztof Kozlowski wrote:
>>> On 08/05/2024 19:53, Andy Shevchenko wrote:
>>>> On Sun, Apr 14, 2024 at 05:49:57PM +0200, Krzysztof Kozlowski wrote:
>>>>> The ID table already has respective entry and MODULE_DEVICE_TABLE and
>>>>> creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
>>>>> the alias to be duplicated.
>> 
>> ...
>> 
>>>>>  MODULE_ALIAS("spi:93xx46");
>>>>
>>>> I was stumbled over this (leftover?).
>>>> Commit message doesn't elaborate this bit.
>>>> Any comments?
>>>
>>> It is not present in ID table and commit msg removes only duplicated
>>> aliases. That alias has meaning - someone might be actually relying on it.
>> 
>> It seems no users for it. The only user of platform data of this EEPROM uses
>> board files which AFAIU bypasses modalias matching.
>
> I don't think that's correct. The modalias of SPI board is there on
> purpose. 

Right, but I think a better workaround would have been to change
the board_info to pick a modalias that is part of the ID table:

--- a/drivers/misc/eeprom/digsy_mtc_eeprom.c
+++ b/drivers/misc/eeprom/digsy_mtc_eeprom.c
@@ -76,7 +76,7 @@ static struct gpiod_lookup_table eeprom_spi_gpiod_table = {
 
 static struct spi_board_info digsy_mtc_eeprom_info[] __initdata = {
        {
-               .modalias               = "93xx46",
+               .modalias               = "eeprom-93xx46",
                .max_speed_hz           = 1000000,
                .bus_num                = EE_SPI_BUS_NUM,
                .chip_select            = 0,


    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
