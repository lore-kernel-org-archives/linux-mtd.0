Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F9DC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jun 2022 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGC3Y3l5XmLicLsj3ccEpOJ1m/lZ18nn1wST+6wnoX8=; b=Q61eYBy2Olp1cl
	mSBFnU+MjbQl+p1PRfC8BL7icuPpcwlhYo/gEZ/Wvf4derK4VgI0pH5fWB/ey/a3R3Cb9jEkMVKQZ
	WogEOBqiYPuFTklcskeQbdFR4NHftuiWJ4wJeiXQeYBoozdz7d/VI0GNI3lIPz6GzfjLrgu5GRzSo
	G3Vw3n51mNCUQgdk5jGH1WZm4tkiWvPU8Efr4JP3Zw0IjRaSfQhX1KWmxm76Jp6E7liNXOB2/+0Dt
	P0n20/XMP+M2Af4dRFamG4ojwfBt9+o9SdqHfY0es3Tez/QrSU71tYL48pEw0ILW78ui58gbQMdID
	p7fIECf/xCiT5ymrYmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxrkG-00EhPC-QG; Sun, 05 Jun 2022 15:00:48 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxrkD-00EhMf-Rr
	for linux-mtd@lists.infradead.org; Sun, 05 Jun 2022 15:00:47 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 4FA063200900;
	Sun,  5 Jun 2022 11:00:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 05 Jun 2022 11:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	tom-fitzhenry.me.uk; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1654441236; x=
	1654527636; bh=NzQT6pX+H9knuipMBv6sOU7BVxvQ4VWlGZa4zEQowUo=; b=t
	Q2Rr74on1dYCKIbhfC/hvepgt8HDkotgHsf0vRlY9+a8aXdduJyCc3hBW/yS4JKK
	9hLMrl2mv/n96yfCHlWYkrRGU4mCfzTqDiqaF6athN+VlQCXrF4PUi62jdC+Gro5
	Q5CGErPunDoIQJxq+9jpneHmEwD2rjlheodVbH0tkziSfI8JC4flNplhEUUavYJi
	XbBenPEYtt5a47trL5hjGkWzUXOLka8RVha6LN5sTffa2JPCGSGVmWllAcemLru1
	U4PS0LdWFP3Ya0/Fow/cDw5xnNmzGj5c+EndgTToCvPN8HTiyfBfb3hn8MtxlD7P
	15b7ec36fXLo9NSIHE5Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1654441236; x=1654527636; bh=NzQT6pX+H9knuipMBv6sOU7BVxvQ
	4VWlGZa4zEQowUo=; b=CTQAYd1LpUm9+LtRmJVLiGUcr5dOu4yF3DLO3m+qtdkk
	2CLVZ/NsXJy/60Qzf1B0mQiMdaFpfR42dxHMa07sHc33kF9W2k38H430t1KNaCqp
	/oDqWv/o2UUbmT0BfsOsy5ba7Avj7P/zC/xFgdmjBk7OnvimzKz2GN1UW94xx9IN
	ZM0f6yypn/24kDBuIGQnUexQ4gwVr1+xB1uuSVd7DNVErwa5DB15Inr69fy+6tzi
	HwIZ7qgOG8uElF0EFgNFTOj/t3t/gsCeZQw6CEiGDwoZgK+aYYlMXMfZwLqUQtcu
	z8VJaybX9AvoS07rbBn0w20e8kASWUqTZiEE2JOpEg==
X-ME-Sender: <xms:E8WcYoBYQyg9ZRe0Fjl14ZIX3sLLhW0JZOnUcnedIemNIDl9W8Jtcg>
    <xme:E8WcYqjKJYSTShPZPX7uvmQ2VpZnpOypLgDixfRztJIzDnYGLW_XSb_eQ2f2RiYgr
    cPxsE2FcJdcjcBf6Q>
X-ME-Received: <xmr:E8WcYrmRarJ8HCbXwHIpuGybqu5V2_g9sOLfed32lIQOqIlLwlG_rl92J4zoMoTx2t1I62hqcxrsBTcEs6BQO34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddttddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufhffjgfkfgggtgesthdtredttdertdenucfhrhhomhepvfhomhcu
    hfhithiihhgvnhhrhicuoehtohhmsehtohhmqdhfihhtiihhvghnrhihrdhmvgdruhhkqe
    enucggtffrrghtthgvrhhnpeejteeukefgveejffdtveelkedtheeujefhudelvdeifeef
    teelhedvteehhfefheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthhomhesthhomhdqfhhi
    thiihhgvnhhrhidrmhgvrdhukh
X-ME-Proxy: <xmx:FMWcYuytu7-s5tODMF5aCVomcJAVX_XZa2RISAZUpr5k9PghLrpKiw>
    <xmx:FMWcYtTZ_noXc1oHIXtvmCFfpd7jRh2sPONtpNjG4MFy7ldEFhkeeA>
    <xmx:FMWcYpbTjX77_sjPvMkJ7p4bFXv7qaUmCF_EqjKya_1hBnel9H18dA>
    <xmx:FMWcYtb3N5wX0FaDFdOOW1uuos4WvEV5Hv9BMHT8VET9CTpHqbB4lA>
Feedback-ID: iefc945ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 11:00:33 -0400 (EDT)
From: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,  Pratyush Yadav
 <p.yadav@ti.com>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
References: <20220510140232.3519184-1-michael@walle.cc>
	<20220510140232.3519184-2-michael@walle.cc>
Date: Sun, 05 Jun 2022 17:00:28 +0200
In-Reply-To: <20220510140232.3519184-2-michael@walle.cc> (Michael Walle's
	message of "Tue, 10 May 2022 16:02:31 +0200")
Message-ID: <87v8tfcfzn.fsf@tom-fitzhenry.me.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_080046_358396_40FC24A6 
X-CRM114-Status: UNSURE (   6.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In "Add support for the siliconkaiser sk25lp128 chip."[0], I have tested
that this patch works on the sk25lp128.

Thanks!

Tested-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>

0. https://lore.kernel.org/all/20220603141603.145777-1-tom@tom-fitzhenry.me.uk/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
