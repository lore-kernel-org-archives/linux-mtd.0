Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE42C02197
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2025 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dECEIxUePr2IE2+7rXg8QbspdD6KNOCiIUJwgV+vMpU=; b=uxFTipiG8eovko
	MpRU0+y0f7U2NqMx9/S1MlCFe4BGrFLSO27a40SgDGxGLJ46NeneQnIgQktLtCyBU4mgWikMZ2dSm
	TnXHpqCC4musraGx6A7/69V5B/VoUkC+/CNH2PIxYCT//zw11nz6t3u4buUnHFML5bWXtupb1qK+c
	5F+5+I4uvcw+myTPCTqdoZ4/qZ/SDo0Ycz5Djj2ydUmjCz6VXEo1a8At0QLkJa7cztxJGec7hl4yQ
	4YWOzjEp6osPaYbQl2iA+/9fKy3KqQ8HHN+Jw1MgZSaY04TpSu8/yXxhwL+5+kcBC50ctQS6tFJy6
	BhYa6obeLojrObkm8FTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0oY-0000000GCog-0iA0;
	Mon, 03 Feb 2025 18:04:54 +0000
Received: from smtp-80.smtpout.orange.fr ([80.12.242.80] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0oU-0000000GCmm-0lry
	for linux-mtd@lists.infradead.org;
	Mon, 03 Feb 2025 18:04:52 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id f0oGt2ORz0JH5f0oJtt8sj; Mon, 03 Feb 2025 19:04:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738605882;
	bh=gLHLa2XdqwW7+r0oY0nu4QSOxnRWXRNBPOE98c52yc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rEDdxMRtjkilBCKJEIJ9ggoEND0Hoyyf2MvcXEI9mEdowPxfDWzNBgnaQekFYde4P
	 MVpOxfUViLIk/24ouSE8hfjT75IrP7NUlaebTxPambp3tutG9gczmChr+kdVEKEC+H
	 LbVw13JByeIGjSu1WLiaX/gVV19otYFGc2CdRZxgNUzy6vdoFYHYqyz+oDlspEc62H
	 cO+2SV3dAZf9BJA00Daj7rKqPaAAuKU38AnWicvFtxDJAgmUlUJcAr76uVOJYwJfhu
	 vhE6G05/JrJFRSMVcMJQIGHUedvEflew1c4vDrWKZVrzj9/T6QS9SQQckucHLzTmTM
	 Zc4UZJUgpKjuw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 19:04:42 +0100
X-ME-IP: 90.11.132.44
Message-ID: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
Date: Mon, 3 Feb 2025 19:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: Add check for kcalloc()
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, gmpy.liaowx@gmail.com, kees@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
 <87tt9bxwc0.fsf@bootlin.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <87tt9bxwc0.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_100450_626987_6BB063BC 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMDMvMDIvMjAyNSDDoCAwOTozMiwgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IE9uIDAy
LzAyLzIwMjUgYXQgMjA6NTQ6NTYgR01ULCBKaWFzaGVuZyBKaWFuZyA8amlhc2hlbmdqaWFuZ2Nv
b2xAZ21haWwuY29tPiB3cm90ZToKPiAKPj4gQWRkIGEgY2hlY2sgZm9yIGtjYWxsb2MoKSBhbmQg
cHJpbnQgYW4gZXJyb3IgbWVzc2FnZSBpZiBpdCBmYWlscy4KPiAKPiBDaGVja2luZywgeWVzLCBi
dXQgbG9nZ2luZywgbm8uIElJUkMgdGhlIGNvcmUgZG9lcyBpdCBhbHJlYWR5IGlmIHJlcXVpcmVk
Lgo+IAo+PiBGaXhlczogNzhjMDgyNDdiOWQzICgibXRkOiBTdXBwb3J0IGttc2cgZHVtcGVyIGJh
c2VkIG9uIHBzdG9yZS9ibGsiKQo+IAo+IENjOiBzdGFibGUgaXMgbWlzc2luZwo+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFzaGVuZyBKaWFuZyA8amlhc2hlbmdqaWFuZ2Nvb2xAZ21haWwuY29tPgo+
PiAtLS0KPj4gICBkcml2ZXJzL210ZC9tdGRwc3RvcmUuYyB8IDUgKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9t
dGRwc3RvcmUuYyBiL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jCj4+IGluZGV4IDdhYzhhYzkwMTMw
Ni4uMzY4OTk3MTU1YzA3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+
PiArKysgYi9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+PiBAQCAtNDIzLDYgKzQyMywxMSBAQCBz
dGF0aWMgdm9pZCBtdGRwc3RvcmVfbm90aWZ5X2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPj4g
ICAJbG9uZ2NudCA9IEJJVFNfVE9fTE9OR1MoZGl2X3U2NChtdGQtPnNpemUsIG10ZC0+ZXJhc2Vz
aXplKSk7Cj4+ICAgCWN4dC0+YmFkbWFwID0ga2NhbGxvYyhsb25nY250LCBzaXplb2YobG9uZyks
IEdGUF9LRVJORUwpOwo+PiAgIAo+PiArCWlmICghY3h0LT5ybW1hcCB8fCAhY3h0LT51c2VkbWFw
IHx8ICFjeHQtPmJhZG1hcCkgewo+PiArCQlkZXZfZXJyKCZtdGQtPmRldiwgImZhaWxlZCB0byBh
bGxvY2F0ZSBtZW1vcnkgZm9yIG1hcFxuIik7Cj4+ICsJCXJldHVybjsKPj4gKwl9Cj4+ICsKPj4g
ICAJLyoganVzdCBzdXBwb3J0IGRtZXNnIHJpZ2h0IG5vdyAqLwo+PiAgIAljeHQtPmRldi5mbGFn
cyA9IFBTVE9SRV9GTEFHU19ETUVTRzsKPj4gICAJY3h0LT5kZXYuem9uZS5yZWFkID0gbXRkcHN0
b3JlX3JlYWQ7Cj4gCj4gV2hhdCBpZiByZWdpc3Rlcl9wc3RvcmVfZGV2aWNlKCkgZmFpbHM/IFlv
dXIgb25seSBwYXJ0aWFsbHkgZml4aW5nIHRoZQo+IHByb2JsZW0gaWYgeW91IGRvbid0IGhhbmRs
ZSB0aGUgZnJlZSgpcyB0aGVyZSBhcyB3ZWxsLgoKLi4uIGFuZCBpZiBhbiBhbGxvY2F0aW9uIGZh
aWxzIGFib3ZlLCB0aGVuIHNvbWUga2ZyZWUoKSBhbHNvIG5lZWRzIHRvIGJlIApjYWxsZWQuCgpB
bmQsIHVucmVsYXRlZCB0byB5b3VyIHBhdGNoLCB0aGVzZSBrY2FsbG9jKCkva2ZyZWUoKSBjb3Vs
ZCBiZSBzb21lIApiaXRtYXBfemFsbG9jKCkvYml0bWFwX2ZyZWUoKS4gKGJ1dCBpJ20gbm90IHN1
cmUgaXQgcmVhbGx5IHdvcnRoIHRoZSBlZmZvcnQpCgpDSgoKPiAKPiBUaGFua3MsCj4gTWlxdcOo
bAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
