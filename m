Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37564C46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 02:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiyUP1gX8dpY3kzo3k2DhfSwpfc7TR75EMKIqoS6JrE=; b=iyftPeBt958Rn+I8P86m+Y0t85
	ML9mie2r44qrMW0cuwmOvPbuJP765KpV5eRQECE2Txx1KFHIKr9rsYOsqWniZuo1ZUMD8tHnLur3D
	DFTyo/aiT+0PI+5Tuum5LW/Qu0WUzKOSAYca51lyRqIlaCmAGbS7BmCJTcDhp4kKY2pU3k+l7zdf/
	IcPGqBjCJ790l0XjITanDtTM7Xm+8y1D94ktj4EKXnrJBKGbfqYWLQVuOqcbYD/WlObfj1PHHQXs+
	qHu9hn3KEX2zFsPAWQ92Jj25HliOCi3GKrUiehtiQ+U2XTm8eGfr9H7wHQpo0U1HgSNxmRp0u9ifB
	+5q032MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSp7r-005sSK-2A;
	Thu, 25 Jan 2024 02:05:55 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSp7m-005sQN-1R
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 02:05:54 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TL3w05tqmz1FJn7;
	Thu, 25 Jan 2024 10:01:20 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F9AA1A016F;
	Thu, 25 Jan 2024 10:05:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 10:05:27 +0800
Subject: Re: [PATCH 00/15] ubifs folio conversion
To: Matthew Wilcox <willy@infradead.org>, Richard Weinberger <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <1132174888.268752.1705995229529.JavaMail.zimbra@nod.at>
 <ZbCZl056dM_YF0P0@casper.infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c0c498fd-5b45-1e99-7539-39ea0f56e1f2@huawei.com>
Date: Thu, 25 Jan 2024 10:05:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ZbCZl056dM_YF0P0@casper.infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_180550_665260_B69D76F3 
X-CRM114-Status: GOOD (  17.93  )
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

1NogMjAyNC8xLzI0IDEzOjAxLCBNYXR0aGV3IFdpbGNveCDQtLXAOgo+IE9uIFR1ZSwgSmFuIDIz
LCAyMDI0IGF0IDA4OjMzOjQ5QU0gKzAxMDAsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPj4g
TWF0dGhldywKPj4KPj4gLS0tLS0gVXJzcHKouW5nbGljaGUgTWFpbCAtLS0tLQo+Pj4gVm9uOiAi
TWF0dGhldyBXaWxjb3giIDx3aWxseUBpbmZyYWRlYWQub3JnPgo+Pj4gQW46ICJyaWNoYXJkIiA8
cmljaGFyZEBub2QuYXQ+Cj4+PiBDQzogIk1hdHRoZXcgV2lsY294IiA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPj4+IEdl
c2VuZGV0OiBTb25udGFnLCAyMS4gSmFudWFyIDIwMjQgMDA6MDg6MDgKPj4+IEJldHJlZmY6IFtQ
QVRDSCAwMC8xNV0gdWJpZnMgZm9saW8gY29udmVyc2lvbgo+Pgo+Pj4gVGhpcyBwYXRjaHNldCBj
b252ZXJ0cyB1YmlmcyB0byB1c2UgZm9saW9zIHRocm91Z2hvdXQuICBJIG1hZGUgc29tZQo+Pj4g
YXR0ZW1wdCB0byBzdXBwb3J0IGxhcmdlIGZvbGlvcywgYnV0IG1vcmUgd29yayBkZWZpbml0ZWx5
IG5lZWRzIHRvIGJlCj4+PiBkb25lIGJlZm9yZSBpdCBjYW4gYmUgZW5hYmxlZC4gIEl0J3Mgbm90
IGNsZWFyIHRvIG1lIHdoZXRoZXIgaXQncyB3b3J0aAo+Pj4gZG9pbmcsIHNvIEkndmUgbGVmdCB0
aGF0IGZvciB5b3UgOy0pCj4+Cj4+IHdoYXQgaXMgdGhlIGJlbmVmaXQgb2YgbGFyZ2UgZm9saW9z
Pwo+IAo+IEZvciBhbm90aGVyIHB1cnBvc2UsIEkganVzdCB3cm90ZSB0aGlzIHVwLiAgUG9zc2li
bHkgdGhlcmUgYXJlIG1vcmUKPiBiZW5lZml0cywgYnV0IHRoZXNlIGFyZSB0aGUgb25lcyBJIHJl
bWVtYmVyZWQganVzdCBub3c6Cj4gCj4gQnV0IHdoeSBzaG91bGQgYSBmaWxlc3lzdGVtIHB1dCBp
biB0aGUgZWZmb3J0IHRvIHN1cHBvcnQgbGFyZ2UgZm9saW9zCj4gKGFrYSBtdWx0aS1wYWdlIGZv
bGlvcyk/Cj4gCj4gICAgICBMb3dlciBvdmVyaGVhZHMKPiAgICAgICAgICBGZXdlciBjYWxscyB0
byB0aGUgcGFnZSBhbGxvY2F0b3IKPiAgICAgICAgICBTaG9ydGVyIExSVSBsaXN0IGhlbHBzIHZt
c2NhbiBhZ2UgbWVtb3J5Cj4gICAgICAgICAgRmV3ZXIgY2FsbHMgdG8gdGhlIHBhZ2UgY2FjaGUg
Zm9yIGxhcmdlIHJlYWQoKS93cml0ZSgpCj4gICAgICAgICAgRmV3ZXIgY2FsbHMgdG8gdGhlIGFy
Y2hpdGVjdHVyZSBjb2RlIGZvciBoYW5kbGluZyBmYXVsdHMgaW4gbW1hcGVkIGZpbGVzCj4gICAg
ICAgICAgUG90ZW50aWFsIHVzZSBvZiBsYXJnZXIgVExCIGVudHJpZXMgKGVnIGNvbnRQVEUgLyBO
QVBPVCkKPiAgICAgIEJlaW5nIGEgYmV0dGVyIGtlcm5lbCBjaXRpemVuCj4gICAgICAgICAgVGhl
IG1vcmUgY29kZSB1c2luZyBsYXJnZSBmb2xpb3MsIHRoZSBlYXNpZXIgaXQgaXMgdG8gYWxsb2Nh
dGUgbGFyZ2UgZm9saW9zCj4gCj4gVGhlIGNvc3RzIG1heSBvdXR3ZWlnaCB0aGUgYmVuZWZpdHMu
IEkgd291bGQgbm90IGludmVzdCB0aW1lIGluIG1ha2luZwo+IGlzbzk2NjAsIGFkZnMgb3IgZWZz
IHN1cHBvcnQgbGFyZ2UgZm9saW9zLiBCdXQgZm9yIGZpbGVzeXN0ZW1zIHdoaWNoCj4gYXJlIHVz
ZWQgZXZlcnkgZGF5IChYRlMsIE5GUywgZXh0NCwgYnRyZnMsIC4uLikgdGhlIGJlbmVmaXQgaXMg
dmVyeSBtdWNoCj4gd29ydGggdGhlIGNvc3QuCgpFeHQ0IGNvdWxkIGdhaW4gYSBnb29kIHBlcmZv
cm1hbmNlIGJhc2VkIG9uIGxhcmdlIGZvbGlvWzFdLCBvbmUgCmltcG9ydGFudCByZWFzb24gaXMg
dGhhdCBibG9ja3MgYWxsb2NhdGlvbiBtZXRob2QgaXMgY2hhbmdlZCBhcyBiYXRjaCAKYWxsb2Nh
dGlvbiBmcm9tIG9uZSBieSBvbmUuIFRoZXJlIGlzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIFVCSUZT
IGFuZCBleHQ0IApvbiBJTyBsb2dpYywgc28gSSdtIG5vdCBzdXJlIGhvdyBtdWNoIHBlcmZvcm1h
bmNlIHRoZSBsYXJnZSBmb2xpbyB3aWxsIApicmluZyB0byBVQklGUy4gSSB0aGluayBwYWdlIHdp
bGwgYmUgcmVwbGFjZWQgYnkgZm9saW8gc29tZSBkYXksIHNvIAp0aGVzZSBwYXRjaGVzIGNhbiBi
ZSBhIGZvbGlvIHN3aXRjaGluZyBhbmQgYSBwcmVwYXJhdGlvbiBmb3IgbGFyZ2UgZm9saW8gCnN1
cHBvcnQgb24gVUJJRlMsIHBlcnNvbmFsbHkgSSB0aGluay4KClsxXSBodHRwczovL2x3bi5uZXQv
QXJ0aWNsZXMvOTU2NTc1LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
