Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FE8606A31E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1d6+P/Ax;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0KPlOU/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VS2UTEaURiXpy5pwDB7tjzQzhpLViPTG0N0cghExiOM=; b=1d6+P/Axh71DBTKrEAALjtIj/c
	t62/MKl5rKa0RpciIFkSoiZVn6n60hjE3Az479EQSiX9VE6wftGXnKbSmsy78UQ61lXaStAoW2+tw
	lPSem9EHJ//q8h4QTLsiPFmj9ACqYJegXTXyRVSSlAVIVul5arMG+jNMvF5nTuzViKeZ5/fTmvKkK
	ch4miGKTzi0Q60RpUSYE3Fy4NwrCZfsvEgkbJbuF2XfsI9XLUjAj+C4HbFrl3RTsaB90nNXbTy0Mw
	zialhb7wHMrl4P9GCMOSW0pLujaLC1U6Y8FWUg1WPUc2k2uOlT1RtQRP4GioQXGw9SI1O1Lde0SAy
	BkOu5J1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxRR-00000007mDq-3up7;
	Tue, 24 Nov 2026 20:48:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxR4-00000007m2g-2kRM
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 20:48:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B6CA4570C;
	Tue, 24 Nov 2026 20:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45121F000C0;
	Tue, 24 Nov 2026 20:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553297;
	bh=3WR0SyTFj/NZLV2BrTwwZoqVlhPA3XgvD8QOWXlzDQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m0KPlOU/BmRhMYggxy1sAdUJB8GviaKkwTJjIeEozrhnucfAHnxkULB6FHMrgCfwf
	 wEHlO0OudopUhcQiPbrxxy+M1/8dxid+DVJDQfxN808ix05kC/0VsiaJSd7Nx4oSz8
	 zDVO9yaskaBRpv7bBCLtv4ky6Ltr8V7BanW5hByMZt4t7GG/4WqUd7D4SjkzQ0/nhY
	 cEiCkMKk4MOks51zXWT8cLTM3pY79MZo9iz8+tByPRDp0UpLZlui6V2W3HLm2+IuI/
	 UsVV13I/eiJRCMCcpqAFqZDX6fiDojd7fnTVFT0lD/IBxtLI7UyMR9ZVqltMY3mokP
	 i85whLUWU76ng==
Message-ID: <sashiko-outbox-231999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ubifs: Bound lpt_gc() retries when LPT GC makes no
 progress
To: "Devin Armstrong" <darmstrong@tantalus.com>, "Richard Weinberger" <richard@nod.at>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, jpark@tantalus.com
In-Reply-To: <20261124-lpt-gc-send-v1-1-eb975487c6d5@tantalus.com>
References: <20261124-lpt-gc-send-v1-1-eb975487c6d5@tantalus.com>
Date: Tue, 24 Nov 2026 20:48:17 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gdWJpZnM6IG1pc3NpbmcgRml4
ZXMgdHJhaWxlciBmb3IgTFBUIEdDIGluZmluaXRlIGxvb3AgZml4IGluCiAgbHB0X2djKCkKLS0K
CmNvbW1pdCA1NWE0YTRmYWM5ZTQ4NTNiZDM2Yzg0MzhkM2UwZDJkNWFmN2JmOGRkCkF1dGhvcjog
RGV2aW4gQXJtc3Ryb25nIDxkYXJtc3Ryb25nQHRhbnRhbHVzLmNvbT4KCj4gdWJpZnM6IEJvdW5k
IGxwdF9nYygpIHJldHJpZXMgd2hlbiBMUFQgR0MgbWFrZXMgbm8gcHJvZ3Jlc3MKPgo+IHViaWZz
X2xwdF9zdGFydF9jb21taXQoKSBhbmQgdWJpZnNfbHB0X3Bvc3RfY29tbWl0KCkgY2FsbCBscHRf
Z2MoKSBpbiBhCj4gIndoaWxlIChuZWVkX3dyaXRlX2FsbChjKSkiIGxvb3AuIElmIGxwdF9nY19s
bnVtKCkgY2Fubm90IGRpcnR5IGV2ZXJ5Cj4gbm9kZSBvZiB0aGUgTEVCIGl0IHdhcyBnaXZlbiwg
dGhhdCBMRUIncyBmcmVlICsgZGlydHkgc3BhY2UgbmV2ZXIKPiByZWFjaGVzIGxlYl9zaXplLCBu
ZWVkX3dyaXRlX2FsbCgpIGtlZXBzIHJldHVybmluZyAxLCBscHRfZ2MoKSBrZWVwcwo+IHNlbGVj
dGluZyB0aGUgc2FtZSBMRUIsIGFuZCB0aGUgbG9vcCBuZXZlciBlbmRzLgo+Cj4gT25lIHdheSB0
byBnZXQgdGhlcmUgaXMgdGhlIExQVCBzY2FubmluZyBwcm9ibGVtIHJlcG9ydGVkIGluIHRoZSBs
aW5rCj4gYmVsb3c6IHRoZSAweGZmIHBhZGRpbmcgYXQgdGhlIGVuZCBvZiBhbiBMUFQgY29tbWl0
IGZvbGxvd2VkIGJ5IHRoZQo+IGZpcnN0IGJ5dGVzIG9mIHRoZSBuZXh0IGNvbW1pdCdzIGxzYXZl
IG5vZGUgY2FuIGZvcm0gYSB2YWxpZC1sb29raW5nCj4gbm9kZSAodGhlIDE2LWJpdCBDUkMgbWF0
Y2hlcyBieSBjaGFuY2UpLiBXaGVuIHRoaXMgaGFwcGVucywgYSByZWFkLXdyaXRlCj4gbW91bnQg
b3IgcmVtb3VudCBzcGlucyBpbiB0aGUga2VybmVsIGF0IDEwMCUgQ1BVIGFuZCBjYW4ndCBiZSBr
aWxsZWQuCj4gUmVhZC1vbmx5IG1vdW50cyBuZXZlciBjb21taXQsIHNvIHRoZXkgYXJlIG5vdCBh
ZmZlY3RlZC4KPgo+IFRyYWNrIHRoZSBMRUIgYW5kIGl0cyBkaXJ0eSBzcGFjZSBzZWxlY3RlZCBi
eSBscHRfZ2MoKSBpbiB0aGUgY2FsbGVyJ3MKPiBsb29wLiBJZiB0aGUgc2FtZSBMRUIgaXMgc2Vs
ZWN0ZWQgVUJJRlNfTFBUX0dDX01BWF9SRVRSSUVTIHRpbWVzIGluIGEKPiByb3cgd2l0aCB1bmNo
YW5nZWQgZGlydHkgc3BhY2UsIHJldHVybiAtRVVDTEVBTi4gQW55IHBhc3MgdGhhdCBtYWtlcwo+
IHByb2dyZXNzIGNoYW5nZXMgdGhlIGRpcnR5IHNwYWNlIGFuZCByZXN0YXJ0cyB0aGUgY291bnQs
IHNvIHRoZSBub3JtYWwKPiBHQyByZXRyeSBjeWNsZSBpcyB1bmFmZmVjdGVkLgo+Cj4gVGhlIGVy
cm9yIG1ha2VzIHRoZSBjb21taXQgZmFpbCwgd2hpY2ggcHV0cyBVQklGUyBpbiByZWFkLW9ubHkg
bW9kZSwgc28KPiB0aGUgbW91bnQgb3IgcmVtb3VudCBmYWlscyB3aXRoIGFuIGVycm9yIGluc3Rl
YWQgb2YgaGFuZ2luZy4gVGhpcyBkb2VzCj4gbm90IHJlcGFpciB0aGUgTFBULCBpdCBvbmx5IHR1
cm5zIGFuIGVuZGxlc3MgbG9vcCBpbnRvIGEgZmFpbHVyZS4KPgo+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW10ZC85N2NhN2ZlNC00YWQ0LWVkZDEtZTk3YS0xZDU0MGFlYWJl
MmRAaHVhd2VpLmNvbS8KPgo+IFNpZ25lZC1vZmYtYnk6IERldmluIEFybXN0cm9uZyA8ZGFybXN0
cm9uZ0B0YW50YWx1cy5jb20+CgpbU2V2ZXJpdHk6IExvd10KVGhpcyBmaXhlcyBhbiBpbmZpbml0
ZSBsb29wIGluIHRoZSBMUFQgR0MgY29tbWl0IHBhdGguICBTaG91bGQgaXQgaW5jbHVkZToKCiAg
Rml4ZXM6IDFlNTE3NjRhM2MyYSAoIlVCSUZTOiBhZGQgbmV3IGZsYXNoIGZpbGUgc3lzdGVtIikK
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjExMjQtbHB0LWdjLXNlbmQtdjEtMS1lYjk3NTQ4N2M2ZDVAdGFudGFsdXMuY29tP3BhcnQ9
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
