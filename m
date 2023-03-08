Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516CDC6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 18:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRFMQR3D9g3oDtaH6yKdMDPdJ7JGKXzIRMMozdr9fNM=; b=dSFJYeYI4SVdTk
	4PD46lUSDPScv1yUdA1tcqmVP4aqu790senlkIWQvmfnJJE2ssjerH23/VhiuBdexE26HHf5bhF3g
	82x2/GljC0abWJ/6nn/qFVgIvW4W1Hn0K+vZcwSbF0FSAdVCxdN4De/K9a9ojzyD5R1TIMCCaoxIE
	h7sVI/Z90mafOGad9CbqPeQr910Q0bwPc4+vPfkQ51qtBHlefzrwYZVACJdGNzwWeaeEdq+C3Jf9B
	Q+m6xoMWqTp9LGbs6j+2ajocW7M3hGGErLsixLSe1wZso5/fmpIU94NwUPo8eIlSi0VYdQXHTzPJI
	j57tfc7AEA6RtzGth1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyZm-006Mu8-1r; Wed, 08 Mar 2023 18:31:46 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyZg-006Ms3-7g; Wed, 08 Mar 2023 18:31:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E339240005;
	Wed,  8 Mar 2023 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678300295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IE2mAjvNqXWB2ZmmfkBzebNZ3UKFN3Q87ghm1dunraM=;
	b=W9bpmY3/KK4H8XkPR5AErqDMuVx7gx1E72W3ekylox5c6Sb1rEoaG0nwEeCbQsUc6fByxS
	3PZpBawbq5O55tiA1JKMB5WB+fl+xGlvZNIIkCxD0BVegUIaYhJ86Z7HDmbu6JgNt7O36Q
	KczTEKWoIBBtiUPEE1mzlJ8L3xWUVUHSuQq9Fv2DewrgLpVSiS05S/U+XBCe5KjNrcLjrq
	zJjci2YlnX3uHUsv5p9FYMGHzDICiiJZDFiKjvNvjG0iu7BTOTVKX/AFVZKghFBpWyCpwD
	wYIXSzk/QdQeStQWTRLDE6ufZtwkm0Ub+sRPvLPoXU1/cVvB2P656eC6WpRDow==
Date: Wed, 8 Mar 2023 19:31:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
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
Message-ID: <20230308193121.7f5b3d02@xps-13>
In-Reply-To: <5974d28426057975e701c4a8454b5a13@milecki.pl>
References: <20230224072903.20945-1-zajec5@gmail.com>
	<20230308173256.3837b87b@xps-13>
	<91ff425b4c901648b1faf34c784f20ad@milecki.pl>
	<20230308190636.7fabab9c@xps-13>
	<5974d28426057975e701c4a8454b5a13@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_103140_627966_6DB5820D 
X-CRM114-Status: GOOD (  43.39  )
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

SGkgUmFmYcWCLAoKcmFmYWxAbWlsZWNraS5wbCB3cm90ZSBvbiBXZWQsIDA4IE1hciAyMDIzIDE5
OjEyOjMyICswMTAwOgoKPiBPbiAyMDIzLTAzLTA4IDE5OjA2LCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gSGkgUmFmYcWCLAo+ID4gCj4gPiByYWZhbEBtaWxlY2tpLnBsIHdyb3RlIG9uIFdlZCwg
MDggTWFyIDIwMjMgMTc6NTU6NDYgKzAxMDA6Cj4gPiAgIAo+ID4+IE9uIDIwMjMtMDMtMDggMTc6
MzQsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+PiA+IEhpIFJhZmHFgiwKPiA+PiA+Cj4gPj4g
PiB6YWplYzVAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgMjQgRmViIDIwMjMgMDg6Mjk6MDMgKzAx
MDA6Cj4gPj4gPiAgCj4gPj4gPj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPiAgCj4gPj4gPj4gPj4gTlZNRU0gc3Vic3lzdGVtIGxvb2tzIGZvciBmaXhlZCBOVk1FTSBj
ZWxscyAoc3BlY2lmaWVkIGluIERUKSBieSAgCj4gPj4gPj4gZGVmYXVsdC4gVGhpcyBiZWhhdmlv
dXIgbWFkZSBzZW5zZSBpbiBlYXJseSBkYXlzIGJlZm9yZSBhZGRpbmcgc3VwcG9ydAo+ID4+ID4+
IGZvciBkeW5hbWljIGNlbGxzLiAgCj4gPj4gPj4gPj4gV2l0aCBldmVyeSBuZXcgc3VwcG9ydGVk
IE5WTUVNIGRldmljZSB3aXRoIGR5bmFtaWMgY2VsbHMgY3VycmVudCAgCj4gPj4gPj4gYmVoYXZp
b3VyIGJlY29tZXMgbm9uLW9wdGltYWwuIEl0IHJlc3VsdHMgaW4gdW5uZWVkZWQgaXRlcmF0aW5n
IG92ZXIgPj4gRFQKPiA+PiA+PiBub2RlcyBhbmQgbWF5IHJlc3VsdCBpbiBmYWxzZSBkaXNjb3Zl
cnkgb2YgY2VsbHMgKGRlcGVuZGluZyBvbiB1c2VkIERUCj4gPj4gPj4gcHJvcGVydGllcykuICAK
PiA+PiA+PiA+PiBUaGlzIGJlaGF2aW91ciBoYXMgYWN0dWFsbHkgY2F1c2VkIGEgcHJvYmxlbSBh
bHJlYWR5IHdpdGggdGhlIE1URCAgCj4gPj4gPj4gc3Vic3lzdGVtLiBNVEQgc3VicGFydGl0aW9u
cyB3ZXJlIGluY29ycmVjdGx5IHRyZWF0ZWQgYXMgTlZNRU0gY2VsbHMuICAKPiA+PiA+Cj4gPj4g
PiBUaGF0J3MgdHJ1ZSwgYnV0IEkgZXhwZWN0IHRoaXMgdG8gYmUgcmVhbGx5IE1URCBzcGVjaWZp
Yy4KPiA+PiA+Cj4gPj4gPiBBIGNvbmNyZXRlIHByb3Bvc2FsIGJlbG93Lgo+ID4+ID4gIAo+ID4+
ID4+IEFsc28gd2l0aCB1cGNvbWluZyBzdXBwb3J0IGZvciBOVk1FTSBsYXlvdXRzIG5vIG5ldyBi
aW5kaW5nIG9yIGRyaXZlcgo+ID4+ID4+IHNob3VsZCBzdXBwb3J0IGZpeGVkIGNlbGxzIGRlZmlu
ZWQgaW4gZGV2aWNlIG5vZGUuICAKPiA+PiA+Cj4gPj4gPiBJJ20gbm90IHN1cmUgSSBhZ3JlZSB3
aXRoIHRoaXMgc3RhdGVtZW50LiBXZSBhcmUgbm90IHByZXZlbnRpbmcgbmV3Cj4gPj4gPiBiaW5k
aW5nL2RyaXZlciB0byB1c2UgZml4ZWQgY2VsbHMsIG9yLi4uPyBXZSBvZmZlciBhIG5ldyB3YXkg
dG8gZXhwb3NlCj4gPj4gPiBudm1lbSBjZWxscyB3aXRoIGFub3RoZXIgd2F5IHRoYW4gImZpeGVk
LW9mZnNldCIgYW5kICJmaXhlZC1zaXplIiBPRgo+ID4+ID4gbm9kZXMuICAKPiA+PiA+PiAgRnJv
bSB3aGF0IEkgdW5kZXJzdG9vZCBhbGwgbmV3IE5WTUVNIGJpbmRpbmdzIHNob3VsZCBoYXZlIGNl
bGxzID4+IGRlZmluZWQgIAo+ID4+IGluIHRoZSBudm1lbS1sYXlvdXQgeyB9IG5vZGUuIFRoYXQn
cyB3aGF0IEkgbWVhbiBieSBzYXlpbmcgdGhleSBzaG91bGQKPiA+PiBub3QgYmUgZGVmaW5lZCBp
biBkZXZpY2Ugbm9kZSAoYnV0IGl0cyAibnZtZW0tbGF5b3V0IiBpbnN0ZWFkKS4gIAo+ID4gCj4g
PiBMYXlvdXRzIGFyZSBqdXN0IGFub3RoZXIgcG9zc2liaWxpdHksIGVpdGhlciB5b3UgdXNlciB0
aGUgbnZtZW0tY2VsbHMKPiA+IGNvbXBhdGlibGUgYW5kIHByb2R1Y2UgbnZtZW0gY2VsbHMgd2l0
aCBmaXhlZCBPRiBub2Rlcywgb3IgeW91IHVzZSB0aGUKPiA+IG52bWVtLWxheW91dCBjb250YWlu
ZXIuIEkgZG9uJ3QgdGhpbmsgYWxsIG5ldyBiaW5kaW5ncyBzaG91bGQgaGF2ZQo+ID4gY2VsbHMg
aW4gbGF5b3V0cy4gSXQgZGVwZW5kcyBpZiB0aGUgY29udGVudCBpcyBzdGF0aWMgb3Igbm90Lgo+
ID4gICAKPiA+PiA+PiBTb2x2ZSB0aGlzIGJ5IG1vZGlmeWluZyBkcml2ZXJzIGZvciBiaW5kaW5n
cyB0aGF0IHN1cHBvcnQgc3BlY2lmeWluZwo+ID4+ID4+IGZpeGVkIE5WTUVNIGNlbGxzIGluIERU
LiBNYWtlIHRoZW0gZXhwbGljaXRseSB0ZWxsIE5WTUVNIHN1YnN5c3RlbSB0bwo+ID4+ID4+IHJl
YWQgY2VsbHMgZnJvbSBEVC4gIAo+ID4+ID4+ID4+IEl0IHdhc24ndCBjbGVhciAodG8gbWUpIGlm
IHJ0YyBhbmQgdzEgY29kZSBhY3R1YWxseSB1c2VzIGZpeGVkIGNlbGxzLiA+PiBJICAKPiA+PiA+
PiBlbmFibGVkIHRoZW0gdG8gZG9uJ3QgcmlzayBhbnkgYnJlYWthZ2UuICAKPiA+PiA+PiA+PiBT
aWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+ICAKPiA+PiA+
PiBbZm9yIGRyaXZlcnMvbnZtZW0vbWVzb24te2VmdXNlLG14LWVmdXNlfS5jXQo+ID4+ID4+IEFj
a2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgo+ID4+ID4+IC0tLQo+ID4+ID4+IFYyOiBGaXggc3RtMzItcm9tZW0uYyB0eXBvIGJy
ZWFraW5nIGl0cyBjb21waWxhdGlvbgo+ID4+ID4+ICAgICBQaWNrIE1hcnRpbidzIEFja2VkLWJ5
Cj4gPj4gPj4gICAgIEFkZCBwYXJhZ3JhcGggYWJvdXQgbGF5b3V0cyBkZXByZWNhdGluZyB1c2Vf
Zml4ZWRfb2ZfY2VsbHMKPiA+PiA+PiAtLS0KPiA+PiA+PiAgZHJpdmVycy9tdGQvbXRkY29yZS5j
ICAgICAgICAgIHwgMiArKwo+ID4+ID4+ICBkcml2ZXJzL252bWVtL2FwcGxlLWVmdXNlcy5jICAg
fCAxICsKPiA+PiA+PiAgZHJpdmVycy9udm1lbS9jb3JlLmMgICAgICAgICAgIHwgOCArKysrKy0t
LQo+ID4+ID4+ICBkcml2ZXJzL252bWVtL2lteC1vY290cC1zY3UuYyAgfCAxICsKPiA+PiA+PiAg
ZHJpdmVycy9udm1lbS9pbXgtb2NvdHAuYyAgICAgIHwgMSArCj4gPj4gPj4gIGRyaXZlcnMvbnZt
ZW0vbWVzb24tZWZ1c2UuYyAgICB8IDEgKwo+ID4+ID4+ICBkcml2ZXJzL252bWVtL21lc29uLW14
LWVmdXNlLmMgfCAxICsKPiA+PiA+PiAgZHJpdmVycy9udm1lbS9taWNyb2NoaXAtb3RwYy5jIHwg
MSArCj4gPj4gPj4gIGRyaXZlcnMvbnZtZW0vbXRrLWVmdXNlLmMgICAgICB8IDEgKwo+ID4+ID4+
ICBkcml2ZXJzL252bWVtL3Fjb20tc3BtaS1zZGFtLmMgfCAxICsKPiA+PiA+PiAgZHJpdmVycy9u
dm1lbS9xZnByb20uYyAgICAgICAgIHwgMSArCj4gPj4gPj4gIGRyaXZlcnMvbnZtZW0vcmF2ZS1z
cC1lZXByb20uYyB8IDEgKwo+ID4+ID4+ICBkcml2ZXJzL252bWVtL3JvY2tjaGlwLWVmdXNlLmMg
fCAxICsKPiA+PiA+PiAgZHJpdmVycy9udm1lbS9zYzI3eHgtZWZ1c2UuYyAgIHwgMSArCj4gPj4g
Pj4gIGRyaXZlcnMvbnZtZW0vc3ByZC1lZnVzZS5jICAgICB8IDEgKwo+ID4+ID4+ICBkcml2ZXJz
L252bWVtL3N0bTMyLXJvbWVtLmMgICAgfCAxICsKPiA+PiA+PiAgZHJpdmVycy9udm1lbS9zdW5w
bHVzLW9jb3RwLmMgIHwgMSArCj4gPj4gPj4gIGRyaXZlcnMvbnZtZW0vc3VueGlfc2lkLmMgICAg
ICB8IDEgKwo+ID4+ID4+ICBkcml2ZXJzL252bWVtL3VuaXBoaWVyLWVmdXNlLmMgfCAxICsKPiA+
PiA+PiAgZHJpdmVycy9udm1lbS96eW5xbXBfbnZtZW0uYyAgIHwgMSArCj4gPj4gPj4gIGRyaXZl
cnMvcnRjL252bWVtLmMgICAgICAgICAgICB8IDEgKwo+ID4+ID4+ICBkcml2ZXJzL3cxL3NsYXZl
cy93MV9kczI1MHguYyAgfCAxICsKPiA+PiA+PiAgaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRl
ci5oIHwgMiArKwo+ID4+ID4+ICAyMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKSAgCj4gPj4gPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNv
cmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYyAgCj4gPj4gPj4gaW5kZXggMGZlYWNiOWZiZGFj
Li4xYmI0NzljMGY3NTggMTAwNjQ0Cj4gPj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5j
Cj4gPj4gPj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPj4gPj4gQEAgLTUyMyw2ICs1
MjMsNyBAQCBzdGF0aWMgaW50IG10ZF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4g
Pj4gPj4gIAljb25maWcuZGV2ID0gJm10ZC0+ZGV2Owo+ID4+ID4+ICAJY29uZmlnLm5hbWUgPSBk
ZXZfbmFtZSgmbXRkLT5kZXYpOwo+ID4+ID4+ICAJY29uZmlnLm93bmVyID0gVEhJU19NT0RVTEU7
Cj4gPj4gPj4gKwljb25maWcudXNlX2ZpeGVkX29mX2NlbGxzID0gb2ZfZGV2aWNlX2lzX2NvbXBh
dGlibGUobm9kZSwgPj4gIm52bWVtLWNlbGxzIik7ICAKPiA+PiA+Cj4gPj4gPiBJIGFtIHdvbmRl
cmluZyBob3cgbXRkIHNwZWNpZmljIHRoaXMgaXM/IEZvciBtZSBhbGwgT0Ygbm9kZXMgY29udGFp
bmluZwo+ID4+ID4gdGhlIG52bWVtLWNlbGxzIGNvbXBhdGlibGUgc2hvdWxkIGJlIHRyZWF0ZWQg
YXMgY2VsbHMgcHJvdmlkZXJzIGFuZAo+ID4+ID4gcG9wdWxhdGUgbnZtZW0gY2VsbHMgYXMgZm9y
IGVhY2ggY2hpbGRyZW4uCj4gPj4gPgo+ID4+ID4gV2h5IGRvbid0IHdlIGp1c3QgY2hlY2sgZm9y
IHRoaXMgY29tcGF0aWJsZSB0byBiZSBwcmVzZW50PyBpbgo+ID4+ID4gbnZtZW1fYWRkX2NlbGxz
X2Zyb21fb2YoKSA/IEFuZCBpZiBub3Qgd2UganVzdCBza2lwIHRoZSBvcGVyYXRpb24uCj4gPj4g
Pgo+ID4+ID4gVGhpcyB3YXkgd2Ugc3RpbGwgZm9sbG93IHRoZSBiaW5kaW5ncyAoZXZlbiB0aG91
Z2ggdXNpbmcgbnZtZW0tY2VsbHMgaW4KPiA+PiA+IHRoZSBjb21wYXRpYmxlIHByb3BlcnR5IHRv
IHJlcXVpcmUgY2VsbHMgcG9wdWxhdGlvbiB3YXMgYSBtaXN0YWtlIGluCj4gPj4gPiB0aGUgZmly
c3QgcGxhY2UsIGFzIGRpc2N1c3NlZCBpbiB0aGUgZGV2bGluayB0aHJlYWQgcmVjZW50bHkpIGJ1
dCB0aGVyZQo+ID4+ID4gaXMgbm8gbmVlZCBmb3IgYSBwZXItZHJpdmVyIGNvbmZpZyBvcHRpb24/
ICAKPiA+PiA+PiBUaGlzIGlzbid0IG10ZCBzcGVjaWZpYy4gUGxlYXNlIGNoZWNrIHRoaXMgcGF0
Y2ggZm9yIGFsbCBvY2N1cnJlbmNlcyA+PiBvZiAgCj4gPj4gdGhlOgo+ID4+IHVzZV9maXhlZF9v
Zl9jZWxscyA9IHRydWUgIAo+ID4+ID4+IFRoZSB2ZXJ5IGZpcnN0IG9uZTogZHJpdmVycy9udm1l
bS9hcHBsZS1lZnVzZXMuYyBkcml2ZXIgZm9yIHRoZSAgCj4gPj4gImFwcGxlLGVmdXNlcyIgYmlu
ZGluZy4gVGhhdCBiaW5kaW5nIHN1cHBvcnRzIGZpeGVkIE9GIGNlbGxzLCBzZWU6Cj4gPj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2FwcGxlLGVmdXNlcy55YW1sICAK
PiA+IAo+ID4gSSdtIHNheWluZzogYmFzZWQgb24gd2hhdCBoYXMgYmVlbiBlbmZvcmNlZCBzbyBm
YXIsIEkgd291bGQgZXhwZWN0IGFsbAo+ID4gZml4ZWQgY2VsbCBwcm92aWRlcnMgdG8gY29tZSB3
aXRoIG52bWVtLWNlbGxzIGFzIGNvbXBhdGlibGUsIG5vPwo+ID4gCj4gPiBJZiB0aGF0J3MgdGhl
IGNhc2Ugd2UgY291bGQgdXNlIHRoYXQgYXMgYSBjb21tb24gZGVub21pbmF0b3I/ICAKPiAKPiBT
b3JyeSwgSSBkb24ndCBnZXQgaXQuIEhhdmUgeW91IGNoZWNrZWQKPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYXBwbGUsZWZ1c2VzLnlhbWwKPiA/Cj4gCj4gSXQncyBh
IE5WTUVNIHByb3ZpZWQgYmluZGluZyB3aXRoIGZpeGVkIGNlbGxzIHRoYXQgZG9lc24ndCB1c2UK
PiBudm1lbS1jZWxscyBhcyBjb21wYXRpYmxlLiBUaGVyZSBhcmUgbWFueSBtb3JlLgoKT2ggeWVh
aCB5b3UncmUgcmlnaHQsIEknbSBtaXhpbmcgdGhpbmdzLiBXZWxsIEkgZ3Vlc3MgeW91J3JlIHJp
Z2h0CnRoZW4sIGl0J3Mgc3VjaCBhIG1lc3MsIHdlIGhhdmUgdG8gdGVsbCB0aGUgY29yZSB0aGUg
cGFyc2luZyBtZXRob2QuCgpTbyBtYXliZSBhbm90aGVyIHF1ZXN0aW9uOiBkbyB3ZSBoYXZlIG90
aGVyIHNpdHVhdGlvbnMgdGhhbiBtdGQgd2hpY2gKc29tZXRpbWVzIGV4cGVjdCB0aGUgbnZtZW0g
Y29yZSB0byBwYXJzZSB0aGUgT0Ygbm9kZXMgdG8gcG9wdWxhdGUgY2VsbHMsCmFuZCBzb21ldGlt
ZXMgbm90PwoKQWxzbywgd2hhdCBhYm91dCAib2ZfY2hpbGRyZW5fYXJlX2NlbGxzIiA/IEJlY2F1
c2UgYWN0dWFsbHkgaW4gbW9zdApjYXNlcyBpdCdzIGEgImZpeGVkIG9mIGNlbGwiLCBzbyBJIGRv
bid0IGZpbmQgdGhlIGN1cnJlbnQgbmFtaW5nCmRlc2NyaXB0aXZlIGVub3VnaCBmb3Igc29tZXRo
aW5nIHNvIHRvdWNoeS4KClRoYW5rcywgTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
