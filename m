Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CCD49223
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9JdVD1TfEMmS2khIWRnhRP2Jp06fhvtgM/KorAIW4M=; b=dbF3dKwN6y8EbL
	byVUDBLG64cOJmKvA7nWqMlPl645lKtIZzq/vYSQyvCicbEFvuhthVcmALBZDBCDqUdHY/HvlcAIY
	CpuREuHfexwl7nVMsNCKnBArIW0AihqG6SgvcPFNXCKL7OFpjHbp8QwMh3JFy2fCC3v+18zFLJLRA
	i3gnUElIQM9Xdgldq2E93YaBQFjEIAtnnCnkCScsMvD7TFmMGapOuALlGSpTWOVIuQeBhCaPyKMXT
	kQsEhYaUCjvtA26/zWuLAxy82Zn2TNsHdssDMTxf1DkQpJIVzCGR0Xs3PmaTbCG330KivOvfMya2p
	nDlcPZB3tvuf7fd/m6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1vA-00000009bbC-3un3;
	Mon, 18 Nov 2024 13:36:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1mo-00000009Zah-1jdb;
	Mon, 18 Nov 2024 13:27:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 491CE6000C;
	Mon, 18 Nov 2024 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731936443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3aT8RFdCdTNdeyQreq16da7/I4iz4pcsvKIIFnCgCA=;
	b=TjnKsS73E0DI6Iz1Q01nvGmPESd+7DxF6LViNdUq0cX9Z0fhcRy+zhf1rsWcq79PUow3za
	RedWyADTe3BipekMwV1ef4XY/nveNr9lfcgJe4eucg+cC4f9nqXU1Al0w+rzpPv1ZlTkL4
	HWjP5twPA9CmE/HK7Q7xBEyU4DBsvYCeyZt+WyrLoXwfeDK9DI6KYjnW7Ab8tBOVTaZS3K
	YNrfEQzODkE3MW1LaAnQM5yksYIAph0J7GYoc5gRUVBOMDwH6TOBPu39VY25t+GtnWI1PU
	t+GuJMr7+z3Ssm8X8RkzTw6qDTocV4cBUXJ4Bck+T4PF979v2jPhGguDTJplDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: <tudor.ambarus@linaro.org>,  <michael@walle.cc>,  <broonie@kernel.org>,
  <pratyush@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <robh@kernel.org>,  <conor+dt@kernel.org>,  <krzk+dt@kernel.org>,
  <venkatesh.abbarapu@amd.com>,  <linux-spi@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <nicolas.ferre@microchip.com>,  <alexandre.belloni@bootlin.com>,
  <claudiu.beznea@tuxon.dev>,  <michal.simek@amd.com>,
  <linux-arm-kernel@lists.infradead.org>,  <alsa-devel@alsa-project.org>,
  <patches@opensource.cirrus.com>,  <git@amd.com>,
  <amitrkcian2002@gmail.com>,  <beanhuo@micron.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add bindings for describing
 concatinated MTD devices
In-Reply-To: <20241026075347.580858-2-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Sat, 26 Oct 2024 13:23:46 +0530")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-2-amit.kumar-mahapatra@amd.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 14:27:21 +0100
Message-ID: <87frnoy8na.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_052726_722137_5DE1A144 
X-CRM114-Status: GOOD (  15.94  )
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

T24gMjYvMTAvMjAyNCBhdCAxMzoyMzo0NiArMDUzMCwgQW1pdCBLdW1hciBNYWhhcGF0cmEgPGFt
aXQua3VtYXItbWFoYXBhdHJhQGFtZC5jb20+IHdyb3RlOgoKPiBUaGlzIGFwcHJvYWNoIHdhcyBz
dWdnZXN0ZWQgYnkgUm9iIFsxXSBkdXJpbmcgYSBkaXNjdXNzaW9uIG9uIE1pcXVlbCdzCj4gaW5p
dGlhbCBhcHByb2FjaCBbMl0gdG8gZXh0ZW5kIHRoZSBNVEQtQ09OQ0FUIGRyaXZlciB0byBzdXBw
b3J0IHN0YWNrZWQKPiBtZW1vcmllcy4KPiBEZWZpbmUgZWFjaCBmbGFzaCBub2RlIHNlcGFyYXRl
bHkgd2l0aCBpdHMgcmVzcGVjdGl2ZSBwYXJ0aXRpb25zLCBhbmQgYWRkCj4gYSAnY29uY2F0LXBh
cnRzJyBiaW5kaW5nIHRvIGxpbmsgdGhlIHBhcnRpdGlvbnMgb2YgdGhlIHR3byBmbGFzaCBub2Rl
cyB0aGF0Cj4gbmVlZCB0byBiZSBjb25jYXRlbmF0ZWQuCj4KPiBmbGFzaEAwIHsKPiAgICAgICAg
IGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciIKPiAgICAgICAgIC4uLgo+ICAgICAgICAgICAg
ICAgICBwYXJ0aXRpb25zIHsKCldyb25nIGluZGVudGF0aW9uIGhlcmUgYW5kIGJlbG93IHdoaWNo
IG1ha2VzIHRoZSBleGFtcGxlIGhhcmQgdG8gcmVhZC4KCj4gICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29u
Y2F0LXBhcnRpdGlvbiA9IDwmZmxhc2gwX3BhcnRpdGlvbiAmZmxhc2gxX3BhcnRpdGlvbj47Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgZmxhc2gwX3BhcnRpdGlvbjogcGFydGl0aW9uQDAgewo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAicGFydDBfMCI7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ODAwMDAwPjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiB9Cj4gZmxhc2hAMSB7
Cj4gICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiCj4gICAgICAgICAuLi4KPiAg
ICAgICAgICAgICAgICAgcGFydGl0aW9ucyB7Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29uY2F0LXBh
cnRpdGlvbiA9IDwmZmxhc2gwX3BhcnRpdGlvbiAmZmxhc2gxX3BhcnRpdGlvbj47Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgZmxhc2gxX3BhcnRpdGlvbjogcGFydGl0aW9uQDAgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAicGFydDBfMSI7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ODAwMDAwPjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiB9CgpUaGlzIGFwcHJvYWNoIGhh
cyBhIGxpbWl0YXRpb24gSSBkaWRuJ3QgdGhpbmsgYWJvdXQgYmVmb3JlOiB5b3UgY2Fubm90CnVz
ZSBhbnl0aGluZyBlbHNlIHRoYW4gZml4ZWQgcGFydGl0aW9ucyBhcyBwYXJ0aXRpb24gcGFyc2Vy
LgoKPiBCYXNlZCBvbiB0aGUgYmluZGluZ3MgdGhlIE1URC1DT05DQVQgZHJpdmVyIG5lZWQgdG8g
YmUgdXBkYXRlZCB0byBjcmVhdGUKPiB2aXJ0dWFsIG10ZC1jb25jYXQgZGV2aWNlcy4KPgo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAxOTExMTgyMjEzNDEuR0EzMDkzN0Bib2d1
cy8KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMTkxMTEzMTcxNTA1LjI2MTI4
LTQtbWlxdWVsLnJheW5hbEBib290bGluLmNvbS8KPgo+IFNpZ25lZC1vZmYtYnk6IEFtaXQgS3Vt
YXIgTWFoYXBhdHJhIDxhbWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPgo+IC0tLQo+ICAuLi4v
bXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sICAgICAgIHwgMTggKysrKysrKysr
KysrKysrKysrCj4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwg
ICAgfCAgNiArKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKPiBpbmRleCAwNTgyNTNk
NmQ4ODkuLmRmNGNjYjNkZmViYSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBh
cnRpdGlvbnMueWFtbAo+IEBAIC0xODMsMyArMTgzLDIxIEBAIGV4YW1wbGVzOgo+ICAgICAgICAg
ICAgICByZWFkLW9ubHk7Cj4gICAgICAgICAgfTsKPiAgICAgIH07Cj4gKwo+ICsgIC0gfAo+ICsg
ICAgcGFydGl0aW9ucyB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25z
IjsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwxPjsKClRoaXMgaXMgbm90IHN0cmljdGx5IHJlbGF0ZWQgYnV0IEkgYmVsaWV2ZSB3ZSB3
aWxsIHNvb24gaGF2ZSBpc3N1ZXMgd2l0aAp0aGVzZSwgYXMgd2Ugd2lsbCBzb29uIGNyb3NzIHRo
ZSA0R2lCIGJvdW5kYXJ5LgoKPiArICAgICAgICBjb25jYXQtcGFydHMgPSA8JnBhcnQwICZwYXJ0
MT47Cj4gKwo+ICsgICAgICAgIHBhcnQwOiBwYXJ0aXRpb25AMCB7Cj4gKyAgICAgICAgICAgIGxh
YmVsID0gImZsYXNoMC1wYXJ0MCI7Cj4gKyAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAgMHgx
MDAwMDA+Owo+ICsgICAgICAgIH07Cj4gKwo+ICsgICAgICAgIHBhcnQxOiBwYXJ0aXRpb25AMTAw
MDAwIHsKPiArICAgICAgICAgICAgbGFiZWwgPSAiZmxhc2gxLXBhcnQwIjsKPiArICAgICAgICAg
ICAgcmVnID0gPDB4MDEwMDAwMCAweDIwMDAwMD47Cj4gKyAgICAgICAgfTsKPiArICAgIH07Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9wYXJ0aXRpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1sCj4gaW5kZXggMWRkYTJjODA3NDdiLi44NmJi
ZDgzYzNmNmQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwKPiBAQCAtMzIs
NiArMzIsMTIgQEAgcHJvcGVydGllczoKPiAgICAnI3NpemUtY2VsbHMnOgo+ICAgICAgZW51bTog
WzEsIDJdCj4gIAo+ICsgIGNvbmNhdC1wYXJ0czoKPiArICAgIGRlc2NyaXB0aW9uOiBMaXN0IG9m
IE1URCBwYXJ0aXRpb25zIHBoYW5kbGVzIHRoYXQgc2hvdWxkIGJlIGNvbmNhdGVuYXRlZC4KPiAr
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkK
PiArICAgIG1pbkl0ZW1zOiAyCj4gKyAgICBtYXhJdGVtczogNAo+ICsKPiAgcGF0dGVyblByb3Bl
cnRpZXM6Cj4gICAgIl5wYXJ0aXRpb24oLS4rfEBbMC05YS1mXSspJCI6Cj4gICAgICAkcmVmOiBw
YXJ0aXRpb24ueWFtbAoKRmluZSBieSBtZSBvdGhlcndpc2UuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
