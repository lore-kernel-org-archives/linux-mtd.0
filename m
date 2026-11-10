Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B20606A32D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 23:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ruac6DGr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eD9v3hc8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VNGjqLLoqRydqNkUbmn7Ya0orr0ZmoQzi3+FkjWr67E=; b=ruac6DGreaKwoC1lZ7XpeA6zLA
	5OgA1g4fr8vwXdPX2180aboWnefzn9Sv8HgN0Aeqskd/qNt+CwJVIP2xV5wHtnsOjgky5mLoqzxri
	hrRnN/ML/mUjtQmtWgFW6C1xpVPmwoHfC4lbxjz3MRkW8UPse61Wv4ujzgB/QYGhgx3RSFQ8JlEPY
	rjhwK8dCHjggOSI9Ys7bKVYj6wzljCIkYJkbPkAntGL+n7LR6cnBadJmZC9vVmByNw4fI5c0in+As
	Gv054TYKZAzZYMyUTM7djeR5vytuhQ4N4d6vb1zvrDp9Z3VMVRTZQF9Zu9l6oiG6VkGD+Sm7u30G3
	YnKwW0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv4o-00000005Dyy-4AMR;
	Tue, 10 Nov 2026 23:16:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv4n-00000005Dyq-3s59
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 23:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD06E4122F;
	Tue, 10 Nov 2026 23:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326931F0093C;
	Tue, 10 Nov 2026 23:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794352589;
	bh=AmJHNzqZSa4ZU5/7SY+6CFiKr5RIKtrITZIuiv5Ydjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eD9v3hc8VwHYOjARHiiRgSJ/RGkwAMnEwcBrubU7etg2W7VlH5ix3/fMBiIcG3ASd
	 JVf0qMkzMeiesI1QctjtjXN4b5eM+e902t2+1bC2FQvP3aT09kO/Ia3nkkGM81C30R
	 SiO1nMQ+Zlsv0uya/dr8jPVcmD7O6NqkLl2q/TAu9G0bxWRnRPicB/c99c8QsCJ3Vf
	 s3hN4uaHCl8MBvsm3m+VUChxX1+wlZ+KohuPbwksDVpXMeQ2eOrV39jztcszbTEiGa
	 3EMTxbyzzjcnLy29snJQt7bhuQ3+Rf/U6qf02s5zKBPdiCMinvBeiP6fEA6ofepZsZ
	 U1749hKJcPn/A==
Message-ID: <sashiko-outbox-207871@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] spi: spi-qpic-snand: use the common
 qcom_nandc_check_flash_errors() function
To: "Gabor Juhos" <j4g8y7@gmail.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Md Sadre Alam" <md.alam@oss.qualcomm.com>, "Sricharan Ramabadhran" <quic_srichara@quicinc.com>, "Varadarajan
 Narayanan" <varadarajan.narayanan@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-1-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
 <20261109-qpic-snand-use-common-functions-v1-1-1e8601e2db84@gmail.com>
Date: Tue, 10 Nov 2026 23:16:28 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbTWVkaXVtXSBzcGk6IHNwaS1x
cGljOiBPT0IgZGF0YSBjb3JydXB0aW9uIGluIHFjb21fc3BpX3JlYWRfbGFzdF9jdygpCiAgWzFd
Ci0tCgpjb21taXQgZTlkYjJjZjBmNDgzZjQxZWZhNWEyMzUwZjIwYTc5YjFmMGE0ZmU3NQpBdXRo
b3I6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgoKc3BpOiBzcGktcXBpYy1zbmFuZDog
dXNlIHRoZSBjb21tb24gcWNvbV9uYW5kY19jaGVja19mbGFzaF9lcnJvcnMoKSBmdW5jdGlvbgoK
VGhpcyBjb21taXQgcmVwbGFjZXMgdGhlIGxvY2FsIHFjb21fc3BpX2NoZWNrX3Jhd19mbGFzaF9l
cnJvcnMoKSBoZWxwZXIKd2l0aCB0aGUgY29tbW9uIHFjb21fbmFuZGNfY2hlY2tfZmxhc2hfZXJy
b3JzKCkgZnVuY3Rpb24gZnJvbSBxcGljX2NvbW1vbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3BpL3NwaS1xcGljLXNuYW5kLmMgYi9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gaW5k
ZXggNDE2ODVhMjg2ZTM4MS4uOTgxZTE2MjIxYjU5ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Nw
aS9zcGktcXBpYy1zbmFuZC5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwoK
WyAuLi4gXQoKPiBAQCAtNjUxLDcgKzYzNSw3IEBAIHN0YXRpYyBpbnQgcWNvbV9zcGlfcmVhZF9s
YXN0X2N3KHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqc25hbmRjLAo+ICAJCXJldHVybiBy
ZXQ7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gcWNvbV9zcGlfY2hlY2tfcmF3X2ZsYXNoX2Vycm9ycyhz
bmFuZGMsIDEpOwo+ICsJcmV0ID0gcWNvbV9uYW5kY19jaGVja19mbGFzaF9lcnJvcnMoc25hbmRj
LCAxKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKCltTZXZlcml0eTogTWVkaXVtXQpU
aGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNhbiBxY29t
X3NwaV9yZWFkX2xhc3RfY3coKQpyZXR1cm4gY29ycnVwdGVkIE9PQiBkYXRhIFsxXSB3aGVuIGEg
cmF3IE9PQiByZWFkIHNwYW5zIGJleW9uZCB0aGUgYmFkCmJsb2NrIG1hcmtlcj8KCnFjb21fc3Bp
X3JlYWRfcGFnZSgpIHJvdXRlcyBhbGwgcmF3IE9PQi1vbmx5IHJlYWRzIChzbmFuZGMtPnFzcGkt
Pm9vYl9ydyAmJgpzbmFuZGMtPnFzcGktPnJhd19ydykgdG8gcWNvbV9zcGlfcmVhZF9sYXN0X2N3
KCk6Cgpkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jOnFjb21fc3BpX3JlYWRfcGFnZSgpIHsK
CS4uLgoJaWYgKHNuYW5kYy0+cXNwaS0+b29iX3J3ICYmIHNuYW5kYy0+cXNwaS0+cmF3X3J3KQoJ
CXJldHVybiBxY29tX3NwaV9yZWFkX2xhc3RfY3coc25hbmRjLCBvcCk7CgkuLi4KfQoKSG93ZXZl
ciwgcWNvbV9zcGlfcmVhZF9sYXN0X2N3KCkgb25seSByZWFkcyB0aGUgZmluYWwgY29kZXdvcmQg
aW50bwpzbmFuZGMtPmRhdGFfYnVmZmVyIGFuZCBjb3BpZXMgb3AtPmRhdGEubmJ5dGVzIHN0YXJ0
aW5nIGZyb20gYmJwb3M6Cgpkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jOnFjb21fc3BpX3Jl
YWRfbGFzdF9jdygpIHsKCS4uLgoJYmJwb3MgPSBtdGQtPndyaXRlc2l6ZSAtIGVjY19jZmctPmN3
X3NpemUgKiAobnVtX2N3IC0gMSk7CgkuLi4KCW1lbWNweShvcC0+ZGF0YS5idWYuaW4sIHNuYW5k
Yy0+ZGF0YV9idWZmZXIgKyBiYnBvcywgb3AtPmRhdGEubmJ5dGVzKTsKfQoKQmVjYXVzZSBwaHlz
aWNhbCBPT0IgYnl0ZXMgYXJlIGRpc3RyaWJ1dGVkIGFjcm9zcyBhbGwgY29kZXdvcmRzIGluIGEK
bXVsdGktY29kZXdvcmQgcGFnZSwgYSBmdWxsIHJhdyBPT0IgcmVhZCAoc3VjaCBhcyB2aWEgbmFu
ZGR1bXAgLW4gLS1vb2IpCm1pc3NlcyB0aGUgT09CIGRhdGEgZnJvbSBlYXJsaWVyIGNvZGV3b3Jk
cyBhbmQgcmV0dXJucyBzaGlmdGVkIGRhdGEgZnJvbQp0aGUgZmluYWwgY29kZXdvcmQgaW5zdGVh
ZC4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LWQyZTJiNTgzLWRlODMtNGY5
MS1hODdmLWE3Yzg4OGRkNDVjOQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwOS1xcGljLXNuYW5kLXVzZS1jb21tb24tZnVuY3Rp
b25zLXYxLTAtMWU4NjAxZTJkYjg0QGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
