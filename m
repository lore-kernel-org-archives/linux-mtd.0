Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEDDCD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XaXKsQ1XnNdGg2Ms1S8iLa9PK7iQHTK3qFvpCJyQN4=; b=Cpm72vrcSbJ5Y6
	B9TvfGSOSHfMa2rx6enoeb4Z3VwMbwUB7mtJz2pYFNYpFZL4sIGwhWkyUcJqNUYAEqhoZy8AYDXK6
	x8QmBMVjY3o15E9csg2ozmNSBECKNueVXOlQoHMR+aAD4pWFw7BcLy4rTBR6UK29B4hIcMkK6o0ym
	YWWWDbyLy6s528mN/sZcB8jymfS/9wrAIEoV59ljuJMGnaDjwIucVT5TqZinwUPDih1NDsoEnzEDA
	n0l3ANAsJxbqIj4Gd353IqJnglRoldbb7wRaXLGBbKYS4/E/D5b0favOz1KBkg+tp+Q8M1SZ4Wh7U
	yy3L5S9OUA03Ldfg9HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSASE-00000003cvC-1Duy;
	Wed, 27 May 2026 09:21:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSASC-00000003cu9-1fN2
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:21:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C21381A36E8;
	Wed, 27 May 2026 09:21:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EF03601A1;
	Wed, 27 May 2026 09:21:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 241691088845E;
	Wed, 27 May 2026 11:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779873689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dxDzvLOl8wBk0Yi1jr1kCBllTts2dC4lVbD1xZepq2M=;
	b=oWOr0odj+Y1GKFjstFh71PsqDdDAm7MRsDCXCNQzFedfIwGWS5dXGON0F+ICr9FPtKedFs
	P6b8XQJf7TvD3z7qyIF/1u7hVvtszYYQ5J3zwdzDQ/oS0ZGLm+aK728vG3o3AGrxO5CAjO
	I1Mu8+84k0L2G1L68ndaR3pSY57GaL5YZ9uLAcsW8+7KWNRwef5uQn7I23kBXK7AZCMm0Q
	enD++aEc27or4dd62JpEvbJMCJIYBj9VVbstkChasH1eDEtrR1IDCW1BaeLhlB/ImLQCOl
	5CofOtIrOndDy3ZP0ShfyeEsxbCF0qDmG1sbalbyIdgFhBCe/LgWlGSLVMm8Tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>,  Randy Dunlap
 <rdunlap@infradead.org>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: maps: remove AMD =?utf-8?Q?=C3=89lan?=
 specific drivers
In-Reply-To: <20260526103227.3152003-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Tue, 26 May 2026 12:32:04 +0200")
References: <20260526103227.3152003-1-arnd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 11:21:26 +0200
Message-ID: <87fr3djjhl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_022132_567305_BDB74C17 
X-CRM114-Status: UNSURE (   9.33  )
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

SGkgQXJuZCwKCk9uIDI2LzA1LzIwMjYgYXQgMTI6MzI6MDQgKzAyLCBBcm5kIEJlcmdtYW5uIDxh
cm5kQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+Cj4gVGhlcmUgYXJlIGZvdXIgTVREIG1hcHMgZHJpdmVycyB0aGF0IGFyZSB1c2VkIHdp
dGggQU1EIMOJbGFuIFNvQ3MuCj4gU2luY2UgNDg2LWNsYXNzIENQVSBzdXBwb3J0IHdhcyByZW1v
dmVkIGluIGNvbW1pdCA4Yjc5M2E5MmQ4NjIgKCJ4ODYvY3B1Ogo+IFJlbW92ZSBNNDg2L000ODZT
WC9FTEFOIHN1cHBvcnQiKSwgaXQgaXMgbm8gbG9uZ2VyIHBvc3NpYmxlIHRvIGFjdHVhbGx5Cj4g
dXNlIHRoZXNlLCBzbyBqdXN0IHJlbW92ZSB0aGUgZHJpdmVycyBlbnRpcmVseS4KClRoZXJlIHdl
cmUgcGVuZGluZyBwYXRjaGVzIGluIG15IHF1ZXVlIHJlbW92aW5nIHRoZXNlLCBleGNlcHQgbmV0
dGVsLmMuCgpJIGZpeGVkIHVwIHRoaXMgY29tbWl0IHdoaWxlIGFwcGx5aW5nIGFuZCBhZGFwdGVk
IGl0IHRoaXMgd2F5OgoKICAgIEF1dGhvcjogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
ICAgIERhdGU6ICAgVHVlIE1heSAyNiAxMjozMjowNCAyMDI2ICswMjAwCgogICAgICAgIG10ZDog
bWFwczogcmVtb3ZlIEFNRCDDiWxhbiBzcGVjaWZpYyBkcml2ZXJzCiAgICAKICAgICAgICBUaGVy
ZSB3ZXJlIGZvdXIgTVREIG1hcHMgZHJpdmVycyB0aGF0IHdlcmUgdXNlZCB3aXRoIEFNRCDDiWxh
biBTb0NzLgogICAgICAgIFNpbmNlIDQ4Ni1jbGFzcyBDUFUgc3VwcG9ydCB3YXMgcmVtb3ZlZCBp
biBjb21taXQgOGI3OTNhOTJkODYyICgieDg2L2NwdToKICAgICAgICBSZW1vdmUgTTQ4Ni9NNDg2
U1gvRUxBTiBzdXBwb3J0IiksIGl0IGlzIG5vIGxvbmdlciBwb3NzaWJsZSB0byBhY3R1YWxseQog
ICAgICAgIHVzZSB0aGVzZS4gVGhyZWUgb2YgdGhlbSBoYXZlIGFscmVhZHkgYmVlbiByZW1vdmVk
LCBzbyByZW1vdmUgdGhlCiAgICAgICAgcmVtYWluaW5nIGRyaXZlciBlbnRpcmVseS4KICAgIAog
ICAgICAgIFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CiAgICAg
ICAgW01pcXVlbCBSYXluYWw6IE9ubHkgTkVUdGVsIHdhcyBzdGlsbCBpbiB0aGUgdHJlZSwgYWRh
cHQgdGhlIHBhdGNoIGFuZCB0aGUgY29tbWl0IGxvZ10KICAgICAgICBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKICAgICBkcml2ZXJzL210
ZC9tYXBzL0tjb25maWcgIHwgICA2IC0tLQogICAgIGRyaXZlcnMvbXRkL21hcHMvTWFrZWZpbGUg
fCAgIDEgLQogICAgIGRyaXZlcnMvbXRkL21hcHMvbmV0dGVsLmMgfCA0NjIgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAg
MyBmaWxlcyBjaGFuZ2VkLCA0NjkgZGVsZXRpb25zKC0pCgoKSXMgaXQgb2theSBmb3IgeW91PwoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
