Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27DEE7545C
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Oct 2023 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rYjaBxcPUHhN8sTDxGofY/ZJ7FB16hlH4VxQb5Sshec=; b=uhCfYGf0w7DNCUEwZft3o2xXYK
	z3iiQDQ3OyMWkdDVLoFvs1Kar0KxG5Qb5L/RniXXgYdb1hUkVoY+CrN3lMj8I+S4Nap2U7XOjtJUV
	4Fh9arC+4Guq3ThVl/bTZ8y8tBmHGLJqQ0aGwRDTktJHySIMTG3i/RJEG3ZfmijNvh23q6gu43ggA
	P6cgqMoT227jLI189WV3Egs8hir6Rfme0pqtdUDlPiQD0/3tBJIoYygUh/4GxdYihDbzvTplnVJLy
	lFBNuObZ9tK7g/1SJ3vVohg/3Mn5MPXykzKm0m0tOioJxr59+eKlWWhZELBwopWg+KDlKC8eTjwVc
	cxwvbJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnjv0-00F6Lb-2z;
	Tue, 03 Oct 2023 18:14:50 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnjuw-00F6KL-16
	for linux-mtd@lists.infradead.org;
	Tue, 03 Oct 2023 18:14:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 864C16340E0E;
	Tue,  3 Oct 2023 20:14:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QeJ_hbG7TRXa; Tue,  3 Oct 2023 20:14:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 899A36340DF3;
	Tue,  3 Oct 2023 20:14:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MM3kCFtSHPOQ; Tue,  3 Oct 2023 20:14:36 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5FCBC6340DE8;
	Tue,  3 Oct 2023 20:14:36 +0200 (CEST)
Date: Tue, 3 Oct 2023 20:14:36 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1553084515.31405.1696356876189.JavaMail.zimbra@nod.at>
In-Reply-To: <bac56760e1abec46e1ca5582fc30cbca1f42af9d.1691717480.git.daniel@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org> <bac56760e1abec46e1ca5582fc30cbca1f42af9d.1691717480.git.daniel@makrotopia.org>
Subject: Re: [PATCH v4 3/8] mtd: ubi: block: don't return on error when
 removing
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: don't return on error when removing
Thread-Index: mEjhakoF9gHQlvYZWxhJOUfsm127PA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_111446_691106_6974FF65 
X-CRM114-Status: GOOD (  17.80  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBbjogIlJhbmR5IER1bmxhcCIgPHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz4sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJy
aWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LAo+ICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVz
aHJAdGkuY29tPiwgIlJvYiBIZXJyaW5nIiA8cm9iaCtkdEBrZXJuZWwub3JnPiwgIktyenlzenRv
ZiBLb3psb3dza2kiCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4sICJDb25v
ciBEb29sZXkiIDxjb25vcitkdEBrZXJuZWwub3JnPiwgIkRhbmllbCBHb2xsZSIgPGRhbmllbEBt
YWtyb3RvcGlhLm9yZz4sCj4gImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPiwgImRldmljZXRyZWUiIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1r
ZXJuZWwiCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IEZyZWl0
YWcsIDExLiBBdWd1c3QgMjAyMyAwMzozNzoxMgo+IEJldHJlZmY6IFtQQVRDSCB2NCAzLzhdIG10
ZDogdWJpOiBibG9jazogZG9uJ3QgcmV0dXJuIG9uIGVycm9yIHdoZW4gcmVtb3ZpbmcKCj4gVGhl
cmUgaXMgbm8gcG9pbnQgb24gcmV0dXJuaW5nIHRoZSBlcnJvciBmcm9tIHViaWJsb2NrX3JlbW92
ZSBpbiBjYXNlCj4gaXQgaXMgYmVpbmcgY2FsbGVkIGR1ZSB0byBhIHZvbHVtZSByZW1vdmFsIGV2
ZW50IC0tIHRoZSB2b2x1bWUgaXMgZ29uZSwKPiB3ZSBzaG91bGQgZGVzdHJveSBhbmQgcmVtb3Zl
IHRoZSB1YmlibG9jayBkZXZpY2Ugbm8gbWF0dGVyIHdoYXQuCj4gCj4gSW50cm9kdWNlIG5ldyBi
b29sZWFuIHBhcmFtZXRlciAnZm9yY2UnIHRvIHRlbGwgdWJpYmxvY2tfcmVtb3ZlIHRvIGdvCj4g
b24gZXZlbiBpbiBjYXNlIHRoZSB1YmlibG9jayBkZXZpY2UgaXMgc3RpbGwgYnVzeS4gVXNlIHRo
YXQgbmV3IG9wdGlvbgo+IHdoZW4gY2FsbGluZyB1YmlibG9ja19yZW1vdmUgZHVlIHRvIGEgVUJJ
X1ZPTFVNRV9SRU1PVkVEIGV2ZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBHb2xsZSA8
ZGFuaWVsQG1ha3JvdG9waWEub3JnPgo+IC0tLQo+IGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jIHwg
NiArKystLS0KPiBkcml2ZXJzL210ZC91YmkvY2Rldi5jICB8IDIgKy0KPiBkcml2ZXJzL210ZC91
YmkvdWJpLmggICB8IDQgKystLQo+IDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYyBi
L2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5kZXggNDM3YzViODNmZmU1MS4uNjlmYTZmZWNi
ODQ5NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL3ViaS9ibG9jay5jCj4gQEAgLTQ1Niw3ICs0NTYsNyBAQCBzdGF0aWMgdm9pZCB1Ymli
bG9ja19jbGVhbnVwKHN0cnVjdCB1YmlibG9jayAqZGV2KQo+IAlpZHJfcmVtb3ZlKCZ1YmlibG9j
a19taW5vcl9pZHIsIGRldi0+Z2QtPmZpcnN0X21pbm9yKTsKPiB9Cj4gCj4gLWludCB1YmlibG9j
a19yZW1vdmUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4gK2ludCB1YmlibG9ja19yZW1v
dmUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmksIGJvb2wgZm9yY2UpCj4gewo+IAlzdHJ1Y3Qg
dWJpYmxvY2sgKmRldjsKPiAJaW50IHJldDsKPiBAQCAtNDcwLDcgKzQ3MCw3IEBAIGludCB1Ymli
bG9ja19yZW1vdmUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4gCj4gCS8qIEZvdW5kIGEg
ZGV2aWNlLCBsZXQncyBsb2NrIGl0IHNvIHdlIGNhbiBjaGVjayBpZiBpdCdzIGJ1c3kgKi8KPiAJ
bXV0ZXhfbG9jaygmZGV2LT5kZXZfbXV0ZXgpOwo+IC0JaWYgKGRldi0+cmVmY250ID4gMCkgewo+
ICsJaWYgKGRldi0+cmVmY250ID4gMCAmJiAhZm9yY2UpIHsKPiAJCXJldCA9IC1FQlVTWTsKPiAJ
CWdvdG8gb3V0X3VubG9ja19kZXY7CgpJcyBpdCByZWFsbHkgc2FmZSB0byBkZXN0cm95IHRoZSBi
bGsgcXVldWUgKHZpYSB1YmlibG9ja19jbGVhbnVwKCkpIGlmIHJlZmNudCBpcyA+IDA/CgpUaGFu
a3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
