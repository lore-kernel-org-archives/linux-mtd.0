Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A908FC2BA1A
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 05:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxmcMB3vclp/8aNiTiRny/YX3FOjnyR8+lJrMSaRg8E=; b=SU2541IQBWQX4j
	v3IFKOBGp9Iyo4mj0McA4/qPVGARjP4UuG+KNJ3OUUcntaXkUrKT6IyFlizh+DfHzWN9zuJP7Yemj
	hMhu1UGYaphAuXJf4VqcE6R53qpGVuPNQh6l5JN/RY27O2jF5c5gmIEkM3HiSQL9GKaqQ0m7bmThb
	Uw95SCsok1qHi1pJp7/p3vuR2ITTMSqjA76W5h1GS5vcNzVxxB0C/kWNyd2ZEjXP1b+nqZQ3oJCZP
	Mm2l5Lt7lnBl88GIRZJlhF3eS0y1YL7/9it8uinku2k1cqySneaGTHtMYggJ+NsA/TuWhTmnVztTg
	RaJPSLu62JEBB4TvM3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKX6h-00000007pBn-1RpX;
	Fri, 21 Jun 2024 05:46:43 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKX6e-00000007pAg-2mRU;
	Fri, 21 Jun 2024 05:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718948759; x=1719553559; i=markus.elfring@web.de;
	bh=kkYqZYijKZreQC7isvDQVtuAI4cUP9+RI5g70SolPKQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BcHwKT8qczQBUZmomUv0AM6QnX97SDGgPlBDIVTabydiiO2YNuvLTi0vxybiHhtx
	 6ooiz0LklK63jJ12sUOR41eTFnHJ29i6E8dwPItmoNQ8eJ85122eKDwij4wJDHN7E
	 jyhyIJVk1GiWjQyvMjc4L2HZ9tAkI56L1V1w9BsPe0Q4wpW9+gOOMaaqgQfI1/EfQ
	 bL4WzQetE6FwBgkj0JRIkCdRabXU5Yl9TdVjHesjkqim7Er/RNbJyQ9UcnggovU/c
	 jyo4VWLQUVqaDTF9GjRZ7doK/FlD0NXDCi2Nl/YD2mc268HvX7Rf/6BG240vgSaxa
	 hJ2hXVSkzKRX78qM9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyvB8-1sYT6j1kTS-016cfq; Fri, 21
 Jun 2024 07:45:59 +0200
Message-ID: <4b368817-11ba-4d6d-9a46-59bee8406ee7@web.de>
Date: Fri, 21 Jun 2024 07:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 05/10] clk: lpc32xx: initialize regmap using parent
 syscon
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
X-Provags-ID: V03:K1:/HnPeG1IAMU/Df3lJw189pApwGB8C6p6sxQOjGGDgYaEXEYX3rR
 1fzF6oMG/oC3y4WJ7MEJ4TBAKQIyhyJR9kLS1DmPUSeNWoeRLiHOx6XiA4dc3aykL6q8xK8
 ppHVp27GOpJ/Bs+b4hwtsFX07S22yoUi7Yykat+/2SOia9gZAP0dOgdRdMUjNp+ybmCNrse
 f6I1C/okSjZJiM9p46NnQ==
UI-OutboundReport: notjunk:1;M01:P0:RZzKrzeMnoA=;3Xr8mLJNU5K+f3Yl83BIysqGVe0
 4rpRYhraZfI1bck68O03DyDm4Cg0Ralh0kzhMQ7XEn/NHb22XhOO/qEek+tkZj9AymaCo5rlw
 bSKPoi1i/ladDc5kcnxbIKRRmcQGzYb4SSgAVMqhYt/qj/PBeAEk81mo2AOh/48zJcgz+wqoi
 MPAi/oqcMFuSKBk+mdhb2o9DXXDBjHLdAU3Yav7jWcUVm9sv3UXQg5rkBV+K14j45sxBBfCgj
 BF0eH/zDH8oj6G819SSeDhWuOAk+DOSqO7rbNv2Qt7c+GSAO2UYlxSB/Rjlnk6hp8CJKsxJLN
 TYBNewFaMSiY6DlviClA4CjSyDZabDzR2UfartoiCxpy0CsdpCAwUZZ7+/W/nRM4IPTPBuXVq
 DZOPeZX3tdo2dEw49H4cW1veaubeQCNBos2daRlftqwTo/+d6d4aoQtD0rHTwlsvcd0g6RObu
 37Jmd3rYX0642LHQoEDxlMQ9ZVSJCkdNf19a7al0wniU1zydyKkNOG7JOzZoS5qXb+WREAufY
 QKToA9R0LG4Ix6eTpjodQq1tzUl7rLtW1asXsu4MO6VZ+MSTWdYTmapSC2TD9GmScTYm+lZwY
 5gpJpFwGpIL0viYTOu0iXtFgTO0Lpw2eVrKsKPMkDP++IbWbuu4VOrvp/t8bgavYXXMUu4T6N
 /6VsHf5yFd4+pm1faTJC+gQmyIZzRN78+tAQwW4DfScDwIVbbvlXUxZShAa6XFjM4//+SobX1
 GbjpiRCVpeFw+GzVaX7nD6J9JYgj6Gh8vBIsAD0+ZwHk6nmmTdIMTVYTFwx3FvFnzFu1tSMhy
 9FKVb+6gaSPCl/M1gSvlML1hIN3Q3IKlJwNFX4wmTfG34=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_224641_024983_DD44BA99 
X-CRM114-Status: UNSURE (   5.20  )
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

> This allows to share the regmap with other simple-mfd devices like
> nxp,lpc32xx-dmamux

Please choose an imperative wording for an improved change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
