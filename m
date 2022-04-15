Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D05C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOY3Fes7w17be9VB98zjCLp6whXwJDG9lr2P97XY2Is=; b=iB0OkQTCxXDK+N
	3hT5I3Jg9WXzK7JH0gmgXLumCxQXNi5NS90AinJte6glhVYFxNy4/ofCVS1FilJ/+s3HFv+fIUjYJ
	yOid/KW7URK9IYFGrRvKVm4mcy9hPf1HMs2lZf9UMgf/uTqr5HYi8io9WUIqBt+IJinhTzxLkQkd8
	gK+QY7JF4g9Da+EwwAvYoeaqBCQMM8/LsYJ6AJFwD6dtZIZI8XMlBbFqUyAdG1l3Qw0Of0wGL63Lt
	oV9I+8kVrwZRe4UY9vBypc4Erfu7y0eJ09ribJSzLVi0oTvwoltgybbnGR/g8MQ2p4Xk01FWc5z4D
	tAdYjnX8WrRlIKyGNT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfHKl-009JAJ-QS; Fri, 15 Apr 2022 08:29:39 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfHKi-009J9t-JW
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 08:29:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 211FC2000D;
 Fri, 15 Apr 2022 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650011371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93vzcx7JzWWf0w+WuNaCbH46MdXIT6WdOLParbJdUjA=;
 b=oWqtY79rJCqfHr8jcc6fd9X1ivZcFJZow6nYBxLnwoB+YZk2IU5d7CrbtmNdzFDm9hGjg4
 MvTudiQik6xa+589CcNb1tYiKOWovZBeOhovu87yTJSwNpXDSAnbELCWEvvGcGJuUM4Hfv
 QbJDvKpQ7z7tMO7sOEA7ZMUb/mB+T7JmeyzpeYOUcfvV5xGLxRel9rjhJMKbrLE7P/B6hO
 e82NQxlUHDkxYih4UHg1EwvZ4pkOEndHSFqpghF7oqvS3Lqv9AJ//KaLz9Ftc1lGyU1+xN
 3jqdMBgemzWrBcoz9UTsvdowxyUktrhauAK7/VNfp+Ej4+ehpJ5ZBdXgG/rcWQ==
Date: Fri, 15 Apr 2022 10:29:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Scott Zhang <macromarship@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
Message-ID: <20220415102929.5c654933@xps13>
In-Reply-To: <CABy3iKzERYHD8Kj+NNnPdAxTxO6ANwrUJGcJO77385RtY1ddGg@mail.gmail.com>
References: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
 <20220414192413.0db7ef46@xps13>
 <CABy3iKzERYHD8Kj+NNnPdAxTxO6ANwrUJGcJO77385RtY1ddGg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_012936_827454_9D2F3A1C 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

SGkgU2NvdHQsCgptYWNyb21hcnNoaXBAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgMTUgQXByIDIw
MjIgMTI6Mzg6MDkgKzA4MDA6Cgo+IEhpLiBNaXF1w6hsLgo+IFllcy4gSSB0cmllZCBuYW5kYml0
ZXJycywgdGhlIHJlc3VsdCBpcyBiZWxvdy4gTG9va3MgZWNjIGlzIG5vdCB3b3JraW5nIC4KPiAK
PiBbcm9vdEBqZ2N4OiB+XSMuL25hbmRiaXRlcnJzIC9kZXYvbXRkMiAtaQo+IGluY3JlbWVudGFs
IGJpdGVycm9ycyB0ZXN0Cj4gU3VjY2Vzc2Z1bGx5IGNvcnJlY3RlZCAwIGJpdCBlcnJvcnMgcGVy
IHN1YnBhZ2UKPiBJbnNlcnRlZCBiaXRlcnJvciBAIDAvNQo+IEZhaWxlZCB0byByZWNvdmVyIDEg
Yml0ZmxpcHMKPiBSZWFkIGVycm9yIGFmdGVyIDEgYml0IGVycm9ycyBwZXIgcGFnZQo+IAo+IEJ5
IGNoZWNraW5nIHRoZSBuYW5kIGRyaXZlciB3aGljaGkgaXMgbnVjOTgwX25hbmQuYwo+IAo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9PcGVuTnV2b3Rvbi9OVUM5ODAtbGludXgtNC40LnkvYmxvYi9tYXN0
ZXIvZHJpdmVycy9tdGQvbmFuZC9udWM5ODBfbmFuZC5jCj4gCj4gCj4gKiBFbmFibGUgSFcgRUND
IDogdW51c2VkIG9uIG1vc3QgY2hpcHMKPiAqLwo+IHZvaWQgbnVjOTgwX25hbmRfZW5hYmxlX2h3
ZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgbW9kZSkKPiB7Cj4gRU5URVIoKTsKPiAjaWZk
ZWYgTlVDOTgwX05BTkRfREVCVUcKPiB7Cj4gY2hhciAqIHB0cj1SRUdfU01SQTA7Cj4gaW50IGk9
MDsKPiBpZiggbW9kZSA9PSBOQU5EX0VDQ19SRUFEICkKPiBwcmludGsoIltSXT1cbiIpOwo+IGVs
c2UKPiBwcmludGsoIltXXT1cbiIpOwo+IAo+IGZvcihpPTA7IGk8bXRkLT5vb2JzaXplOyBpKysp
Cj4gewo+IHByaW50aygiJVggIiwgKihwdHIraSkgKTsKPiBpZiAoIGkgJSAzMiA9PSAzMSkKPiBw
cmludGsoIlxuIik7Cj4gfQo+IHByaW50aygiXG4iKTsKPiB9Cj4gI2VuZGlmCj4gTEVBVkUoKTsK
PiB9Cj4gCj4gCj4gSSBndWVzcyB0aGUgbnVjOTgwIGRyaXZlciBkb2Vzbid0IHN1cHBvcnQgZWNj
IGNvcnJlY3Rpb24uCgpZb3UgY2Fubm90IHVzZSBOQU5EIHdpdGhvdXQgcHJvcGVyIEVDQyBoYW5k
bGluZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
