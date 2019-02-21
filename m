Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C15C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:17:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF792086A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mfqGAnFw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF792086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kMhGSAcjFwu7QOFJEemGldULEVsRROW8VPKjTipBVJ0=; b=mfqGAnFwzrhZSU
	USHvVBOiqzJQch8OepbsYXX0AiCDbas4Vh2trSnzzbsyEp3k2KMUO1WF3UlnNhPl1S71DOU2yYGSt
	mErpmxk9rOQ5+E7k8FxQjW1gCFiJOeGKcDcunOZipWK1llYL1BqAtohRn1ZLmTjCwDz8B6Nx07weT
	CazrF2l/I+3dGx2KbSdCYsdFX8/XQg+K+H13KGowOp2wbE+H5xa9IScw2M7ufpQW6NDwkVMoA7cb8
	i6t/bQUClN2syaEkZlVudKrSMYQdg/8p3s95WXPLjjuvtJzH3eOHVuzyfTNYZep7t5RbjyF4nRRUN
	YQGlUXcz3VMwyonsLuWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwkTk-0003OX-4P; Thu, 21 Feb 2019 09:17:16 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkSF-0001T3-EV; Thu, 21 Feb 2019 09:15:47 +0000
X-Originating-IP: 90.88.23.190
Received: from localhost.localdomain
 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B987B1BF20A;
 Thu, 21 Feb 2019 09:15:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH 00/15] mtd: rawnand: 5th batch of cleanups
Date: Thu, 21 Feb 2019 10:15:12 +0100
Message-Id: <20190221091527.20497-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_011543_829936_7DF3E46A 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIHRpbWUgSSBhbSB0aGUgb25lIHdobyBzZW5kIHRoZSBjbGVhbnVwcyBvbiBi
ZWhhbGYgb2YgQm9yaXMsIEkKanVzdCB0b29rIGhpcyBwYXRjaGVzIGJlY2F1c2UgSSBuZWVkZWQg
dGhlbSBmb3IgbXkgJ2dlbmVyaWMgRUNDCmVuZ2luZScgd29yay4gQmV0d2VlbiB0aGlzIGNsZWFu
dXAgc2VyaWVzIGFuZCB0aGUgRUNDIGVuZ2luZSBzZXJpZXMKdGhlcmUgd2lsbCBiZSBhbiBhZGRp
dGlvbmFsIG9uZSwgdG8gcHJlcGFyZSB0aGUgZmllbGQuCgpQYXRjaCAxIGFkZHMgYSBmaWVsZCB0
byB0aGUgbWVtb3JnIHN0cnVjdHVyZSwgcGF0Y2ggMiAmIDMgYWRkIGhlbHBlcnMKaW4gdGhlIHJh
dyBOQU5EIGNvcmUsIGZvbGxvd2luZyBwYXRjaGVzIGFyZSBnZW5lcmFsIGNsZWFudXBzIGluIHRo
ZQpyYXcgTkFORCBhcmVhIHRoYXQgcHJlcGFyZXMgdGhlIHVzZSBvZiB0aGUgKGdlbmVyaWMpIE5B
TkQgY29yZSBzaGFyZWQKYmV0d2VlbiByYXcgTkFORHMgYW5kIFNQSS1OQU5EcyBhbmQgZmluYWxs
eSBhIGZldyBuYW5kX2NoaXAgZW50cmllcwphcmUgZHJvcHBlZC4KClJlZ2FyZHMsCk1pcXXDqGwK
CgpCb3JpcyBCcmV6aWxsb24gKDE1KToKICBtdGQ6IG5hbmQ6IEFkZCBtYXhfYmFkX2VyYXNlYmxv
Y2tzX3Blcl9sdW4gaW5mbyB0byBtZW1vcmcKICBtdGQ6IG5hbmQ6IEFkZCBhbiBoZWxwZXIgcmV0
dXJuaW5nIHRoZSBudW1iZXIgb2YgZXJhc2VibG9ja3MgcGVyCiAgICB0YXJnZXQKICBtdGQ6IG5h
bmQ6IEFkZCBhbiBoZWxwZXIgdG8gcmV0cmlldmUgdGhlIG51bWJlciBvZiBwYWdlcyBwZXIgdGFy
Z2V0CiAgbXRkOiBzcGluYW5kOiBJbXBsZW1lbnQgbXRkLT5fbWF4X2JhZF9ibG9ja3MKICBtdGQ6
IHJhd25hbmQ6IFVzZSBuYW5kX3RvX210ZCgpIGluIG5hbmRfe3NldCxnZXR9X2ZsYXNoX25vZGUo
KQogIG10ZDogcmF3bmFuZDogUHJlcGFyZSB0aGluZ3MgdG8gcmV1c2UgdGhlIGdlbmVyaWMgTkFO
RCBsYXllcgogIG10ZDogcmF3bmFuZDogRmlsbCBtZW1vcmcgZHVyaW5nIGRldGVjdGlvbgogIG10
ZDogcmF3bmFuZDogSW5pdGlhbGl6ZSB0aGUgbmFuZF9kZXZpY2Ugb2JqZWN0CiAgbXRkOiByYXdu
YW5kOiBQcm92aWRlIGFuIGhlbHBlciB0byBnZXQgY2hpcC0+ZGF0YV9idWYKICBtdGQ6IHJhd25h
bmQ6IE1vdmUgYWxsIHBhZ2UgY2FjaGUgcmVsYXRlZCBmaWVsZHMgdG8gYSBzdWItc3RydWN0CiAg
bXRkOiByYXduYW5kOiBVc2UgbmFuZGRldl9tdGRfbWF4X2JhZF9ibG9ja3MoKQogIG10ZDogcmF3
bmFuZDogR2V0IHJpZCBvZiBjaGlwLT5iaXRzX3Blcl9jZWxsCiAgbXRkOiByYXduYW5kOiBHZXQg
cmlkIG9mIGNoaXAtPmNoaXBzaXplCiAgbXRkOiByYXduYW5kOiBHZXQgcmlkIG9mIGNoaXAtPm51
bWNoaXBzCiAgbXRkOiByYXduYW5kOiBHZXQgcmlkIG9mIGNoaXAtPmVjY197c3RyZW5ndGgsc3Rl
cH1fZHMKCiBkcml2ZXJzL210ZC9uYW5kL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAg
MzQgKysrCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMgIHwgICA4
ICstCiAuLi4vbXRkL25hbmQvcmF3L2JjbTQ3eHhuZmxhc2gvb3BzX2JjbTQ3MDYuYyAgfCAgIDIg
Ky0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgICAgICB8ICAgNyAr
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMgICAgICAgICAgICAgICAgIHwgICA2ICst
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmMgICAgICAgICAgICAgfCAgIDYgKy0K
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9lbGJjX25hbmQuYyAgICAgICAgICB8ICAgNCArLQog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2lmY19uYW5kLmMgICAgICAgICAgIHwgICA0ICstCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgICAgfCAgMTcgKy0KIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2hpc2k1MDRfbmFuZC5jICAgICAgICAgICB8ICAgMiArLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmggICAgICAgICAgICAgIHwgICAyICstCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9qejQ3NDBfbmFuZC5jICAgICAgICAgICAgfCAgIDcgKy0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jICAgICAgICAgICB8ICA0OSArKy0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jICAgICAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYW1kLmMgICAgICAgICAgICAgICB8ICAxMSArLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgICAgICAgIHwgMjUzICsrKysrKysrKysr
LS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYyAgICAgICAgICAgICAgIHwg
IDQ1ICsrLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfZXNtdC5jICAgICAgICAgICAgICB8
ICAxMCArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jICAgICAgICAgICAgIHwg
IDkwICsrKystLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfamVkZWMuYyAgICAgICAgICAg
ICB8ICAyNyArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9taWNyb24uYyAgICAgICAgICAg
IHwgIDE0ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyAgICAgICAgICAgICAg
fCAgMzUgKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX3NhbXN1bmcuYyAgICAgICAgICAg
fCAgNDIgKy0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX3Rvc2hpYmEuYyAgICAgICAgICAg
fCAgMTkgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYyAgICAgICAgICAgICAgICB8
ICAxMSArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jICAgICAgICAgICAgIHwg
ICA4ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jICAgICAgICAgICAgICAgfCAg
IDkgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyAgICAgICAgICAgICB8ICAx
NSArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFfbmFuZC5jICAgICAgICAgICAgIHwgICA4
ICstCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgICAgICAgICAgICAgICAgICAgfCAgIDEg
KwogZHJpdmVycy9tdGQvbmFuZC9zcGkvZ2lnYWRldmljZS5jICAgICAgICAgICAgIHwgICA2ICst
CiBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jICAgICAgICAgICAgICAgfCAgIDQgKy0K
IGRyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jICAgICAgICAgICAgICAgICB8ICAgMiArLQog
ZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5jICAgICAgICAgICAgICAgIHwgICAyICstCiBk
cml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGlu
Y2x1ZGUvbGludXgvbXRkL25hbmQuaCAgICAgICAgICAgICAgICAgICAgICB8ICAzMiArKy0KIGlu
Y2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgICAgICAgICAgICAgICB8ICA5NyArKysrLS0t
CiAzOCBmaWxlcyBjaGFuZ2VkLCA1NDggaW5zZXJ0aW9ucygrKSwgMzUwIGRlbGV0aW9ucygtKQoK
LS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
