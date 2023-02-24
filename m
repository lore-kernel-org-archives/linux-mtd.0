Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DEBC61DA4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Feb 2023 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQSxkQXdGnw3bCnT/IZSGrXttqgH18JqD3qckHXMFb4=; b=VttwD8xlCAIjwI
	bwkxLlAp8otiMre4avlN3nryzoW4vNvWDmq4eMeEQFrflUX2zDY7U7YIEee+sPNqk5KxpzEVDnDJJ
	wvaQlw8elXWU2bP0ElAU+ruLY0eF4Y2Gxu6oNX/MwbdqWxqcoOq7GSO3RRhbEuRpVbkfwSxzMcQpO
	OsQc4d01Afsk5CxJgY+4kP7aaDHqZCFBhJ4mex7WamYeqajc74rztjvFeOtGly9NGPhSwhX3q0QFs
	Nicq3U85A7Kfn3gj9VilWzOBO42Ri0v1JCtXOB0KnxB2KBlY6bG/yEasQ37ij2CtQ4BYT2wzpyFFl
	mPzTUKR4396Bf1rcAk9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXtq-002aV5-5O; Fri, 24 Feb 2023 13:14:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXtl-002aT6-1Q; Fri, 24 Feb 2023 13:14:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 65D7D6602FB6;
	Fri, 24 Feb 2023 13:14:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677244443;
	bh=Okn4gS1gr349hyYSKqFPtphNu9lynSCGwrmaUsYAV7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gm+baLq2JEYoErHccOrY+sq6UkDE63wM7blUSKo5+RWdViPYvsPewvBWLj6KK/Klp
	 mX0JPGD4xhg/6yWU++Nzbmfnl82cF9liwmH7/V49AdT0JhjKn/9qFXL/MGmI+iFB67
	 kEGGWDZczMu1ApL71HWexGJDHuCekPnec8VhOqK/IaN4Ec18oW5lZJK5IMSXZwaONx
	 pW0CUQ3NXQdomYvAUVtmuLd3Bvdsg8AvWF57+1ZZ3pSrcDOBQdPK7V6n01YRtKSLUa
	 bKRbQR8cYQ9XXXp8GWwxsBTRfmoO71Bj6gti3TX4MnkShBZEDgDb+fHdBMjgfzYc9q
	 hsCnVl7kz1jdg==
Message-ID: <c17f94a6-c710-f80e-c2af-9e450f144157@collabora.com>
Date: Fri, 24 Feb 2023 14:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2] nvmem: add explicit config option to read OF fixed
 cells
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230224072903.20945-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224072903.20945-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_051405_230804_D9F4575F 
X-CRM114-Status: GOOD (  15.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SWwgMjQvMDIvMjMgMDg6MjksIFJhZmHFgiBNacWCZWNraSBoYSBzY3JpdHRvOgo+IEZyb206IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBOVk1FTSBzdWJzeXN0ZW0gbG9v
a3MgZm9yIGZpeGVkIE5WTUVNIGNlbGxzIChzcGVjaWZpZWQgaW4gRFQpIGJ5Cj4gZGVmYXVsdC4g
VGhpcyBiZWhhdmlvdXIgbWFkZSBzZW5zZSBpbiBlYXJseSBkYXlzIGJlZm9yZSBhZGRpbmcgc3Vw
cG9ydAo+IGZvciBkeW5hbWljIGNlbGxzLgo+IAo+IFdpdGggZXZlcnkgbmV3IHN1cHBvcnRlZCBO
Vk1FTSBkZXZpY2Ugd2l0aCBkeW5hbWljIGNlbGxzIGN1cnJlbnQKPiBiZWhhdmlvdXIgYmVjb21l
cyBub24tb3B0aW1hbC4gSXQgcmVzdWx0cyBpbiB1bm5lZWRlZCBpdGVyYXRpbmcgb3ZlciBEVAo+
IG5vZGVzIGFuZCBtYXkgcmVzdWx0IGluIGZhbHNlIGRpc2NvdmVyeSBvZiBjZWxscyAoZGVwZW5k
aW5nIG9uIHVzZWQgRFQKPiBwcm9wZXJ0aWVzKS4KPiAKPiBUaGlzIGJlaGF2aW91ciBoYXMgYWN0
dWFsbHkgY2F1c2VkIGEgcHJvYmxlbSBhbHJlYWR5IHdpdGggdGhlIE1URAo+IHN1YnN5c3RlbS4g
TVREIHN1YnBhcnRpdGlvbnMgd2VyZSBpbmNvcnJlY3RseSB0cmVhdGVkIGFzIE5WTUVNIGNlbGxz
Lgo+IAo+IEFsc28gd2l0aCB1cGNvbWluZyBzdXBwb3J0IGZvciBOVk1FTSBsYXlvdXRzIG5vIG5l
dyBiaW5kaW5nIG9yIGRyaXZlcgo+IHNob3VsZCBzdXBwb3J0IGZpeGVkIGNlbGxzIGRlZmluZWQg
aW4gZGV2aWNlIG5vZGUuCj4gCj4gU29sdmUgdGhpcyBieSBtb2RpZnlpbmcgZHJpdmVycyBmb3Ig
YmluZGluZ3MgdGhhdCBzdXBwb3J0IHNwZWNpZnlpbmcKPiBmaXhlZCBOVk1FTSBjZWxscyBpbiBE
VC4gTWFrZSB0aGVtIGV4cGxpY2l0bHkgdGVsbCBOVk1FTSBzdWJzeXN0ZW0gdG8KPiByZWFkIGNl
bGxzIGZyb20gRFQuCj4gCj4gSXQgd2Fzbid0IGNsZWFyICh0byBtZSkgaWYgcnRjIGFuZCB3MSBj
b2RlIGFjdHVhbGx5IHVzZXMgZml4ZWQgY2VsbHMuIEkKPiBlbmFibGVkIHRoZW0gdG8gZG9uJ3Qg
cmlzayBhbnkgYnJlYWthZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxy
YWZhbEBtaWxlY2tpLnBsPgo+IFtmb3IgZHJpdmVycy9udm1lbS9tZXNvbi17ZWZ1c2UsbXgtZWZ1
c2V9LmNdCj4gQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGlu
Z2xAZ29vZ2xlbWFpbC5jb20+CgpbZm9yIG10ay1lZnVzZS5jLCBudm1lbS9jb3JlLmMsIG52bWVt
LXByb3ZpZGVyLmhdClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKW01UODE5MiwgTVQ4MTk1IENo
cm9tZWJvb2tzXQpUZXN0ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
