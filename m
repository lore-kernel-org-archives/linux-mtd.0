Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4203CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZBpvdenkBZJe6DYUSLw7JjIu4EZyvtM/shpjNKnhdk=; b=R6b4W6n4YAfawa
	94pEyFZRLiY1mMQxHSNE3tvuNBV2nq2w2Bbsso3uoZodO8bcXH+Yz1kzQh+hlO3pVnjlfgSvy804F
	18qibvTlCD1DNnCEM69300pGx33QfKCrKIzCbsJd6zrE4mhUsO/zeJnUC3apWD3vxjQ663FNU8OwT
	T0vT5F65vgkV+ljtmUavnPmZ46Qv0mWBn6f3Y7T7swwxLz1oeaXcTP4C7Jr2ZUzMxThE5YJhklUAy
	MxBF+GBV3anDukE4SAa+KqnAVE5SgH/pQrxCKfdIwF6IraOE5Bn0Mi1Z7BhVqMRQnT3EXbxwmthkI
	TnowLrMgV5/EvNtbO11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoWf-007FvC-HB; Mon, 11 Apr 2022 07:31:54 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoVH-007FI4-U5
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 07:30:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4E9B100004;
 Mon, 11 Apr 2022 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649662226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/xzW5v4uncHlXnLZChNAFi9an//7tnmIOd8TO6D4uQ=;
 b=V3OgNKtFGHcBOu56LDsq47seiXDOwhbZfASy9CPIg+2E4RmhtGcOuBeSZ7afsZNEUUz8XD
 z/5frCafI3vPS9ht4t0vyLhn0HFJ3je8gb3L3Piqfmu0qatdpuOahp3ztkytijnkZWClww
 re4Vs2cyUYBXSNvuD2wQ9qU0XNm/gnSrspuLjVC+STRIWJpT4P5Uwex3m6vgKku6RuEQFV
 sh0BHBE51KoCzjwP/JddcIwpiF6XSzDdNWcwUsr11YogsqfFnF/5GRCaxSDWnehtjNjRTX
 ifkpZcqfSxlkstRP+xQa+9+GrWiZVaVy1X8w5q44XEd/2vdv/QY7+xRyxxE4KQ==
Date: Mon, 11 Apr 2022 09:30:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: sean@geanix.com, frieder.schrempf@kontron.de, festevam@gmail.com,
 ye.li@nxp.com, peng.fan@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/4] mtd: rawnand: gpmi: Add strict ecc strength check
Message-ID: <20220411093023.6adab065@xps13>
In-Reply-To: <20220408220541.7sjtg6wysc4qzw3z@umbrella>
References: <20220404195427.8871-1-han.xu@nxp.com>
 <20220404195427.8871-2-han.xu@nxp.com>
 <20220405092826.1f70fb70@xps13>
 <20220408220541.7sjtg6wysc4qzw3z@umbrella>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_003028_298309_252AB589 
X-CRM114-Status: GOOD (  29.12  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gRnJpLCA4IEFwciAyMDIyIDE3OjA1OjQx
IC0wNTAwOgoKPiBPbiAyMi8wNC8wNSAwOToyOEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4g
SGkgSGFuLAo+ID4gCj4gPiBoYW4ueHVAbnhwLmNvbSB3cm90ZSBvbiBNb24sICA0IEFwciAyMDIy
IDE0OjU0OjI1IC0wNTAwOgo+ID4gICAKPiA+ID4gQWRkIHN0cmljdCBlY2Mgc3RyZW5ndGggY2hl
Y2sgaW4gZ3BtaV9jaGVja19lY2MoKSBmdW5jdGlvbiwgd2hpY2ggaXMKPiA+ID4gc2FtZSBhcyBu
YW5kX2VjY19pc19zdHJvbmdfZW5vdWdoKCkgZGlkLiBJdCB3aWxsIGNoZWNrIGJvdGggY29ycmVj
dCBiaXRzCj4gPiA+IGFuZCBjb3JyZWN0IGJpdHMgcGVyIGJ5dGUgdG8gZW5zdXJlIGl0IG1lZXRz
IGNoaXAgcmVxdWlyZWQgZWNjIHN0cmVuZ3RoLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTog
SGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KPiA+ID4gCj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIHNp
bmNlIHYyOgo+ID4gPiAgLSBzcGxpdCB0aGUgZWNjIGNoZWNrIHRvIGEgc2luZ2xlIHBhdGNoCj4g
PiA+IC0tLQo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9n
cG1pLW5hbmQuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+ID4gPiBpbmRleCA0MTQ0ZDU5
MzcxMDMuLjlhMzdmOGNjNjYzZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+ID4gPiBAQCAtMjM4LDkgKzIzOCwxNCBAQCBzdGF0aWMg
dm9pZCBncG1pX2R1bXBfaW5mbyhzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gPiA+ICAJ
CWdlby0+YmxvY2tfbWFya19iaXRfb2Zmc2V0KTsKPiA+ID4gIH0KPiA+ID4gIAo+ID4gPiAtc3Rh
dGljIGlubGluZSBib29sIGdwbWlfY2hlY2tfZWNjKHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhp
cykKPiA+ID4gK3N0YXRpYyBib29sIGdwbWlfY2hlY2tfZWNjKHN0cnVjdCBncG1pX25hbmRfZGF0
YSAqdGhpcykgIAo+ID4gCj4gPiBUaGlzIGNoYW5nZSBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBj
b21taXQuCj4gPiAgIAo+ID4gPiAgewo+ID4gPiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAm
dGhpcy0+bmFuZDsKPiA+ID4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKCZ0
aGlzLT5uYW5kKTsKPiA+ID4gIAlzdHJ1Y3QgYmNoX2dlb21ldHJ5ICpnZW8gPSAmdGhpcy0+YmNo
X2dlb21ldHJ5Owo+ID4gPiArCWNvbnN0IHN0cnVjdCBuYW5kX2VjY19wcm9wcyAqcmVxdWlyZW1l
bnRzID0KPiA+ID4gKwkJbmFuZGRldl9nZXRfZWNjX3JlcXVpcmVtZW50cygmY2hpcC0+YmFzZSk7
Cj4gPiA+ICsJaW50IGNvcnIsIGRzX2NvcnI7Cj4gPiA+ICAKPiA+ID4gIAkvKiBEbyB0aGUgc2Fu
aXR5IGNoZWNrLiAqLwo+ID4gPiAgCWlmIChHUE1JX0lTX01YUyh0aGlzKSkgewo+ID4gPiBAQCAt
MjQ4LDcgKzI1MywyMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZ3BtaV9jaGVja19lY2Moc3RydWN0
IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ID4gPiAgCQlpZiAoZ2VvLT5nZl9sZW4gPT0gMTQpCj4g
PiA+ICAJCQlyZXR1cm4gZmFsc2U7Cj4gPiA+ICAJfQo+ID4gPiAtCXJldHVybiBnZW8tPmVjY19z
dHJlbmd0aCA8PSB0aGlzLT5kZXZkYXRhLT5iY2hfbWF4X2VjY19zdHJlbmd0aDsKPiA+ID4gKwo+
ID4gPiArCWlmIChnZW8tPmVjY19zdHJlbmd0aCA+IHRoaXMtPmRldmRhdGEtPmJjaF9tYXhfZWNj
X3N0cmVuZ3RoKQo+ID4gPiArCQlyZXR1cm4gZmFsc2U7Cj4gPiA+ICsKPiA+ID4gKwkvKiBjaGVj
ayBlY2Mgc3RyZW5ndGgsIHNhbWUgYXMgbmFuZF9lY2NfaXNfc3Ryb25nX2Vub3VnaCgpIGRpZCAq
LyAgCj4gPiAKPiA+IFdoeSBub3QgdXNpbmcgbmFuZF9lY2NfaXNfc3Ryb25nX2Vub3VnaCgpIGlu
IHRoaXMgY2FzZT8gIAo+IAo+IEhpIE1pcXXDqGwsCj4gCj4gMS4gY3VycmVudCBuYW5kX2VjY19p
c19zdHJvbmdfZW5vdWdoKCkgY29tcGFyZWQgcmVxdWlyZWQgZWNjIHdpdGggY29uZiBlY2MsIGJ1
dAo+IEkgb25seSBzZWUgY29uZiB3YXMgaW5pdGlhbGl6ZWQgaW4gc29tZSBzcGktbmFuZCBhbmQg
c3cgZWNjIGRyaXZlcnMuIE5vdCBzdXJlIGlmCj4gaXQncyBhIGlzc3VlIG9yIHNvbWV0aW5nIG1p
c3NlZCBpbiB0aGUgZ3BtaSBkcml2ZXI/IE9uIG15IHNpZGUsCj4gbmFuZF9lY2NfaXNfc3Ryb25n
X2Vub3VnaCgpIGp1c3QgcmV0dXJuZWQuCgpJdCB3YXMgaW5kZWVkIG1lYW50IHRvIGJlIHVzZWQg
cHJpbWFyaWx5IGJ5IHRoZSBuZXcgRUNDIGVuZ2luZQphYnN0cmFjdGlvbiwgYnV0IGl0J3MgYmVz
dCBub3QgdG8gZHVwbGljYXRlIHRoaXMgbG9naWMgb3ZlciBhbmQgb3ZlcgphZ2Fpbiwgc28gaWYg
ZmlsbGluZyBhIG5hbmRfZWNjX3Byb3BzIHN0cnVjdHVyZSBpcyBhbGwgaXQgdGFrZXMgdG8gYmUK
YWJsZSB0byB1c2UgdGhpcyBoZWxwZXIsIGl0J3MgcHJvYmFibHkgd29ydGggdHJ5aW5nPwoKPiAy
LiBJIHJlbWVtYmVyZWQgdGhhdCBuYW5kX2VjY19pc19zdHJvbmdfZW5vdWdoKCkgdXNlZCB0byBj
b21wYXJlIHJlcXVpcmVkIGVjYwo+IHdpdGggbmFuZF9lY2NfY3RybCBlY2Mgc3RyZW5ndGgsIGJ1
dCBldmVuIGluIHRoaXMgY2FzZSwgSSBkb24ndCBrbm93IGlmIGl0J3MgYQo+IGdvb2QgaWRlYSBq
dXN0IGRpcmVjdGx5IGNhbGwgdGhpcyBmdW5jdGlvbi4gVXN1YWxseSB0aGUgZHJpdmVyIGxvb2tp
bmcgZm9yIGEKPiBwcm9wZXIgYmNoIHNldHRpbmcgYW5kIGdldCB0aGUgZWNjIHN0cmVuZ3RoL3N0
ZXAsIGF0IGxhc3Qgc2V0IHRoZSBuYW5kX2VjY19jdHJsCj4gLiBTbyBhdCB0aGlzIG1vbWVudCwg
aXQncyBub3QgcmVhZHkgdG8gdXNlIG5hbmRfZWNjX2lzX3N0cm9uZ19lbm91Z2goKS4KPiA+ICAg
Cj4gPiA+ICsJaWYgKHJlcXVpcmVtZW50cy0+c3RlcF9zaXplKSB7Cj4gPiA+ICsJCWNvcnIgPSBt
dGQtPndyaXRlc2l6ZSAqIGdlby0+ZWNjX3N0cmVuZ3RoIC8KPiA+ID4gKwkJICAgICAgIGdlby0+
ZWNjX2NodW5rX3NpemU7Cj4gPiA+ICsJCWRzX2NvcnIgPSBtdGQtPndyaXRlc2l6ZSAqIHJlcXVp
cmVtZW50cy0+c3RyZW5ndGggLwo+ID4gPiArCQkJICByZXF1aXJlbWVudHMtPnN0ZXBfc2l6ZTsK
PiA+ID4gKwkJaWYgKGNvcnIgPCBkc19jb3JyIHx8Cj4gPiA+ICsJCSAgICBnZW8tPmVjY19zdHJl
bmd0aCA8IHJlcXVpcmVtZW50cy0+c3RyZW5ndGgpCj4gPiA+ICsJCQlyZXR1cm4gZmFsc2U7Cj4g
PiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJcmV0dXJuIHRydWU7Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+
ID4gIC8qICAKPiA+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsICAKCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
