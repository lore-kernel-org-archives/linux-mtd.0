Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DB0C32751
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 08:09:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A7920693
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 08:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmfh0hqv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A7920693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwSLbvyI3l1Ahn1+PsStJ1GrCFzMGjJ53WESn5TMLNA=; b=hmfh0hqvhDOsJa
	OVxEolkKBLQGKLVht8q8DqpXfXgcgJVYhLceuEWtw3Hx1HHjnz6KLJMaQor8WtaXjRaCog0kO8gvi
	5WWSmCHh1CxefuLAjcjgPqpQWWJHxxJjIGe2F5gvDodhFMSa9nrtRHz9LhmMHxYakcf3rClkD2SZ8
	LiBuXy8xCUR+iq19Vd4uGWiemP/gFwK+iELeTbvokGgEgTtN4OqOtXpOisxctAbJ3pfq1Yzd0fYwL
	W1A/+F85H45zU4dVCJVJyJHOVtNv5oIJki0GYUEhhTDzspkL40nQQfrgWZ+CcUlv5r6Cu3OXX7AII
	DqI5v7YyK6Ir5TSPQxrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsjfj-0007j3-Il; Wed, 31 Jul 2019 08:09:19 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsjdl-0007UW-PK
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 08:07:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E9F87608311C;
 Wed, 31 Jul 2019 10:07:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pUVqnb0erfpF; Wed, 31 Jul 2019 10:07:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6D0566083139;
 Wed, 31 Jul 2019 10:07:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OQcdeKW7J85D; Wed, 31 Jul 2019 10:07:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4CE24608311C;
 Wed, 31 Jul 2019 10:07:06 +0200 (CEST)
Date: Wed, 31 Jul 2019 10:07:06 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <1015927082.55006.1564560426219.JavaMail.zimbra@nod.at>
In-Reply-To: <20190731074244.2msdjvuokoci2lxx@pengutronix.de>
References: <20190725205627.31313-1-richard@nod.at>
 <20190731074244.2msdjvuokoci2lxx@pengutronix.de>
Subject: Re: [PATCH] ubifs: Correctly initialize c->min_log_bytes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Correctly initialize c->min_log_bytes
Thread-Index: 0SGRrnqnaRM3HLKM49BAD6ote33qkQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_010718_075131_0C6C48F9 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlV3ZSBLbGVpbmUtS8O2bmln
IiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IEFuOiAicmljaGFyZCIgPHJpY2hh
cmRAbm9kLmF0Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmc+Cj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAzMS4gSnVsaSAyMDE5IDA5OjQyOjQ0Cj4gQmV0cmVm
ZjogUmU6IFtQQVRDSF0gdWJpZnM6IENvcnJlY3RseSBpbml0aWFsaXplIGMtPm1pbl9sb2dfYnl0
ZXMKCj4gSGVsbG8gUmljaGFyZCwKPiAKPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAxMDo1Njoy
N1BNICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IEN1cnJlbnRseSBvbiBhIGZy
ZXNobHkgbW91bnRlZCBVQklGUywgYy0+bWluX2xvZ19ieXRlcyBpcyAwLgo+PiBUaGlzIGNhbiBs
ZWFkIHRvIGEgbG9nIG92ZXJydW4gYW5kIG1ha2UgY29tbWl0cyBmYWlsLgo+PiAKPj4gUmVjZW50
IGtlcm5lbHMgd2lsbCByZXBvcnQgdGhlIGZvbGxvd2luZyBhc3NlcnQ6Cj4+IFVCSUZTIGFzc2Vy
dCBmYWlsZWQ6IGMtPmxoZWFkX2xudW0gIT0gYy0+bHRhaWxfbG51bSwgaW4gZnMvdWJpZnMvbG9n
LmM6NDEyCj4+IAo+PiBjLT5taW5fbG9nX2J5dGVzIGNhbiBoYXZlIHR3byBzdGF0ZXMsIDAgYW5k
IGMtPmxlYl9zaXplLgo+PiBJdCBjb250cm9scyBob3cgbXVjaCBieXRlcyBvZiB0aGUgbG9nIGFy
ZWEgYXJlIHJlc2VydmVkIGZvciBub24tYnVkCj4+IG5vZGVzIHN1Y2ggYXMgY29tbWl0IG5vZGVz
Lgo+PiAKPj4gQWZ0ZXIgYSBjb21taXQgaXQgaGFzIHRvIGJlIHNldCB0byBjLT5sZWJfc2l6ZSBz
dWNoIHRoYXQgd2UgaGF2ZSBhbHdheXMKPj4gZW5vdWdodCBzcGFjZSBmb3IgYSBjb21taXQuIFdo
aWxlIGEgY29tbWl0IHJ1bnMgaXQgY2FuIGJlIDAgdG8gbWFrZSB0aGUKPj4gcmVtYWluaW5nIGJ5
dGVzIG9mIHRoZSBsb2cgYXZhaWxhYmxlIHRvIHdyaXRlcnMuCj4+IAo+PiBIYXZpbmcgaXQgc2V0
IHRvIDAgcmlnaHQgYWZ0ZXIgbW91bnQgaXMgd3Jvbmcgc2luY2Ugbm8gc3BhY2UgZm9yIGNvbW1p
dHMKPj4gaXMgcmVzZXJ2ZWQuCj4+IAo+PiBSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+PiBTaWduZWQtb2Zm
LWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IAo+IEkgYXNzdW1lIHlv
dSBjYXJlIGZvciBhcHBseWluZyB0aGlzIHRvIG1haW5saW5lPyBJIHdvbmRlciBpdCBpc24ndCBp
bgo+IG5leHQgeWV0PyEKCkRvbid0IHN0cmVzcyBtZS4gVGhlIGlzc3VlIGlzIHByZXNlbnQgaW4g
VUJJRlMgc2luY2UgZGF5IDAsIHRoZXJlIGlzIGFic29sdXRlbHkKbm8gcmVhc29uIHRvIGh1cnJ5
LgpJdCB3aWxsIGdldCBtZXJnZWQgd2hlbiBJJ20gYmFjayBmcm9tIHRyYXZlbGluZyBhbmQgbXkg
dGltZSBwZXJtaXRzIGl0LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
