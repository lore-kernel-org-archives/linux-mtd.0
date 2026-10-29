Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D63606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtmMbf6s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=16Vbpycg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sPd3/oUT0qWr+u07yGZip60YK7Mfj2azwqO7CFY+JO4=; b=NtmMbf6sI/Tb4626AvvKeUNls3
	EMTyI38E/sjaWFhZvyx8erqw+Ty7fq30+XpG9G7avG4onp79h0Dgtr1VNiSSdrMVEh37J7XMtM86o
	yDHV45q9yX6v0sLqZtsiinAEEy1psjASbu68d61xVcwVnxWxWURgFIf/SKtCaDeJ5xbL613X6ckjT
	sbN7ThUZtnzFbwMpM+gWaO1PVQmdNP24K7xpb9vYuNyMWtBbyLRYUGNE7LDOXKASUNN7wl9ppfvcm
	3c3c6smgjX5EEvuE6JvjCHA822DVJl4Q9ubYw+cVRTGqvGRXWW7Q1exUWmViery9OSwuKfcNEuqiB
	LZnrvCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRvz-00000009cw8-1KP3;
	Thu, 29 Oct 2026 15:20:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRvw-00000009cvg-05m6
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 15:20:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E429CC49F4A;
	Thu, 29 Oct 2026 15:21:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6035460360;
	Thu, 29 Oct 2026 15:20:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A63910329108;
	Thu, 29 Oct 2026 16:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793287247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zDXaXId2QMZQGGH0ZkoNgmI6zhuM3ACKFfQoGGvgzc0=;
	b=16VbpycgoGK+Bueo3Fxkz/Q35JqsNP5tV2hWIwDWhcLwgp8NkOOkwGhPp1MbQ2QYG/ygPF
	DV1w/R0AU0yrE1vtbn4ta5J+AKFvjeOQNjlL7XHAuo1LHvCalbwB0NLu1/3AqWFQRveILg
	tIaVwq9LI8hNHb719+KcfM9x6VJ6JhWaXFtZhiiNKbzjKJNBNcSP5mSejyPHMG9mklfdHm
	89s8/0bWGr54x6edPik3VTQIlzXQYMN5V9WDPLSd790LDd9enfTuPRH66RB4B8j6YioU1G
	BwwcB7Ztty22BcfDSskDeOQqXE5tyTa79Qg5aJJBO28Kx2J0O3+7+4WIi9mSQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: linux-mtd@lists.infradead.org,  Vignesh Raghavendra <vigneshr@ti.com>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Richard Weinberger
 <richard@nod.at>,  linux-kernel@vger.kernel.org,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: fix an OF node reference leak
In-Reply-To: <rc-review-20261023-ai33-33-fd231771d138@gmail.com> (Yige Jiang's
	message of "Thu, 29 Oct 2026 00:47:40 +0800")
References: <rc-review-20261023-ai33-33-fd231771d138@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 29 Oct 2026 16:20:43 +0100
Message-ID: <87se1oedo4.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_082052_245418_5F93565E 
X-CRM114-Status: GOOD (  18.06  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjkvMTAvMjAyNiBhdCAwMDo0Nzo0MCArMDgsIFlpZ2UgSmlhbmcgPHlpZ2VqaWFuZzg2QGdt
YWlsLmNvbT4gd3JvdGU6Cgo+IHJwY2lmX2hiX3Byb2JlKCkgZ2V0cyBhIGNoaWxkLW5vZGUgcmVm
ZXJlbmNlIHdpdGggb2ZfZ2V0X25leHRfY2hpbGQoKS4KPiBUaGUgSHlwZXJCdXMgY29yZSBkb2Vz
IG5vdCBjb25zdW1lIGl0LCBzbyB0aGUgZHJpdmVyIGxlYWtzIHRoZQo+IHJlZmVyZW5jZSBvbiBy
ZWdpc3RyYXRpb24gZmFpbHVyZSBhbmQgcmVtb3ZlLgo+Cj4gUHV0IHRoZSBub2RlIG9uIHJlZ2lz
dHJhdGlvbiBmYWlsdXJlIGFuZCBhZnRlciB1bnJlZ2lzdGVyaW5nIHRoZQo+IEh5cGVyQnVzIGRl
dmljZSBvbiByZW1vdmUuIExlYXZlIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uIGZhaWx1cmVzIG9u
Cj4gb3V0X2Rpc2FibGVfcnBtLCBzaW5jZSBubyBub2RlIHJlZmVyZW5jZSBoYXMgYmVlbiBhY3F1
aXJlZCB0aGVyZS4KPgo+IEZpeGVzOiA1ZGUxNWI2MTBmNzggKCJtdGQ6IGh5cGVyYnVzOiBhZGQg
UmVuZXNhcyBSUEMtSUYgZHJpdmVyIikKPiBBc3Npc3RlZC1ieTogTExNCj4gU2lnbmVkLW9mZi1i
eTogWWlnZSBKaWFuZyA8eWlnZWppYW5nODZAZ21haWwuY29tPgo+IC0tLQo+IEJhc2VkIG9uIGxp
bnV4LW5leHQgbmV4dC0yMDI2MTAxNiAoMmVmYjdhMTFmMWFhKS4KPiBDb21waWxlLXRlc3RlZDog
YXJtNjQsIEdDQyAxNC4yLjAsIFc9MSwgQ09ORklHX09GX0RZTkFNSUM9eS4KPiBDT01QSUxFX1RF
U1Q9eS4KPiBUaGUgb2JqZWN0IHdhcyBidWlsdCBmcm9tIHRoaXMgZXhhY3QgYmFzZSB3aXRoIHRo
ZSBwYXRjaCBhcHBsaWVkLgo+IE5vIGZ1bGwga2VybmVsIG9yIG1vZHVsZS1saW5rLCBoYXJkd2Fy
ZSBvciBydW50aW1lIHRlc3Qgd2FzIHBlcmZvcm1lZC4KPgo+ICBkcml2ZXJzL210ZC9oeXBlcmJ1
cy9ycGMtaWYuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1p
Zi5jIGIvZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLmMKPiBpbmRleCBmNDQ4ZTIzZjkyNjBm
MTBhYmUxNzg0Mjg0OWIzMTIzNjVkY2Q4Mjk0Li5hYTY5YWJlNmQ2YmM2NzRiYjhjZGI1MzFiYmFk
ZmI3YjM1NmUzMTIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLmMKPiBAQCAtMTQ1LDEwICsxNDUs
MTIgQEAgc3RhdGljIGludCBycGNpZl9oYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAJaHlwZXJidXMtPmhiZGV2Lm5wID0gb2ZfZ2V0X25leHRfY2hpbGQocGRldi0+ZGV2
LnBhcmVudC0+b2Zfbm9kZSwgTlVMTCk7Cj4gIAllcnJvciA9IGh5cGVyYnVzX3JlZ2lzdGVyX2Rl
dmljZSgmaHlwZXJidXMtPmhiZGV2KTsKPiAgCWlmIChlcnJvcikKPiAtCQlnb3RvIG91dF9kaXNh
YmxlX3JwbTsKPiArCQlnb3RvIG91dF9wdXRfbm9kZTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgCj4g
K291dF9wdXRfbm9kZToKPiArCW9mX25vZGVfcHV0KGh5cGVyYnVzLT5oYmRldi5ucCk7Cj4gIG91
dF9kaXNhYmxlX3JwbToKPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShoeXBlcmJ1cy0+cnBjLmRldik7
Cj4gIAlyZXR1cm4gZXJyb3I7Cj4gQEAgLTE2MSw2ICsxNjMsNyBAQCBzdGF0aWMgdm9pZCBycGNp
Zl9oYl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWh5cGVyYnVzX3Vu
cmVnaXN0ZXJfZGV2aWNlKCZoeXBlcmJ1cy0+aGJkZXYpOwo+ICAKPiAgCXBtX3J1bnRpbWVfZGlz
YWJsZShoeXBlcmJ1cy0+cnBjLmRldik7Cj4gKwlvZl9ub2RlX3B1dChoeXBlcmJ1cy0+aGJkZXYu
bnApOwo+ICB9Cj4gIAoKSW4gZ2VuZXJhbCB3ZSBhbHdheXMgYXBwbHkgdGhlIHNhbWUgb3JkZXIg
aW4gdGhlIHByb2JlIGVycm9yIHBhdGggYW5kIGluCnRoZSByZW1vdmUgcGF0aC4gVGhpcyBpcyBu
b3QgcmVzcGVjdGVkIGhlcmU/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
