Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A6C6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kf1+vpzuSSSGbMNpgWwjOrHIh1gxdr5nnqpaBglr1sM=; b=mbS7VciFdBk5mTnFLUDcrBqdG3
	Ix0TnRkBKUDHsgfXL0EiFPaJHfhGzwbIjDe18v2cgiJXNunxKiAACz3DmcBuccAf+jYUTlY94d8lh
	B52cipt+2Xg9ltn5YlTmGpCUpoG64qGGMA93FD3jIE6pw1P9qdLFh9KKtCPctc2UAghlXipNIfEW3
	qDlqUa1372aRlmrKa/ezJPvcWMB639xf4iCGP+zFJbhHxkUTZAyYs9ojvMJULXrdVKJIUFnFNG6Vn
	M9yiakRVzQmu1uLH+8d/A4GNOwonnVGO1kYrn6oC+A7oM+nmgGoH6NwEma8XjVVQtyDNFa0zDZsP5
	ix2ft5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyHT-006KM8-On; Wed, 08 Mar 2023 18:12:51 +0000
Received: from 5.mo575.mail-out.ovh.net ([46.105.62.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyHL-006KFl-IK
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 18:12:48 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.16.30])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id DDA1125F7A
	for <linux-mtd@lists.infradead.org>; Wed,  8 Mar 2023 18:12:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-cqldr (unknown [10.110.115.240])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1EF4D1FDE9;
	Wed,  8 Mar 2023 18:12:33 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
	by ghost-submission-6684bf9d7b-cqldr with ESMTPSA
	id NAwlBhHQCGQKAhoAZIOUGg
	(envelope-from <rafal@milecki.pl>); Wed, 08 Mar 2023 18:12:33 +0000
MIME-Version: 1.0
Date: Wed, 08 Mar 2023 19:12:32 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH V2] nvmem: add explicit config option to read OF fixed
 cells
In-Reply-To: <20230308190636.7fabab9c@xps-13>
References: <20230224072903.20945-1-zajec5@gmail.com>
 <20230308173256.3837b87b@xps-13>
 <91ff425b4c901648b1faf34c784f20ad@milecki.pl>
 <20230308190636.7fabab9c@xps-13>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5974d28426057975e701c4a8454b5a13@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 14994172011305216839
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddufedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejvdelgfeutdfhfeelheegfedtleduleeuvdfgfeefvefhvedtheetjeetfeehgeenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefpddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_101243_908362_0499F2A6 
X-CRM114-Status: GOOD (  34.68  )
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

T24gMjAyMy0wMy0wOCAxOTowNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBSYWZhxYIsCj4g
Cj4gcmFmYWxAbWlsZWNraS5wbCB3cm90ZSBvbiBXZWQsIDA4IE1hciAyMDIzIDE3OjU1OjQ2ICsw
MTAwOgo+IAo+PiBPbiAyMDIzLTAzLTA4IDE3OjM0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiA+
IEhpIFJhZmHFgiwKPj4gPgo+PiA+IHphamVjNUBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAyNCBG
ZWIgMjAyMyAwODoyOTowMyArMDEwMDoKPj4gPgo+PiA+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Cj4+ID4+ID4+IE5WTUVNIHN1YnN5c3RlbSBsb29rcyBmb3IgZml4
ZWQgTlZNRU0gY2VsbHMgKHNwZWNpZmllZCBpbiBEVCkgYnkKPj4gPj4gZGVmYXVsdC4gVGhpcyBi
ZWhhdmlvdXIgbWFkZSBzZW5zZSBpbiBlYXJseSBkYXlzIGJlZm9yZSBhZGRpbmcgc3VwcG9ydAo+
PiA+PiBmb3IgZHluYW1pYyBjZWxscy4KPj4gPj4gPj4gV2l0aCBldmVyeSBuZXcgc3VwcG9ydGVk
IE5WTUVNIGRldmljZSB3aXRoIGR5bmFtaWMgY2VsbHMgY3VycmVudAo+PiA+PiBiZWhhdmlvdXIg
YmVjb21lcyBub24tb3B0aW1hbC4gSXQgcmVzdWx0cyBpbiB1bm5lZWRlZCBpdGVyYXRpbmcgb3Zl
ciA+PiBEVAo+PiA+PiBub2RlcyBhbmQgbWF5IHJlc3VsdCBpbiBmYWxzZSBkaXNjb3Zlcnkgb2Yg
Y2VsbHMgKGRlcGVuZGluZyBvbiB1c2VkIERUCj4+ID4+IHByb3BlcnRpZXMpLgo+PiA+PiA+PiBU
aGlzIGJlaGF2aW91ciBoYXMgYWN0dWFsbHkgY2F1c2VkIGEgcHJvYmxlbSBhbHJlYWR5IHdpdGgg
dGhlIE1URAo+PiA+PiBzdWJzeXN0ZW0uIE1URCBzdWJwYXJ0aXRpb25zIHdlcmUgaW5jb3JyZWN0
bHkgdHJlYXRlZCBhcyBOVk1FTSBjZWxscy4KPj4gPgo+PiA+IFRoYXQncyB0cnVlLCBidXQgSSBl
eHBlY3QgdGhpcyB0byBiZSByZWFsbHkgTVREIHNwZWNpZmljLgo+PiA+Cj4+ID4gQSBjb25jcmV0
ZSBwcm9wb3NhbCBiZWxvdy4KPj4gPgo+PiA+PiBBbHNvIHdpdGggdXBjb21pbmcgc3VwcG9ydCBm
b3IgTlZNRU0gbGF5b3V0cyBubyBuZXcgYmluZGluZyBvciBkcml2ZXIKPj4gPj4gc2hvdWxkIHN1
cHBvcnQgZml4ZWQgY2VsbHMgZGVmaW5lZCBpbiBkZXZpY2Ugbm9kZS4KPj4gPgo+PiA+IEknbSBu
b3Qgc3VyZSBJIGFncmVlIHdpdGggdGhpcyBzdGF0ZW1lbnQuIFdlIGFyZSBub3QgcHJldmVudGlu
ZyBuZXcKPj4gPiBiaW5kaW5nL2RyaXZlciB0byB1c2UgZml4ZWQgY2VsbHMsIG9yLi4uPyBXZSBv
ZmZlciBhIG5ldyB3YXkgdG8gZXhwb3NlCj4+ID4gbnZtZW0gY2VsbHMgd2l0aCBhbm90aGVyIHdh
eSB0aGFuICJmaXhlZC1vZmZzZXQiIGFuZCAiZml4ZWQtc2l6ZSIgT0YKPj4gPiBub2Rlcy4KPj4g
Cj4+ICBGcm9tIHdoYXQgSSB1bmRlcnN0b29kIGFsbCBuZXcgTlZNRU0gYmluZGluZ3Mgc2hvdWxk
IGhhdmUgY2VsbHMgCj4+IGRlZmluZWQKPj4gaW4gdGhlIG52bWVtLWxheW91dCB7IH0gbm9kZS4g
VGhhdCdzIHdoYXQgSSBtZWFuIGJ5IHNheWluZyB0aGV5IHNob3VsZAo+PiBub3QgYmUgZGVmaW5l
ZCBpbiBkZXZpY2Ugbm9kZSAoYnV0IGl0cyAibnZtZW0tbGF5b3V0IiBpbnN0ZWFkKS4KPiAKPiBM
YXlvdXRzIGFyZSBqdXN0IGFub3RoZXIgcG9zc2liaWxpdHksIGVpdGhlciB5b3UgdXNlciB0aGUg
bnZtZW0tY2VsbHMKPiBjb21wYXRpYmxlIGFuZCBwcm9kdWNlIG52bWVtIGNlbGxzIHdpdGggZml4
ZWQgT0Ygbm9kZXMsIG9yIHlvdSB1c2UgdGhlCj4gbnZtZW0tbGF5b3V0IGNvbnRhaW5lci4gSSBk
b24ndCB0aGluayBhbGwgbmV3IGJpbmRpbmdzIHNob3VsZCBoYXZlCj4gY2VsbHMgaW4gbGF5b3V0
cy4gSXQgZGVwZW5kcyBpZiB0aGUgY29udGVudCBpcyBzdGF0aWMgb3Igbm90Lgo+IAo+PiA+PiBT
b2x2ZSB0aGlzIGJ5IG1vZGlmeWluZyBkcml2ZXJzIGZvciBiaW5kaW5ncyB0aGF0IHN1cHBvcnQg
c3BlY2lmeWluZwo+PiA+PiBmaXhlZCBOVk1FTSBjZWxscyBpbiBEVC4gTWFrZSB0aGVtIGV4cGxp
Y2l0bHkgdGVsbCBOVk1FTSBzdWJzeXN0ZW0gdG8KPj4gPj4gcmVhZCBjZWxscyBmcm9tIERULgo+
PiA+PiA+PiBJdCB3YXNuJ3QgY2xlYXIgKHRvIG1lKSBpZiBydGMgYW5kIHcxIGNvZGUgYWN0dWFs
bHkgdXNlcyBmaXhlZCBjZWxscy4gPj4gSQo+PiA+PiBlbmFibGVkIHRoZW0gdG8gZG9uJ3Qgcmlz
ayBhbnkgYnJlYWthZ2UuCj4+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KPj4gPj4gW2ZvciBkcml2ZXJzL252bWVtL21lc29uLXtlZnVzZSxt
eC1lZnVzZX0uY10KPj4gPj4gQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4+ID4+IC0tLQo+PiA+PiBWMjogRml4IHN0bTMy
LXJvbWVtLmMgdHlwbyBicmVha2luZyBpdHMgY29tcGlsYXRpb24KPj4gPj4gICAgIFBpY2sgTWFy
dGluJ3MgQWNrZWQtYnkKPj4gPj4gICAgIEFkZCBwYXJhZ3JhcGggYWJvdXQgbGF5b3V0cyBkZXBy
ZWNhdGluZyB1c2VfZml4ZWRfb2ZfY2VsbHMKPj4gPj4gLS0tCj4+ID4+ICBkcml2ZXJzL210ZC9t
dGRjb3JlLmMgICAgICAgICAgfCAyICsrCj4+ID4+ICBkcml2ZXJzL252bWVtL2FwcGxlLWVmdXNl
cy5jICAgfCAxICsKPj4gPj4gIGRyaXZlcnMvbnZtZW0vY29yZS5jICAgICAgICAgICB8IDggKysr
KystLS0KPj4gPj4gIGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLXNjdS5jICB8IDEgKwo+PiA+PiAg
ZHJpdmVycy9udm1lbS9pbXgtb2NvdHAuYyAgICAgIHwgMSArCj4+ID4+ICBkcml2ZXJzL252bWVt
L21lc29uLWVmdXNlLmMgICAgfCAxICsKPj4gPj4gIGRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1
c2UuYyB8IDEgKwo+PiA+PiAgZHJpdmVycy9udm1lbS9taWNyb2NoaXAtb3RwYy5jIHwgMSArCj4+
ID4+ICBkcml2ZXJzL252bWVtL210ay1lZnVzZS5jICAgICAgfCAxICsKPj4gPj4gIGRyaXZlcnMv
bnZtZW0vcWNvbS1zcG1pLXNkYW0uYyB8IDEgKwo+PiA+PiAgZHJpdmVycy9udm1lbS9xZnByb20u
YyAgICAgICAgIHwgMSArCj4+ID4+ICBkcml2ZXJzL252bWVtL3JhdmUtc3AtZWVwcm9tLmMgfCAx
ICsKPj4gPj4gIGRyaXZlcnMvbnZtZW0vcm9ja2NoaXAtZWZ1c2UuYyB8IDEgKwo+PiA+PiAgZHJp
dmVycy9udm1lbS9zYzI3eHgtZWZ1c2UuYyAgIHwgMSArCj4+ID4+ICBkcml2ZXJzL252bWVtL3Nw
cmQtZWZ1c2UuYyAgICAgfCAxICsKPj4gPj4gIGRyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYyAg
ICB8IDEgKwo+PiA+PiAgZHJpdmVycy9udm1lbS9zdW5wbHVzLW9jb3RwLmMgIHwgMSArCj4+ID4+
ICBkcml2ZXJzL252bWVtL3N1bnhpX3NpZC5jICAgICAgfCAxICsKPj4gPj4gIGRyaXZlcnMvbnZt
ZW0vdW5pcGhpZXItZWZ1c2UuYyB8IDEgKwo+PiA+PiAgZHJpdmVycy9udm1lbS96eW5xbXBfbnZt
ZW0uYyAgIHwgMSArCj4+ID4+ICBkcml2ZXJzL3J0Yy9udm1lbS5jICAgICAgICAgICAgfCAxICsK
Pj4gPj4gIGRyaXZlcnMvdzEvc2xhdmVzL3cxX2RzMjUweC5jICB8IDEgKwo+PiA+PiAgaW5jbHVk
ZS9saW51eC9udm1lbS1wcm92aWRlci5oIHwgMiArKwo+PiA+PiAgMjMgZmlsZXMgY2hhbmdlZCwg
MjkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4gPj4gPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+PiA+PiBpbmRleCAw
ZmVhY2I5ZmJkYWMuLjFiYjQ3OWMwZjc1OCAxMDA2NDQKPj4gPj4gLS0tIGEvZHJpdmVycy9tdGQv
bXRkY29yZS5jCj4+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+PiA+PiBAQCAtNTIz
LDYgKzUyMyw3IEBAIHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKPj4gPj4gIAljb25maWcuZGV2ID0gJm10ZC0+ZGV2Owo+PiA+PiAgCWNvbmZpZy5uYW1lID0g
ZGV2X25hbWUoJm10ZC0+ZGV2KTsKPj4gPj4gIAljb25maWcub3duZXIgPSBUSElTX01PRFVMRTsK
Pj4gPj4gKwljb25maWcudXNlX2ZpeGVkX29mX2NlbGxzID0gb2ZfZGV2aWNlX2lzX2NvbXBhdGli
bGUobm9kZSwgPj4gIm52bWVtLWNlbGxzIik7Cj4+ID4KPj4gPiBJIGFtIHdvbmRlcmluZyBob3cg
bXRkIHNwZWNpZmljIHRoaXMgaXM/IEZvciBtZSBhbGwgT0Ygbm9kZXMgY29udGFpbmluZwo+PiA+
IHRoZSBudm1lbS1jZWxscyBjb21wYXRpYmxlIHNob3VsZCBiZSB0cmVhdGVkIGFzIGNlbGxzIHBy
b3ZpZGVycyBhbmQKPj4gPiBwb3B1bGF0ZSBudm1lbSBjZWxscyBhcyBmb3IgZWFjaCBjaGlsZHJl
bi4KPj4gPgo+PiA+IFdoeSBkb24ndCB3ZSBqdXN0IGNoZWNrIGZvciB0aGlzIGNvbXBhdGlibGUg
dG8gYmUgcHJlc2VudD8gaW4KPj4gPiBudm1lbV9hZGRfY2VsbHNfZnJvbV9vZigpID8gQW5kIGlm
IG5vdCB3ZSBqdXN0IHNraXAgdGhlIG9wZXJhdGlvbi4KPj4gPgo+PiA+IFRoaXMgd2F5IHdlIHN0
aWxsIGZvbGxvdyB0aGUgYmluZGluZ3MgKGV2ZW4gdGhvdWdoIHVzaW5nIG52bWVtLWNlbGxzIGlu
Cj4+ID4gdGhlIGNvbXBhdGlibGUgcHJvcGVydHkgdG8gcmVxdWlyZSBjZWxscyBwb3B1bGF0aW9u
IHdhcyBhIG1pc3Rha2UgaW4KPj4gPiB0aGUgZmlyc3QgcGxhY2UsIGFzIGRpc2N1c3NlZCBpbiB0
aGUgZGV2bGluayB0aHJlYWQgcmVjZW50bHkpIGJ1dCB0aGVyZQo+PiA+IGlzIG5vIG5lZWQgZm9y
IGEgcGVyLWRyaXZlciBjb25maWcgb3B0aW9uPwo+PiAKPj4gVGhpcyBpc24ndCBtdGQgc3BlY2lm
aWMuIFBsZWFzZSBjaGVjayB0aGlzIHBhdGNoIGZvciBhbGwgb2NjdXJyZW5jZXMgCj4+IG9mCj4+
IHRoZToKPj4gdXNlX2ZpeGVkX29mX2NlbGxzID0gdHJ1ZQo+PiAKPj4gVGhlIHZlcnkgZmlyc3Qg
b25lOiBkcml2ZXJzL252bWVtL2FwcGxlLWVmdXNlcy5jIGRyaXZlciBmb3IgdGhlCj4+ICJhcHBs
ZSxlZnVzZXMiIGJpbmRpbmcuIFRoYXQgYmluZGluZyBzdXBwb3J0cyBmaXhlZCBPRiBjZWxscywg
c2VlOgo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYXBwbGUsZWZ1
c2VzLnlhbWwKPiAKPiBJJ20gc2F5aW5nOiBiYXNlZCBvbiB3aGF0IGhhcyBiZWVuIGVuZm9yY2Vk
IHNvIGZhciwgSSB3b3VsZCBleHBlY3QgYWxsCj4gZml4ZWQgY2VsbCBwcm92aWRlcnMgdG8gY29t
ZSB3aXRoIG52bWVtLWNlbGxzIGFzIGNvbXBhdGlibGUsIG5vPwo+IAo+IElmIHRoYXQncyB0aGUg
Y2FzZSB3ZSBjb3VsZCB1c2UgdGhhdCBhcyBhIGNvbW1vbiBkZW5vbWluYXRvcj8KClNvcnJ5LCBJ
IGRvbid0IGdldCBpdC4gSGF2ZSB5b3UgY2hlY2tlZApEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbnZtZW0vYXBwbGUsZWZ1c2VzLnlhbWwKPwoKSXQncyBhIE5WTUVNIHByb3ZpZWQg
YmluZGluZyB3aXRoIGZpeGVkIGNlbGxzIHRoYXQgZG9lc24ndCB1c2UKbnZtZW0tY2VsbHMgYXMg
Y29tcGF0aWJsZS4gVGhlcmUgYXJlIG1hbnkgbW9yZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
