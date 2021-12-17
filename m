Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1920EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRe9JSK5KnXplsDLjQQVlU6Bg5kEJetRk/8+JgbgU4s=; b=qQkWTgxZFQh8PH
	x76X+SnwnEtEFwLhAFmBX5Jm64uN4C6rxxeUravie5WLWUlAMtWBSXaqBRLJsJVZh2qh6SP0Yxvyl
	suflyMSvrjBbBDtBZVi5rnMc1qW2Df374bbSHGajDYJvgopvFPuivCuU8/shVjXQzVTklqkVIwbLL
	H28wTdfsc3Bis9Q4S1inW8A3BJnSKqnBJBclm++h9Wm5i19JmvFn5319J+E+51CNHcIOZeCaWe+YS
	UeQjig+VNk1hrzg0GBZTAR1yJXBg5fKWl8jw/Uc6PDAIUj5BUKy4B0IK4tcAsuRJRqq6uw9dvhoFe
	pirgJStqQBkWReGRMWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFVr-00AzbQ-Pa; Fri, 17 Dec 2021 15:51:16 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFVm-00AzXy-QY
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:51:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7D67460007;
 Fri, 17 Dec 2021 15:51:04 +0000 (UTC)
Date: Fri, 17 Dec 2021 16:51:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Wolfram Sang <wsa@kernel.org>, Chris Brandt
 <Chris.Brandt@renesas.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas
 R-Car Gen3 & RZ/N1 NAND controller
Message-ID: <20211217165102.6950cf40@xps13>
In-Reply-To: <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-2-miquel.raynal@bootlin.com>
 <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075111_173721_E457DC4B 
X-CRM114-Status: GOOD (  30.26  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBGcmksIDE3IERlYyAyMDIx
IDE2OjQ0OjU5ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gRnJpLCBEZWMgMTcsIDIwMjEg
YXQgMzoyMCBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiA+IEFkZCBhIFlhbWwgZGVzY3JpcHRpb24gZm9yIHRoaXMgUmVuZXNhcyBOQU5EIGNvbnRy
b2xsZXIuCj4gPgo+ID4gQXMgdGhpcyBjb250cm9sbGVyIGlzIGVtYmVkZGVkIG9uIGRpZmZlcmVu
dCBTb0MgZmFtaWxpZXMsIHByb3ZpZGU6Cj4gPiAqIGEgZmFtaWx5LXNwZWNpZmljICJyLWNhci1n
ZW4zIiBjb21wYXRpYmxlIGFuZCBhIG1vcmUgc3BlY2lmaWMKPiA+ICAgInI4YTc3OTUxIiBvbmUK
PiA+ICogYSBmYW1pbHktc3BlY2lmaWMgInJ6bjEiIGNvbXBhdGlibGUgYW5kIGEgbW9yZSBzcGVj
aWZpYyAicjlhMDZnMDMyIgo+ID4gICBvbmUKPiA+Cj4gPiBNb3JlIGNvbXBhdGlibGVzIGNhbiBi
ZSBhZGRlZCBsYXRlciBpZiBuZXcgU29DcyB3aXRoIHRoaXMgY29udHJvbGxlcgo+ID4gbXVzdCBi
ZSBzdXBwb3J0ZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+ICAKPiAKPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhCj4gCj4gPiAtLS0g
L2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3JlbmVzYXMtbmFuZGMueWFtbAo+ID4gQEAgLTAsMCArMSw2NiBAQAo+ID4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1M
IDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRk
L3JlbmVzYXMtbmFuZGMueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogUmVuZXNhcyBSLUNhciBH
ZW4zICYgUlovTjF4IE5BTkQgZmxhc2ggY29udHJvbGxlciBkZXZpY2UgdHJlZSBiaW5kaW5ncwo+
ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+ID4gKwo+ID4gK2FsbE9mOgo+ID4gKyAgLSAkcmVmOiAibmFuZC1j
b250cm9sbGVyLnlhbWwiCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6
Cj4gPiArICAgIG9uZU9mOgo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gZW51
bToKPiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk1MS1uYW5kYwo+ID4gKyAgICAg
ICAgICAtIGNvbnN0OiByZW5lc2FzLHJjYXItZ2VuMy1uYW5kYyAgCj4gCj4gTWlnaHQgYmUgYSBi
aXQgcHJlbWF0dXJlIHRvIGFkZCB0aGVzZSBiZWZvcmUgdGhleSBoYXZlIGJlZW4gdGVzdGVkLAo+
IGFuZCBiZWNhdXNlIHRoZXJlIGFyZSBzbWFsbCBkaWZmZXJlbmNlcyBpbiBpbnRlZ3JhdGlvbiwg
Y2ZyLiBiZWxvdy4KPiAKPiA+ICsKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAt
IGVudW06Cj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDZnMDMyLW5hbmRjCj4gPiAr
ICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscnpuMS1uYW5kYwo+ID4gKwo+ID4gKyAgcmVnOgo+
ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgaW50ZXJydXB0czoKPiA+ICsgICAgbWF4
SXRlbXM6IDEKPiA+ICsKPiA+ICsgIGNsb2NrczoKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogQVBCIGhvc3QgY29udHJvbGxlciBjbG9jawo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IEV4dGVybmFsIE5BTkQgYnVzIGNsb2NrCj4gPiArCj4gPiArICBjbG9jay1uYW1l
czoKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAgICAgLSBjb25zdDogaGNsawo+ID4gKyAgICAgIC0g
Y29uc3Q6IGVjbGsgIAo+IAo+IE9uIFItQ2FyIEdlbjMsIHRoZXJlJ3MgYSBzaW5nbGUgbW9kdWxl
IGNsb2NrLgo+IFBsdXMgYSBwb3dlci1kb21haW4gdG8gbWFuYWdlIHRoYXQuCj4gCj4gQWN0dWFs
bHkgdGhlIFJaL04xIGNsb2NrIGRyaXZlciBhbHNvIHJlZ2lzdGVycyBhIFBNIERvbWFpbiwgc28g
bGV0dGluZwo+IFJ1bnRpbWUgUE0gbWFuYWdlIHRoZSBjbG9ja3MgbWF5IHdvcmsgb24gUlovTjEs
IHRvby4uLgo+IAo+IE9uIFItQ2FyIEdlbjMsIHRoZXJlJ3MgYWxzbyBhIG1vZHVsZSByZXNldC4K
Ck9rLCBJIGRpZG4ndCBrbm93LiBJIHByb3Bvc2UgdG8gZHJvcCB0aGUgci1jYXItZ2VuMyBjb21w
YXRpYmxlIGVudGlyZWx5CmZyb20gdGhlIGRyaXZlciBhbmQgdGhlIGJpbmRpbmcgd2hlbiBJJ2xs
IGFwcGx5IHRoZSBzZXJpZXMuIElzIGl0IGZpbmUKZm9yIHlvdT8KCj4gCj4gPiArCj4gPiArcmVx
dWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiArICAtIGNsb2Nrcwo+
ID4gKyAgLSBjbG9jay1uYW1lcwo+ID4gKyAgLSBpbnRlcnJ1cHRzCj4gPiArCj4gPiArdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4g
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2lj
Lmg+Cj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOWEwNmcwMzItc3lzY3Ry
bC5oPgo+ID4gKwo+ID4gKyAgICBuYW5kLWNvbnRyb2xsZXJANDAxMDIwMDAgewo+ID4gKyAgICAg
ICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA2ZzAzMi1uYW5kYyIsICJyZW5lc2FzLHJ6bjEt
bmFuZGMiOwo+ID4gKyAgICAgICAgcmVnID0gPDB4NDAxMDIwMDAgMHgyMDAwPjsKPiA+ICsgICAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA1OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiA+ICsg
ICAgICAgIGNsb2NrcyA9IDwmc3lzY3RybCBSOUEwNkcwMzJfSENMS19OQU5EPiwgPCZzeXNjdHJs
IFI5QTA2RzAzMl9DTEtfTkFORD47Cj4gPiArICAgICAgICBjbG9jay1uYW1lcyA9ICJoY2xrIiwg
ImVjbGsiOwo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAj
c2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsgICAgfTsgIAo+IAo+IEdye29ldGplLGVldGluZ31zLAo+
IAo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4gCj4gLS0KPiBHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCj4gCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
