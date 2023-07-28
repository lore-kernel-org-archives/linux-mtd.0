Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FE2C001E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeNnmksUcKWxo63UYIi+mKtyqFVPu/JVkaCrUHMOZqs=; b=YHFK4z1aWYsvZw
	mdStotkOc/6AP8qxc91Ey6nz3AhMRXAfmV1wRwSiiW5WuhSDqcREMJIMBAdrEh6hrnNU2gqW9ivNr
	41PlwU0yr5fDZTnf3YqrdQyd6EPQNcAsEApZFZS+OJroFxWHyLr+Q+WimlGRdgn0E2pJJiKKDCgnY
	kDLq6Zlq9/mHDTcnBtzGtww53mKV+zKNy2i9jK7BZG5CsJqqXQ+YzrIwpelCtScPSrKGWER9k0og+
	rhnUvWx2CBXeSgNIAvPhv3gbqlHQMM4UdNlVwUnzI6QLYCoNHvdaE0FwWXh/bp675nW2dRKnO16PH
	LugfsLBCpvTohy76u8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJUg-002bEI-12;
	Fri, 28 Jul 2023 09:10:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJUc-002bCF-0k;
	Fri, 28 Jul 2023 09:10:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4A2662086;
	Fri, 28 Jul 2023 09:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF74C433C7;
	Fri, 28 Jul 2023 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690535437;
	bh=jsukJ3h2ilmz083UcYGengZNcUIJYlLHWk6g/LKxW1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jq54e2P2vabTsv0/ZkCTu/TtAKcPA/986KlVzpTtjaLAFsettUVGxIIEhV012qHmY
	 XjZnDjmAeW2ab1ZsUURkM7jE4L/524t63e/2b+AR7jZDEQXiyB3jMa2BRjo+JEpwRs
	 l3QdUPJ8w/4urXWddV+VETsCyali7ZkVGVcRJ/K6g+RVz5T9C+bf9WioC+uygEDa9I
	 Rh3AvZFW0PdulmDiZySwu0Xy2XsI/jHB3Xyi77hPM/dAwa7KUnEsd9+KEupPqjueWP
	 u1x3RpBtfjI/oksjIHjYF89qn/jUU3ZW18drI+6RQKSDrQ5SYoMzV9cMfadNlCraZU
	 lW9h48LazI1/g==
Date: Fri, 28 Jul 2023 10:10:24 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mfd: Explicitly include correct DT includes
Message-ID: <20230728091024.GE8175@google.com>
References: <20230714174731.4059811-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714174731.4059811-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_021038_357304_08AECF2C 
X-CRM114-Status: GOOD (  15.17  )
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

T24gRnJpLCAxNCBKdWwgMjAyMywgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IFRoZSBEVCBvZl9kZXZp
Y2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxh
dGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRm
b3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRoYXQgbWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQg
MTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRlbXBvcmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRo
ZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0
LCB0aGVyZSdzIGEgcHJldHR5IG11Y2ggcmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmls
ZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0cmVlLiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBo
ZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhlIGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRl
Y2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVj
dCBpbmNsdWRlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9hYjg1MDAtY29yZS5jICAgICAgICAgICB8IDEgLQo+
ICBkcml2ZXJzL21mZC9hY2VyLWVjLWE1MDAuYyAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9t
ZmQvYWN0ODk0NWEuYyAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL2FsdGVyYS1z
eXNtZ3IuYyAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9tZmQvYXJpem9uYS1jb3JlLmMgICAg
ICAgICAgfCAxIC0KPiAgZHJpdmVycy9tZmQvYXRjMjYweC1jb3JlLmMgICAgICAgICAgfCAxIC0K
PiAgZHJpdmVycy9tZmQvYmNtNTkweHguYyAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9t
ZmQvY3Jvc19lY19kZXYuYyAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL2RhOTA1Mi1p
MmMuYyAgICAgICAgICAgIHwgNSArLS0tLQo+ICBkcml2ZXJzL21mZC9kYTkwNTUtaTJjLmMgICAg
ICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC9kYTkwNjItY29yZS5jICAgICAgICAgICB8IDIg
Ky0KPiAgZHJpdmVycy9tZmQvaGk2NTV4LXBtaWMuYyAgICAgICAgICAgfCA0ICsrLS0KPiAgZHJp
dmVycy9tZmQvaXFzNjJ4LmMgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL2xw
ODczeC5jICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21mZC9tYWRlcmEtaTJjLmMg
ICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC9tYWRlcmEtc3BpLmMgICAgICAgICAgICB8
IDEgLQo+ICBkcml2ZXJzL21mZC9tYXg3NzYyMC5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2
ZXJzL21mZC9tYXg3NzY4Ni5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC9tYXg3
Nzg0My5jICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZmQvbWF4ODkwNy5jICAgICAg
ICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tZmQvbWF4ODkyNS1jb3JlLmMgICAgICAgICAgfCAx
IC0KPiAgZHJpdmVycy9tZmQvbWF4ODk5Ny5jICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVy
cy9tZmQvbWF4ODk5OC5jICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tZmQvbXQ2MzU4
LWlycS5jICAgICAgICAgICAgfCA1ICsrLS0tCj4gIGRyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMg
ICAgICAgICAgIHwgNSArKystLQo+ICBkcml2ZXJzL21mZC9tdDYzOTctaXJxLmMgICAgICAgICAg
ICB8IDUgKystLS0KPiAgZHJpdmVycy9tZmQvcGFsbWFzLmMgICAgICAgICAgICAgICAgfCAzICsr
LQo+ICBkcml2ZXJzL21mZC9xY29tLXBtODAwOC5jICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVy
cy9tZmQvcmF2ZS1zcC5jICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL3JrOHh4
LWNvcmUuYyAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21mZC9yb2htLWJkNzE4MjguYyAg
ICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZmQvcm9obS1iZDcxOHg3LmMgICAgICAgICAgfCAy
ICstCj4gIGRyaXZlcnMvbWZkL3JvaG0tYmQ5NTc2LmMgICAgICAgICAgIHwgMiArLQo+ICBkcml2
ZXJzL21mZC9ydDUwMzMuYyAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZmQvcnot
bXR1My5jICAgICAgICAgICAgICAgfCA0ICsrKy0KPiAgZHJpdmVycy9tZmQvc2VjLWNvcmUuYyAg
ICAgICAgICAgICAgfCAyIC0tCj4gIGRyaXZlcnMvbWZkL3NwcmQtc2MyN3h4LXNwaS5jICAgICAg
IHwgMiArLQo+ICBkcml2ZXJzL21mZC9zc2JpLmMgICAgICAgICAgICAgICAgICB8IDYgKysrLS0t
Cj4gIGRyaXZlcnMvbWZkL3N0bTMyLWxwdGltZXIuYyAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMv
bWZkL3N0bTMyLXRpbWVycy5jICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvbWZkL3N1bjRpLWdw
YWRjLmMgICAgICAgICAgIHwgNCArKy0tCj4gIGRyaXZlcnMvbWZkL3RpLWxtdS5jICAgICAgICAg
ICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvbWZkL3RpX2FtMzM1eF90c2NhZGMuYyAgICAgIHwgMiAr
LQo+ICBkcml2ZXJzL21mZC90cHM2NTA3eC5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJz
L21mZC90cHM2NTA5MC5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC90cHM2NTIx
Ny5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC90cHM2NTIxOC5jICAgICAgICAg
ICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC90cHM2NTk0LWNvcmUuYyAgICAgICAgICB8IDIgKy0K
PiAgZHJpdmVycy9tZmQvdHdsNjA0MC5jICAgICAgICAgICAgICAgfCAyIC0tCj4gIGRyaXZlcnMv
bWZkL3dtODMxeC1jb3JlLmMgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMgfCAzICstLQo+ICA1MSBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRp
b25zKCspLCA2NiBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcwoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
