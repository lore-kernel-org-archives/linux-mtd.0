Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81F9C2BA1A
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 05:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6W9BuPtCMn8ebP4UByP2XZZNYPma1XlThfSKPbTckI=; b=zlCkRvY6Z0CF3k
	fCRHJa+AGy9LAFRrab7YAjxwrUpTXbc1U3t4N37t3FZSpJ6CfEHzqSaLtMeMoWAeUt5ajx6aqbTMn
	UGmVVB+7ZRC2JRchLEq6MXwP3TsYgZ8pnEwsNnrPKD+AfmMbYxPm50by1Cxp2cW3L30jnRDE4jkrk
	XZb28Z6uGRXeiwrsO6SWYJh/aqkxZTuNhpxx1tPIxOi8E65wbW5JsOvg1HP+hj52+DPgH5I0XRZbt
	7X8+Y1KJlwyHMl8H7YTM2nbiP9fjF2aHo7ol+82m7LaYmxvnhj7POFY0H+rrsa5t3TZy6XStufJwC
	e+emCo6qTr1axIdcRlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXCF-00000007ppD-10Bv;
	Fri, 21 Jun 2024 05:52:27 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXC8-00000007poT-34jj;
	Fri, 21 Jun 2024 05:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718949090; x=1719553890; i=markus.elfring@web.de;
	bh=B/FtBrdM0MhQsIGzDSXhE0531n+bBkbvzx6WIgFpcl4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=g9WFBtZJ6jlB7Xhm4LApEB33Lek0861qyFNqPb11SiEuEbAqlDQlxKGJ5LkLcnKc
	 BLrvnBx5OAZfeh7r05oZsGab+pZ3zwUw4URvK5pCKhai8AwyJ+I/pjcANj2N0e0Ok
	 Mkmv5/vIM+W39FeC0LdnMz95DnOVdsSFEQ+vZOZ9m7d1f1aLUhBTEz2FlVHJ+Msge
	 F2abgY6fqjIjiJCuN8Xjwe9BEutZDXssCtL8EMyIa8rMKy/KVuzTLEbV1DW2YCUKl
	 jfdAXFHp5JAi+4+MgmH6z/bfnkBLFFTvtuXHYcrAekFxHSUZpK4NhTH0MVAPA7ATR
	 7Ouc4OrP0NrGubXFlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQPdl-1ryJTH0wtN-00XZsv; Fri, 21
 Jun 2024 07:51:30 +0200
Message-ID: <62a564df-e78f-470b-a1b3-2e49b6c05395@web.de>
Date: Fri, 21 Jun 2024 07:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX
 SoC
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
 Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
X-Provags-ID: V03:K1:bPaZvoxzJ/h40pvO52zJQM/EXwvqLuVGmwbJlhznsZdSb7+5vV9
 ivg/UFZwjDfRawbpm6w0wCBUaQyp9SJcyDqFrot02cTYmewtQVP7vrWLKc5MV0m8Yvuzqml
 3MMYaa56tKHofEPv+LYWJE+ygSMZ+e5P2grD4YKSoPHdjNrcG5SnDh1+y4SlXyeVzIcF9Y6
 7Ufmk6v6MTeNw2cuMzL1w==
UI-OutboundReport: notjunk:1;M01:P0:UuJ6HPlnuco=;b+auAotmGPrPfJRrtNoxICqpvzR
 pKZtILPKcz2H6Q3tjierCqUY1bw3iXANbljk6kGRZQ8Ir2J+sNZeAoqtxl3Ol0bMTRtSR+4A5
 R+79tcqE/AFMIX8Tj1+dTIq7iGX7H4Z/u4Wn+kGkiczsJT8uP+YBDZA8XWHHbBvTsgBvIgd/M
 t9dbgwBnBviEkn54bA4PV6n6FJWZ2Y4y+qtNc/0yhyMsZfG7v0588p63zWHDOl0BeqabSRk0R
 iSEF/OpLj1jUM9QoM53KVYIxp38zUjrP0FNRW9Bg99ZVq+9y4Cm4pt4oIst1Zi6lZ24WYkyvF
 BbLoTfMQq5eSvbcruXX4b4W4yMHhw5+LoDEdfBn/pTE++mjkuh4AWG5xEAjppkayQT5jEk7+e
 yfcqBPTlRwvN6YwtV8y0qh3+k0GcUhaS/rk5Zy7282DcKttFw8dGIzfia8vte2yv9T+KDpp7x
 ZoVyYf4Iic/IeCnBZg6D0yD+WT406j6qhg495/RmOh3i+X08miyIXWRWAtUxvD+Z2q98HXkGZ
 OnDeEaI4pDSADbegqEszNfdwJ/7SJuW4t99TgT5m1p647pYuyGNkeHX71fk1jCeF/cva/8v4g
 TaikQTpWxd8OrwGHTigbYnrR3Vlnp1LmtBfdQRH8Cw/GcZVyr+9cvXVDmQondRXAg7T013/yY
 IUdhxPtFPZpkDp9Ex3fUOe4K5g0Yvq38AyBxinSmvccQ0O9581SX9FEcl6oyvQFs6TqaswsiA
 v9A67FvaC4G/xzhDWdxVjzSCMCp7GXb3ZVKMN2KLd4wMMcDjDQRJ1S4hyog0GLC1LbvrxWaTj
 pBtdYg/1eB+cdDSUEzEgIwCtPrPRwhWBwKvX/wkLonUvM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_225221_081075_A1AFC7F9 
X-CRM114-Status: UNSURE (   5.34  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

4oCmCj4gdGhpcyBkcml2ZXIgYWxsb3dzIHRvIHJvdXRlIGEgc2lnbmFsIHJlcXVlc3QgbGluZSB0
aHJ1IHRoZSBtdWx0aXBsZXhlciBmb3IKPiBnaXZlbiBwZXJpcGhlcmFsLgoKV291bGQgeW91IGxp
a2UgdG8gY2hvb3NlIGFuIGltcGVyYXRpdmUgd29yZGluZyBmb3IgYW4gaW1wcm92ZWQgY2hhbmdl
IGRlc2NyaXB0aW9uPwpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0
dGluZy1wYXRjaGVzLnJzdD9oPXY2LjEwLXJjNCNuOTQKClJlZ2FyZHMsCk1hcmt1cwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
