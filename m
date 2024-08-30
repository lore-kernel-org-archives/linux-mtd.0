Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A369ACA0EE5
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 06:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mN33xKhw20mbWa170X9OwMQNzdBg6h5St9qEa1nASOw=; b=OxrCb8kq/xwcsg
	gEzMMFXyq3KsxyvNczvbMj64oS+QDzTGE52oIKAgQc7Lkkzv3zWW0YqR0UYsRJVPfl9wEoi9vzfUE
	fCMXfkp+iGqIIRxIuA0Sw8ppXzIeA1sMFYqPIsKOIS6cU98EwUOXCPInjLH1/Yee/S85yI/L4PJzb
	crEHh1SqUvwWhiETYd3uScWmtEnOwU48q8gwTQst49yAd1RqDOiQwMXs1yJUIM7HQI+a//1Z5OFvk
	6Oyn7iXfD6bmHY2S4TUeJj2Btz/YhJxpT5yDM9R6wCkBS8/7l5QLMuPFg2sgwtC/nJb7MrE44IlTn
	Vtcj1PXn1N9pw8jDLLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvEa-00000004yZv-1uso;
	Fri, 30 Aug 2024 06:35:48 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvDf-00000004yJd-44eG;
	Fri, 30 Aug 2024 06:34:54 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ww7dp3fr0z18MyV;
	Fri, 30 Aug 2024 14:33:50 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 14CA1140202;
	Fri, 30 Aug 2024 14:34:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Aug 2024 14:34:39 +0800
Message-ID: <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
Date: Fri, 30 Aug 2024 14:34:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <michal.simek@amd.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
	<gustavoars@kernel.org>, <linux@treblig.org>, <robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
	<christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
	<christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <jic23@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
 <20240826144917.2c4e202d@xps-13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826144917.2c4e202d@xps-13>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_233452_900341_802BCD0B 
X-CRM114-Status: UNSURE (   6.86  )
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

CgpPbiAyMDI0LzgvMjYgMjA6NDksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgS3J6eXN6dG9m
LAo+IAo+IGtyemtAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDI2IEF1ZyAyMDI0IDEyOjE5OjA3
ICswMjAwOgo+IAo+PiBPbiAyNi8wOC8yMDI0IDExOjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
Pj4gSGkgSmluamllLAo+Pj4KPj4+IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBvbiBNb24s
IDI2IEF1ZyAyMDI0IDE3OjQzOjE4ICswODAwOgo+Pj4gICAKPj4+PiBVc2Ugc2NvcGVkIGZvcl9l
YWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlX3Njb3BlZCgpIHdoZW4gaXRlcmF0aW5nIG92ZXIK
Pj4+PiBkZXZpY2Ugbm9kZXMgdG8gbWFrZSBjb2RlIGEgYml0IHNpbXBsZXIuICAKPj4+Cj4+PiBX
aHkgaXMgdGhpcyBhIHJlc2VuZCA/IERpZCBJIG1pc3MgYSBwcmV2aW91cyBpdGVyYXRpb24/ICAK
Pj4KPj4gWW91IHdlcmUgbm90IGNjLWVkIG9uIHByZXZpb3VzIGl0ZXJhdGlvbi4gSSBhc2tlZCBm
b3IgcHJvcGVyIHNwbGl0Cj4+IGJldHdlZW4gc3Vic3lzdGVtcyBhbmQgc2VuZGluZyB0byBtYWlu
dGFpbmVycywgdGh1cyB0aGlzIHJlc2VuZC4KPiAKPiBPay4gTWFrZXMgc2Vuc2UsIGFuZCB0aGUg
cGF0Y2hzZXQgbG9va3MgZmluZS4KCkhpLCBNaXF1ZWwsCgpDb3VsZCB0aGlzIHNlcmllcyBiZSBt
ZXJnZWQsIHRoYW5rIHlvdSEKCj4gCj4gSmluamllLCBwbGVhc2UgYWx3YXlzIGluY2x1ZGUgYSBj
aGFuZ2Vsb2cgd2hlbiB5b3Ugc2VuZCBuZXcgdmVyc2lvbnMsCj4gYW5kIGV4cGxhbmF0aW9ucyBm
b3IgYSBSRVNFTkQuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
