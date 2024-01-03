Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6706C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jan 2024 03:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rb1HzFDrU8WvDsbAewQnVMxqZcqLIMT77ohKeM6gejI=; b=rc/eKT2UtisOxDpk/6sC5PkM8L
	lequaRaBfiMvlyZZNAGg3myLPsYbTOu+3cCgjSdNi8X+6prK2RYsKoGc/P2Ro3y0xZJJTM+3qu6aH
	HG0BvjCXlSCRvayERHusKqsMfzrSzR7cNdCwyVTTAsPesPOaC72n91XMbvZe0ItD5SZ7XMMYP96xh
	VUKqmUeFF510wIP+eUx2bZhLko6vlm1dw45pVh2SnO9xXeZEVtSw0Hws5BVkOJw5RPw+iINZaj/KT
	XJ3zksuUBWQNSQbAbOQBB9iNi1BbxIVFQfAhfMO1l8tXrKXTFgcG233huM1TupxhVY3Ab89hGwU0j
	P5rzs7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKrmb-009fw5-2W;
	Wed, 03 Jan 2024 03:19:05 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKrmV-009fuS-13
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jan 2024 03:19:02 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4T4ZZw3PHnz1FHX7;
	Wed,  3 Jan 2024 11:14:48 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id F3CD1140136;
	Wed,  3 Jan 2024 11:18:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 11:18:46 +0800
Subject: Re: [PATCH RFC 00/17] ubifs: Add filesystem repair support
To: Richard Weinberger <richard@nod.at>
CC: david oberhollenzer <david.oberhollenzer@sigma-star.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Tudor
 Ambarus <Tudor.Ambarus@linaro.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com>
 <1145531757.175508.1703844362355.JavaMail.zimbra@nod.at>
 <13b259ca-b32f-a8d6-5e11-8bb38df72f5c@huawei.com>
 <642239519.177270.1703884138999.JavaMail.zimbra@nod.at>
 <a145fc68-9b0a-9794-48d2-b7ad79116833@huawei.com>
 <535616666.192239.1704228332389.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <460eb02e-8937-282c-62c5-6ea606324b0e@huawei.com>
Date: Wed, 3 Jan 2024 11:18:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <535616666.192239.1704228332389.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_191900_218864_EE7360D1 
X-CRM114-Status: GOOD (  28.59  )
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

5ZyoIDIwMjQvMS8zIDQ6NDUsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhh
bzFAaHVhd2VpLmNvbT4KPj4gSSBjb21lIHVwIHdpdGggYW5vdGhlciB3YXkgdG8gaW1wbGVtZW50
IGZzY2sudWJpZnM6Cj4+Cj4+IFRoZXJlIGFyZSB0aHJlZSBtb2RlczoKPj4KPj4gMS4gY29tbW9u
IG1vZGUobm8gb3B0aW9ucyk6IEFzayB1c2VyIHdoZXRoZXIgdG8gZml4IGFzIGxvbmcgYXMgYSBw
cm9ibGVtCj4+IGlzIGRldGVjdGVkLgo+IAo+IE1ha2VzIHNlbnNlLgo+IAo+PiAyLiBzYWZlIG1v
ZGUoLWEgb3B0aW9uKTogQXV0byByZXBhaXIgYXMgbG9uZyBhcyBubyBkYXRhL2ZpbGVzIGxvc3Qo
ZWcuCj4+IG5saW5rLCBpc2l6ZSwgeGF0dHJfY250LCB3aGljaCBjYW4gYmUgY29ycmVjdGVkIHdp
dGhvdXQgZHJvcHBpbmcgbm9kZXMpLAo+PiBvdGhlcndpc2UgcmV0dXJucyBlcnJvciBjb2RlLgo+
IAo+IE1ha2VzIHNlbnNlLgo+ICAgCj4+IDMuIGRhbmdlcm91cyBtb2RlKC15IG9wdGlvbik6IEZp
eCBpcyBhbHdheXMgc3VjY2Vzc2Z1bCwgdW5sZXNzCj4+IHN1cGVyYmxvY2sgaXMgY29ycnVwdGVk
LiBUaGVyZSBhcmUgMiBzaXR1YXRpb25zOgo+IAo+IFBsZWFzZSBub3QgdXNlICIteSIuIFVzdWFs
bHkgIi15IiBzdGFuZHMgZm9yICJhbnN3ZXIgeWVzIHRvIGFsbCBxdWVzdGlvbnMiLgo+IEJ1dCBz
ZWxlY3RpbmcgbmFtZXMgZm9yIGNvbW1hbmQgbGluZSBmbGFncyBpcyBjdXJyZW50bHkgbXkgbGVh
c3QgY29uY2Vybi4KPiAgIAo+PiAgICBhKSBUTkMgaXMgdmFsaWQ6IGZzY2sgd2lsbCBwcmludCB3
aGljaCBmaWxlIGlzIGRyb3BwZWQgYW5kIHdoaWNoCj4+IGZpbGUncyBkYXRhIGlzIGRyb3BwZWQK
PiAKPiBTb3VuZHMgYWxzbyBnb29kLgo+ICAgCj4+ICAgIGIpIFROQyBpcyBpbnZhbGlkOiBmc2Nr
IHdpbGwgc2NhbiBhbGwgbm9kZXMgd2l0aG91dCByZWZlcmVuY2luZyBUTkMsCj4+IHNhbWUgYXMg
dGhpcyBwYXRjaHNldCBkb2VzCj4gCj4gSSdkIG1ha2UgdGhpcyBhIGRpc3RpbmN0IG1vZGUuCj4g
SXQgY2FuIGJlIHVzZWQgdG8gcmVidWlsZCBpbmRleCBhbmQgTEVCIHByb3BlcnR5IHRyZWVzLgo+
IFRoaXMgaXMgYmFzaWNhbGx5IGEgImRyb3AgdHJlZXMgYW5kIHJlYnVpbGQiIG1vZGUuCj4gCgpP
SywgdGhlbiBmc2NrIHdpbGwgaGF2ZSBmb3VyIG1vZGVzLgoKPj4KPj4gUTE6IEhvdyBkbyB5b3Ug
dGhpbmsgb2YgdGhpcyBtZXRob2Q/Cj4gCj4gU291bmRzIGdvb2Qgc28gZmFyLgo+ICAgCj4+IFEy
OiBNb2RlIDEsIDIgYW5kIDMoYSkgZGVwZW5kIG9uIGpvdXJuYWwgcmVwbGF5aW5nLCBJIGZvdW5k
Cj4+IHhmc19yZXBhaXJbMV0gc2hvdWxkIGJlIHVzZWQgYWZ0ZXIgbW91bnRpbmcvdW5tb3VudGlu
ZyB4ZnMgKExldCBrZXJuZWwKPj4gcmVwbGF5IGpvdXJuYWwpLCBpZiBVQklGUyBkb2VzIHNvLCB0
aGVyZSBpcyBubyBuZWVkIHRvIGNvcHkgcmVjb3ZlcnkKPj4gc3Vic3lzdGVtIGludG8gdXNlcnNw
YWNlLCBidXQgdXNlciBoYXMgdG8gbW91bnQvdW5tb3VudCBiZWZvcmUgZG9pbmcKPj4gZnNjay4g
SSBmb3VuZCBlMmZzY2sgaGFzIGNvcGllZCByZWNvdmVyeSBjb2RlIGludG8gdXNlcnNwYWNlLCBz
byBpdCBjYW4KPj4gZG8gZnNjayB3aXRob3V0IG1vdW50aW5nL3VubW91bnRpbmcuIElmIFVCSUZT
IGRvZXMgc28sIGpvdXJuYWwgcmVwbGF5aW5nCj4+IHdpbGwgdXBkYXRlIFROQyBhbmQgTFBULCBw
bGVhc2UgcmVmZXJlbmNlIFEzKDEpLiBXaGljaCBtZXRob2QgZG8geW91Cj4+IHN1Z2dlc3Q/Cj4g
Cj4gVUJJRlMgaXMgYSBsaXR0bGUgc3BlY2lhbCByZWdhcmRpbmcgdGhlIGpvdXJuYWwuCj4gCj4g
MS4gVGhlIGpvdXJuYWwgaXMgbm90IGFuIGFkZC1vbiBsaWtlIGl0IGlzIG9uIG1hbnkgb3RoZXIg
ZmlsZSBzeXN0ZW1zLAo+IHlvdSBoYXZlIHRvIHJlcGxheSBpdCB0byBnZXQgYSBjb25zaXN0ZW50
IGZpbGUgc3lzdGVtLgo+IDIuIEpvdXJuYWwgcmVwbGF5IGlzIGFsc28gbmVlZGVkIGFmdGVyIGEg
Y2xlYW4gdW1vdW50LiBUaGUgcmVhc29uIGlzIHRoYXQKPiBVQklGUyBkb2VzIG5vIGNvbW1pdCBh
dCB1bW91bnQgdGltZS4KCkkgYWdyZWUsIHRoZXJlIGV4aXN0cyBvbmUgc2l0dWF0aW9uIHRoYXQg
VUJJRlMgcmVwbGF5cyBqb3VybmFsIGV2ZW4gCmFmdGVyIGNsZWFuIHVtb3VudC4KICAgICBQMSAg
ICAgIHViaWZzX2JndCAgICAgIHVtb3VudAogICBta2RpcgogICAgICAgICAgcnVuX2JnX2NvbW1p
dAogICAgICAgICAgIGMtPmNtdF9zdGF0ZSA9IENPTU1JVF9SVU5OSU5HX0JBQ0tHUk9VTkQKICAg
ICAgICAgICBkb19jb21taXQKICAgICAgICAgICAgdWJpZnNfbG9nX3N0YXJ0X2NvbW1pdChjLCAm
bmV3X2x0YWlsX2xudW0pIC8vIGxvZyBzdGFydAogICAgICAgICAgICB1cF93cml0ZSgmYy0+Y29t
bWl0X3NlbSkKICAgdG91Y2gKICAgIHViaWZzX2pubF91cGRhdGUgLy8gbmV3IGJ1ZHMgYWRkZWQK
ICAgICAgICAgICAgICAgICAgICAgICAgICBjbGVhbnVwX21udAogICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZWFjdGl2YXRlX3N1cGVyCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcy0+
a2lsbF9zYgogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdlbmVyaWNfc2h1dGRvd25fc3Vw
ZXIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3luY19maWxlc3lzdGVtCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1Ymlmc19zeW5jX2ZzCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWJpZnNfcnVuX2NvbW1pdAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB3YWl0X2Zvcl9jb21taXQgLy8gd2FpdCBiZyBjb21taXQsIAondG91Y2gnIHdvbid0IGJl
IGNvbW1pdGVkLCBpdCB3aWxsIGJlIHJlcGxheWVkIGluIG5leHQgbW91bnQKCj4gCj4gU28gSU1I
TyB5b3UgbmVlZCB0byBoYXZlIGpvdXJuYWwgcmVwbGF5IGNvZGUgaW4geW91ciB0b29sIGluIGFu
eSBjYXNlLgo+IFlvdSBjYW4gY29weSBpdCBmcm9tIHRoZSBrZXJuZWwgaW1wbGVtZW50YXRpb24g
YW5kIGFkZCBtb3JlIGNoZWNrcy4KPiBXaGlsZSB0aGUga2VybmVsIGNvZGUgYWxzbyB0cmllcyB0
byBiZSBmYXN0LCBmc2NrIHNob3VsZCBiZSBtb3JlIHBhcmFub2lkLgo+IElkZWFsbHkgdGhlIG91
dGNvbWUgaXMgYSBsaWJ1YmlmcyBvciBzdWNoIHdoaWNoIGNhbiBiZSBkZXJpdmVkIGZyb20gdGhl
Cj4ga2VybmVsIHNvdXJjZSB3aGlsZSBidWlsZGluZyBtdGQtdXRpbHMuCgpBbGwgcmlnaHQsIHNv
dW5kcyBsaWtlIGEgaHVnZSBjb3B5IHdvcmsuCgo+IAo+PiBRMzogSWYgZnNjayBkcm9wcyBvciB1
cGRhdGVzIGEgbm9kZShlZy4gZGVudHJ5IGxvc3QgaW5vZGUsIGNvcnJlY3RlZAo+PiBpbm9kZSkg
aW4gbW9kZSAxLDIgYW5kIDMoYSksIFROQy9MUFQgc2hvdWxkIGJlIHVwZGF0ZWQuIFRoZXJlIGFy
ZSB0d28KPj4gd2F5cyB1cGRhdGluZyBUTkMgYW5kIExQVDoKPj4KPj4gICAgMSkgTGlrZSBrZXJu
ZWwgZG9lcywgd2hpY2ggbWVhbnMgdGhhdCBtYXJrIGRpcnR5IFROQy9MUFQgZm9yCj4+IGNvcnJl
c3BvbmRpbmcgYnJhbmNoZXMgYW5kIGRvX2NvbW1pdCgpLiBJdCB3aWxsIGNvcHkgbXVjaCBjb2Rl
IGludG8KPj4gdXNlcnNwYWNlLCBlZy4gdG5jLmMsIGxwdC5jLCB0bmNfY29tbWl0LmMsCj4+IGxw
dF9jb21taXQuYy4gSSBmZWFyIHRoZXJlIGV4aXN0cyByaXNrcy4gRm9yIGV4YW1wbGUsIHRoZXJl
IGlzIG5vIHNwYWNlCj4+IGxlZnQgZm9yIG5ldyBpbmRleCBub2RlcywgZ2Mgc2hvdWxkIGJlIHBl
cmZvcm1lZD8gSWYgc28sIGdjL2xwdCBnYyBjb2RlCj4+IHNob3VsZCBiZSBjb3BpZWQgdG9vLgo+
Pgo+PiAgICAyKSBSZWJ1aWxkIG5ldyBUTkMvTFBUIGJhc2VkIG9uIHZhbGlkIG5vZGVzLiBUaGlz
IHdheSBpcyBzaW1wbGUsIGJ1dAo+PiBvbGQgZ29vZCBUTkMgY291bGQgYmUgY29ycnVwdGVkLCBp
dCBtZWFucyB0aGF0IHBvd2VyY3V0IGR1cmluZyBmc2NrIG1heQo+PiBsZXQgVUJJRlMgaW1hZ2Ug
bXVzdCBiZSByZXBhaXJlZCBpbiBtb2RlIDMoYikgYnV0IGl0IGNvdWxkIGJlIHJlcGFpcmVkCj4+
IGluIG1vZGUgMlwzKGEpIGJlZm9yZSBpbnZva2luZyBmc2NrLgo+Pgo+PiBXaGljaCB3YXkgaXMg
YmV0dGVyPwo+IAo+IFNpbmNlIHlvdSBuZWVkIHRvIGRvIGEgZnVsbCBqb3VybmFsIHJlcGxheSBh
bnl3YXkgYW5kIHBvd2VyLWN1dCBhd2FyZW5lc3MKPiBpcyBvbmUgb2YgeW91ciByZXF1aXJlbWVu
dHMsIEkgZmVhciB0aGUgb25seSBvcHRpb24gaXMgMSkuID4KPiBUaGFua3MsCj4gLy9yaWNoYXJk
Cj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
