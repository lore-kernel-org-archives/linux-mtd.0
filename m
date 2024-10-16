Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F22D20688
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 02:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIpCtKWQfnyuUrgHtR3AloCU1HYFV0057MVAnNvQ5hI=; b=tPQAnW4z3a83VuXpgYrP/j76yQ
	tdxSLLztTOCY8NMi9o0hFOvNiS/lIEShRmuYwydgtKOt4BvZpx5l8Yeq1SK9eVbg98kk0XRChZmQI
	+nwFdyyPKhr6PDB/xoLUK2c7fwqxyzhqBVyupfcCWhxB66kZC8S6mLbkoG0867a4LTeESX4jElz5f
	R5rP9xK5Sij1vs6uhUGew8we/0nLBTu2oYPWlERBTelHDz+XVX4MLCiDeplX/x0anotxOWmMxhlCi
	sj6yoTSvPRTyjOItodsWoYAyPW/gbEilXFdxUL8+KhcWbLsRCEh+W9oYGLe1y72xD0NpPXWw3t23g
	FK1zAqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0tWC-0000000ACda-1lGA;
	Wed, 16 Oct 2024 02:12:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0tW6-0000000ACaY-0CCn
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 02:12:06 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XSvZw2qnGz20qB6;
	Wed, 16 Oct 2024 10:11:04 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2656B1402C7;
	Wed, 16 Oct 2024 10:11:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 16 Oct 2024 10:11:47 +0800
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Waqar Hameed <waqar.hameed@axis.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
 <5173d3d2-4a6b-8b0b-c8f7-8034c9763532@huawei.com> <pnd7ca9r0pt.fsf@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <239af2ee-c18d-414f-099f-2c82f98d9671@huawei.com>
Date: Wed, 16 Oct 2024 10:11:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <pnd7ca9r0pt.fsf@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_191205_578134_52244C63 
X-CRM114-Status: GOOD (  22.42  )
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

5ZyoIDIwMjQvMTAvMTYgMjo1MiwgV2FxYXIgSGFtZWVkIOWGmemBkzoKSGkgV2FxYXIsClsuLi5d
Cj4gCj4gRm9yIGNvbXBsZXRlbmVzcywgaGVyZSBhcmUgdGhlIF9leGFjdF8gc3RlcHMgdGhhdCBJ
IGhhdmUgdXNlZCB0bwo+IHJlcHJvZHVjZSB0aGlzIG9uIG15IHN5c3RlbSB3aXRoIHY2LjEyLXJj
MiAoY29tbWl0IDc1YjYwN2ZhYjM4ZCAiTWVyZ2UKPiB0YWcgJ3NjaGVkX2V4dC1mb3ItNi4xMi1y
YzItZml4ZXMnIG9mCj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RqL3NjaGVkX2V4dCIpOgo+IAo+IGBgYAo+IHViaWF0dGFjaCAtbSAyCj4gCj4ga2V5Y3Rs
IGFkZCBsb2dvbiBkdW1teV9rZXk6IGR1bW15X2xvYWQgQHVzCj4gCj4gdWJpbWt2b2wgL2Rldi91
YmkwIC1zIDgwTWlCIC1uIDAgLU4gdGVzdC12b2wKPiB1Yml1cGRhdGV2b2wgL2Rldi91YmkwXzAg
LXQKPiAKPiBtb3VudCAtdCB1YmlmcyAvZGV2L3ViaTBfMCAvbW50L2ZsYXNoIC1vIGF1dGhfaGFz
aF9uYW1lPXNoYTI1NixhdXRoX2tleT1kdW1teV9rZXk6Cj4gCj4gY291bnQ9MAo+IHdoaWxlIHRy
dWU7IGRvCj4gICAgICBkYXRlCj4gICAgICBjb3VudD0kKCgkY291bnQgKyAxKSkKPiAgICAgIGVj
aG8gY291bnQ9JGNvdW50Cj4gCj4gICAgICBybSAtZiAvbW50L2ZsYXNoL3Rlc3QtZmlsZS5iaW4K
PiAgICAgIGRkIGlmPS9kZXYvdXJhbmRvbSBvZj0vbW50L2ZsYXNoL3Rlc3QtZmlsZS5iaW4gYnM9
MU0gY291bnQ9NjAgY29udj1mc3luYwo+IAo+ICAgICAgZWNobyAiIgo+IGRvbmUKPiBgYGAKPiAK
ClRoYW5rcyBmb3IgdGhlIGNvbXBsZXRlIHByb2dyYW0sIEkgd2lsbCB0cnkgaXQgYWdhaW4uCkJU
Vywgd2hhdCBpcyB0aGUgY29uZmlndXJhdGlvbiBvZiB5b3VyIGZsYXNoPyhlZy4gZXJhc2Ugc2l6
ZSwgcGFnZSBzaXplKT8KCj4gTm90ZSB0aGF0IHlvdSBuZWVkIHRvIGhhdmUgYENPTkZJR19VQklG
U19GU19BVVRIRU5USUNBVElPTj15YCAoYW5kCj4gYENPTkZJR19LQVNBTj15YCBvYnZpb3VzbHkp
IGluIHlvdXIgYC5jb25maWdgIGluIG9yZGVyIHRvIHRyaWdnZXIgdGhlCj4gb2ZmZW5kaW5nIGBt
ZW1jcHkoKWAgaW4gYHViaWZzX2NvcHlfaGFzaCgpYC4gQWxzbywgaXQgdGFrZXMgYSB3aGlsZS4g
Rm9yCj4gZXhhbXBsZSwgbGFzdCB0aW1lIGl0IHRvb2sgbWUgODggaXRlcmF0aW9ucyBvZiB0aGUg
YWJvdmUgbG9vcCBiZWZvcmUgaXQKPiB0cmlnZ2VyZWQuIFNvIHlvdSBtaWdodCBuZWVkIHRvIGxl
dCBpdCBzcGluIGZvciBhIHdoaWxlLgoKWWVzLCBhYm92ZSB0d28gY29uZmlncyBhcmUgZW5hYmxl
ZCwgYW5kIEkgaGF2ZSBhZGRlZCBwcmludGluZyBtZXNzYWdlcyAKdG8gY29uZmlybSB0aGUgYXV0
aGVudGljYXRpb24gcGF0aCBpcyBhY3RpdmUuCj4gCj4+Cj4+IENhbiB5b3UgZGlnIG1vcmUgZGVl
cGVyIGJ5IGFkZGluZyBtb3JlIGRlYnVnIG1lc3NhZ2UsIHNvIHRoYXQgd2UgY2FuIGZpZ3VyZSBv
dXQKPj4gd2hhdCBpcyByZWFsbHkgaGFwcGVuaW5nLgo+IAo+IENlcnRhaW5seSEgSSBjb3VsZCB0
cnkgdG8gZW5hYmxlIHRoZSBkZWJ1ZyBwcmludHMgZnJvbSBVQklGUywgaG93ZXZlcgo+IHRoZXkg
YXJlICphIGxvdCouIE1vcmVvdmVyLCBwcmludGluZyB0aGF0IG11Y2ggY2hhbmdlcyB0aGUgdGlt
aW5nCj4gYmVoYXZpb3IgYW5kIG1pZ2h0IG1ha2UgaXQgaGFyZGVyIHRvIHRyaWdnZXIgdGhlIHVz
ZS1hZnRlci1mcmVlLiBEbyB5b3UKPiBoYXZlIGFueSB0aXBzIG9uIHdoZXJlIHdlIHNob3VsZCB0
cnkgdG8gZm9jdXMgdGhlIGRlYnVnIHByaW50cyAoYQo+IGR5bmFtaWMgZGVidWcgZmlsdGVyKS4K
PiAKCldlbGwsIGxldCdzIGRvIGEgcHJlbGltaW5hcnkgYW5hbHlzaXMuClRoZSB6bm9kZS0+Y3Bh
cmVudFt6bm9kZS0+Y2lpcF0gaXMgYSBmcmVlZCBhZGRyZXNzIGluIHdyaXRlX2luZGV4KCksIAp3
aGljaCBtZWFuczoKMS4gJ3pub2RlLT5jaWlwJyBpcyB2YWxpZCwgem5vZGUtPmNwYXJlbnQgaXMg
ZnJlZWQgYnkgdG5jX2RlbGV0ZSwgCmhvd2V2ZXIgem5vZGUgY2Fubm90IGJlIGZyZWVkIGlmIHpu
b2RlLT5jbmV4dCBpcyBub3QgTlVMTCwgd2hpY2ggbWVhbnM6CiAgIGEpICd6bm9kZS0+Y3BhcmVu
dCcgaXMgbm90IGRpcnR5LCB3ZSBzaG91bGQgYWRkIGFuIGFzc2VydGlvbiBsaWtlIAp1Ymlmc19h
c3NlcnQoYywgdWJpZnNfem5fZGlydHkoem5vZGUtPmNwYXJlbnQpKSBpbiAKZ2V0X3pub2Rlc190
b19jb21taXQoKS4gTm90ZSwgcGxlYXNlIGNoZWNrIHRoYXQgJ3pub2RlLT5jcGFyZW50JyBpcyBu
b3QgCk5VTEwgYmVmb3JlIHRoZSBhc3NlcnRpb24uCiAgIGIpICd6bm9kZS0+Y3BhcmVudCcgaXMg
ZGlydHksIGJ1dCBpdCBpcyBub3QgYWRkZWQgaW50byBsaXN0IAonYy0+Y25leHQnLCB3ZSBzaG91
bGQgdHJhdmVyc2UgdGhlIGVudGlyZSBUTkMgaW4gZ2V0X3pub2Rlc190b19jb21taXQoKSAKdG8g
bWFrZSBzdXJlIHRoYXQgYWxsIGRpcnR5IHpub2RlcyBhcmUgY29sbGVjdGVkIGludG8gbGlzdCAn
Yy0+Y25leHQnLCAKc28gYW5vdGhlciBhc3NlcnRpb24gaXMgbmVlZGVkLgoyLiAnem5vZGUtPmNp
aXAnIGlzIGludmFsaWQsIGFuZCB0aGUgdmFsdWUgYmV5b25kcyB0aGUgbWVtb3J5IGFyZWEgb2Yg
Cnpub2RlLT5jcGFyZW50LiBBbGwgem5vZGVzIGFyZSBhbGxvY2F0ZWQgd2l0aCBzaXplIG9mICdj
LT5tYXhfem5vZGVfc3onLCAKd2hpY2ggbWVhbnMgdGhhdCAnem5vZGUtPmNpaXAnIGV4Y2VlZHMg
dGhlICdjLT5mYW50b3V0Jywgc28gd2UgY2FuIGFkZCAKYW4gYXNzZXJ0aW9uIGxpa2UgdWJpZnNf
YXNzZXJ0KGMsIHpub2RlLT5jaWlwIDwgYy0+ZmFudG91dCkgaW4gCmdldF96bm9kZXNfdG9fY29t
bWl0KCkuCgpUaGF0J3Mgd2hhdCBJIGNhbiB0aGluayBvZiwgYXJlIHRoZXJlIGFueSBvdGhlciBw
b3NzaWJpbGl0aWVzPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
