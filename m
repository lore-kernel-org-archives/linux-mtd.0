Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E67EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 07:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNAXdd+aVLB+IGmDtafUy9oegkQ/RNnMJfRsHeRwq2Q=; b=ZhNZB1mVgm5vPugTzaZRgtxSaz
	A8QHT2KUst5sBnvzK7PvL3g+Me94Jwdz7W2p6SiMCV89L5w+r4jX8ct0wwjSVtWcDETfiQCHUKYTh
	os+ze8EoupqxAHUA1Th9nq+5DBFVAsatN2RsZMRKNX3UCH+8RylNWJcO3YTAe80YjmmzgVIPhDZya
	EvqOfqI9L6n/K103GOAu6GnJLT2eF94ub/8GazH8NV4VGL6+8h2lsZ6sbE6QUc+EBc80l77rMXrUm
	9G1Os6UbLR+ICdfdUp7pcmFn+0/7Z0b2qzuQgDFmTulLpTkfRiqhXC28qZIvlTL3yxcLmq6DPR0Fl
	CmwsL2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntOpc-0073T0-Lq; Tue, 24 May 2022 07:19:52 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntOpZ-0073Rx-L3
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 07:19:51 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 865732222E;
 Tue, 24 May 2022 09:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653376781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/htG7OyW5YqCjznA1oXKYQhkz8pG2pTnLrCkASZVoo=;
 b=ksnNzOVQTrqvIX7KFcA/r0rYwmv2R4E/MZsYZwjPUJvVCkviboit4z2Ko7iAOwlVW2sLAa
 JGfP6tS8OCbVwPUrITcOOl8nSgeZ0dzFRc2ihvxi2vkyrxhe1NnxY9I0tGeEbgwPItk3No
 RZ4rDiVGCjoAVYoZvbTDOTixXV2Of3I=
MIME-Version: 1.0
Date: Tue, 24 May 2022 09:19:38 +0200
From: Michael Walle <michael@walle.cc>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: macronix: Add support for mx66l2g45g
In-Reply-To: <91183d9f-a4a2-b237-b097-2ba546f9308c@linux.intel.com>
References: <20220523150334.1758649-1-jiaqing.zhao@linux.intel.com>
 <e310ab2100f459346ae6cfa77c9ada19@walle.cc>
 <91183d9f-a4a2-b237-b097-2ba546f9308c@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <02b3a83b5fafa7099d79fac7ca9250f2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_001949_917960_7C598EEF 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Am 2022-05-24 05:35, schrieb Jiaqing Zhao:
> On 2022-05-24 01:04, Michael Walle wrote:
>> Am 2022-05-23 17:03, schrieb Jiaqing Zhao:
>>> Macronix mx66l2g45g is a 3V, 2Gbit (256MB) NOR flash that supports
>>> x1, x2, and x4 operation modes.
>>> 
>>> Tested read/write/erase with Aspeed AST2600 BMC SoC operating in x2
>>> mode at 50MHz, using Aspeed spi-mem driver.
>>> 
>>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>> 
>> Reviewed-by: Michael Walle <michael@walle.cc>
>> 
>> # is this picked up by b4? link goes to the sfdp dump
> 
> May I ask what do you mean by "is this picked up by b4?"

It was question to the maintainers (or myself). b4 the tool
the spi-nor maintainers [1] use to pick up the patches. And,
no it is not picked up automatically.

-michael

[1] 
https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

>> Link: 
>> https://lore.kernel.org/r/2b859cff-2403-0526-f3ae-749920b3fd8b@linux.intel.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
