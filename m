Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DE606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2026 02:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H+nwqngs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4pwsNjr4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vZXJ2/nYf1PN9CUu3iC3TYiU8q5u4xF2yZ4c3jT+y2c=; b=H+nwqngsJDrZ2eyNUWlSkk8M+V
	J60KHVgZ9+rR1uZVe/60UnjbYlWkBpIBsmbfxdQjYh/xbNlQEyN5jHMed3shFGDv4AF0abEz/Bt3+
	/rgtjEAzGqC7Atw2sHBhftfyYMEn89uLOx8pQkt03Pdi+I4r2acjAX3TGfYU0fQBWdS4tHlVtKCVv
	hCYDYvn7wLttPLNGF/BgPEJz7uNcgTrZZszQAef8dez+mTCO+gA/XLdOL2TmkayXd+hlVxP1Jy+Yj
	8nKBJ1hjVFDMmQLwlkJ3btAmUyztUSVDjsRUDuwDHDKt/K/r12RbCgti6fOoAIshLXGQ/IbxJ1ArZ
	RqMxaZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAew-00000001cgm-3Axh;
	Mon, 26 Oct 2026 02:42:02 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAet-00000001cg7-2LSO
	for linux-mtd@lists.infradead.org;
	Mon, 26 Oct 2026 02:42:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BmpIBmwz3s7h3zyf+rZ1e2cKX1mYlPZ38XsruGm9TcI=;
	b=4pwsNjr4k1dDtecgaqj4G96wRk/wSjAV9JlrpoKUeZWLVXyBuTUyD5V774noLcMo9VSkno8uZ
	TPXsM/PEFgM/6V+WZCE7mL2y/6c13K6RdRk2FUvkP/QLSVT1Yp8ZHlOldOiAcUb4t4lg1J+zhLH
	SKSuFIoQEa0jEAn2LLd2ZRQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jCdDT1kw2z1prPg;
	Mon, 26 Oct 2026 10:41:29 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 006B140537;
	Mon, 26 Oct 2026 10:41:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 10:41:35 +0800
Subject: Re: [PATCH] ubifs: check the length of index branches before reading
 them
To: Alejandro Pacheco <ale@alepacheco.dev>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <82903e1b-56b0-4947-b0ed-5c24a536491a@alepacheco.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <869bf284-451c-d70f-102f-c306ad452a54@huawei.com>
Date: Mon, 26 Oct 2026 10:41:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <82903e1b-56b0-4947-b0ed-5c24a536491a@alepacheco.dev>
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_194159_931322_5D1998D3 
X-CRM114-Status: GOOD (  32.41  )
X-Spam-Score: -3.8 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8yNCAyMDozMCwgQWxlamFuZHJvIFBhY2hlY28g0LS1wDoKPiBGcm9tOiBBbGVq
YW5kcm8gUGFjaGVjbyA8YWxlQGFsZXBhY2hlY28uZGV2Pgo+IAo+IHJlYWRfem5vZGUoKSB2YWxp
ZGF0ZXMgZWFjaCBicmFuY2ggb2YgdGhlIGluZGV4IG5vZGUgaXQgcmVhZHM6IHRoZSBMRUIKPiBu
dW1iZXIgYW5kIG9mZnNldCBvZiBldmVyeSBicmFuY2ggYW5kLCBpbiBhIGxldmVsIDAgem5vZGUs
IHRoZSBsZW5ndGggb2YKPiB0aGUgbGVhZiBub2RlIHRoZSBicmFuY2ggcG9pbnRzIHRvLCBhZ2Fp
bnN0IGMtPnJhbmdlc1tdLiBJbiBhIHpub2RlIGFib3ZlCj4gbGV2ZWwgMCwgd2hlcmUgZWFjaCBi
cmFuY2ggcG9pbnRzIHRvIGFub3RoZXIgaW5kZXggbm9kZSwgdGhlIGxlbmd0aCBpcwo+IG5vdCBj
aGVja2VkOgo+IAo+IAlpZiAoem5vZGUtPmxldmVsKQo+IAkJY29udGludWU7Cj4gCj4gV2hlbiBz
dWNoIGEgY2hpbGQgaXMgbG9hZGVkLCB1Ymlmc19sb2FkX3pub2RlKCkgY2FsbHMgcmVhZF96bm9k
ZSgpIGZvcgo+IGl0LCB3aGljaCBhbGxvY2F0ZXMgYy0+bWF4X2lkeF9ub2RlX3N6IGJ5dGVzIGFu
ZCBoYXMgdWJpZnNfcmVhZF9ub2RlKCkKPiByZWFkIHpici0+bGVuIGJ5dGVzIGludG8gdGhlbS4g
QmVmb3JlIHRoZSByZWFkLCB0aGF0IGxlbmd0aCBpcyBib3VuZGVkCj4gYnkgdGhlIHNwYWNlIGxl
ZnQgaW4gdGhlIExFQiBidXQgbm90IGJ5IHRoZSBzaXplIG9mIHRoZSBidWZmZXI7IHRoZQo+IGxl
bmd0aCBpbiB0aGUgbm9kZSBoZWFkZXIgaXMgY29tcGFyZWQgd2l0aCBpdCBhbmQgd2l0aCBjLT5y
YW5nZXNbXSBvbmx5Cj4gYWZ0ZXIgdGhlIHJlYWQuIFNvIGFuIGltYWdlIHdpdGggYSBicmFuY2gg
bGVuZ3RoIGxhcmdlciB0aGFuCj4gYy0+bWF4X2lkeF9ub2RlX3N6LCBidXQgd2l0aGluIHRoZSBM
RUIsIGNhbiBjYXVzZSBhIGhlYXAgYnVmZmVyIG92ZXJmbG93Lgo+IAo+IGRiZ19jaGVja19vbGRf
aW5kZXgoKSwgd2hpY2ggd2Fsa3MgdGhlIG9sZCBpbmRleCBvbiB0aGUgbWVkaWEgd2hlbiB0aGUK
PiBjaGtfaW5kZXggZGVidWdnaW5nIGNoZWNrIGlzIGVuYWJsZWQsIHJlYWRzIGVhY2ggY2hpbGQg
aW5kZXggbm9kZSBieSBpdHMKPiBicmFuY2ggbGVuZ3RoIHRoZSBzYW1lIHdheSwgaW50byBhIGJ1
ZmZlciBzaXplZCBmb3IgYW4gaW5kZXggbm9kZSBvZgo+IGMtPmZhbm91dCBicmFuY2hlcywgd2l0
aG91dCBjaGVja2luZyB0aGUgbGVuZ3RoLgo+IAo+IHZhbGlkYXRlX21hc3RlcigpIGFscmVhZHkg
Y2hlY2tzIHRoZSByb290IGluZGV4IG5vZGUncyBsZW5ndGgsCj4gYy0+enJvb3QubGVuLCBhZ2Fp
bnN0IGMtPnJhbmdlc1tVQklGU19JRFhfTk9ERV0uIEdpdmUgZXZlcnkgb3RoZXIgaW5kZXgKPiBi
cmFuY2ggdGhlIHNhbWUgY2hlY2sgYmVmb3JlIGl0IGlzIHVzZWQgZm9yIGEgcmVhZDogaW4gcmVh
ZF96bm9kZSgpLCBieQo+IHJ1bm5pbmcgdGhlIGxlbmd0aCBjaGVjayBsZXZlbCAwIGJyYW5jaGVz
IGdldCB3aXRoIHR5cGUgVUJJRlNfSURYX05PREUsCj4gYW5kIGluIGRiZ19jaGVja19vbGRfaW5k
ZXgoKS4gSW1hZ2VzIHdyaXR0ZW4gYnkgVUJJRlMgb3IgbWtmcy51YmlmcyBhcmUKPiBub3QgYWZm
ZWN0ZWQ6IGFuIGluZGV4IG5vZGUgaXMgdWJpZnNfaWR4X25vZGVfc3ooKSBvZiBpdHMgMSB0byBm
YW5vdXQKPiBicmFuY2hlcyBsb25nLCB3aGljaCBpcyB0aGUgcmFuZ2UgaW4gYy0+cmFuZ2VzW1VC
SUZTX0lEWF9OT0RFXSwgYW5kCj4gdWJpZnNfcmVhZF9ub2RlKCkgYWxyZWFkeSByZWplY3RzIGEg
bGVuZ3RoIG91dHNpZGUgaXQsIHRob3VnaCBvbmx5IGFmdGVyCj4gdGhlIHJlYWQuCj4gCj4gVGhp
cyBuZWVkcyBhIGNyYWZ0ZWQgaW1hZ2UgKHRoZSBDUkMgb2YgdGhlIGluZGV4IG5vZGUgaG9sZGlu
ZyB0aGUgYnJhbmNoCj4gY2F0Y2hlcyByYW5kb20gY29ycnVwdGlvbiksIGFuZCBtb3VudGluZyBV
QklGUyBuZWVkcyBDQVBfU1lTX0FETUlOIGluCj4gdGhlIGluaXRpYWwgdXNlciBuYW1lc3BhY2Uu
Cj4gCj4gSXQgd2FzIHRlc3RlZCBvbiBhIEtBU0FOIFVNTCBrZXJuZWwgYnVpbHQgZnJvbSB0aGlz
IHRyZWUsIHdpdGggVUJJIG9uIGEKPiA2NCBNaUIgbXRkcmFtIGRldmljZSBhbmQgdGhlIGNoa19p
bmRleCBkZWJ1Z2dpbmcgY2hlY2sgZW5hYmxlZC4gQSB0cmVlIG9mCj4gMSw4MzAgZmlsZXMgaW4g
MzAgZGlyZWN0b3JpZXMgd2FzIGNvcGllZCB0byBhIGZyZXNobHkgZm9ybWF0dGVkIHZvbHVtZSwK
PiByZWFkIGJhY2sgYWZ0ZXIgYSByZW1vdW50LCBwYXJ0bHkgZGVsZXRlZCBhbmQgY29waWVkIGFn
YWluLCBhbmQgcmVhZAo+IGJhY2sgYWZ0ZXIgYW5vdGhlciByZW1vdW50OyB0aGUgc2FtZSB0cmVl
IHdhcyByZWFkIGJhY2sgZnJvbSBhIHNlY29uZAo+IHZvbHVtZSB3cml0dGVuIGJ5IG1rZnMudWJp
ZnMuIEFjcm9zcyB0aGUgcmVtb3VudHMsIHJlYWRfem5vZGUoKSByZWFkIDkwOQo+IGluZGV4IG5v
ZGVzIGFib3ZlIGxldmVsIDAsIGFuZCBkYmdfY2hlY2tfb2xkX2luZGV4KCkgd2Fsa2VkIHRoZSBv
bGQKPiBpbmRleCBhdCAyMCBjb21taXRzLCB0aGUgd2hvbGUgaW5kZXggb2YgZWFjaCB2b2x1bWUg
YXMgaXQgd2FzIG9uIHRoZQo+IG1lZGlhIGFtb25nIHRoZW0sIHdpdGggbm8gS0FTQU4gcmVwb3J0
LCB3YXJuaW5nIG9yIFVCSUZTIGVycm9yLiBUaGlzIG9ubHkKPiBydW5zIHRoZSBuZXcgY2hlY2tz
IG9uIHZhbGlkIGluZGV4IG5vZGVzOiBubyBpbWFnZSB3aXRoIGEgYmFkIGJyYW5jaAo+IGxlbmd0
aCB3YXMgbWFkZS4gSXQgYnVpbGRzIHdpdGggbm8gbmV3IHdhcm5pbmdzIChXPTEsIHg4Nl82NCBk
ZWZjb25maWcKPiB3aXRoIFVCSUZTIGFuZCBLQVNBTiksIGFuZCBjaGVja3BhdGNoLnBsIC0tc3Ry
aWN0IHJlcG9ydHMgbm90aGluZy4KPiAKPiBBbiBMTE0gY29kaW5nIGFzc2lzdGFudCB3YXMgdXNl
ZCB0byBmaW5kIHRoaXMgYnVnIGFuZCB0byB3cml0ZSB0aGlzCj4gcGF0Y2ggYW5kIGl0cyBjaGFu
Z2Vsb2cuCj4gCj4gRml4ZXM6IDFlNTE3NjRhM2MyYSAoIlVCSUZTOiBhZGQgbmV3IGZsYXNoIGZp
bGUgc3lzdGVtIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IEFsZWphbmRybyBQYWNoZWNvIDxhbGVAYWxlcGFjaGVjby5kZXY+Cj4gLS0tCj4gICBmcy91Ymlm
cy9jb21taXQuYyAgIHwgNSArKysrKwo+ICAgZnMvdWJpZnMvdG5jX21pc2MuYyB8IDYgKysrLS0t
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
ClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRp
ZmYgLS1naXQgYS9mcy91Ymlmcy9jb21taXQuYyBiL2ZzL3ViaWZzL2NvbW1pdC5jCj4gaW5kZXgg
NWIzYTg0MDA5OGIuLjBlNTBiNTg0MjQ4IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2NvbW1pdC5j
Cj4gKysrIGIvZnMvdWJpZnMvY29tbWl0LmMKPiBAQCAtNjk2LDYgKzY5NiwxMSBAQCBpbnQgZGJn
X2NoZWNrX29sZF9pbmRleChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX3picmFu
Y2ggKnpyb290KQo+ICAgCQlsbnVtID0gbGUzMl90b19jcHUoYnItPmxudW0pOwo+ICAgCQlvZmZz
ID0gbGUzMl90b19jcHUoYnItPm9mZnMpOwo+ICAgCQlsZW4gPSBsZTMyX3RvX2NwdShici0+bGVu
KTsKPiArCQlpZiAobGVuIDwgYy0+cmFuZ2VzW1VCSUZTX0lEWF9OT0RFXS5taW5fbGVuIHx8Cj4g
KwkJICAgIGxlbiA+IGMtPnJhbmdlc1tVQklGU19JRFhfTk9ERV0ubWF4X2xlbikgewo+ICsJCQll
cnIgPSA4Owo+ICsJCQlnb3RvIG91dF9kdW1wOwo+ICsJCX0KPiAgIAkJa2V5X3JlYWQoYywgJmJy
LT5rZXksICZsb3dlcl9rZXkpOwo+ICAgCQlpZiAoaWlwICsgMSA8IGxlMTZfdG9fY3B1KGlkeC0+
Y2hpbGRfY250KSkgewo+ICAgCQkJYnIgPSB1Ymlmc19pZHhfYnJhbmNoKGMsIGlkeCwgaWlwICsg
MSk7Cj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3RuY19taXNjLmMgYi9mcy91Ymlmcy90bmNfbWlz
Yy5jCj4gaW5kZXggMTBiMjIyZGM2YTUuLmUzYWUxNzk3N2M5IDEwMDY0NAo+IC0tLSBhL2ZzL3Vi
aWZzL3RuY19taXNjLmMKPiArKysgYi9mcy91Ymlmcy90bmNfbWlzYy5jCj4gQEAgLTM1Nyw5ICsz
NTcsOSBAQCBzdGF0aWMgaW50IHJlYWRfem5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVj
dCB1Ymlmc196YnJhbmNoICp6emJyLAo+ICAgCQl9Cj4gICAKPiAgIAkJaWYgKHpub2RlLT5sZXZl
bCkKPiAtCQkJY29udGludWU7Cj4gLQo+IC0JCXR5cGUgPSBrZXlfdHlwZShjLCAmemJyLT5rZXkp
Owo+ICsJCQl0eXBlID0gVUJJRlNfSURYX05PREU7Cj4gKwkJZWxzZQo+ICsJCQl0eXBlID0ga2V5
X3R5cGUoYywgJnpici0+a2V5KTsKPiAgIAkJaWYgKGMtPnJhbmdlc1t0eXBlXS5tYXhfbGVuID09
IDApIHsKPiAgIAkJCWlmICh6YnItPmxlbiAhPSBjLT5yYW5nZXNbdHlwZV0ubGVuKSB7Cj4gICAJ
CQkJdWJpZnNfZXJyKGMsICJiYWQgdGFyZ2V0IG5vZGUgKHR5cGUgJWQpIGxlbmd0aCAoJWQpIiwK
PiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
