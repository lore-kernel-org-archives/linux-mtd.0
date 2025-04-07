Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6076C369A3
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WH/lCe8PgMJ20rCjG4DlyTYOcssKr+uNUd9TWxzZcsA=; b=cohnl5PyeQPexM
	yOydZF1YevOiqihkG3CKIefmdekz8nGTctT44VqN3Gyrf6pnflLGWrq1uWWpOcZXRMJtZlZDLxkvx
	42xxezRGSq7xfizzLUm/nBRail4FaXz83k+lVCIQm9Ugbf0tZBvyI5dCjT+Ao1QbZ6aEK5XRyrJPW
	vSxeqp8EgiQ8sV35qyedJmjxI5fnn2uN4ygVc7Afc7B6MA26FtDYPy3YzkkyC7v6FRZofgq3mbuGN
	TVjF/ds1Uh2QZM+cFREJVp+++6GZA9ipVuwDBgTqWQRUbywftawPMKMBPL71p5IGQiiHZ8MYM4giz
	Wyw64AkPRqaQxWWgBcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hVc-0000000Gvol-0m6c;
	Mon, 07 Apr 2025 08:07:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hP3-0000000GuRT-0f6N
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 08:00:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E61B244371;
	Mon,  7 Apr 2025 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744012818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MSWCyW5uI5Z9ZGyZVx2/95ay1GhUkLkvBEaHMuEqJU=;
	b=eVFwLXdXTJXwPIFhA7cVn/m2T20j4rpfa2ue6EFts15Kbbhw7S/fhPvB8CeQGjHsQo5M89
	W8FnhtVKz+GkrA4Xa30uH7+aI//BmWK+BVBbp//WK+VewDCqMls9z7xyNINscH9fU4h3bU
	kYCkdaMYFA1F5+B8HOsuDHRmVRybyP9Flzjjpdto5D7WhK2wF5mN11a7CeFoSSaFpKaq7i
	COjlGUHB9QEKMXbaN4bX9Ue8pw/1w6FRlJEay8s8g+BjxxNu6uzY3l6RvAtOqKty/n7HAW
	YNpMdm2HQhj+FjQzqPNPHA+qG4uDtnnYzzxvUhKHyfc/tsHL3EevLvKlm879dg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Md Sadre Alam <quic_mdalam@quicinc.com>,  Mark Brown
 <broonie@kernel.org>,  Varadarajan Narayanan <quic_varada@quicinc.com>,
  Sricharan Ramabadhran <quic_srichara@quicinc.com>,  Arnd Bergmann
 <arnd@arndb.de>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic: fix common module build
In-Reply-To: <20250407072745.186831-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 7 Apr 2025 09:27:14 +0200")
References: <20250407072745.186831-1-arnd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 07 Apr 2025 10:00:16 +0200
Message-ID: <875xjgflkf.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeeftdefledvieegvdejlefgleegjefhgfeuleevgfdtjeehudffhedvheegueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_010021_492896_4573F0DC 
X-CRM114-Status: GOOD (  10.93  )
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

SGkgQXJuZCwKCk9uIDA3LzA0LzIwMjUgYXQgMDk6Mjc6MTQgKzAyLCBBcm5kIEJlcmdtYW5uIDxh
cm5kQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+Cj4gV2hlbiB0aGUgTkFORCBkcml2ZXIgaXMgYSBsb2FkYWJsZSBtb2R1bGUsIGFuZCB0
aGUgU1BJIGRyaXZlciBpcwo+IHR1cm5lZCBvZmYsIHRoZSBjb21tb24gcGFydCBpcyBub3QgYnVp
bHQ6Cj4KPiBFUlJPUjogbW9kcG9zdDogInFjb21fbmFuZGNfdW5hbGxvYyIgW2RyaXZlcnMvc3Bp
L3NwaS1xcGljLXNuYW5kLmtvXSB1bmRlZmluZWQhCj4gRVJST1I6IG1vZHBvc3Q6ICJxY29tX3dy
aXRlX3JlZ19kbWEiIFtkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5rb10gdW5kZWZpbmVkIQo+
IEVSUk9SOiBtb2Rwb3N0OiAicWNvbV9yZWFkX3JlZ19kbWEiIFtkcml2ZXJzL3NwaS9zcGktcXBp
Yy1zbmFuZC5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiAicWNvbV9uYW5kY19kZXZf
dG9fbWVtIiBbZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQua29dIHVuZGVmaW5lZCEKPiBFUlJP
UjogbW9kcG9zdDogInFjb21fbmFuZGNfYWxsb2MiIFtkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFu
ZC5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiAicWNvbV9zdWJtaXRfZGVzY3MiIFtk
cml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0
OiAicWNvbV9jbGVhcl9yZWFkX3JlZ3MiIFtkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5rb10g
dW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiAicWNvbV9jbGVhcl9iYW1fdHJhbnNhY3Rpb24i
IFtkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rw
b3N0OiAicWNvbV9yZWFkX2RhdGFfZG1hIiBbZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQua29d
IHVuZGVmaW5lZCEKPiBFUlJPUjogbW9kcG9zdDogInFjb21fd3JpdGVfZGF0YV9kbWEiIFtkcml2
ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5rb10gdW5kZWZpbmVkIQo+Cj4gU2ltcGxpZnkgdGhlIE1h
a2VmaWxlIHRvIGp1c3QgYnVpbGQgdGhlIGNvbW1vbiBiaXRzIGZvciBlaXRoZXIgb2YgdGhlIHR3
bywKPiBzbyBpdCB3aWxsIGJlIGJ1aWx0LWluIHdoZW5ldmVyIG9uZSBvZiB0aGVtIGlzLCBvciBv
dGhlcndpc2UgYSBsb2FkYWJsZQo+IG1vZHVsZSBpZiBuZWVkZWQuCj4KPiBGaXhlczogNzMwNGQx
OTA5MDgwICgic3BpOiBzcGktcXBpYzogYWRkIGRyaXZlciBmb3IgUUNPTSBTUEkgTkFORCBmbGFz
aCBJbnRlcmZhY2UiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+CgpUaGFua3MgZm9yIHRoZSBmaXgsIEkganVzdCBhcHBsaWVkIEdlZXJ0J3MgaWRlbnRpY2Fs
IHBhdGNoIHRoaXMgbW9ybmluZywKSSB3YXMgd2FpdGluZyBmb3IgLXJjMSB0byBzeW5jaHJvbml6
ZSBldmVyeXRoaW5nIGFnYWluOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMTc0
NDAxMDEyNzQ2Ljk5ODY1OC4xMTIwNjk5NDM0ODY4Mzk4NzYzMC5iNC10eUBib290bGluLmNvbS9U
LyN0CgpTb3JyeSBmb3IgdGhlIGRlbGF5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
