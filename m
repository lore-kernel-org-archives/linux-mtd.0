Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EC8C7EE25
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RWe6/1YgfbXx758N8iBrY1ZfiOWDVPMkW6msVneJc8=; b=Ta+26TdUFAui0s
	Tdxtz6Q/j99cIgFwgdfZlilHHcEv67Wf6x8PR73BzQSsA8fBes/OEPqzgp9j11zAm3kS9CcUBkJ5i
	J/kmI11AfsypxOaYG2NWAYZVRa5eXfDlBm84bW/03tVN08HVodWiXahZRAN7chj9YBUCBuqM1fNiZ
	b6sgUS2Sr3lpyLBT8e5EeMZS+q9eB0VflAg/ZgrB9D6OK4wiZtUe28ah+4YgcU6248wgaWB4ZL3Ed
	RglF8AZ1V7CsBVsloCGCdoKuZgXti/gfV+7hFHec8FgqNR+ZaEtMrntcUty42NWZ4YarjcS6BTprS
	JCZj24n4DShGQ/JOfPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1t-00DRMA-0u;
	Fri, 09 Jun 2023 15:27:57 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1q-00DRJD-1I
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 15:27:56 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+7IAwP96oZESKh99Ayico9fsf/vk2Nmi+qqamobINk=;
	b=EEdwhi0UZb0AG50ITx4a/Gob4DIa5pesN3xxggvxBYDPNcFZPrbxyroIKUWFvsp/egMLqJ
	xBk4KGkQJfBJqV+GJ4y7hxZ9QpFIJJkuuxQavbxBoMUV4NOQPWCe9LFWKruWlEo36E2Ujy
	Ct3NzkBghBJclhG6rA/u3ffFpjYKGhTBPfn+mImnHND1dkET06B3vuFdYmIVIW3SldWRd0
	8yS9vsdr/kbBZ9vVK7ndKCjLKTeU0fonic+AxLMQEcgXZVNP/nlIV4zL86eiGAZh22WhV/
	7J9HsP1E/zHSvszyV38OND2YmsclocwwzuK9YjLMBYv3eUVrYj4rQOc0uxIE9w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E73A60002;
	Fri,  9 Jun 2023 15:27:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?utf-8?b?UmFm?= =?utf-8?b?YcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: mtd: partitions: Include TP-Link SafeLoader in allowed list
Date: Fri,  9 Jun 2023 17:27:47 +0200
Message-Id: <20230609152747.1188598-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602215629.2568-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7c74557f59e8880f079121e3cf8d5875f3e7e99d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082754_716261_F3A10C4F 
X-CRM114-Status: UNSURE (   9.73  )
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

T24gRnJpLCAyMDIzLTA2LTAyIGF0IDIxOjU2OjI5IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IEl0J3Mgc3VwcG9zZWQgdG8gYmUgdGhlcmUgYW5kIGl0J3MgbmVlZGVkIGZvciBw
cm9wZXIgdmFsaWRhdGlvbiBvZiBEVFMKPiBmaWxlcy4KPiAKPiBUaGlzIGZpeGVzIGZvbGxvd2lu
ZyBlcnJvcnMgZm9yIE5vcnRoc3RhciBiYXNlZCBUUC1MaW5rIHJvdXRlcnM6Cj4gCj4gYXJjaC9h
cm0vYm9vdC9kdHMvYmNtNDcwODEtdHBsaW5rLWFyY2hlci1jNS12Mi5kdGI6IGZsYXNoQDA6IHBh
cnRpdGlvbnM6ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoK
PiAgICAgICAgICdwYXJ0aXRpb24tZmlsZS1zeXN0ZW0nLCAncGFydGl0aW9uLW9zLWltYWdlJywg
J3BhcnRpdGlvbnMtdGFibGUtb2Zmc2V0JyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVz
OiAncGluY3RybC1bMC05XSsnCj4gICAgICAgICAnI2FkZHJlc3MtY2VsbHMnIGlzIGEgcmVxdWly
ZWQgcHJvcGVydHkKPiAgICAgICAgICcjc2l6ZS1jZWxscycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0
eQo+ICAgICAgICAgJ3BhcnRpdGlvbi1maWxlLXN5c3RlbScsICdwYXJ0aXRpb24tb3MtaW1hZ2Un
LCAncGFydGl0aW9ucy10YWJsZS1vZmZzZXQnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4
ZXM6ICdecGFydGl0aW9uQFswLTlhLWZdKyQnLCAncGluY3RybC1bMC05XSsnCj4gICAgICAgICAn
cGFydGl0aW9uLWZpbGUtc3lzdGVtJywgJ3BhcnRpdGlvbi1vcy1pbWFnZScsICdwYXJ0aXRpb25z
LXRhYmxlLW9mZnNldCcgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ15wYXJ0aXRp
b24tWzAtOWEtel0rJCcsICdwaW5jdHJsLVswLTldKycKPiAgICAgICAgICdmaXMtaW5kZXgtYmxv
Y2snIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgICAgICAgIGFyY2gvYXJtL2Jvb3QvZHRzL2Jj
bTQ3MDgxLXRwbGluay1hcmNoZXItYzUtdjIuZHRiOiBmbGFzaEAwOiBwYXJ0aXRpb25zOmNvbXBh
dGlibGU6ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoKPiAg
ICAgICAgICAgICAgICAgWyd0cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zJ10gaXMgdG9vIHNo
b3J0Cj4gICAgICAgICAgICAgICAgICdmaXhlZC1wYXJ0aXRpb25zJyB3YXMgZXhwZWN0ZWQKPiAg
ICAgICAgICAgICAgICAgJ3NlcmNvbW0sc2MtcGFydGl0aW9ucycgd2FzIGV4cGVjdGVkCj4gICAg
ICAgICAnYXJtLGFybS1maXJtd2FyZS1zdWl0ZScgd2FzIGV4cGVjdGVkCj4gICAgICAgICAnYnJj
bSxiY200OTA4LXBhcnRpdGlvbnMnIHdhcyBleHBlY3RlZAo+ICAgICAgICAgJ2JyY20sYmNtOTQ3
eHgtY2ZlLXBhcnRpdGlvbnMnIHdhcyBleHBlY3RlZAo+ICAgICAgICAgJ2xpbmtzeXMsbnMtcGFy
dGl0aW9ucycgd2FzIGV4cGVjdGVkCj4gICAgICAgICAncWNvbSxzbWVtLXBhcnQnIHdhcyBleHBl
Y3RlZAo+ICAgICAgICAgJ3JlZGJvb3QtZmlzJyB3YXMgZXhwZWN0ZWQKPiAgICAgICAgIEZyb20g
c2NoZW1hOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC55YW1sCj4g
YXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwODEtdHBsaW5rLWFyY2hlci1jNS12Mi5kdGI6IGZsYXNo
QDA6IHBhcnRpdGlvbnM6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgn
cGFydGl0aW9ucy10YWJsZS1vZmZzZXQnIHdhcyB1bmV4cGVjdGVkKQo+ICAgICAgICAgRnJvbSBz
Y2hlbWE6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwKPiBh
cmNoL2FybS9ib290L2R0cy9iY200NzA4MS10cGxpbmstYXJjaGVyLWM1LXYyLmR0YjogZmxhc2hA
MDogcGFydGl0aW9uczogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZp
eGVkOgo+ICAgICAgICAgJ3BhcnRpdGlvbi1maWxlLXN5c3RlbScsICdwYXJ0aXRpb24tb3MtaW1h
Z2UnLCAncGFydGl0aW9ucy10YWJsZS1vZmZzZXQnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJl
Z2V4ZXM6ICdwaW5jdHJsLVswLTldKycKPiAgICAgICAgICcjYWRkcmVzcy1jZWxscycgaXMgYSBy
ZXF1aXJlZCBwcm9wZXJ0eQo+ICAgICAgICAgJyNzaXplLWNlbGxzJyBpcyBhIHJlcXVpcmVkIHBy
b3BlcnR5Cj4gICAgICAgICAncGFydGl0aW9uLWZpbGUtc3lzdGVtJywgJ3BhcnRpdGlvbi1vcy1p
bWFnZScsICdwYXJ0aXRpb25zLXRhYmxlLW9mZnNldCcgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUg
cmVnZXhlczogJ15wYXJ0aXRpb25AWzAtOWEtZl0rJCcsICdwaW5jdHJsLVswLTldKycKPiAgICAg
ICAgICdwYXJ0aXRpb24tZmlsZS1zeXN0ZW0nLCAncGFydGl0aW9uLW9zLWltYWdlJywgJ3BhcnRp
dGlvbnMtdGFibGUtb2Zmc2V0JyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAnXnBh
cnRpdGlvbi1bMC05YS16XSskJywgJ3BpbmN0cmwtWzAtOV0rJwo+ICAgICAgICAgJ2Zpcy1pbmRl
eC1ibG9jaycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+ICAgICAgICAgYXJjaC9hcm0vYm9vdC9k
dHMvYmNtNDcwODEtdHBsaW5rLWFyY2hlci1jNS12Mi5kdGI6IGZsYXNoQDA6IHBhcnRpdGlvbnM6
Y29tcGF0aWJsZTogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVk
Ogo+ICAgICAgICAgICAgICAgICBbJ3RwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMnXSBpcyB0
b28gc2hvcnQKPiAgICAgICAgICAgICAgICAgJ2ZpeGVkLXBhcnRpdGlvbnMnIHdhcyBleHBlY3Rl
ZAo+ICAgICAgICAgICAgICAgICAnc2VyY29tbSxzYy1wYXJ0aXRpb25zJyB3YXMgZXhwZWN0ZWQK
PiAgICAgICAgICdhcm0sYXJtLWZpcm13YXJlLXN1aXRlJyB3YXMgZXhwZWN0ZWQKPiAgICAgICAg
ICdicmNtLGJjbTQ5MDgtcGFydGl0aW9ucycgd2FzIGV4cGVjdGVkCj4gICAgICAgICAnYnJjbSxi
Y205NDd4eC1jZmUtcGFydGl0aW9ucycgd2FzIGV4cGVjdGVkCj4gICAgICAgICAnbGlua3N5cyxu
cy1wYXJ0aXRpb25zJyB3YXMgZXhwZWN0ZWQKPiAgICAgICAgICdxY29tLHNtZW0tcGFydCcgd2Fz
IGV4cGVjdGVkCj4gICAgICAgICAncmVkYm9vdC1maXMnIHdhcyBleHBlY3RlZAo+ICAgICAgICAg
RnJvbSBzY2hlbWE6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMs
c3BpLW5vci55YW1sCj4gYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwODEtdHBsaW5rLWFyY2hlci1j
NS12Mi5kdGI6IGZsYXNoQDA6IHBhcnRpdGlvbnM6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJl
IG5vdCBhbGxvd2VkICgncGFydGl0aW9ucy10YWJsZS1vZmZzZXQnIHdhcyB1bmV4cGVjdGVkKQo+
ICAgICAgICAgRnJvbSBzY2hlbWE6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvamVkZWMsc3BpLW5vci55YW1sCj4gYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwODEtdHBsaW5r
LWFyY2hlci1jNS12Mi5kdGI6IGZsYXNoQDA6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5v
dCBhbGxvd2VkICgncGFydGl0aW9ucycgd2FzIHVuZXhwZWN0ZWQpCj4gICAgICAgICBGcm9tIHNj
aGVtYTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9y
LnlhbWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
