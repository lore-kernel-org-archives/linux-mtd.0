Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED691C25B10
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH4lgLYsLzBLPxxDsefNLa1B9tCXyCyn98loiJCUwWI=; b=yihIH7M+MQDmWF
	EoSEbewN4QsgZMXiXPabTnGL9bFtp5O7iRYjGg9OPwWSfqQIE/mlV2SGaPwc2riBJYFk0IqINEfoy
	Zd3RuETWQ/iTOS0wcpDDCcAQ4hVuxVgBzlPzdcvwCx5pRClh68CLiFyVRwTuRy+FSypp12+y0f39E
	fo6klXksY38g0tYTcAerF9h7qv8U66NUBN4jgr0c1VxZgLrdiGHwzidvOR3B21BXdh53fmoE1v8A8
	x1RY83Py4+oLQ18g1A1DbljBq2e22Bq0ZAXDMpW+NcWQMOTjnpCAoFd68Z7oIkiIl/OkVUgeH3SLO
	LGguKOZKun3Q4a2PZmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VTZ-0000000Cx9d-2JwM;
	Mon, 13 May 2024 13:12:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VTV-0000000Cx7T-1XGR;
	Mon, 13 May 2024 13:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715605935;
	bh=iGwqCXIPo5Sz/mVwtdsEoVu5uuBlckkioU0/F3+rFJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wP4V4wRD3bgtkqQVaTg10pjSetuDkdLdu8u+Xm46+KGCWbUbEeETjSVCBADEVn3fH
	 5ONQmZ70MG6ygHnm46zi/Pi8HOrdgBWGe0HomQUvnqwcRJO38IxFF8GkkZrecDGHsc
	 FN/NQHFV1WRuXQkLBQDdb5RAENk/TVRsH7RZLLwN+DLcgi8rTAmHcONOb35dybZdfE
	 /79ktkbLNe4UW7oxoVgeFqQcoNtrnyw6zll/ILwHuotrt4/gSQTc8Ya/N/37Lue3Zk
	 jOzF4liFus2SVMYo5aqP3RWGFt+aqquKqsOro4PyXJexL3+2zxSHex5q91CHHwjLMr
	 34XuAB1Rl0PoA==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7867A3782167;
	Mon, 13 May 2024 13:12:13 +0000 (UTC)
Message-ID: <debde564-eac8-4d07-8e25-75e321150df7@collabora.com>
Date: Mon, 13 May 2024 15:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 UNGLinuxDriver@microchip.com, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240510123018.3902184-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_061217_571531_050B4E2B 
X-CRM114-Status: UNSURE (   5.77  )
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

Il 10/05/24 14:30, Rob Herring (Arm) ha scritto:
> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For MediaTek

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
