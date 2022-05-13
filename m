Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B1C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuSigCtBF7PXnXPgVdMMferZFs/2EHIVuw0t1YM6EZc=; b=Q3tjFtBuAwZ7Mg
	s6Wo25c+tOS9lfIp3wvvws6TFqsbkU5lyRZOa+fL0s8tYqAgU4FbNh4+AHx/wpKBoPzp/r9n++vvb
	2saFfFF3zoCxj6W7BNyYAFfCWWZxpgC7wcQtDa/etWWeGEOa3zda96l0T2AQORxsKNnLHpoqXJ5Dy
	caET2dX1YlBQb1baXPwxGX3fXABFJlHsy7/iOdWAYcMn1zkys9+V2Dx5FEzW1C/qrsqOOEVokfI89
	F0PsvqkwKRLTiEgr48f7jDPR/Vj6AvFjv30YV1BGNSDo8ILeg9xSra0J8Qg/iGQk1d3qaMMulsfol
	TNMPow65uY+ChZyzPfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npSRo-00FW5o-EK; Fri, 13 May 2022 10:23:00 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npSRk-00FW44-Mp
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 10:22:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 209A6200014;
 Fri, 13 May 2022 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652437370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKGQzMvl09aeW/JHbZLxJsWC9vk0A9Wq5iOaeINC+eU=;
 b=BqLKfOLwkIwXDjK/SWTDjdRTdeAR0xUgcw4HEWSz7zFWnQF5cjfpxqarNCJVNlwj0Ysn9Q
 8Rqf+sCNgGMegm5tM6K+DrsYPcszY/2hGubshBf1CpSvbQ2HF7+02Zl9rKD3xJXATXIHT2
 FKMUnSRHyRux9tchbskrcTrY+Pxve91A6fSh+pM0Q0gZ6rineVDbvYLYGPAA92tIcYiPIi
 FuQhDq/wY4+7OmgpB4+gcJbKYtcvKwR2/A21NWfL6hsqkxrjrksPMD5nPByWEjbYDGvmv1
 hGwyvUiUHcuWSVCOgjFnIrYdlXUpa74gllaDIMTQl91DCpOIdMKOyWXgqlPjpw==
Date: Fri, 13 May 2022 12:22:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: st_spi_fsm: add missing
 clk_disable_unprepare() stfsm_remove()
Message-ID: <20220513122248.146d6944@xps13>
In-Reply-To: <20220513100322.2664431-1-yangyingliang@huawei.com>
References: <20220513100322.2664431-1-yangyingliang@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_032257_086669_AB276AC2 
X-CRM114-Status: GOOD (  12.26  )
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

SGksCgp5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20gd3JvdGUgb24gRnJpLCAxMyBNYXkgMjAyMiAx
ODowMzoyMiArMDgwMDoKCj4gQ2xvY2sgc291cmNlIGlzIHByZXBhcmVkIGFuZCBlbmFibGVkIGJ5
IGNsa19wcmVwYXJlX2VuYWJsZSgpCj4gaW4gcHJvYmUgZnVuY3Rpb24sIGJ1dCBubyBkaXNhYmxl
IG9yIHVucHJlcGFyZSBpbiByZW1vdmUgZnVuY3Rpb24uCgoJCQkgbm90IGRpc2FibGVkIG9yIHVu
cHJlcGFyZWQKCk90aGVyd2lzZSBsb29rcyBnb29kLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5n
IFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20u
YyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCj4gaW5kZXggOTgzOTk5YzAyMGQ2
Li5kMzM3N2IxMGZjMGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlf
ZnNtLmMKPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwo+IEBAIC0yMTI2
LDYgKzIxMjYsOCBAQCBzdGF0aWMgaW50IHN0ZnNtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICB7Cj4gIAlzdHJ1Y3Qgc3Rmc20gKmZzbSA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOwo+ICAKPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShmc20tPmNsayk7Cj4gKwo+
ICAJcmV0dXJuIG10ZF9kZXZpY2VfdW5yZWdpc3RlcigmZnNtLT5tdGQpOwo+ICB9Cj4gIAoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
