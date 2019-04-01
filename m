Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E409DC4360F
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B286220830
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M3pNpken"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B286220830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPbZb0+A7fQ1N7apcrRlLNBRvUMCu4SxHn0SRyenX+o=; b=M3pNpken3LpRQ1
	/YW2Nicf9pCnpXHw1pbW/qeQL82TGVnq/ESoi2HS2Apg+vKifbrNOV/cOtSbI4GdIi5yngBRMEU0f
	snJtqUjguab8CceUNv7dwcNU+1z/EEcVLcinlhyGgkIukdeiWcTZKIRmAR+b1GxayDGWUZJ+CBNk1
	IvbSw7ogLyOyBV3DwkS+HJf458zRdHQsw8FdTFNP9uCQj2J5QnT74R/cv7NJVE4SlZ2c4PVBQjMog
	fEH4tj4DSqXxCUvj5+vF5Hzo/FDagBgkGFJGprC6hZOACk3+pp9RajCctNSzPtM4lBIkmKy7fozDk
	ECCVD871xL9dT8gAhN/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB17D-0004eH-UE; Mon, 01 Apr 2019 17:52:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB176-0004ST-CT
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 17:52:55 +0000
X-Originating-IP: 81.185.163.178
Received: from xps13 (178.163.185.81.rev.sfr.net [81.185.163.178])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BECECC000A;
 Mon,  1 Apr 2019 17:52:40 +0000 (UTC)
Date: Mon, 1 Apr 2019 19:52:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH 4/7] dt-bindings: mfd: Document Macronix MX25F0A
 controller bindings
Message-ID: <20190401193431.3e8788a0@xps13>
In-Reply-To: <1553768318-23149-5-git-send-email-masonccyang@mxic.com.tw>
References: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
 <1553768318-23149-5-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_105252_847152_76204AD0 
X-CRM114-Status: GOOD (  15.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 juliensu@mxic.com.tw, bbrezillon@kernel.org, marcel.ziswiler@toradex.com,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, geert@linux-m68k.org, stefan@agner.ch,
 linux-mtd@lists.infradead.org, richard@nod.at, liang.yang@amlogic.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
VGh1LCAyOCBNYXIgMjAxOSAxODoxODozNQorMDgwMDoKCj4gRG9jdW1lbnQgdGhlIGJpbmRpbmdz
IHVzZWQgYnkgdGhlIE1hY3Jvbml4IE1YMjVGMEEgTUZEIGNvbnRyb2xsZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWFzb24gWWFuZyA8bWFzb25jY3lhbmdAbXhpYy5jb20udHc+Cj4gLS0tCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9teGljLW14MjVmMGEudHh0ICAgICAgIHwgNjYgKysr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC9teGljLW14MjVmMGEudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvbXhpYy1teDI1ZjBhLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvbXhpYy1teDI1ZjBhLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMC4uNTNiNDgzOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL214aWMtbXgyNWYwYS50eHQKPiBAQCAtMCww
ICsxLDY2IEBACj4gK01hY3Jvbml4IE1YMjVGMEEgTXVsdGktRnVuY3Rpb24gRGV2aWNlIFRyZWUg
QmluZGluZ3MKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICsKPiArTVgyNUYwQSBpcyBhIE11bHRpRnVuY3Rpb24gRGV2aWNlIHdpdGggU1BJ
IGFuZCByYXcgTkFORCwgd2hpY2gKPiArc3VwcG9ydHMgZWl0aGVyIHNwaSBob3N0IGNvbnRyb2xs
ZXIgb3IgcmF3IG5hbmQgY29udHJvbGxlci4KPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4g
Ky0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJteGljLG14MjVmMGEtbWZkIgoKU2hvdWxkIHByb2Jh
Ymx5IGJlICJteGljLG14MjVmMGEiCgo+ICstICNhZGRyZXNzLWNlbGxzOiBzaG91bGQgYmUgMQo+
ICstICNzaXplLWNlbGxzOiBzaG91bGQgYmUgMAo+ICstIHJlZzogc2hvdWxkIGNvbnRhaW4gMiBl
bnRyaWVzLCBvbmUgZm9yIHRoZSByZWdpc3RlcnMgYW5kIG9uZSBmb3IgdGhlIGRpcmVjdAo+ICsg
ICAgICAgbWFwcGluZyBhcmVhIGluIFNQSSBtb2RlLgo+ICstIHJlZy1uYW1lczogc2hvdWxkIGNv
bnRhaW4gInJlZ3MiIGFuZCAiZGlybWFwIgo+ICstIGludGVycnVwdHM6IGludGVycnVwdCBsaW5l
IGNvbm5lY3RlZCB0byB0aGlzIE1GRCBjb250cm9sbGVyCj4gKwo+ICtSZXF1aXJlZCBub2RlczoK
PiArIC0gc3BpIDoKPiArCU5vZGUgZm9yIGNvbmZpZ3VyaW5nIHRoZSBTUEkgY29udHJvbGxlciBk
cml2ZXIuCj4gKwlSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsJCS0gY29tcGF0aWJsZSA9ICJteGlj
eSxteDI1ZjBhLXNwaSI7Cj4gKwkJLSBjbG9jay1uYW1lczogc2hvdWxkIGNvbnRhaW4gInBzX2Ns
ayIsICJzZW5kX2NsayIgYW5kCj4gKwkJCSAgICAgICAic2VuZF9kbHlfY2xrIgo+ICsJCS0gY2xv
Y2tzOiBzaG91bGQgY29udGFpbiAzIGVudHJpZXMgZm9yIHRoZSAicHNfY2xrIiwgInNlbmRfY2xr
Igo+ICsJCQkgIGFuZCAic2VuZF9kbHlfY2xrIiBjbG9ja3MKPiArCj4gKy0gbmFuZCA6Cj4gKwlO
b2RlIGZvciBjb25maWd1cmluZyB0aGUgcmF3IG5hbmQgY29udHJvbGxlciBkcml2ZXIuCj4gKwlS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsJCS0gY29tcGF0aWJsZSA9ICJteGljeSxteDI1ZjBhLW5h
bmQtY3RsciI7Cj4gKwkJLSBuYW5kLWVjYy1tb2RlID0gInNvZnQiOwo+ICsJCS0gbmFuZC1lY2Mt
YWxnbyA9ICJiY2giOwoKWW91IGNhbiBoYXZlIG9ubHkgb25lIG5vZGUgYXQgYSB0aW1lLiBZb3Ug
Y2FuIGFkZCBhIG14aWMsbW9kZSBwcm9wZXJ0eQpiZWluZyBlaXRoZXIgInNwaS1jb250cm9sbGVy
IiBvciAibmFuZC1jb250cm9sbGVyIi4KCj4gKwo+ICtFeGFtcGxlOgo+ICsKPiArCW14aWM6IG14
MjVmMGEtbWZkQDQzYzMwMDAwIHsKPiArCQljb21wYXRpYmxlID0gIm14aWMsbXgyNWYwYS1tZmQi
Owo+ICsJCXJlZyA9IDwweDQzYzMwMDAwIDB4MTAwMDA+LCA8MHhhMDAwMDAwMCAweDQwMDAwMDA+
Owo+ICsJCXJlZy1uYW1lcyA9ICJyZWdzIiwgImRpcm1hcCI7Cj4gKwkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gKwkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJCS8qIGVpdGhlciBzcGkgb3Ig
bmFuZCAqLwo+ICsJCXNwaSB7Cj4gKwkJCWNvbXBhdGlibGUgPSAibXhpY3ksbXgyNWYwYS1zcGki
Owo+ICsJCQljbG9ja3MgPSA8JmNsa3dpemFyZCAwPiwgPCZjbGt3aXphcmQgMT4sIDwmY2xrYyAx
NT47Cj4gKwkJCWNsb2NrLW5hbWVzID0gInNlbmRfY2xrIiwgInNlbmRfZGx5X2NsayIsICJwc19j
bGsiOwo+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkJI3NpemUtY2VsbHMgPSA8MD47
Cj4gKwo+ICsJCQlmbGFzaEAwIHsKPiArCQkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7
Cj4gKwkJCQlyZWcgPSA8MD47Cj4gKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47
Cj4gKwkJCQlzcGktdHgtYnVzLXdpZHRoID0gPDQ+Owo+ICsJCQkJc3BpLXJ4LWJ1cy13aWR0aCA9
IDw0PjsKPiArCQkJfTsKPiArCQl9Owo+ICsKPiArCQluYW5kIHsKPiArCQkJY29tcGF0aWJsZSA9
ICJteGljeSxteDI1ZjBhLW5hbmQtY3RsciI7Cj4gKwkJCW5hbmQtZWNjLW1vZGUgPSAic29mdCI7
Cj4gKwkJCW5hbmQtZWNjLWFsZ28gPSAiYmNoIjsKPiArCQkJbmFuZC1lY2Mtc3RlcC1zaXplID0g
PDUxMj47Cj4gKwkJCW5hbmQtZWNjLXN0cmVuZ3RoID0gPDg+OwoKQXJlIHlvdSBzdXJlIHlvdSB3
YW50IHNvZnQgY29ycmVjdGlvbj8gKEkgaGF2ZSBub3QgY2hlY2tlZCB0aGUgZHJpdmVyCnlldCku
IEZvciBodyBjb3JyZWN0aW9uLCBJIHByZWZlciB0byBkcm9wIHRoZSB0d28gc3RlcC1zaXplL3N0
cmVuZ3RoCnByb3BlcnRpZXMuIFRoZXNlIHZhbHVlcyB3aWxsIGJlIGRlcml2ZWQgZGVwZW5kaW5n
IG9uIHRoZSBjaGlwJ3MKcmVxdWlyZW1lbnRzLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
