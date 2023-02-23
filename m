Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00209C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rb4/fsK3ulG6UyOVSlTkvTyH4CYjwiboT/0nSt1OqQM=; b=bCQqUNbAdSCK5R
	pzAFcL0mRP9SxTPI9HFT9al6S1EX56otrbNaQNo2Iy+Byw90HwijMkvF8N34ezQ9aXwAgvt52LEmi
	L1M2ujaA4aoHqRnPrYxKRGeK0CVa4RsUXgplm6BsnDzZG4GLoWoUiNQUs0opFLoemFfSRD9GTCzQ7
	8uD6TZCW+PTlMTy7DdvehbJLQ6yxBRlipQ++Kt5qPruyu9BRFPXcOHarT03iyp302SnYLDvOPLJOA
	BL+CiP91VQl7kMRt9ga7ywp+tvV56XgAevJjnAaGGUkDY+lPTUvJDX0BNDw2C9f/6a3SxlPOC+4u/
	eAzlgz4QOJp5o8BO3LlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6Od-00FRZ8-WF; Thu, 23 Feb 2023 07:52:08 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6Oa-00FRY4-1Q
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 07:52:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BB376E0008;
	Thu, 23 Feb 2023 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677138717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3Na4CYb9kTAmsQXQ12a8ECc3REHW3J46FSYTiqPpIE=;
	b=F99Z6lVXJTZVJW0dd/aq59yPqZwxTXUuOLPS406f4jrym+0ugToFkF+77rPLI5xRdvdjsA
	gubHGaK1hxDtZL+twgny6uIhzqcp3zoCOoqG3Bx8lW5aBNsEMwbHZTDZd8KYsnKxkqVunX
	PlWQ2krBBRt9xswUEGeKWpyHYg1Gy5knuQsYZhOiVRIWjrYWHjR/HCcf3cfI4AhMBUhE+Y
	663qscealwy73M9NjwoTmz28M6+6P8pvBdfXxBSGvvQiWmQxL6xn3HFbeCs9OrogPo458I
	anuiQNKseaJ4Fp07eDR9XolsXU7molqov46rh9hjrhwh75QhqKYWOm8vWe+NLA==
Date: Thu, 23 Feb 2023 08:51:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hector Palacios <hector.palacios@digi.com>
Cc: herve.codina@bootlin.com, sashal@kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] nand_base: force best_mode to be >= 0
Message-ID: <20230223085156.76fade4e@xps-13>
In-Reply-To: <20230222152510.1064332-1-hector.palacios@digi.com>
References: <20230222152510.1064332-1-hector.palacios@digi.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_235204_545065_A3192758 
X-CRM114-Status: GOOD (  23.93  )
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

SGkgSGVjdG9yLAoKaGVjdG9yLnBhbGFjaW9zQGRpZ2kuY29tIHdyb3RlIG9uIFdlZCwgMjIgRmVi
IDIwMjMgMTY6MjU6MTAgKzAxMDA6Cgo+IEFjY29yZGluZyB0byB0aGUgT05GSSBzcGVjaWZpY2F0
aW9uLCBiaXQgMCBvZiAnU0RSIHRpbWluZyBtb2RlIHN1cHBvcnQnCj4gKGJ5dGVzIDEyOS0xMzAp
ICJzaGFsbCBiZSAxIi4gVGhhdCBtZWFucyB0aGUgTkFORCBzdXBwb3J0cyBhdCBsZWFzdAo+IHRp
bWluZyBtb2RlIDAuCj4gCj4gTkFORCBjaGlwIEh5bml4IEgyN1U0RzhGMkdEQS1CSSAoYXQgbGVh
c3QpIGlzIHJlYWRpbmcgYSAwIG9uIHRoaXMgZmllbGQKPiB3aGljaCBtYWtlcyBiZXN0X21vZGUg
PSAtMSBhbmQgdGhlIGZvbGxvd2luZyBsb29wIGJlIHNraXBwZWQuIEFuIGVycm9yCj4gY29kZSBp
cyByZXR1cm5lZCB1cHN0cmVhbSBhbmQgdGhlIE5BTkQgcHJvYmUgZmFpbHMuCj4gCj4gR2l2ZW4g
dGhhdCBzZHJfdGltaW5nX21vZGVzICptdXN0KiBiZSAxIGJ5IHNwZWNpZmljYXRpb24sIGZvcmNl
IGJlc3RfbW9kZQo+IHRvIGJlIDEgYXQgbGVhc3QsIHNvIHRoYXQgdGhpcyBmdW5jdGlvbiBkb2Vz
bid0IHJldHVybiBhbiBlcnJvciBvbiBhIE5BTkQKPiB0aGF0IGNhbiB3b3JrIHdpdGggc3VjaCB0
aW1pbmdzIGRlc3BpdGUgcmVwb3J0aW5nIGFuIGluY29ycmVjdCBPTkZJIHZhbHVlLgoKVGhhbmtz
IGZvciB0aGUgcGF0Y2ghCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhlY3RvciBQYWxhY2lvcyA8aGVj
dG9yLnBhbGFjaW9zQGRpZ2kuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBpbmRleCBjM2NjNjYwMzk5MjUu
LjQ3NDg1MGU0NDU1YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jh
c2UuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAgLTk0Nyw3
ICs5NDcsNyBAQCBpbnQgbmFuZF9jaG9vc2VfYmVzdF9zZHJfdGltaW5ncyhzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLAo+ICAJCS8qIEZhbGxiYWNrIHRvIHNsb3dlciBtb2RlcyAqLwo+ICAJCWJlc3Rf
bW9kZSA9IGlmYWNlLT50aW1pbmdzLm1vZGU7Cj4gIAl9IGVsc2UgaWYgKGNoaXAtPnBhcmFtZXRl
cnMub25maSkgewo+IC0JCWJlc3RfbW9kZSA9IGZscyhjaGlwLT5wYXJhbWV0ZXJzLm9uZmktPnNk
cl90aW1pbmdfbW9kZXMpIC0gMTsKPiArCQliZXN0X21vZGUgPSBmbHMoY2hpcC0+cGFyYW1ldGVy
cy5vbmZpLT5zZHJfdGltaW5nX21vZGVzIHwgMSkgLSAxOwoKSSBmdWxseSB1bmRlcnN0YW5kIHRo
ZSBwcm9ibGVtIGFuZCBob3cgeW91IHByb3Bvc2UgdG8gc29sdmUgaXQgYnV0IEkgYW0KYSBiaXQg
aGVzaXRhdGluZy4gSSB3b3VsZCByYXRoZXIgcHJlZmVyIGEgcGVyLWNoaXAvcGVyLW1hbnVmYWN0
dXJlciBmaXgKcmF0aGVyIHRoYW4gYSBnbG9iYWwgc29sdXRpb24sIGp1c3QgYmVjYXVzZSB3ZSBk
b24ndCByZWFsbHkga25vdwp3aGV0aGVyIGFuIGFwcGFyZW50bHkgT05GSSBjb21wYXRpYmxlIGRl
dmljZSB3aWxsIHN1cHBvcnQgdGhhdCBtb2RlIChvcgp3ZSBzaG91bGQgYXQgbGVhc3QgdGVsbCB0
aGUgdXNlciBhYm91dCBpdCkuIE1heWJlIHJlYWRzIHdvcmsgYnV0IG5vdAp3cml0ZXM/IChPciBu
b3QgYWxsIG9mIHRoZW0/KS4gQW5kIGluIGdlbmVyYWwsIEkgd291bGQgcHJlZmVyIHRvIGtlZXAK
dGhlIGNvcmUgInRpZHkiICh3ZWxsLCBtdGQgY29udGFpbnMgYSBsb3Qgb2YgbGVnYWN5IGNvZGUs
IGJ1dCB5b3Ugc2VlCndoYXQgSSBtZWFuKSBhbmQgcHJldmVudCAidW5kZXNpcmVkIiBiZWhhdmlv
ciBieSBmaXhpbmcgd2hhdCdzCmNvbnNpZGVyZWQgd3JvbmcgaW4gbWFudWZhY3R1cmVyIGNvZGUu
CgpJIHdvdWxkIHJhdGhlciBnbyBmb3IgYSBmaXggb2YgdGhlIHBhcmFtZXRlciBwYWdlIGluIG5h
bmRfaHluaXguYywKZWl0aGVyIGluIHRoZSAuaW5pdCgpIGhvb2sgb3IgaW4gdGhlIC5maXh1cF9v
bmZpX3BhcmFtX3BhZ2UoKQpkZXBlbmRpbmcgb2Ygd2hhdCBpcyBtb3N0IGFwcHJvcHJpYXRlLiBZ
b3UgY2FuIHByb2JhYmx5IHVzZSBhCmNvbXBhcmlzb24gd2l0aCB0aGUgbW9kZWwgc3RyaW5nIHRv
IHRhcmdldCB5b3VyIHNwZWNpZmljIGRldmljZSBmb3IKbm93LiBIZXJlIGFyZSB0d28gZGlmZmVy
ZW50IHdheXMgb2YgaGFuZGxpbmcgc3VjaCBpc3N1ZXM6Ci0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jv
bml4LmMjTDE0OAotIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3Vy
Y2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9taWNyb24uYyNMNTk4CgpQbGVhc2UgZG9uJ3Qg
Zm9yZ2V0IHRvIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkgdGhpcyBpcyBhIHNhZmUKYXNz
dW1wdGlvbiwgYWxzbyBwbGVhc2UgdXNlICJCSVQoMCkiIHJhdGhlciB0aGFuICIxIiAod2UgZG9u
J3Qgd3JpdGUgYW4KaW50ZWdlciBidXQganVzdCBhZGQgYSBtaXNzaW5nIGJpdCwgdGhhdCdzIHRo
ZSByYXRpb25hbGUpLgoKPiAgCX0KPiAgCj4gIAlmb3IgKG1vZGUgPSBiZXN0X21vZGU7IG1vZGUg
Pj0gMDsgbW9kZS0tKSB7CgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
