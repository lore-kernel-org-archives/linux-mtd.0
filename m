Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF60C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 05:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3iqT4W12VJIrLIU78teutZ3zmKtM9o9fYscTF0/wmTY=; b=vi3JsESaoYU7jw
	9HglyrnU2NJkDwirg2ZGhHnCvqWDCQSO216B6l6UxD+0hjWIv1KQV/Ex5bXELEOa5/YVvO3Wj14YI
	64ORZ1W/+BnDywGoicdaNPwxXyCK5h0vEk4jd7IFYs7Nj7dKq+b9+DONrDWsukgRaC8ftH7F7LJiZ
	DkxLhOhPIygzT8b7JNJECmVDeKO7lJFKcNonQqMdcqX9LloeiRkRKgecrj9J9E4BmV7Q+xBzwaOYt
	cbm1x5G/2jyIEzDgRB1PFZjnolYcqBCUknlBSJq8d/X3ccukNpbqLfrSTuWKhbVLnHEoefNAx3UGa
	L/Db1k63kHCGBpyJfeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWxt-00000007nMu-1TLd;
	Fri, 21 Jun 2024 05:37:37 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWxq-00000007nLR-1hLW;
	Fri, 21 Jun 2024 05:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718948207; x=1719553007; i=markus.elfring@web.de;
	bh=1SQIJLyP8KM0t0hXj5dAJLCq9lDBaf/TIWUVsJ97Ung=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OxGxApPm3qrh/Uq5UHSKdmuHA/EdQNdVJma2RSdg+S1AafTTsW8sFpAYf2MgTKfv
	 fZqivsvv+R5zbqNTRfhhkPPlGppoe5bmTcmMuGHMKC0k/OAykV552sZwl8awTQDsB
	 AGzeQ4RW7xxaGjveQJX3GD9ERf6C+RV4Ym6AX+TKIf52lZS7atgVBQbv1mV4RtSRH
	 KkLEhiS7KHYlRbJUQEAALxh1GO9FOVOYR0xJfPw94pP+vbFbjZ76u0PXn2nVtSrHY
	 6zTbgoX3wK0YvcjZsvq6EeqaZsHZhLuAlAjT+yQReM8MI5A86H1yxI1+ANljXev5R
	 k8YcZrvMI2bYGwTXBg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0Zs0-1sWp6x1rro-018Giw; Fri, 21
 Jun 2024 07:36:47 +0200
Message-ID: <a39f024c-7ab0-41f2-839d-ee2f62ddd6e9@web.de>
Date: Fri, 21 Jun 2024 07:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 04/10] ARM: dts: lpc32xx: Add missing dma and i2s
 properties
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
 <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
X-Provags-ID: V03:K1:Q7NNgNryQC4SvaqLSK46kUdFDA/ZWIIeO+B+DYHgCi0VqphfXz0
 LxOkeihG+Vrnw4q7094DPBzn7YDv2hUbpmVAdrJiShrqQhvj/8VJB5CO1x9U8dSN1exLjhS
 laSizbk3rhAQA4KMMEgqhwVU706cLgRCb467YcJy47Twkvz6B9MtZOubwGfQ9bMn5k+qiZq
 UXTnwNamwsXRAU6cK3a+Q==
UI-OutboundReport: notjunk:1;M01:P0:sxFXbRmwiow=;ItU3h73LSNWoHkiePPzF614YhOu
 vuWij/Wyd7G8C5bGFuxA34oRBoufqeSTJ1sO9oRDCQE17yA7yy+qUu1NsP3rGmwp607imLjET
 tlxMODkKmLWwjZN6WYB6OA00j+fL4/qe6kTDDGUFCsG3taFS+ziaS/XOF31nR0iYxmcGadXTF
 6WbDUOyp+fcYOvOUMdt9RtSb2KDjSlAT7V/u2dyxjIY7X2vNdA2A3LesS4hrWtUQ/j9jjsvCn
 9beVtwcM8ulERcSMjuM741ha+Tw/qMRQ7gvbaw8+RqndqAdbkDOMNKreIXpENNCPmnCrs2u7d
 uu7d4ceOXvKIb0nfzXvE8ZxudF5gVftjMcbGm9p5v/g2bWH7hYwtq5BZvz2s5DSK5Ta2ADRIX
 Zj2gqGUTQD6PH2NOVY/JvDoxrqN45EWShbKqn6+ZNV5ks/kb+tYB/7ZiQ0Pa0HXSr9tf+A+so
 2m0HXc6DpDDbA5nZafQpxxhgKpzPfPkjIo0773z24llMY/3IgrJYUbesX+Q5vBXyKqmi9y2M0
 LK96kUrboZ04zfJ43TiSAduhHGvUqMa0Jd2kkqNGi3fbr9ha1sNkt9rYqZm5yiKLdvXbfM2No
 5QPLKvW7DEDeT5xgYTZuSUEhGr0NvKoFBDWXfNP1E1JvGayANL1ZwqCpCoC1SFc5KVhOkyEO2
 22iZ/kQ+CA2ClHf081/2WBHIHecK0qpypwt0wXVmjFbC/kbygWKAOart5LMzLQ+2A7RERaKAl
 2v4BF7zzWd40QCWglLMTkaLvdwDoghAUBkoMXKoI+FWfJV1ZYWSEIJdBn8GPUvZFcmMAMgaTm
 TmADuSAnsOy9ft+lNhrWayN5+XfvhQrVkx6wjoHCE4kfM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_223734_838942_B995952F 
X-CRM114-Status: UNSURE (   6.09  )
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

> Adds properties declared in the new DT bindings:

  Add?                                How do you think about to replace such an abbreviation?

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
