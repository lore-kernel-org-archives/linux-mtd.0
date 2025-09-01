Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D77CA1007
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Nw7W3WV4k2lGHE+g/PMmAa4tbG2ZGq0NuJEFxtcZdw=; b=gVjdmqOWJTSzWh
	t998ndmua91HTOB9mSq81pleW9QGFTujm0zDWX3onuJO+rn+XRBdaG1/fRpO7TDSPU+WzC2rDoj7h
	IU3yJow1PFWvBQJ0Lin5eAyG+5DEzdgzF8FiPp2QQokHoShKWdx+idfYunBZFKOcJJ+nHS8Mw0o2T
	bEOSbm5wXfUjnoCLcRc6bwuZdUz4q7/wsKfeTK9vWFVtC3Av8tTEh64gKcriJpLu07QFevPvHvufW
	VaEuDgaKm2EEYYC6jvmzVjsk7vV3iN1UWHr8pTkpq6l2OuHXiZgLERRHVT57kv7wKMWRpNG5dgq80
	wWeebXMS+f1NBocLzREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Ac-0000000CzNX-3jcd;
	Mon, 01 Sep 2025 15:10:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3fL-0000000CTEG-2krs
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:29:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 21618C8F1CA;
	Mon,  1 Sep 2025 12:29:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDD1860699;
	Mon,  1 Sep 2025 12:29:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F5951C22D87C;
	Mon,  1 Sep 2025 14:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cWgoH2Dk3tP8+kSxnwvn4KHgYnZS93diogUKlzT44bQ=;
	b=Sc3mWsNKvebbzs3fTPRX1biLkJfchmfJkPG9xud03MuTJkxYOw1f6UtPBR6QcYZybftTOd
	HgLuk6jeBaA8OLkkFNMqN1QB1RqV6fx+T84104BcmgpBL9gdVSypKK50rKzKOeEBSxqcOW
	xCn9lFlNpqSTZ0McAu0gjyabQ6+RDYYKsCNyaHF8FMsi7b+J+nbWLoJntU8IL14fij0JKA
	zdHZLKwx1ZIzo8zoAd5OAQWvgX2mV8ACVVGbx2WLn8Z+S3uxfHnk9bQgayiv+bohqXQbPe
	j1QWmqM+iKbbs1HVDr83yckEFJa1c2ynPYqF/q/oXai/olZnPPm1r6qMNl6fgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
In-Reply-To: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
References: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v14 0/3] mtd: Add support for stacked memories
Message-Id: <175672977534.48892.6856890804594361623.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:29:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052943_869387_5FED5CA7 
X-CRM114-Status: GOOD (  11.82  )
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

T24gTW9uLCAyMyBKdW4gMjAyNSAxNjoyNDo0MiArMDUzMCwgQW1pdCBLdW1hciBNYWhhcGF0cmEg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdGFja2VkIHN1cHBvcnQgYnkgZW5oYW5j
aW5nIHRoZSBleGlzdGluZyBtdGQtY29uY2F0Cj4gZHJpdmVyIHRvIGJlIG1vcmUgZ2VuZXJpYy4K
PiAKPiBBcyBiYWNrZ3JvdW5kLCBhIGZldyB5ZWFycyBhZ28sIEJlcm5oYXJkIEZyYXVlbmRpZW5z
dCBpbml0aWF0ZWQgYW4gZWZmb3J0Cj4gWzJdIHRvIGFjaGlldmUgdGhlIHNhbWUsIHdoaWNoIHdh
cyBsYXRlciBhZGFwdGVkIGJ5IE1pcXVlbCBbMV0gdG8gaW50cm9kdWNlCj4gc3RhY2tlZCBtb2Rl
IHN1cHBvcnQuIEluIHRoaXMgYXBwcm9hY2gsIHBhcnRpdGlvbnMgdG8gYmUgY29uY2F0ZW5hdGVk
IHdlcmUKPiBzcGVjaWZpZWQgdXNpbmcgYSBEVCBwcm9wZXJ0eSAicGFydC1jb25jYXQiIHdpdGhp
biB0aGUgcGFydGl0aW9ucwo+IGRlZmluaXRpb24sIGFsbG93aW5nIHR3byBNVEQgZGV2aWNlcyB0
byBmdW5jdGlvbiBhcyBhIHNpbmdsZSBsYXJnZXIgb25lIGluCj4gb3JkZXIgdG8gYmUgYWJsZSB0
byBkZWZpbmUgcGFydGl0aW9ucyBhY3Jvc3MgY2hpcCBib3VuZGFyaWVzLiBIb3dldmVyLCB0aGUK
PiBiaW5kaW5ncyB3ZXJlIG5vdCBhY2NlcHRlZC4gQXMgYSByZXN1bHQsIHRoZSBtdGQtY29uY2F0
IGFwcHJvYWNoIHdhcwo+IGRyb3BwZWQsIGFuZCBhbHRlcm5hdGl2ZSBEVCBiaW5kaW5ncyB3ZXJl
IGludHJvZHVjZWQgWzNdWzRdWzVdLCBkZXNjcmliaW5nCj4gdGhlIHR3byBmbGFzaCBkZXZpY2Vz
IGFzIG9uZS4gQ29ycmVzcG9uZGluZyBTUEkgY29yZSBjaGFuZ2VzIHRvIHN1cHBvcnQKPiB0aGVz
ZSBiaW5kaW5ncyB3ZXJlIGxhdGVyIGFkZGVkIFs2XS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBt
dGQvbmV4dCwgdGhhbmtzIQoKWzEvM10gZHQtYmluZGluZ3M6IG10ZDogRGVzY3JpYmUgTVREIHBh
cnRpdGlvbnMgY29uY2F0ZW5hdGlvbgogICAgICBjb21taXQ6IGE3YzgxYWMzMjhhNmRkZGY1MTU4
OGVjYzdhOTRmNTZkYTM0Yzc4NzUKWzIvM10gbXRkOiBNb3ZlIHN0cnVjdCBtdGRfY29uY2F0IGRl
ZmluaXRpb24gdG8gaGVhZGVyIGZpbGUKICAgICAgY29tbWl0OiAwOGJlMjI0ZTM5NjVkYzcxNjQ2
MGVlNjJkZGYxZjMwNDIxMDQ5YmVkClszLzNdIG10ZDogQWRkIGRyaXZlciBmb3IgY29uY2F0ZW5h
dGluZyBkZXZpY2VzCiAgICAgIGNvbW1pdDogZmE0N2RjODI5NTE5NGEwM2M5MTgyOTQ1ODA1YjYx
N2IwMTQ0N2FlOQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
