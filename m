Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540EFC76195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5kQZmYcL8SBbHJ+T51638Wcn9qTzJYkhlZ28r/gZ00=; b=JVa+QejnoFOXr8
	KkEhQGRy2Mk/KTQ2XArOlsPY92xIPmYUBCbL2hfySTHK4/6PxKumvx1UduM0VSXabNyu0JMTdjFiR
	AQ0gML5d7wfiOLHRYvUlrNmQKUmeBimDeJp+6YtUIBxABqNNJpvGqwX2cc+vz/wvxGcd3Rcq93lQS
	gP+yj6Lh9HaMMYKW5Xp/9BHrK9N+baVniNdzef7NRo5mFuTfBpsrNKqcAaZuk1skPyLDJ/wPGqTj2
	2nXJeJUtafgDP76sca10SF5XYI3cWzDJLp8LjdiSWII+b3LyTaAOoH2jhu84PMNFKFk+PyjQBAzjC
	tiwq5UAsOgjs8TBCdHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezsC-00GOS5-19;
	Wed, 22 Mar 2023 14:55:32 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pezrz-00GOPa-0B
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 14:55:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2D5FE1C0006;
	Wed, 22 Mar 2023 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679496911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFfA11oca0z60zNaQoo8l9bTRoSybNo1r8bX+dEwnH8=;
	b=BCbP6P978hjPpmfP/HktMsFzWqr2cU0aBDRzuVx41Ae0cZRzjkyus4BSPwKrR6cYX5AqO8
	gHoiybIdDDQ2ljSgvr9wgMX+RUZmHncu3eNxt92/OFb8eiKFnNpOzdDKkmR2tUm4dfYetq
	a+FI1WM/diBlWqWK4c+/909BZ1a9Sk1krU9Ll2J81yCZi9DTmXPtJI3DXFB1HfT4tvu9P/
	X7Tv0VNktXp6L5UHUDLV8748FA4PNoJY9qqgHrOVWse7FOMzXhOG37LIqrb/oCddNt3wHl
	M4BY/dmkEoTDru7gq70xfNaedXdlIjEEdcp9XxGj3LZppZiHsgIa5IzLTSsgtw==
Date: Wed, 22 Mar 2023 15:55:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Remove the unused function
 is_imx51_nfc()
Message-ID: <20230322155508.6f4acb80@xps-13>
In-Reply-To: <20230317074041.115036-1-jiapeng.chong@linux.alibaba.com>
References: <20230317074041.115036-1-jiapeng.chong@linux.alibaba.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_075519_399206_47845B2A 
X-CRM114-Status: GOOD (  12.82  )
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

SGksCgpqaWFwZW5nLmNob25nQGxpbnV4LmFsaWJhYmEuY29tIHdyb3RlIG9uIEZyaSwgMTcgTWFy
IDIwMjMgMTU6NDA6NDEKKzA4MDA6Cgo+IFRoZSBmdW5jdGlvbiBpc19pbXg1MV9uZmMgaXMgZGVm
aW5lZCBpbiB0aGUgbXhjX25hbmQuYyBmaWxlLCBidXQgbm90Cj4gY2FsbGVkIGVsc2V3aGVyZSwg
c28gcmVtb3ZlIHRoaXMgdW51c2VkIGZ1bmN0aW9uLgo+IAo+IGRyaXZlcnMvbXRkL25hbmQvcmF3
L214Y19uYW5kLmM6MTYwMjoxOTogd2FybmluZzogdW51c2VkIGZ1bmN0aW9uICdpc19pbXg1MV9u
ZmMnLgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLCBidXQgYXBwYXJlbnRseSBpc19pbXg1M19uZmMo
KSBpcyBhbHNvIHVudXNlZCwKc3RyYW5nZSB0aGUgcm9ib3QgZGlkIG5vdCBwaWNrIHRoaXMgdXAu
IEFueXdheSwgbm8gbmVlZCB0byByZXNlbmQsIEkKcmVjZWl2ZWQgYW5vdGhlciBwYXRjaCByZW1v
dmluZyBib3RoIGZ1bmN0aW9ucyBhbHJlYWR5LgoKPiAKPiBSZXBvcnRlZC1ieTogQWJhY2kgUm9i
b3QgPGFiYWNpQGxpbnV4LmFsaWJhYmEuY29tPgo+IExpbms6IGh0dHBzOi8vYnVnemlsbGEub3Bl
bmFub2xpcy5jbi9zaG93X2J1Zy5jZ2k/aWQ9NDU1OQo+IFNpZ25lZC1vZmYtYnk6IEppYXBlbmcg
Q2hvbmcgPGppYXBlbmcuY2hvbmdAbGludXguYWxpYmFiYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L214Y19uYW5kLmMgfCA1IC0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFu
ZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhjX25hbmQuYwo+IGluZGV4IGY2Yzk2MzQxYjg5
Ni4uMTZkNzk1YzI1NjA5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L214Y19u
YW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jCj4gQEAgLTE1OTks
MTEgKzE1OTksNiBAQCBzdGF0aWMgaW5saW5lIGludCBpc19pbXgyNV9uZmMoc3RydWN0IG14Y19u
YW5kX2hvc3QgKmhvc3QpCj4gIAlyZXR1cm4gaG9zdC0+ZGV2dHlwZV9kYXRhID09ICZpbXgyNV9u
YW5kX2RldnR5cGVfZGF0YTsKPiAgfQo+ICAKPiAtc3RhdGljIGlubGluZSBpbnQgaXNfaW14NTFf
bmZjKHN0cnVjdCBteGNfbmFuZF9ob3N0ICpob3N0KQo+IC17Cj4gLQlyZXR1cm4gaG9zdC0+ZGV2
dHlwZV9kYXRhID09ICZpbXg1MV9uYW5kX2RldnR5cGVfZGF0YTsKPiAtfQo+IC0KPiAgc3RhdGlj
IGlubGluZSBpbnQgaXNfaW14NTNfbmZjKHN0cnVjdCBteGNfbmFuZF9ob3N0ICpob3N0KQo+ICB7
Cj4gIAlyZXR1cm4gaG9zdC0+ZGV2dHlwZV9kYXRhID09ICZpbXg1M19uYW5kX2RldnR5cGVfZGF0
YTsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
