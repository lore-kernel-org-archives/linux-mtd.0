Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2195C3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yP+BAlabc1u30dPXwdhO+B8lMW4IIPvXGuiTcM2bjuc=; b=soDM9LXoQ+bPw3
	f5wjS2R8gpJQ1dRzZ/VK1BflThlAwDJ/Fd3Kv+7Zh1xTjTqXasJCm5cqrrqMoGZ+MKQKQUHHGoW/B
	3kjhzuJaFbJEA9uF/t0YdI+cUJn5zZN347IESe462K1Uyna+faGtLepu645wOXixCgFkFl64RjYmz
	lbu09bG+g0DnbmVmuR22pRqXtnEVoSckvpppkMIhzziPN0xz65W8z8kJO8684FHSlHu4g5hDbk+tn
	izQnhnWlFRiiA5+QZG1bIKa8X3x3gEkgV4bX0jq5EYCsQa5dvUshpUNplKOYQ4rWkg87q6z1UrcYN
	k0HGNtfMv+gnQaUZLz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWlx-0000000AXk7-0Hka;
	Wed, 10 Jul 2024 12:50:13 +0000
Received: from flow1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWlf-0000000AXhB-3jYD;
	Wed, 10 Jul 2024 12:49:57 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id E33CC20042D;
	Wed, 10 Jul 2024 08:49:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 08:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720615794; x=1720622994; bh=j8Mj9dw1Fm
	/JtEgtuTD5TSV9xTAWODaAOo5fjhNJeMk=; b=teTIciYZjvnAmtCaBvfsvRNjup
	wfCqM8oj1NVTM4jQ8jo5sskqJd9CXNwzX82No3oPh2ILjs4uutrlschv4dsLphU3
	DoHiZabk+5RNoNoz0INCQm1A/q0azsdpIKZ40BSY9zzvhrlrJsyAZoIB+AdhjZSM
	pglEr9LbbW0omvvUOv9xqemh9id/jhlr5i0OZnHACguZQxkJK5xIIlZPHl7qxIZi
	W18h/fh2fJqcEc9Qy9KDPKHfa/hVK9NfMC964RoDdIGpXNYZKvQ3LTPV8BpbXyRq
	/YSFUKn6ydo2t/RPLCAoY+yDhYs54/3qhWLzotGyYi2xcf1uXo+GhSqGYN6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720615794; x=1720622994; bh=j8Mj9dw1Fm/JtEgtuTD5TSV9xTAW
	ODaAOo5fjhNJeMk=; b=azzoWZRU5IySoav5jThTxI4/AKjfG7wh/UAeG5Y0yp/7
	pSjbpcVBoFNXfnK1AoPP/qA9CqwrRF8Dry0A37SxJCpk4Z5ullPkhy+gC2T5PlNW
	qtHzAzk/b8G5f3Tag6CJRkj0grWKT3j9AAJUB+sBlye1xyej0B+45sVmj7pFPIT0
	0C8phEMHJHLEtbkJkAqgb4SfK8Mg1xM0BHjBi1UepOwgPEnmdulrH+N+Got5FU1k
	1RVQ/Fe3Nc6RoIgAiYJC5LjOoh+Fk0b7Imsv7vkFNEtN+B28lrOP2iHu73sBprCP
	xkZ00fMz0ava03lyq9Jugs0eBmn8yWi7qreY8Gmasw==
X-ME-Sender: <xms:b4OOZh0Add5PpRvK-JwSRnx3M8MLRjt6lQVSLPf8bA1FKB4pYvBGow>
    <xme:b4OOZoE2nV6HZMpoyEVk3eDfC7dus2QqobaL3YCy7l8HFtBHVk97Nwkt_A9WozDEc
    C4EVANiB042rUeaNJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:b4OOZh5zNJxlOfPHh0-H8WYSyelbHHrXbP1YSq7BCS2SyJWdegrqqQ>
    <xmx:b4OOZu1jTQpah1fyyddzLy-SSEDaDFK_TWeDgISB8kW5bliLViVMcg>
    <xmx:b4OOZkE-est_ti1vs2CHielhfk6js_rK4NVMMPgNmJ_Fck8MCdzLbg>
    <xmx:b4OOZv-Dzbnlfj9JbL0x2Cl3B8vEn5obOKRlDMYB5cv0l5MtlBW17Q>
    <xmx:coOOZviKtDwt5hZt1uJ3U9a5Mli5qRUVB721KXhKKAyxK8Y3E3_QlGxR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D5425B60089; Wed, 10 Jul 2024 08:49:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
Date: Wed, 10 Jul 2024 14:48:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Felsch" <m.felsch@pengutronix.de>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Russell King" <linux@armlinux.org.uk>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Jon Hunter" <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_054956_018274_A89F811A 
X-CRM114-Status: UNSURE (   7.77  )
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

On Mon, Jul 1, 2024, at 15:53, Marco Felsch wrote:
> The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of the
> new Kconfig symbol to select the I2C EEPROM driver support.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm/configs/aspeed_g4_defconfig   | 2 +-
>  arch/arm/configs/aspeed_g5_defconfig   | 2 +-
>  arch/arm/configs/at91_dt_defconfig     | 2 +-
>  arch/arm/configs/axm55xx_defconfig     | 2 +-
>  arch/arm/configs/davinci_all_defconfig | 2 +-
>  arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
>  arch/arm/configs/ixp4xx_defconfig      | 2 +-
>  arch/arm/configs/keystone_defconfig    | 2 +-
>  arch/arm/configs/lpc18xx_defconfig     | 2 +-

Applied to soc/defconfig, thanks

   Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
