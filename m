Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B08C7618D
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 03:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqT171gwNcrzh9uN46pIlDhEXAEdoH2yJXzxd3XYkGA=; b=YNZC8S3wQPFV21
	8vn48MYhYpURFpGPLY/cUt1VSRun1UbskZlXWDZAK2e9/GvGNH73j+bN1UrJ0VxC1R+WiihahLmdB
	DqBXhs3MIJa0DJzYOOUJveEoNDVBLCOA+zVNRipPwy6ILA92CId66I2DKftt3aKcsx+IrsrGr2JgJ
	BHc2pPBMq98gSlk0j4xz/b2RULbPYFXNdteUq12cI+zeHZDz+bHVlyvuD3ij0EbzjgI9GPqikOxlf
	m8owb4pM+u1FmEKDsQl66oKhgVqvzy7yJcOqM30RKIenJIY5nHT/Z+pZQgr8kmNlu3S8KbnXYfQoJ
	w95VxbMztzMyEYeCetPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGIx-006DrZ-1h;
	Thu, 06 Apr 2023 03:28:55 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGIt-006Dpu-2l
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 03:28:54 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PsRky3LfTzrZ8c;
	Thu,  6 Apr 2023 11:27:22 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm100009.china.huawei.com (7.185.36.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 6 Apr 2023 11:07:24 +0800
Message-ID: <839c7aad-7357-20fd-6029-4785ade035b9@huawei.com>
Date: Thu, 6 Apr 2023 11:07:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Two bug fix commit fixes in the ubi_resize_volume() were fixed by
 a patch in the mailing list
To: Guo Xuenan <guoxuenan@huaweicloud.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
	<richard@nod.at>, chengzhihao1 <chengzhihao1@huawei.com>
References: <20230403020402.2261218-1-wangzhaolong1@huawei.com>
 <f55c0db7-ef93-86ae-c4f9-476515358787@huawei.com>
 <2092125501.19940.1680727689243.JavaMail.zimbra@nod.at>
 <ff46732f-b16e-f376-62f6-cf184cc6d366@huaweicloud.com>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <ff46732f-b16e-f376-62f6-cf184cc6d366@huaweicloud.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_202852_079190_9856600A 
X-CRM114-Status: GOOD (  13.75  )
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

T0ssIEknbGwgdHJ5IHRvIHNlbmQgYSBzZXJpZXMgbGF0ZXIgdG8gZml4IHRoZXNlIHByb2JsZW1z
IGluIHRoZSAKdWJpX3Jlc2l6ZV92b2x1bWUoKS4KClRoYW5rcyBmb3IgZXZlcnlvbmUuCgpaaGFv
TG9uZyBXYW5nCgrlnKggMjAyMy80LzYgOToyMCwgR3VvIFh1ZW5hbiDlhpnpgZM6Cj4gSGkgUmlj
aGFyZO+8jAo+Cj4gT24gMjAyMy80LzYgNDo0OCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+
PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+PiBWb246ICJjaGVuZ3poaWhhbzEi
IDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPj4+PiDCoMKgwqDCoMKgIEknZCBsaWtlIHRvIGtu
b3cgd2h5IHBhdGNoWzFdIGRpZG4ndCBnZXQgaW50byB0aGUgbWFpbmxpbmUuCj4+Pj4KPj4+PiBb
MV0gCj4+Pj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL3Bh
dGNoLzIwMjIwMTI0MDI0MDU2LjE5OTY3NjMtMS1ndW94dWVuYW5AaHVhd2VpLmNvbS8KPj4gU29y
cnksIGl0IGZlbGwgdGhyb3VnaCB0aGUgY3JhY2tzLgo+Pgo+Pj4gSSBmaW5kIHRoZXJlIHdlcmUg
dGhyZWUgcHJvYmxlbXMgaW4gdWJpX3Jlc2l6ZV92b2x1bWUoKToKPj4+Cj4+PiAxLiBNZW1sZWFr
wqAgLSBmaXhlZCBieSAxZTU5MWVhMDcyZGYgKCJ1Ymk6IEZpeCB1bnJlZmVyZW5jZWQgb2JqZWN0
Cj4+PiByZXBvcnRlZCBieSBrbWVtbGVhayBpbiB1YmlfcmVzaXplX3ZvbHVtZSgpIikKPj4gQWdy
ZWVkLgo+Pgo+Pj4gMi4gVUFGIGluIGVycm9yIGhhbmRsaW5nIHBhdGjCoCAtIGZpeGVkIGJ5IDlh
ZjMxZDZlYzFhNCAoInViaTogRml4Cj4+PiB1c2UtYWZ0ZXItZnJlZSB3aGVuIHZvbHVtZSByZXNp
emluZyBmYWlsZWQiKQo+PiBBZ3JlZWQuCj4+Cj4+PiAzLiBVQUYgaW4gY29uY3VycmVudCBzaHJp
bmcgdm9sdW1lIGFuZCB3cml0aW5nCj4+PiBmYXN0bWFwKHZvbC0+cmVzZXJ2ZWRfcGVicyBpdGVy
YXRpb24pwqAgLSBmaXhlZCBieSBbMV0KPj4+IDQuIFBvdGVudGlvbmFsIGRhdGEgbG9zdCBpbiBm
YWlsZWQgc2hyaW5raW5nKGZhaWxlZCBhZnRlciB1bm1hcHBpbmcKPj4+IGxlYnMpwqAgLSBtZW50
aW9uZWQgaW4gWzFdLCB3aGljaCBpcyBub3QgYSBiaWcgcHJvYmxlbSwgd2UgY2FuIGFkZCBzb21l
Cj4+PiBjb21tZW50cyB0byBleHBsYWluIGl0Lgo+Pj4gNS4gVG9vIG1hbnkgbGVicyB1c2VkIGlm
IGV4cGFuZGluZyB2b2x1bWUgZmFpbGVkIGFmdGVyIFsxXSBhcHBsaWVkOgo+Pj4gSWYgd2UgdXBk
YXRlIHZvbC0+cmVzZXJ2ZWRfcGVicyB0b2dldGhlciB3aXRoIHZvbC0+ZWJhX3RibCwgdGhlbiBv
dGhlcgo+Pj4gd3JpdGluZyBwcm9jZXNzIGNvdWxkIHRha2UgbG51bSBiaWdnZXIgdGhhbiBvbGQg
dm9sLT5yZXNlcnZlZF9wZWJzLgo+Pj4gVGhlcmUgd2lsbCBiZSB6b21iaWUgbG9naWNhbCBwZWJz
KGxudW0gZ3JlYXRlciB0aGFuIHZvbC0+cmVzZXJ2ZWRfcGVicywKPj4+IGNvdWxkIG5vdCBiZSBh
Y2Nlc3NlZCBvciByZWNsYWltZWQpIGlmIHJlc2l6aW5nIGZhaWxlZC4KPj4+IE1heWJlIHdlIHNo
b3VsZCBmaXggdGhhdCBieSBob2xkaW5nICdsZWJfd3JpdGVfbG9jaycgd2hpbGUgZXhwYW5kaW5n
IAo+Pj4gdm9sdW1lPwo+Pj4gNi4gSW4gZXJyb3IgaGFuZGxpbmcgcGF0aCAnb3V0X2FjYycsIFVC
SSBzaG91bGQgcmVjb3ZlciAKPj4+ICd1YmktPnJzdmRfcGVicycKPj4+IGFuZCAndWJpLT5hdmFp
bF9wZWJzJyBpbiAncGVicyA+IDAnIGNhc2UsIG90aGVyd2lzZSBVQkkgd2lsbCBkaXNwbGF5Cj4+
PiB3cm9uZyBhdmFpbGFibGUgcGViIGNvdW50Lgo+Pj4KPj4+IFJpY2hhcmQsIEhvdyBkbyB5b3Ug
dGhpbms/Cj4+IEkgYWdyZWUsIHdlIHNob3VsZCBhcHBseSB0aGlzIHBhdGNoLiBHdW8gWHVlbmFu
LCBjYW4geW91IHBsZWFzZSAKPj4gcmViYXNlIHlvdXIgcGF0Y2gKPj4gb24gdGhlIGxhdGVzdCBr
ZXJuZWwgYW5kIHJlc2VuZD8KPj4gdm10LmMgc2F3IHNvbWUgY2hhbmdlcyBhbmQgdGhlIHBhdGNo
IGRvZXMgbm90IGxvbmdlciBhcHBseS4KPiBPS++8jEkgd2lsbCBhc2sgbXkgY29sbGVhZ3VlcyBa
aGFvbG9uZyBXYW5nIHRvIGhlbHAgbWUgcmViYXNlIGFuZCByZXNlbmQgCj4gaXQgYXMgc29vbiBh
cwo+IHBvc3NpYmxl77yMaGUgaXMgY3VycmVudGx5IG1vcmUgZm9jdXNlZCBvbiB1YmlmcyA6KQo+
Cj4gVGhhbmtzCj4gWHVlbmFuCj4+IFRoYW5rcywKPj4gLy9yaWNoYXJkCj4+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
