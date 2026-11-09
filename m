Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7C606A325
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MH7WXEia;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDrw0C/B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8xXEEa9d+3FJY3tPNXi84Cvl8cLKgD1MyPh/Kquy7pQ=; b=MH7WXEiatzDHYknx8/tVWS/gaI
	dJv0DN3+uZrSV45HrGGJJwoQ+Gils3DFo+pUy2N6YY5RKwxT+ISpJXuUrxax0ukBu2KLz3Xu36epL
	WWkMyxXjuvw/+4E+RzXS/79cyTgJZr5JGQHWWKQhitEiLzfKNrklVhvy18lXbNXOwAg7InQPfo+CI
	YSdDUzGvLuP4rE2GO4wU8idKHPF7YgFyPgaaZV4U9meRPsXNMvTOQw8DHO4RuLo5QQ/tKTMa4FsiP
	4CDC+jlCRT5BVVMo7cdchPHzNlM6kPJMy33xr/MXTTuGINkPTMBwe+CBnMmW11+fhWRWZhQCo+erF
	zUGxhkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVJP-00000001aA8-0p1o;
	Mon, 09 Nov 2026 19:45:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVJO-00000001a9u-2BLr
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:45:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D296843897;
	Mon,  9 Nov 2026 19:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6202A1F0089F;
	Mon,  9 Nov 2026 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253549;
	bh=bxavNznC7FLRXKmbXXuNMU/QhUd797ovHvipFFMuHEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDrw0C/BK7cthssg9AZk1bVlmEp8tLo3/Gve6xPnRzrfdcifr5E7Rc/gGU0hWa7y4
	 5MzQa1vpnLBt5NIk/Zz8n8TYK3rBUFuZkYEk1qIVvJ6Yb098LBlHeRUiBIcPKRZDP5
	 c68pnVVJS7ilHxWWkbGa/c9f32osOazvZEgyT5r1JkYi/sVK+Pwi6i5PfUVnZMbzNM
	 sbBelEnFro9M6NogH/DINIZp444H7rQavRn7GGmFjxB72HZxJZfhag42NNNaJ0lb+J
	 d8gRg8s0UiSlNZmRHbqFoxeHo4gPFhLxB7HtLbFFRu5ANRQJ1lsmcEqN/anY3QaUTc
	 X4EA40tdBmWpA==
Message-ID: <sashiko-outbox-205501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_cw_write() function
To: "Gabor Juhos" <j4g8y7@gmail.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Md Sadre Alam" <md.alam@oss.qualcomm.com>, "Sricharan Ramabadhran" <quic_srichara@quicinc.com>, "Varadarajan
 Narayanan" <varadarajan.narayanan@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-4-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
 <20261109-qpic-snand-use-common-functions-v1-4-1e8601e2db84@gmail.com>
Date: Mon, 09 Nov 2026 19:45:48 +0000
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
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIHNwaTogcXBp
Yy1zbmFuZDogaW1wcm9wZXIgcmF3IE9PQiB3cml0ZSBoYW5kbGluZyBpbgogIHFjb21fc3BpX3By
b2dyYW1fZXhlY3V0ZSgpIFsxXQotLQoKY29tbWl0IDMxY2UxNWI5M2RhN2RkYTgyZWExOTM5OGI0
YWJjYzVlMWMxNzU4ODAKQXV0aG9yOiBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KCnNw
aTogc3BpLXFwaWMtc25hbmQ6IHVzZSB0aGUgY29tbW9uIHFjb21fbmFuZGNfY29uZmlnX2N3X3dy
aXRlKCkgZnVuY3Rpb24KClRoaXMgY29tbWl0IHJlcGxhY2VzIHRoZSBsb2NhbCBxY29tX3NwaV9j
b25maWdfY3dfd3JpdGUoKSBoZWxwZXIgd2l0aCB0aGUKY29tbW9uIHFjb21fbmFuZGNfY29uZmln
X2N3X3dyaXRlKCkgZnVuY3Rpb24gZnJvbSBxcGljX2NvbW1vbi4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgYi9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5j
Cj4gaW5kZXggYTgyNWJkYjkzYThhMS4uNjc3NGEwYTVkYjJhNyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25h
bmQuYwoKWyAuLi4gXQoKPiBAQCAtMTI3MSw3ICsxMjYwLDcgQEAgc3RhdGljIGludCBxY29tX3Nw
aV9wcm9ncmFtX29vYihzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKnNuYW5kYywKPiAgCQkJ
CSAgICBvb2JfYnVmLCAwLCBzbmFuZGMtPnFzcGktPm10ZC0+b29iYXZhaWwpOwo+ICAJcWNvbV9u
YW5kY19jb25maWdfcGFnZV93cml0ZShzbmFuZGMpOwo+ICAJcWNvbV93cml0ZV9kYXRhX2RtYShz
bmFuZGMsIEZMQVNIX0JVRl9BQ0MsIHNuYW5kYy0+ZGF0YV9idWZmZXIsIGRhdGFfc2l6ZSArIG9v
Yl9zaXplLCAwKTsKPiAtCXFjb21fc3BpX2NvbmZpZ19jd193cml0ZShzbmFuZGMpOwo+ICsJcWNv
bV9uYW5kY19jb25maWdfY3dfd3JpdGUoc25hbmRjKTsKPiAgCj4gIAlyZXQgPSBxY29tX3N1Ym1p
dF9kZXNjcyhzbmFuZGMpOwo+ICAJaWYgKHJldCkgewoKW1NldmVyaXR5OiBDcml0aWNhbF0KVGhp
cyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHFjb21f
c3BpX3Byb2dyYW1fb29iKCkKWzFdIHNpbGVudGx5IGRpc2NhcmQgcmF3IE9PQiB3cml0ZXMgc3Vj
aCBhcyBiYWQgYmxvY2sgbWFya2VycyBmcm9tCnNwaW5hbmRfbWFya2JhZCgpPwoKc3BpbmFuZF9t
YXJrYmFkKCkgaXNzdWVzIGEgcmF3IE9PQiB3cml0ZSB3aXRoIGRhdGFsZW4gPSAwLCBvb2JsZW4g
PSAyLCBhbmQKbW9kZSA9IE1URF9PUFNfUkFXLCB3aGljaCBzZXRzIHBhZ2VfcncgPSBmYWxzZSwg
b29iX3J3ID0gdHJ1ZSwgYW5kCnJhd19ydyA9IHRydWUgaW4gcWNvbV9zcGlfZWNjX3ByZXBhcmVf
aW9fcmVxX3BpcGVsaW5lZCgpLiAgSG93ZXZlciwKcWNvbV9zcGlfcHJvZ3JhbV9leGVjdXRlKCkg
aWdub3JlcyByYXdfcncgd2hlbiBwYWdlX3J3IGlzIGZhbHNlIGFuZCByb3V0ZXMKdGhlIHdyaXRl
IHRvIHFjb21fc3BpX3Byb2dyYW1fb29iKCk6Cgpkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5j
OnFjb21fc3BpX3Byb2dyYW1fZXhlY3V0ZSgpIHsKCWlmIChzbmFuZGMtPnFzcGktPnBhZ2Vfcncg
JiYgc25hbmRjLT5xc3BpLT5yYXdfcncpCgkJcmV0dXJuIHFjb21fc3BpX3Byb2dyYW1fcmF3KHNu
YW5kYywgb3ApOwoKCWlmIChzbmFuZGMtPnFzcGktPnBhZ2VfcncpCgkJcmV0dXJuIHFjb21fc3Bp
X3Byb2dyYW1fZWNjKHNuYW5kYywgb3ApOwoKCWlmIChzbmFuZGMtPnFzcGktPm9vYl9ydykKCQly
ZXR1cm4gcWNvbV9zcGlfcHJvZ3JhbV9vb2Ioc25hbmRjLCBvcCk7CiAgICAuLi4KfQoKcWNvbV9z
cGlfcHJvZ3JhbV9vb2IoKSBzZXRzIG9vYl9idWYgdG8gc25hbmRjLT5xc3BpLT5kYXRhX2J1ZiAo
dGhlIHN0YXJ0IG9mCnRoZSBwYWdlIGJ1ZmZlciByYXRoZXIgdGhhbiB0aGUgT09CIG9mZnNldCkg
YW5kIHVuY29uZGl0aW9uYWxseSBlbmFibGVzIEVDQwp2aWEgZWNjX2NmZy0+ZWNjX2JjaF9jZmcu
ICBBcyBhIHJlc3VsdCwgbXRkX29vYmxheW91dF9nZXRfZGF0YWJ5dGVzKCkgcmVhZHMKMHhmZiBp
bnN0ZWFkIG9mIHRoZSBiYWQgYmxvY2sgbWFya2VyIGFuZCBwcm9ncmFtcyBpdCB0byBmbGFzaCB3
aXRoIEVDQwplbmFibGVkLCBsZWF2aW5nIGRlZmVjdGl2ZSBibG9ja3MgdW5tYXJrZWQgYW5kIGFs
bG93aW5nIHN1YnNlcXVlbnQgd3JpdGVzIHRvCmZhaWxpbmcgYmxvY2tzLgoKWzFdIGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9idWcvbGludXgtZGEzN2MyNDMtZTRmMS00ODcwLTgxOTAtNDZhZTJmNWIz
MjgyCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYxMTA5LXFwaWMtc25hbmQtdXNlLWNvbW1vbi1mdW5jdGlvbnMtdjEtMC0xZTg2MDFl
MmRiODRAZ21haWwuY29tP3BhcnQ9NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
