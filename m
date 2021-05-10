Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD3CC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:10:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA408613DE
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA408613DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kwmy75vjO1qRUXcj0N5M4ff4e33DTgZg/G+gwCt6VcA=; b=c++CC1nzVkS9cbe9+nxW3Cyko
	GLAsIzgVmd1Im57OU0zaidnHCMdjrDOC7+W6GDiNTPvAyA0HVxjBaC2nmYc+dm9psJJBoXMb8dyzN
	3nnSopx112Z6xb2Ou3loNEm0D14dexi//msW9/l7f3OMK6zOjVjo8IG8M55lwlnJG/RNIPlmXGrNm
	TR/Ue+hUQSsy33CUCGHMDexCIf4jIldqb3Xr8QSPKYeisVKmlu3B6Rx+giIxlmvXttUNKzbFXbTWA
	wGKIPdjr9vzOEsrpE9t7yoEn5J+Gt1m1wHdZAGnSsL+CioSQagis6mi8Uxe14zK6M24Ort6nnW/nC
	OufPBhpBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1uq-00DiN5-Az; Mon, 10 May 2021 09:09:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1uY-00DiMD-CN
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=857ciXq3IUgNtAVimWTkW5vGBQomrGGb+zJ9HmYJaBI=; b=a8bv+Mj/j35/v2qMZa5k4vDE61
 lsouly5uYU7bI5ubbMyxmptGrtGwFsbGW6UNgHU1rAYpC1hzvq8bPKtbgHi5s3itSrTI95MGky2G2
 BsVajBUS1Oak+CTX5+7awBUTo2WN96RKfeKo1zXWM3LjmMWGtT9TEe3vosNtDyOo45zbaEjuj//m5
 4TzBIaD51yPqoUVmLJ46kZaY3qlmBFuzL2osgtPCWWYfUkFpy5ZHa2aBqp+0ouUW+Q8Tni/PG1MPS
 sOVn+diuEC2pw9q8CGj5KApq08hOWHGjYG7DULyQL/1hLt8dKfQTXUPyQBjarjMZcYVLpHMnpXWMy
 3Cm1pypg==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1uV-008RQg-9q
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:09:09 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D63D3240006;
 Mon, 10 May 2021 09:09:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 David Bauer <mail@david-bauer.net>, Andrew Cameron <apcameron@softhome.net>
Subject: Re: [PATCH] mtd: parsers: ofpart: fix parsing subpartitions
Date: Mon, 10 May 2021 11:09:00 +0200
Message-Id: <20210510090900.3326-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210508173214.28365-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0bc731700ec65606803c407901cef999a204fbb7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_020907_507650_233BD8E8 
X-CRM114-Status: UNSURE (   8.60  )
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

T24gU2F0LCAyMDIxLTA1LTA4IGF0IDE3OjMyOjE0IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IG9mcGFydCB3YXMgcmVjZW50bHkgcGF0Y2hlZCB0byBub3Qgc2NhbiByYW5kb20g
cGFydGl0aW9uIG5vZGVzIGFzCj4gc3VicGFydGl0aW9ucy4gVGhhdCBjaGFuZ2UgdW5mb3J0dW5h
dGVseSBicm9rZSBzY2FubmluZyB2YWxpZAo+IHN1YnBhcnRpdGlvbnMgbGlrZToKPiAKPiBwYXJ0
aXRpb25zIHsKPiAJY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gCSNzaXplLWNlbGxzID0gPDE+Owo+IAo+IAlwYXJ0aXRpb25AMCB7Cj4g
CQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+IAkJbGFiZWwgPSAiYm9vdGxvYWRl
ciI7Cj4gCQlyZWcgPSA8MHgwIDB4MTAwMDAwPjsKPiAKPiAJCXBhcnRpdGlvbkAwIHsKPiAJCQls
YWJlbCA9ICJjb25maWciOwo+IAkJCXJlZyA9IDwweDgwMDAwIDB4ODAwMDA+Owo+IAkJfTsKPiAJ
fTsKPiB9Owo+IAo+IEZpeCB0aGF0IHJlZ3Jlc3Npb24gYnkgYWRkaW5nIDEgbW9yZSBjb2RlIHBh
dGguIFdlIGFjdHVhbGx5IG5lZWQgMwo+IGNvbmRpdGlvbmFsIGJsb2NrcyB0byBzdXBwb3J0IDMg
cG9zc2libGUgY2FzZXMuIFRoaXMgY2hhbmdlIGFsc28gbWFrZXMKPiBjb2RlIGVhc2llciB0byB1
bmRlcnN0YW5kICYgZm9sbG93Lgo+IAo+IFJlcG9ydGVkLWJ5OiBEYXZpZCBCYXVlciA8bWFpbEBk
YXZpZC1iYXVlci5uZXQ+Cj4gRml4ZXM6IDJkNzUxMjAzYWFjZiAoIm10ZDogcGFyc2Vyczogb2Zw
YXJ0OiBsaW1pdCBwYXJzaW5nIG9mIGRlcHJlY2F0ZWQgRFQgc3ludGF4Cj4gU2lnbmVkLW9mZi1i
eTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IFRlc3RlZC1ieTogQW5kcmV3
IENhbWVyb24gPGFwY2FtZXJvbkBzb2Z0aG9tZS5uZXQ+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL2Zp
eGVzLCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
