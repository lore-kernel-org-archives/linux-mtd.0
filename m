Return-Path: <SRS0=2WOf=VN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0C6C76188
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 07:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE10C20880
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 07:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YWtuBWcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE10C20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6Bu5NXCtQxRso5fqwr/dsGuCePzzQ0d0aXZNWW8+oA=; b=YWtuBWcFnsPv6u
	cPmoCsjR+OAs5eEZ0d/6pIguVMDeriUQQrXcpfK9sxChWB/XMsEfDJDunCzcDIHtKjPsy2WNxSEVb
	SbvCbQAb4Ra5eSUi80tWAG52mN3Y6L4L4aavcQzKI9SHMh7brzXgDyaMkNiXJ0V/Rcdmqxgy5Shw+
	IAYtZk6th86hHyMcDVuzuIXqFI6Hk3BYJNNAVzL6T1uuNPDzdE5CiiFhvu8sK72mGgHpBm9orcqyL
	LFMezeow8iATmtOsDRd2u82qvjbUMl6Zfglv0UNDZSzIVk7OAamm74GUyqz3K1p0xH/OsCPOsWKq9
	WkfQ8TcscmHw9eybi6aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnHkq-0006RS-Uz; Tue, 16 Jul 2019 07:20:05 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnHkn-000628-Iz
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2019 07:20:03 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4582860017;
 Tue, 16 Jul 2019 07:19:34 +0000 (UTC)
Date: Tue, 16 Jul 2019 09:19:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Ensure child nodes are of type 'object'
Message-ID: <20190716091933.39db956e@xps13>
In-Reply-To: <20190715230457.3901-1-robh@kernel.org>
References: <20190715230457.3901-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_002001_801932_EA820151 
X-CRM114-Status: GOOD (  15.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gTW9uLCAxNSBK
dWwgMjAxOSAxNzowNDo1NyAtMDYwMDoKCj4gUHJvcGVydGllcyB3aGljaCBhcmUgY2hpbGQgbm9k
ZSBkZWZpbml0aW9ucyBuZWVkIHRvIGhhdmUgYW4gZXhwbGljdAo+IHR5cGUuIE90aGVyd2lzZSwg
YSBtYXRjaGluZyAoRFQpIHByb3BlcnR5IGNhbiBzaWxlbnRseSBtYXRjaCB3aGVuIGFuCj4gZXJy
b3IgaXMgZGVzaXJlZC4gRml4IHRoaXMgdXAgdHJlZS13aWRlLiBPbmNlIHRoaXMgaXMgZml4ZWQs
IHRoZQo+IG1ldGEtc2NoZW1hIHdpbGwgZW5mb3JjZSB0aGlzIG9uIGFueSBjaGlsZCBub2RlIGRl
ZmluaXRpb25zLgo+IAo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgo+IENjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gQ2M6IERhdmlkIFdvb2Ro
b3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KPiBDYzogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNm
b3JwZWFjZUBnbWFpbC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5j
b20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6
IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2
ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgo+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20+Cj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+
IENjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnCj4gQ2M6IGxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBDYzogbGludXgtc3BpQHZn
ZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gUGxlYXNlIGFjay4gSSB3aWxsIHRha2UgdGhpcyB2aWEgdGhlIERUIHRyZWUu
Cj4gCj4gUm9iCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2J1cy9hbGx3aW5uZXIsc3Vu
OGktYTIzLXJzYi55YW1sICAgICAgIHwgMSArCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9hbGx3aW5uZXIsc3VuNGktYTEwLW5hbmQueWFtbCAgICAgIHwgMSArCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwgICAgIHwgMSAr
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1s
ICAgICAgICAgIHwgMyArKysKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FsbHdpbm5l
cixzdW40aS1hMTAtc3BpLnlhbWwgICAgICAgfCAxICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL2FsbHdpbm5lcixzdW42aS1hMzEtc3BpLnlhbWwgICAgICAgfCAxICsKPiAgNiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKClsuLi5dCgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFt
bAo+IGluZGV4IDE5OWJhNWFjMmEwNi4uZDI2MWI3MDk2YzY5IDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxl
ci55YW1sCj4gQEAgLTQwLDYgKzQwLDcgQEAgcHJvcGVydGllczoKPiAgCj4gIHBhdHRlcm5Qcm9w
ZXJ0aWVzOgo+ICAgICJebmFuZEBbYS1mMC05XSQiOgo+ICsgICAgdHlwZTogb2JqZWN0Cj4gICAg
ICBwcm9wZXJ0aWVzOgo+ICAgICAgICByZWc6Cj4gICAgICAgICAgZGVzY3JpcHRpb246CgpGb3Ig
dGhlIG10ZCAueWFtbDoKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
