Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39ABC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 06:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LqmnI67byvr2Z4UiSk0BXp/soLOISZ+RtQP38noBUw=; b=2jUimiIouKzapsGvolA53uHhvi
	uXPqk6t7mpLMAGhD3oLNkGh9oRueYiaO7Ncq8sOtK9wOweMrY31VpMBqASqFDDSzrqmrjF7i1ki67
	0SZRsZzg3gwKLsB2Mj4S158fTN94qL8W5R3VkEv1iP2mScc5obNRnyeeUVgaKy1b01GXRmvK+DMub
	lBUI88EAqW20vXEvPcmVDlMhCYnv+/FyP7DyZBqhJZTRzQTBtT8qupxVk5pbWe6Bh4WkJXAMLIYTa
	0BITTCiufRbNCfCe4PjYROfntmKMQsCOgQBljLVQcE8d2Yq55pZ0HMQ2g81eqh8p3slPbr1lIgKQu
	o7C9mnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQ67-001JqT-R0; Thu, 21 Jul 2022 06:55:47 +0000
Received: from 8.mo581.mail-out.ovh.net ([46.105.77.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQ5w-001Jef-1m
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 06:55:37 +0000
Received: from player158.ha.ovh.net (unknown [10.111.208.97])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id B7D9B23EDB
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2022 06:55:31 +0000 (UTC)
Received: from RCM-web2.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
	(Authenticated sender: rafal@milecki.pl)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 40A322CCE9609;
	Thu, 21 Jul 2022 06:55:10 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 21 Jul 2022 08:55:10 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 joel.peshkin@broadcom.com, dan.beygelman@broadcom.com, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH 0/9] arm64: bcmbca: Move BCM4908 SoC support under
 ARCH_BCMBCA
In-Reply-To: <20220721000626.29497-1-william.zhang@broadcom.com>
References: <20220721000626.29497-1-william.zhang@broadcom.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <cb6bcce75bec6c845fa4a35587a2332d@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 17898149347535334168
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudelkedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeegvdffjeelvdeggeetheegveejieetgeeiiefggeelveejffehieekhfduueelhfenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhduheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekud
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_235536_271467_C90F2A42 
X-CRM114-Status: UNSURE (   7.88  )
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

On 2022-07-21 02:06, William Zhang wrote:
> RESEND to include linux arm kernel mailing list.
> 
> Now that Broadcom Broadband arch ARCH_BCMBCA is in the kernel, this 
> change
> set migrates the existing broadband chip BCM4908 support to 
> ARCH_BCMBCA.

I'd expect me to receive patches 7/9, 8/9 and 9/9 too.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
