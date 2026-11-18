Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06E606A32A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSywlsub;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X+SBRXXO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Dmanva4lPqxA0qqkFgk69h8ODpCV1XUGv7FxtrkMco=; b=CSywlsubn9VryortkfMs9EAC50
	4nx0FlGlLKL1M2qRT2/wyr+ArkYevsALsOSIsTJ+rR5enUjr1mJTkuAinvjDi+J7OLARArlkXDe5o
	CMUqADAxMeN85a9o/CIUNEJxwMO8d7loYayrMHVkmCJpDTfptim/Q3pASts30XtJtKFJ7jOK1nXk8
	RwL3WP+AM1pzhG3JeauoPJAO4NuBSE64KisalxBDxEpN91irwDcSbz+ZoeqUF8sVdYR0xkjw4DRsp
	kLMW3/ksq2ASfLXKiPEbjQS6BYnrkw1vjTkAbAz/naMN8CEsYd6Zrqrcp/gyJbCjOShAbHskikFwD
	QTVZ66og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcEs-00000008QPq-1NRA;
	Wed, 18 Nov 2026 09:46:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcEp-00000008QPE-0Iqk
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 09:46:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58BF91A169A
	for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:45:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19B925FE9B;
	Wed, 18 Nov 2026 09:45:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC81211BC0DFF;
	Wed, 18 Nov 2026 10:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794995155; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7cHtxhfx+Jp5jkHHuQhj/jLx3mH/a2nxfneU8+kMyOI=;
	b=X+SBRXXODI88ljWGiHFKGbDsD/94jik0Oxd0bLQ4oI9Gr852F73/PkP0CFK5KUCQGkF1Dk
	if9aVJsrSZ2JpBzECGrFBTzu+1gOy3YzR8Zk22+a7sHFqKMNddxfkUIEQsSuc74bHERNOS
	0HT/RVMYevAbaP4BiwNBJWSa7pw/qHFW0JWinw3wuhX7dwp0icBI2gxwUp3g13ovg4esrx
	vxJa79XL+bsEAJwmWMBzZQsvZLmgzKaXZhSiOC35WziuRcRo0LPwsFnwMEYMhCadHAXFMI
	/HELQWXaRZ9KEeMZ4Qj0yG+IuLOTPkJkYUiwr5rD+bode+3zn6cyOG5WwY+Jyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Gleixner <tglx@kernel.org>,  "Artem B.
 Bityuckiy" <dedekind@infradead.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
In-Reply-To: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
	(James Hilliard's message of "Tue, 03 Nov 2026 22:52:39 -0700")
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 10:45:51 +0100
Message-ID: <87fqwyjwvk.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_014559_252008_5ADA7FF4 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDMvMTEvMjAyNiBhdCAyMjo1MjozOSAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gY3JlYXRlX2JidCgpIHJldHVybnMgYW4gZXJyb3Ig
aWYgcmVhZGluZyBhIGJhZC1ibG9jayBtYXJrZXIgZmFpbHMsCgpUaGlzIHNlbnRlbmNlIGRvZXMg
bm90IG1lYW4gYW55dGhpbmcuCgo+IGJ1dAo+IGNoZWNrX2NyZWF0ZSgpIGlnbm9yZXMgdGhhdCBy
ZXN1bHQuIEl0IGNhbiBhc3NpZ24gdmVyc2lvbiAxIHRvIHRoZQoKVGhhdCdzIGFsc28gdW5jbGVh
ci4KCj4gaW5jb21wbGV0ZSBSQU0gdGFibGUgYW5kIHdyaXRlIGl0IHRvIHRoZSBwcmltYXJ5IGFu
ZCBtaXJyb3IgbG9jYXRpb25zLgo+IFVuc2Nhbm5lZCBmYWN0b3J5LWJhZCBibG9ja3MgdGhlbiBh
cHBlYXIgZ29vZCBpbiB0aGUgcGVyc2lzdGVkIHRhYmxlcy4KCkhlcmUgaXMgYSBwcm9wb3NhbCB3
aGljaCBJIGJlbGlldmUgbWFrZXMgbW9yZSBzZW5zZToKCm10ZDogcmF3bmFuZDogYWJvcnQgQkJU
IGNyZWF0aW9uIG9uIHNjYW4gZmFpbHVyZQoKY3JlYXRlX2JidCgpIGNhbiBmYWlsIG9uIGEgbm9u
LUVDQyBPT0IgcmVhZCBlcnJvciwgbGVhdmluZyB0aGUgUkFNIEJCVApwYXJ0aWFsbHkgcG9wdWxh
dGVkLiBJdCBpcyBwcmVmZXJhYmxlIHRvIGJhaWwgb3V0IGVhcmx5IHJhdGhlciB0aGFuIGJ1bXAK
dGhlIHRhYmxlIHZlcnNpb25zIGFuZCB3cml0ZSBpbmNvbXBsZXRlIHByaW1hcnkgYW5kIG1pcnJv
ciB0YWJsZXMsIHdoaWNoCndvdWxkIG1hcmsgdGhlIHVuc2Nhbm5lZCBmYWN0b3J5LWJhZCBibG9j
a3MgYXMgZ29vZC4KCj4gUHJvcGFnYXRlIHRoZSBzY2FuIGZhaWx1cmUgYmVmb3JlIGNoYW5naW5n
IHRhYmxlIHZlcnNpb25zIG9yIHdyaXRpbmcKPiBlaXRoZXIgY29weS4gS2VlcCBleHBsaWNpdCBO
QU5EX0JCVF9DUkVBVEVfRU1QVFkgaW5pdGlhbGl6YXRpb24gdW5jaGFuZ2VkLgo+Cj4gRml4ZXM6
IGVlYWRhMjRkYThiZCAoIltNVERdIE5BTkQ6IFJlYWQgb25seSBPT0IgYnl0ZXMgZHVyaW5nIGJh
ZCBibG9jayBzY2FuIikKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4KCkkgd291bGQgcHJlZmVyIGlmIHlvdSBjb3VsZCB3cml0ZSB5b3Vy
IG93biBjb21taXQgbG9ncywgZ2l2aW5nIHVzIG1vcmUKY29uZmlkZW5jZSBvbiB0aGUgd29yayB0
aGF0IGhhcyBiZWVuIGFza2VkLiBZb3UgY2FuIHVzZSBhbiBMTE0gdG8KaW1wcm92ZS9lbmhhbmNl
IGl0IG9idmlvdXNseS4KClRoYW5rcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
