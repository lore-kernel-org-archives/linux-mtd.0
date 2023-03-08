Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE114C64EC4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqhYP31zO8UQiOClum6/2h+AlbFITBPsC371w6Du0B4=; b=bBIcYP9jefLWJPEeW0jrVuyrHS
	XTuaSko1Itrt3uFCMsuLhKFTNKNELvM5faYBBk1MR01f1ZZTf6Wow1etl5h7fhOAIyFxFKsiOaIj3
	Yv89Tm96679NtbETZBt13Gyn/FiWwlygPLa/p2bYrcW6hNyT8j1YF094birQwGufyb4ijZk6Mlw9w
	IRiIRah+zvYjMrgNVzFiGbnaVPJjNqz2zpWAiLL1SmS22plkT7f1Xbqoa9fG8CoN508m/pozbgdKQ
	5Flw+GK702FaPOFGWLKTikKWURgKf5PNtl3dw6XTx4KzgeiiUSfw/+H7MxR/SJJZhH/19LHG6dD4J
	bBDN2hGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZx5D-0060gH-Ke; Wed, 08 Mar 2023 16:56:07 +0000
Received: from 8.mo581.mail-out.ovh.net ([46.105.77.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZx57-0060cv-Vw
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 16:56:05 +0000
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.16.96])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 872E4273B1
	for <linux-mtd@lists.infradead.org>; Wed,  8 Mar 2023 16:55:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-thdkc (unknown [10.108.4.11])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 753361FE33;
	Wed,  8 Mar 2023 16:55:46 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
	by ghost-submission-6684bf9d7b-thdkc with ESMTPSA
	id /Qw+GhK+CGScog0A/TOSEw
	(envelope-from <rafal@milecki.pl>); Wed, 08 Mar 2023 16:55:46 +0000
MIME-Version: 1.0
Date: Wed, 08 Mar 2023 17:55:46 +0100
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
In-Reply-To: <20230308173256.3837b87b@xps-13>
References: <20230224072903.20945-1-zajec5@gmail.com>
 <20230308173256.3837b87b@xps-13>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <91ff425b4c901648b1faf34c784f20ad@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 13697979742194281287
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddufedggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejvdelgfeutdfhfeelheegfedtleduleeuvdfgfeefvefhvedtheetjeetfeehgeenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefpddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_085602_348786_95D02E3A 
X-CRM114-Status: GOOD (  31.05  )
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

T24gMjAyMy0wMy0wOCAxNzozNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBSYWZhxYIsCj4g
Cj4gemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDI0IEZlYiAyMDIzIDA4OjI5OjAzICsw
MTAwOgo+IAo+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+IAo+
PiBOVk1FTSBzdWJzeXN0ZW0gbG9va3MgZm9yIGZpeGVkIE5WTUVNIGNlbGxzIChzcGVjaWZpZWQg
aW4gRFQpIGJ5Cj4+IGRlZmF1bHQuIFRoaXMgYmVoYXZpb3VyIG1hZGUgc2Vuc2UgaW4gZWFybHkg
ZGF5cyBiZWZvcmUgYWRkaW5nIHN1cHBvcnQKPj4gZm9yIGR5bmFtaWMgY2VsbHMuCj4+IAo+PiBX
aXRoIGV2ZXJ5IG5ldyBzdXBwb3J0ZWQgTlZNRU0gZGV2aWNlIHdpdGggZHluYW1pYyBjZWxscyBj
dXJyZW50Cj4+IGJlaGF2aW91ciBiZWNvbWVzIG5vbi1vcHRpbWFsLiBJdCByZXN1bHRzIGluIHVu
bmVlZGVkIGl0ZXJhdGluZyBvdmVyIAo+PiBEVAo+PiBub2RlcyBhbmQgbWF5IHJlc3VsdCBpbiBm
YWxzZSBkaXNjb3Zlcnkgb2YgY2VsbHMgKGRlcGVuZGluZyBvbiB1c2VkIERUCj4+IHByb3BlcnRp
ZXMpLgo+PiAKPj4gVGhpcyBiZWhhdmlvdXIgaGFzIGFjdHVhbGx5IGNhdXNlZCBhIHByb2JsZW0g
YWxyZWFkeSB3aXRoIHRoZSBNVEQKPj4gc3Vic3lzdGVtLiBNVEQgc3VicGFydGl0aW9ucyB3ZXJl
IGluY29ycmVjdGx5IHRyZWF0ZWQgYXMgTlZNRU0gY2VsbHMuCj4gCj4gVGhhdCdzIHRydWUsIGJ1
dCBJIGV4cGVjdCB0aGlzIHRvIGJlIHJlYWxseSBNVEQgc3BlY2lmaWMuCj4gCj4gQSBjb25jcmV0
ZSBwcm9wb3NhbCBiZWxvdy4KPiAKPj4gQWxzbyB3aXRoIHVwY29taW5nIHN1cHBvcnQgZm9yIE5W
TUVNIGxheW91dHMgbm8gbmV3IGJpbmRpbmcgb3IgZHJpdmVyCj4+IHNob3VsZCBzdXBwb3J0IGZp
eGVkIGNlbGxzIGRlZmluZWQgaW4gZGV2aWNlIG5vZGUuCj4gCj4gSSdtIG5vdCBzdXJlIEkgYWdy
ZWUgd2l0aCB0aGlzIHN0YXRlbWVudC4gV2UgYXJlIG5vdCBwcmV2ZW50aW5nIG5ldwo+IGJpbmRp
bmcvZHJpdmVyIHRvIHVzZSBmaXhlZCBjZWxscywgb3IuLi4/IFdlIG9mZmVyIGEgbmV3IHdheSB0
byBleHBvc2UKPiBudm1lbSBjZWxscyB3aXRoIGFub3RoZXIgd2F5IHRoYW4gImZpeGVkLW9mZnNl
dCIgYW5kICJmaXhlZC1zaXplIiBPRgo+IG5vZGVzLgoKIEZyb20gd2hhdCBJIHVuZGVyc3Rvb2Qg
YWxsIG5ldyBOVk1FTSBiaW5kaW5ncyBzaG91bGQgaGF2ZSBjZWxscyBkZWZpbmVkCmluIHRoZSBu
dm1lbS1sYXlvdXQgeyB9IG5vZGUuIFRoYXQncyB3aGF0IEkgbWVhbiBieSBzYXlpbmcgdGhleSBz
aG91bGQKbm90IGJlIGRlZmluZWQgaW4gZGV2aWNlIG5vZGUgKGJ1dCBpdHMgIm52bWVtLWxheW91
dCIgaW5zdGVhZCkuCgoKPj4gU29sdmUgdGhpcyBieSBtb2RpZnlpbmcgZHJpdmVycyBmb3IgYmlu
ZGluZ3MgdGhhdCBzdXBwb3J0IHNwZWNpZnlpbmcKPj4gZml4ZWQgTlZNRU0gY2VsbHMgaW4gRFQu
IE1ha2UgdGhlbSBleHBsaWNpdGx5IHRlbGwgTlZNRU0gc3Vic3lzdGVtIHRvCj4+IHJlYWQgY2Vs
bHMgZnJvbSBEVC4KPj4gCj4+IEl0IHdhc24ndCBjbGVhciAodG8gbWUpIGlmIHJ0YyBhbmQgdzEg
Y29kZSBhY3R1YWxseSB1c2VzIGZpeGVkIGNlbGxzLiAKPj4gSQo+PiBlbmFibGVkIHRoZW0gdG8g
ZG9uJ3QgcmlzayBhbnkgYnJlYWthZ2UuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnF
gmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+IFtmb3IgZHJpdmVycy9udm1lbS9tZXNvbi17ZWZ1
c2UsbXgtZWZ1c2V9LmNdCj4+IEFja2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+PiAtLS0KPj4gVjI6IEZpeCBzdG0zMi1yb21l
bS5jIHR5cG8gYnJlYWtpbmcgaXRzIGNvbXBpbGF0aW9uCj4+ICAgICBQaWNrIE1hcnRpbidzIEFj
a2VkLWJ5Cj4+ICAgICBBZGQgcGFyYWdyYXBoIGFib3V0IGxheW91dHMgZGVwcmVjYXRpbmcgdXNl
X2ZpeGVkX29mX2NlbGxzCj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvbXRkY29yZS5jICAgICAgICAg
IHwgMiArKwo+PiAgZHJpdmVycy9udm1lbS9hcHBsZS1lZnVzZXMuYyAgIHwgMSArCj4+ICBkcml2
ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgfCA4ICsrKysrLS0tCj4+ICBkcml2ZXJzL252bWVt
L2lteC1vY290cC1zY3UuYyAgfCAxICsKPj4gIGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLmMgICAg
ICB8IDEgKwo+PiAgZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jICAgIHwgMSArCj4+ICBkcml2
ZXJzL252bWVtL21lc29uLW14LWVmdXNlLmMgfCAxICsKPj4gIGRyaXZlcnMvbnZtZW0vbWljcm9j
aGlwLW90cGMuYyB8IDEgKwo+PiAgZHJpdmVycy9udm1lbS9tdGstZWZ1c2UuYyAgICAgIHwgMSAr
Cj4+ICBkcml2ZXJzL252bWVtL3Fjb20tc3BtaS1zZGFtLmMgfCAxICsKPj4gIGRyaXZlcnMvbnZt
ZW0vcWZwcm9tLmMgICAgICAgICB8IDEgKwo+PiAgZHJpdmVycy9udm1lbS9yYXZlLXNwLWVlcHJv
bS5jIHwgMSArCj4+ICBkcml2ZXJzL252bWVtL3JvY2tjaGlwLWVmdXNlLmMgfCAxICsKPj4gIGRy
aXZlcnMvbnZtZW0vc2MyN3h4LWVmdXNlLmMgICB8IDEgKwo+PiAgZHJpdmVycy9udm1lbS9zcHJk
LWVmdXNlLmMgICAgIHwgMSArCj4+ICBkcml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMgICAgfCAx
ICsKPj4gIGRyaXZlcnMvbnZtZW0vc3VucGx1cy1vY290cC5jICB8IDEgKwo+PiAgZHJpdmVycy9u
dm1lbS9zdW54aV9zaWQuYyAgICAgIHwgMSArCj4+ICBkcml2ZXJzL252bWVtL3VuaXBoaWVyLWVm
dXNlLmMgfCAxICsKPj4gIGRyaXZlcnMvbnZtZW0venlucW1wX252bWVtLmMgICB8IDEgKwo+PiAg
ZHJpdmVycy9ydGMvbnZtZW0uYyAgICAgICAgICAgIHwgMSArCj4+ICBkcml2ZXJzL3cxL3NsYXZl
cy93MV9kczI1MHguYyAgfCAxICsKPj4gIGluY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCB8
IDIgKysKPj4gIDIzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9t
dGQvbXRkY29yZS5jCj4+IGluZGV4IDBmZWFjYjlmYmRhYy4uMWJiNDc5YzBmNzU4IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29y
ZS5jCj4+IEBAIC01MjMsNiArNTIzLDcgQEAgc3RhdGljIGludCBtdGRfbnZtZW1fYWRkKHN0cnVj
dCBtdGRfaW5mbyAqbXRkKQo+PiAgCWNvbmZpZy5kZXYgPSAmbXRkLT5kZXY7Cj4+ICAJY29uZmln
Lm5hbWUgPSBkZXZfbmFtZSgmbXRkLT5kZXYpOwo+PiAgCWNvbmZpZy5vd25lciA9IFRISVNfTU9E
VUxFOwo+PiArCWNvbmZpZy51c2VfZml4ZWRfb2ZfY2VsbHMgPSBvZl9kZXZpY2VfaXNfY29tcGF0
aWJsZShub2RlLCAKPj4gIm52bWVtLWNlbGxzIik7Cj4gCj4gSSBhbSB3b25kZXJpbmcgaG93IG10
ZCBzcGVjaWZpYyB0aGlzIGlzPyBGb3IgbWUgYWxsIE9GIG5vZGVzIGNvbnRhaW5pbmcKPiB0aGUg
bnZtZW0tY2VsbHMgY29tcGF0aWJsZSBzaG91bGQgYmUgdHJlYXRlZCBhcyBjZWxscyBwcm92aWRl
cnMgYW5kCj4gcG9wdWxhdGUgbnZtZW0gY2VsbHMgYXMgZm9yIGVhY2ggY2hpbGRyZW4uCj4gCj4g
V2h5IGRvbid0IHdlIGp1c3QgY2hlY2sgZm9yIHRoaXMgY29tcGF0aWJsZSB0byBiZSBwcmVzZW50
PyBpbgo+IG52bWVtX2FkZF9jZWxsc19mcm9tX29mKCkgPyBBbmQgaWYgbm90IHdlIGp1c3Qgc2tp
cCB0aGUgb3BlcmF0aW9uLgo+IAo+IFRoaXMgd2F5IHdlIHN0aWxsIGZvbGxvdyB0aGUgYmluZGlu
Z3MgKGV2ZW4gdGhvdWdoIHVzaW5nIG52bWVtLWNlbGxzIGluCj4gdGhlIGNvbXBhdGlibGUgcHJv
cGVydHkgdG8gcmVxdWlyZSBjZWxscyBwb3B1bGF0aW9uIHdhcyBhIG1pc3Rha2UgaW4KPiB0aGUg
Zmlyc3QgcGxhY2UsIGFzIGRpc2N1c3NlZCBpbiB0aGUgZGV2bGluayB0aHJlYWQgcmVjZW50bHkp
IGJ1dCB0aGVyZQo+IGlzIG5vIG5lZWQgZm9yIGEgcGVyLWRyaXZlciBjb25maWcgb3B0aW9uPwoK
VGhpcyBpc24ndCBtdGQgc3BlY2lmaWMuIFBsZWFzZSBjaGVjayB0aGlzIHBhdGNoIGZvciBhbGwg
b2NjdXJyZW5jZXMgb2YKdGhlOgp1c2VfZml4ZWRfb2ZfY2VsbHMgPSB0cnVlCgpUaGUgdmVyeSBm
aXJzdCBvbmU6IGRyaXZlcnMvbnZtZW0vYXBwbGUtZWZ1c2VzLmMgZHJpdmVyIGZvciB0aGUKImFw
cGxlLGVmdXNlcyIgYmluZGluZy4gVGhhdCBiaW5kaW5nIHN1cHBvcnRzIGZpeGVkIE9GIGNlbGxz
LCBzZWU6CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9hcHBsZSxlZnVz
ZXMueWFtbAoKCj4+ICAJY29uZmlnLnJlZ19yZWFkID0gbXRkX252bWVtX3JlZ19yZWFkOwo+PiAg
CWNvbmZpZy5zaXplID0gbXRkLT5zaXplOwo+PiAgCWNvbmZpZy53b3JkX3NpemUgPSAxOwo+PiBA
QCAtODkxLDYgKzg5Miw3IEBAIHN0YXRpYyBzdHJ1Y3QgbnZtZW1fZGV2aWNlIAo+PiAqbXRkX290
cF9udm1lbV9yZWdpc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPj4gIAljb25maWcubmFtZSA9
IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiJXMtJXMiLCBkZXZfbmFtZSgmbXRkLT5kZXYpLCAKPj4g
Y29tcGF0aWJsZSk7Cj4+ICAJY29uZmlnLmlkID0gTlZNRU1fREVWSURfTk9ORTsKPj4gIAljb25m
aWcub3duZXIgPSBUSElTX01PRFVMRTsKPj4gKwljb25maWcudXNlX2ZpeGVkX29mX2NlbGxzID0g
dHJ1ZTsKPj4gIAljb25maWcudHlwZSA9IE5WTUVNX1RZUEVfT1RQOwo+PiAgCWNvbmZpZy5yb290
X29ubHkgPSB0cnVlOwo+PiAgCWNvbmZpZy5pZ25vcmVfd3AgPSB0cnVlOwo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9udm1lbS9hcHBsZS1lZnVzZXMuYyAKPj4gYi9kcml2ZXJzL252bWVtL2FwcGxl
LWVmdXNlcy5jCj4+IGluZGV4IDliN2M4NzEwMjEwNC4uMDExOWJhYzQzYjJjIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL252bWVtL2FwcGxlLWVmdXNlcy5jCj4+ICsrKyBiL2RyaXZlcnMvbnZtZW0v
YXBwbGUtZWZ1c2VzLmMKPj4gQEAgLTM2LDYgKzM2LDcgQEAgc3RhdGljIGludCBhcHBsZV9lZnVz
ZXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAKPj4gKnBkZXYpCj4+ICAJc3RydWN0IHJl
c291cmNlICpyZXM7Cj4+ICAJc3RydWN0IG52bWVtX2NvbmZpZyBjb25maWcgPSB7Cj4+ICAJCS5k
ZXYgPSAmcGRldi0+ZGV2LAo+PiArCQkudXNlX2ZpeGVkX29mX2NlbGxzID0gdHJ1ZSwKPj4gIAkJ
LnJlYWRfb25seSA9IHRydWUsCj4+ICAJCS5yZWdfcmVhZCA9IGFwcGxlX2VmdXNlc19yZWFkLAo+
PiAgCQkuc3RyaWRlID0gc2l6ZW9mKHUzMiksCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVt
L2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4+IGluZGV4IDE3NGVmMzU3NGUwNy4uNjc4
M2NkODQ3OGQ3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL252bWVtL2NvcmUuYwo+PiArKysgYi9k
cml2ZXJzL252bWVtL2NvcmUuYwo+PiBAQCAtODQ0LDkgKzg0NCwxMSBAQCBzdHJ1Y3QgbnZtZW1f
ZGV2aWNlICpudm1lbV9yZWdpc3Rlcihjb25zdCBzdHJ1Y3QgCj4+IG52bWVtX2NvbmZpZyAqY29u
ZmlnKQo+PiAgCWlmIChydmFsKQo+PiAgCQlnb3RvIGVycl9yZW1vdmVfY2VsbHM7Cj4+IAo+PiAt
CXJ2YWwgPSBudm1lbV9hZGRfY2VsbHNfZnJvbV9vZihudm1lbSk7Cj4+IC0JaWYgKHJ2YWwpCj4+
IC0JCWdvdG8gZXJyX3JlbW92ZV9jZWxsczsKPj4gKwlpZiAoY29uZmlnLT51c2VfZml4ZWRfb2Zf
Y2VsbHMpIHsKPj4gKwkJcnZhbCA9IG52bWVtX2FkZF9jZWxsc19mcm9tX29mKG52bWVtKTsKPj4g
KwkJaWYgKHJ2YWwpCj4+ICsJCQlnb3RvIGVycl9yZW1vdmVfY2VsbHM7Cj4+ICsJfQo+PiAKPj4g
IAlkZXZfZGJnKCZudm1lbS0+ZGV2LCAiUmVnaXN0ZXJpbmcgbnZtZW0gZGV2aWNlICVzXG4iLCBj
b25maWctPm5hbWUpOwo+PiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
