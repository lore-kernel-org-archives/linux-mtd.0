Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12389C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jPEmdUZfB9AytxrlVJcluqc74OTTGdtIgnr182c6Jk=; b=VRf1YuCbjvkad+
	zLFmw0Da+hG9ddkqjkkBYKFzHJ7yuCiYxfXm1qhzwawwsVbVTYV5XQ6gBKAuRUs2QHWPdXDJGlJ5r
	nJ0xYi+i8ITihC7ORAZTDiG9oqhmWrBa+RpJ+3sRcmcbzmk0sCb2D1qFeDeFL/OTVLcbFcw82zLjN
	TPHGazxiHuJRH8SIyeSHAQdqSLFzA9qUmCOoO5fpwYE/45X3D5vw8Y832S1bNa7hXA9MSJS2Q/Q6t
	79OEaETgebja/jUe1pq2n10gyQ5CF2DYv3ldaz1p9fwcEJIYCG82/0Fpc1O55UmM8Gc8Nlfha0BCc
	bMa+6fir2a86t2/RfFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdgn-00HZMO-Uo; Tue, 05 Apr 2022 07:33:22 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdc7-00HWpf-Vi
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 07:28:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C87F7C0002;
 Tue,  5 Apr 2022 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649143708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNba/ZsRl+TMUiugX0Hpzo+4o+Xo8F6lOgItKYdU+P4=;
 b=obNGbkyDBWp0x0C6BH9cvoZsoCuqQoPpIPdO0aNcg432I6QJ5pZhtFXXSRWDw5GjCM7d5B
 Q3ioqjD0Gnu73ST/yU8Iszs07XMQfixVVFEsdCYKZXA2i8Zzr8yZqOJsJFBQkmBvtAogXw
 gYYUj9dCAIq5Av8v5OGJxF5Z1ZDK40oG3xYXeZLfxDnarePPQdNJ5Ta22dq8Mh219R7qB2
 HGuYDG6ok93ufBMwKKtn2h3JuVfwThlrm494X3rTqDaC0ju05Nx/njUDS5bzsbpK8VEQVx
 QwpaQuWg7V4zj6gT08ke0ZDAUr3CChiUGDhfWMUTnaahyeP/P+izOUDPfKXTCw==
Date: Tue, 5 Apr 2022 09:28:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: sean@geanix.com, frieder.schrempf@kontron.de, festevam@gmail.com,
 ye.li@nxp.com, peng.fan@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/4] mtd: rawnand: gpmi: Add strict ecc strength check
Message-ID: <20220405092826.1f70fb70@xps13>
In-Reply-To: <20220404195427.8871-2-han.xu@nxp.com>
References: <20220404195427.8871-1-han.xu@nxp.com>
 <20220404195427.8871-2-han.xu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_002832_206056_332CF93D 
X-CRM114-Status: GOOD (  18.84  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gTW9uLCAgNCBBcHIgMjAyMiAxNDo1NDoy
NSAtMDUwMDoKCj4gQWRkIHN0cmljdCBlY2Mgc3RyZW5ndGggY2hlY2sgaW4gZ3BtaV9jaGVja19l
Y2MoKSBmdW5jdGlvbiwgd2hpY2ggaXMKPiBzYW1lIGFzIG5hbmRfZWNjX2lzX3N0cm9uZ19lbm91
Z2goKSBkaWQuIEl0IHdpbGwgY2hlY2sgYm90aCBjb3JyZWN0IGJpdHMKPiBhbmQgY29ycmVjdCBi
aXRzIHBlciBieXRlIHRvIGVuc3VyZSBpdCBtZWV0cyBjaGlwIHJlcXVpcmVkIGVjYyBzdHJlbmd0
aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW4gWHUgPGhhbi54dUBueHAuY29tPgo+IAo+IC0tLQo+
IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gc3BsaXQgdGhlIGVjYyBjaGVjayB0byBhIHNpbmdsZSBw
YXRjaAo+IC0tLQo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1u
YW5kLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9n
cG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBpbmRleCA0MTQ0ZDU5MzcxMDMuLjlhMzdmOGNjNjYzZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBAQCAt
MjM4LDkgKzIzOCwxNCBAQCBzdGF0aWMgdm9pZCBncG1pX2R1bXBfaW5mbyhzdHJ1Y3QgZ3BtaV9u
YW5kX2RhdGEgKnRoaXMpCj4gIAkJZ2VvLT5ibG9ja19tYXJrX2JpdF9vZmZzZXQpOwo+ICB9Cj4g
IAo+IC1zdGF0aWMgaW5saW5lIGJvb2wgZ3BtaV9jaGVja19lY2Moc3RydWN0IGdwbWlfbmFuZF9k
YXRhICp0aGlzKQo+ICtzdGF0aWMgYm9vbCBncG1pX2NoZWNrX2VjYyhzdHJ1Y3QgZ3BtaV9uYW5k
X2RhdGEgKnRoaXMpCgpUaGlzIGNoYW5nZSBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBjb21taXQu
Cgo+ICB7Cj4gKwlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gJnRoaXMtPm5hbmQ7Cj4gKwlzdHJ1
Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKCZ0aGlzLT5uYW5kKTsKPiAgCXN0cnVjdCBi
Y2hfZ2VvbWV0cnkgKmdlbyA9ICZ0aGlzLT5iY2hfZ2VvbWV0cnk7Cj4gKwljb25zdCBzdHJ1Y3Qg
bmFuZF9lY2NfcHJvcHMgKnJlcXVpcmVtZW50cyA9Cj4gKwkJbmFuZGRldl9nZXRfZWNjX3JlcXVp
cmVtZW50cygmY2hpcC0+YmFzZSk7Cj4gKwlpbnQgY29yciwgZHNfY29ycjsKPiAgCj4gIAkvKiBE
byB0aGUgc2FuaXR5IGNoZWNrLiAqLwo+ICAJaWYgKEdQTUlfSVNfTVhTKHRoaXMpKSB7Cj4gQEAg
LTI0OCw3ICsyNTMsMjIgQEAgc3RhdGljIGlubGluZSBib29sIGdwbWlfY2hlY2tfZWNjKHN0cnVj
dCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiAgCQlpZiAoZ2VvLT5nZl9sZW4gPT0gMTQpCj4gIAkJ
CXJldHVybiBmYWxzZTsKPiAgCX0KPiAtCXJldHVybiBnZW8tPmVjY19zdHJlbmd0aCA8PSB0aGlz
LT5kZXZkYXRhLT5iY2hfbWF4X2VjY19zdHJlbmd0aDsKPiArCj4gKwlpZiAoZ2VvLT5lY2Nfc3Ry
ZW5ndGggPiB0aGlzLT5kZXZkYXRhLT5iY2hfbWF4X2VjY19zdHJlbmd0aCkKPiArCQlyZXR1cm4g
ZmFsc2U7Cj4gKwo+ICsJLyogY2hlY2sgZWNjIHN0cmVuZ3RoLCBzYW1lIGFzIG5hbmRfZWNjX2lz
X3N0cm9uZ19lbm91Z2goKSBkaWQgKi8KCldoeSBub3QgdXNpbmcgbmFuZF9lY2NfaXNfc3Ryb25n
X2Vub3VnaCgpIGluIHRoaXMgY2FzZT8KCj4gKwlpZiAocmVxdWlyZW1lbnRzLT5zdGVwX3NpemUp
IHsKPiArCQljb3JyID0gbXRkLT53cml0ZXNpemUgKiBnZW8tPmVjY19zdHJlbmd0aCAvCj4gKwkJ
ICAgICAgIGdlby0+ZWNjX2NodW5rX3NpemU7Cj4gKwkJZHNfY29yciA9IG10ZC0+d3JpdGVzaXpl
ICogcmVxdWlyZW1lbnRzLT5zdHJlbmd0aCAvCj4gKwkJCSAgcmVxdWlyZW1lbnRzLT5zdGVwX3Np
emU7Cj4gKwkJaWYgKGNvcnIgPCBkc19jb3JyIHx8Cj4gKwkJICAgIGdlby0+ZWNjX3N0cmVuZ3Ro
IDwgcmVxdWlyZW1lbnRzLT5zdHJlbmd0aCkKPiArCQkJcmV0dXJuIGZhbHNlOwo+ICsJfQo+ICsK
PiArCXJldHVybiB0cnVlOwo+ICB9Cj4gIAo+ICAvKgoKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
