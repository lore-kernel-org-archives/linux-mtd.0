Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A861EC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRYf1SELWWI80M7jC/kGyYQG7efBJsFPtMb4XSEzAvU=; b=s9VbTFFaYGP19e
	b1S+oJQr5tVHP+mzlqSaAHcVIS8Qz4tnh5idW/wV3gFBaORatT+1codoVmrXE6fWcaaj6YUBlPV6i
	r1miEom6EKZ62w5c4V06n9+3VRHFKznZpREV8D4ukjhg+XuFqc81OehrGXgfz2aug0Q0z8knaQF9z
	K43De8q3/iJcBrNOVMMjIeMGHWXgXaMrh3fWAZDEJh2piIVNWN99mRG7eW7rCfJTti4BjkLPwSMin
	7YIeX3iyo5RHJhAVJL2GWxspXocDpBuIfkMs2YQjtYjKVfO29blah8yoCscprrAQA74WxuUU6GbTu
	k2RFymIUqWJK8cMVtdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGr0-00Fe8D-7C; Thu, 09 Dec 2021 10:40:46 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGqx-00Fe7W-CQ
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 10:40:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9BB56240010;
 Thu,  9 Dec 2021 10:40:39 +0000 (UTC)
Date: Thu, 9 Dec 2021 11:40:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
Message-ID: <20211209114038.710139a8@xps13>
In-Reply-To: <bebef734-d0d3-e78e-e07a-9160ead1f673@kernel.org>
References: <20211206174209.2297565-1-robh@kernel.org>
 <20211209104224.41d42cca@xps13>
 <bebef734-d0d3-e78e-e07a-9160ead1f673@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_024043_747744_A22C6A5D 
X-CRM114-Status: GOOD (  29.55  )
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

SGkgUm9nZXIsCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBUaHUsIDkgRGVjIDIwMjEgMTI6
MDg6MDcgKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAwOS8xMi8yMDIxIDExOjQyLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgUm9iLAo+ID4gCj4gPiByb2JoQGtlcm5lbC5vcmcgd3Jv
dGUgb24gTW9uLCAgNiBEZWMgMjAyMSAxMTo0MjowOSAtMDYwMDoKPiA+ICAgCj4gPj4gV2l0aCAn
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJyBzdXBwb3J0IGltcGxlbWVudGVkLCB0aGUgVEkgR1BNQyBl
eGFtcGxlCj4gPj4gaGFzIGEgd2FybmluZzoKPiA+Pgo+ID4+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy5leGFtcGxlLmR0LnlhbWw6
IG5hbmRAMCwwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ3JiLWdw
aW9zJyB3YXMgdW5leHBlY3RlZCkKPiA+Pgo+ID4+IEFkZCB0aGUgbWlzc2luZyBkZWZpbml0aW9u
IGZvciAncmItZ3Bpb3MnLiAgCj4gPiAKPiA+IHJiLWdwaW9zIGlzIGFscmVhZHkgZGVmaW5lZCBp
biBuYW5kLWNvbnRyb2xsZXIueWFtbC4gSSBzZWVtcyBsaWtlIHRoZQo+ID4gcmVhbCBwcm9ibGVt
IGlzIHRoYXQgdGhpcyBmaWxlIGRvZXMgbm90IHJlZmVyIHRvIGl0LiBDYW4geW91IHVwZGF0ZSB0
aGUKPiA+IGZpeD8gIAo+IAo+IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIHJlZmVyIHRvIG5hbmQtY29u
dHJvbGxlci55YW1sIHJpZ2h0IG5vdyBhcyB3ZSBhcmUgbm90Cj4gZnVsbHkgY29tcGF0aWJsZSB3
aXRoIGl0IHlldC4gUGxlYXNlIHNlZSBleGFtcGxlcyBiZWxvdy4KClRoaXMgaXMgYSAqdmVyeSog
d3Jvbmcgd2F5IG9mIGRlZmluaW5nIGEgTkFORCBzZXR1cC4gSSB3aWxsIHRha2UgdGhlCnBhdGNo
IHRvIHNpbGVuY2UgdGhlIHdhcm5pbmcsIGJ1dCBwbGVhc2UgY29udmVydCB0aGlzIHJlcHJlc2Vu
dGF0aW9uIHRvCnRoZSAnbmV3JyBvbmUuIEkgYmVsaWV2ZSBvbiB0aGUgZHJpdmVyIHNpZGUgaXQg
c2hvdWxkIG5vdCBiZSB0b28KY29tcGxpY2F0ZWQgdG8gc3VwcG9ydCBoYXZpbmcgYSBmZXcgb2Yg
dGhlc2UgcHJvcGVydGllcyBtb3ZlZCB0byBhIE5BTkQKY2hpcCBzdWJub2RlIGFuZCBzdGlsbCBz
dXBwb3J0IHRoZSBiZWxvdyBiaW5kaW5nLiBKdXN0IGJlIHZlcnkgY2xlYXIKdGhhdCBpZiB0aGUg
bGVnYWN5IGJpbmRpbmdzIGFyZSB1c2VkLCBvbmx5IGEgc2luZ2xlIGNoaXAgaXMgc3VwcG9ydGVk
LgoKPiB0aSxncG1jLW5hbmQgZXhhbXBsZToKPiAKPiAgICAgICBuYW5kQDAsMCB7Cj4gICAgICAg
ICBjb21wYXRpYmxlID0gInRpLG9tYXAyLW5hbmQiOwo+ICAgICAgICAgcmVnID0gPDAgMCA0Pjsg
ICAgICAgICAgLyogZGV2aWNlIElPIHJlZ2lzdGVycyAqLwo+ICAgICAgICAgaW50ZXJydXB0LXBh
cmVudCA9IDwmZ3BtYz47Cj4gICAgICAgICBpbnRlcnJ1cHRzID0gPDAgSVJRX1RZUEVfTk9ORT4s
IC8qIGZpZm9ldmVudCAqLwo+ICAgICAgICAgICAgICAgICAgICAgIDwxIElSUV9UWVBFX05PTkU+
OyAvKiB0ZXJtY291bnQgKi8KPiAgICAgICAgIHRpLG5hbmQteGZlci10eXBlID0gInByZWZldGNo
LWRtYSI7Cj4gICAgICAgICB0aSxuYW5kLWVjYy1vcHQgPSAiYmNoMTYiOwo+ICAgICAgICAgdGks
ZWxtLWlkID0gPCZlbG0+Owo+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwxPjsKPiAKPiAgICAgICAgIC8qIE5BTkQgZ2VuZXJpYyBwcm9wZXJ0
aWVzICovCj4gICAgICAgICBuYW5kLWJ1cy13aWR0aCA9IDw4PjsKPiAgICAgICAgIHJiLWdwaW9z
ID0gPCZncG1jIDAgR1BJT19BQ1RJVkVfSElHSD47ICAvKiBncG1jX3dhaXQwICovCj4gCj4gICAg
ICAgICAvKiBHUE1DIHByb3BlcnRpZXMqLwo+ICAgICAgICAgZ3BtYyxkZXZpY2Utd2lkdGggPSA8
MT47Cj4gCj4gICAgICAgICBwYXJ0aXRpb25AMCB7Cj4gICAgICAgICAgIGxhYmVsID0gIk5BTkQu
U1BMIjsKPiAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDA0MDAwMD47Cj4gICAgICAg
ICB9Owo+ICAgICAgICAgcGFydGl0aW9uQDEgewo+ICAgICAgICAgICBsYWJlbCA9ICJOQU5ELlNQ
TC5iYWNrdXAxIjsKPiAgICAgICAgICAgcmVnID0gPDB4MDAwNDAwMDAgMHgwMDA0MDAwMD47Cj4g
ICAgICAgICB9Owo+ICAgICAgIH07Cj4gCj4gCj4gbmFuZC1jb250cm9sbGVyIGV4YW1wbGU6Cj4g
Cj4gICAgIG5hbmQtY29udHJvbGxlciB7Cj4gICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gICAgICAgY3MtZ3Bpb3MgPSA8MD4sIDwmZ3Bpb0Eg
MT47IC8qIEEgc2luZ2xlIG5hdGl2ZSBDUyBpcyBhdmFpbGFibGUgKi8KPiAKPiAgICAgICAvKiBj
b250cm9sbGVyIHNwZWNpZmljIHByb3BlcnRpZXMgKi8KPiAKPiAgICAgICBuYW5kQDAgewo+ICAg
ICAgICAgcmVnID0gPDA+OyAvKiBOYXRpdmUgQ1MgKi8KPiAgICAgICAgIG5hbmQtdXNlLXNvZnQt
ZWNjLWVuZ2luZTsKPiAgICAgICAgIG5hbmQtZWNjLWFsZ28gPSAiYmNoIjsKPiAKPiAgICAgICAg
IC8qIGNvbnRyb2xsZXIgc3BlY2lmaWMgcHJvcGVydGllcyAqLwo+ICAgICAgIH07Cj4gCj4gICAg
ICAgbmFuZEAxIHsKPiAgICAgICAgIHJlZyA9IDwxPjsgLyogR1BJTyBDUyAqLwo+ICAgICAgIH07
Cj4gICAgIH07Cj4gCj4gCj4gPiAKPiA+IFdoaWxlIGF0IGl0IHlvdSBtaWdodCBhbHNvIHdhbnQg
dG8gZHJvcCB0aGUgcmItZ3Bpb3MgcHJvcGVydHkgZnJvbQo+ID4gaW5nZW5pYyxuYW5kLnlhbWws
IHdoaWNoIGFsc28gZGVmaW5lcyBpdCBhIHNlY29uZCB0aW1lLgo+ID4gICAKPiA+PiBDYzogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+PiBDYzogUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiA+PiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8
dmlnbmVzaHJAdGkuY29tPgo+ID4+IENjOiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29t
Pgo+ID4+IENjOiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPiA+PiBDYzogbGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3RpLGdwbWMtbmFuZC55YW1sIHwgNSArKysrKwo+ID4+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC90aSxncG1jLW5hbmQueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1uYW5kLnlhbWwKPiA+PiBpbmRl
eCBiZWIyNmI5YmNmYjIuLjFjMjgwZjUyYmFhMCAxMDA2NDQKPiA+PiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RpLGdwbWMtbmFuZC55YW1sCj4gPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC90aSxncG1jLW5hbmQueWFtbAo+
ID4+IEBAIC01Myw2ICs1MywxMSBAQCBwcm9wZXJ0aWVzOgo+ID4+ICAgICAgZW51bTogWzgsIDE2
XQo+ID4+ICAgICAgZGVmYXVsdDogOAo+ID4+ICAKPiA+PiArICByYi1ncGlvczoKPiA+PiArICAg
IGRlc2NyaXB0aW9uOgo+ID4+ICsgICAgICBHUElPIGNvbm5lY3Rpb24gdG8gUi9CIHNpZ25hbCBm
cm9tIE5BTkQgY2hpcAo+ID4+ICsgICAgbWF4SXRlbXM6IDEKPiA+PiArCj4gPj4gIHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+ID4+ICAgICJAWzAtOWEtZl0rJCI6Cj4gPj4gICAgICAkcmVmOiAiL3NjaGVt
YXMvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwiICAKPiA+IAo+ID4gVGhhbmtzLAo+ID4g
TWlxdcOobAo+ID4gICAKPiAKPiBjaGVlcnMsCj4gLXJvZ2VyCj4gCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
