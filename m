Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7DFC61DE4
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 01:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p037iYpTWAF/t6LCAIS9AAOHegaqeN+YC7YD8mqUhFc=; b=eF8HEgXwLilY1iszUL3xwdjJOk
	8WZrDuuspvmrKEXI1Jxa2ZiiNN/vKbyRgLZDSRejusCeOBE9IqjvB9sYouWRH0t03p2uB+13l22cT
	+qdGIXiuG5URJ+udHY1/ISgzSMDe12R2g+3UJkBHtKeOjfMLhGMBUZFN8mPWtUiGcOi5eqiNI8RzW
	mmBlM00dbBslt8f5Y/aWnGAU5XXgOsz7Mp4mdxBVMYj0Z8h/zPKF8vtJV2U0ZDwY5DLEdXlFXGrNl
	L2Fca6FqTKwbNN3Lp/pMu/OvgRyclW6g7seMz8YnkexHakps7RMBR8cFMToMRC4GJ7xlliXKtbjeu
	thfMM2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rAY-00000008KEu-1DRz;
	Mon, 31 Aug 2026 01:50:42 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rAT-00000008KDy-1aNH
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 01:50:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tWXuCM94czECBPLKT+AV2SP5ymKH3EWJnoTNqN8pi6Y=;
	b=Tkn8G5fG4uwdd2raAKhYYYvOEPO8UWognEsnJgtZ40PRQkiICsglt/cLhTSwbKA4jn3DgIOgH
	JkZjvfO1hspP0mW96ftX+a2R3tZO+Pt2a+FU8ZulPH0AlNmRnKCXuBpByN2gLOXu2fz4hRzCAN4
	PTgGEl65SxUxVAUhRI8khek=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hYBVJ098mz1T4Jg;
	Mon, 31 Aug 2026 09:39:04 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 448B140579;
	Mon, 31 Aug 2026 09:50:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 31 Aug 2026 09:50:21 +0800
Subject: Re: [PATCH] ubifs-utils: Don't compile engine support if not
 available
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	<linux-mtd@lists.infradead.org>
CC: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
References: <20260829173245.5-tFbtxE@breakpoint.cc>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <481dc2f7-ba6f-743a-b841-a3bdb8807ff6@huawei.com>
Date: Mon, 31 Aug 2026 09:50:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260829173245.5-tFbtxE@breakpoint.cc>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_185037_898068_AE71E617 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi84LzMwIDE6MzIsIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3Ig0LS1wDoKPiBPcGVu
U1NMIDQuMCBkcm9wcGVkIGVuZ2luZSBzdXBwb3J0IHdoaWNoIHdhcyBkZXByZWNhdGVkIHNpbmNl
IDMuMC4gVGhlCj4gcmVwbGFjZW1lbnQgaXMgdGhlICJwcm92aWRlcnMiIEFQSS4KPiAKPiBBZGQg
YW4gaWZuZGVmIE9QRU5TU0xfTk9fRU5HSU5FIGFyb3VuZCB0aGUgZW5naW5lIGNvZGUgc28gaXQg
Y2FuIGJlIGxlZnQKPiBvdXQgd2hlcmUgaXQgaXMgbm90IHN1cHBvcnRlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxzZWJhc3RpYW5AYnJlYWtwb2ludC5j
Yz4KPiAtLS0KPiAgIHViaWZzLXV0aWxzL2NvbW1vbi9zaWduLmMgfCAxMCArKysrKysrKystCj4g
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3ViaWZzLXV0aWxzL2NvbW1vbi9zaWduLmMgYi91Ymlmcy11dGlscy9jb21tb24v
c2lnbi5jCj4gaW5kZXggMDMyYTZhY2MwNDVkLi41Zjk0YzBhZDE3NmYgMTAwNjQ0Cj4gLS0tIGEv
dWJpZnMtdXRpbHMvY29tbW9uL3NpZ24uYwo+ICsrKyBiL3ViaWZzLXV0aWxzL2NvbW1vbi9zaWdu
LmMKPiBAQCAtMjMsMTEgKzIzLDE0IEBACj4gICAjaW5jbHVkZSA8b3BlbnNzbC9iaW8uaD4KPiAg
ICNpbmNsdWRlIDxvcGVuc3NsL3BlbS5oPgo+ICAgI2luY2x1ZGUgPG9wZW5zc2wvZXJyLmg+Cj4g
LSNpbmNsdWRlIDxvcGVuc3NsL2VuZ2luZS5oPgo+ICAgI2luY2x1ZGUgPG9wZW5zc2wvY21zLmg+
Cj4gICAjaW5jbHVkZSA8b3BlbnNzbC9jb25mLmg+Cj4gICAjaW5jbHVkZSA8ZXJyLmg+Cj4gICAK
PiArI2lmbmRlZiBPUEVOU1NMX05PX0VOR0lORQo+ICsjaW5jbHVkZSA8b3BlbnNzbC9lbmdpbmUu
aD4KPiArI2VuZGlmCj4gKwo+ICAgI2luY2x1ZGUgImxpbnV4X3R5cGVzLmgiCj4gICAjaW5jbHVk
ZSAic2lnbi5oIgo+ICAgI2luY2x1ZGUgInViaWZzLmgiCj4gQEAgLTEzOSw2ICsxNDIsNyBAQCBz
dGF0aWMgRVZQX1BLRVkgKnJlYWRfcHJpdmF0ZV9rZXkoY29uc3QgY2hhciAqcHJpdmF0ZV9rZXlf
bmFtZSwgWDUwOSAqKmNlcnQpCj4gICAJKmNlcnQgPSBOVUxMOwo+ICAgCj4gICAJaWYgKCFzdHJu
Y21wKHByaXZhdGVfa2V5X25hbWUsICJwa2NzMTE6IiwgNykpIHsKPiArI2lmbmRlZiBPUEVOU1NM
X05PX0VOR0lORQo+ICAgCQlFTkdJTkUgKmU7Cj4gICAJCXN0cnVjdCB7Cj4gICAJCQljb25zdCBj
aGFyICp1cmw7Cj4gQEAgLTE3Nyw2ICsxODEsMTAgQEAgc3RhdGljIEVWUF9QS0VZICpyZWFkX3By
aXZhdGVfa2V5KGNvbnN0IGNoYXIgKnByaXZhdGVfa2V5X25hbWUsIFg1MDkgKipjZXJ0KQo+ICAg
CQl9Cj4gICAJCSpjZXJ0ID0gcGFybXMuY2VydDsKPiAgIAkJZnByaW50ZihzdGRlcnIsICJVc2lu
ZyBjZXJ0ICVwXG4iLCAqY2VydCk7Cj4gKyNlbHNlCj4gKwkJc3NsX2Vycl9tc2coIlBLQ1MjMTEg
RU5HSU5FIHN1cHBvcnQgbm90IGF2YWlsYWJsZS4iKTsKPiArCQlyZXR1cm4gTlVMTDsKSGkgU2Vi
YXN0aWFuLApUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQuIEkgYW0gd29uZGVyaW5nIHdoZXRoZXIg
aXQgd291bGQgYmUgYmV0dGVyIHRvIAppbXBsZW1lbnQgUEtDUzExIGVuY3J5cHRpb24gaW4gI2Vs
c2UgYnJhbmNoIGJ5IHRoZSBPcGVuU1NMIDQuMCBBUEkgcHJvdmlkZXIuCj4gKyNlbmRpZgo+ICAg
CX0gZWxzZSB7Cj4gICAJCUJJTyAqYjsKPiAgIAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
