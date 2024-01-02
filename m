Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCFCC47073
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k68UNz3qC6hfunSTAe3AEcpD/B2UezRvlnaPvHf2FdY=; b=4mFq+kwAbrRwzN8KT9zGZlG+GO
	1vqqIuBKXaF5XRPa2qdpf9+8FOzvLfKjnv4yDyJUtIjGCzknEEDyoyJIjdmuWlHvr5cIWE4n+KAlv
	+uQjs5QWlxctKzuf/K4GCftcvlJfrkf7XkoiFP3HdKiDY0f5yKEbwQnkcPERVxIIt0zKy8Zprby4c
	Lb64B5oUZNOv9Hjkk3G6SV6QXLDxokz30Gefx0RVmRs1dW8d7xDc5590FQO8mSxm/wdgiB7v3MYZw
	FaB8o7HjLGCOfyQMfVD2TFRZJRCSoqryELf6FAwE0+/pGFCNFZmNl0Ctq5z1sGn7kItXbOH0J7KIt
	MnkkhRpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbhC-007Y7u-0d;
	Tue, 02 Jan 2024 10:08:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbh8-007Y6x-2U
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 10:08:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4T47nq0DhKzMl5r;
	Tue,  2 Jan 2024 18:07:43 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A982180075;
	Tue,  2 Jan 2024 18:08:12 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 18:08:11 +0800
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
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a145fc68-9b0a-9794-48d2-b7ad79116833@huawei.com>
Date: Tue, 2 Jan 2024 18:08:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <642239519.177270.1703884138999.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_020823_190913_DD15244E 
X-CRM114-Status: GOOD (  15.21  )
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

5ZyoIDIwMjMvMTIvMzAgNTowOCwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPj4gU2Vjb25k
LCB5b3UgY29uY2VybiBvZGQvaW5jb21wbGV0ZSBmaWxlcyBhcmUgcmVjb3ZlcmVkIGp1c3QgbGlr
ZSBJCj4+IG1ldGlvbmVkIGluIGRvY3VtZW50YXRpb24oTGltaXRhdGlvbnMgc2VjdGlvbiksIHdo
aWNoIHN0aWxsIG1ha2UKPj4gYXBwbGljYXRpb24gZmFpbGVkIGJlY2F1c2UgdGhlIHJlY292ZXJl
ZCBmaWxlIGxvc3QgZGF0YSBvciBkZWxldGVkIGZpbGUKPj4gaXMgcmVjb3ZlcmVkLiBTbyB5b3Ug
c3VnZ2VzdGVkIG1lIHRoYXQgbWFrZSBhIHVzZXJzcGFjZSBmc2NrIHRvb2wsIGFuZAo+PiBmc2Nr
IGNhbiB0ZWxsbCB1c2VyIHdoaWNoIGZpbGUgaXMgZGF0YSBsb3N0LCB3aGljaCBmaWxlIGlzIHJl
Y292ZXJlZAo+PiBhZnRlciBkZWxldGlvbi4KPj4KPj4gVGhlIGRpZmZpY3VsdHkgY29tZXMgZnJv
bSBzZWNvbmQgcG9pbnQswqAgaG93IGRvZXMgZnNjayBrbm93IGEgZmlsZSBpcwo+PiByZWNvdmVy
ZWQgaW5jb21wbGV0ZSBvciBvbGQuIFdoZXRoZXIgdGhlIG5vZGUgaXMgZXhpc3RpbmcsIGl0IGlz
IGp1ZGdlZAo+PiBieSBUTkMsIGJ1dCBUTkMgY291bGQgYmUgZGFtYWdlZCBsaWtlIEkgZGVzY2li
ZWQgaW4gYWJvdmUuIERvIHlvdSBoYXZlCj4+IGFueSBpZGVhcz8KPiBUaGF0J3MgdGhlIHByb2Js
ZW0gd2hhdCBhbGwgZnNjayB0b29scyBoYXZlIGluIGNvbW1vbi4KPiBUaGUgYmVzdCB3ZSBjYW4g
ZG8gaXMgb2ZmZXJpbmcgc2FmZSBhbmQgZGFuZ2Vyb3VzIHJlcGFpciBtb2Rlcwo+IHBsdXMgYSBn
b29kIHJlcGFpciByZXBvcnQuCj4gCgpJIGNvbWUgdXAgd2l0aCBhbm90aGVyIHdheSB0byBpbXBs
ZW1lbnQgZnNjay51YmlmczoKClRoZXJlIGFyZSB0aHJlZSBtb2RlczoKCjEuIGNvbW1vbiBtb2Rl
KG5vIG9wdGlvbnMpOiBBc2sgdXNlciB3aGV0aGVyIHRvIGZpeCBhcyBsb25nIGFzIGEgcHJvYmxl
bSAKaXMgZGV0ZWN0ZWQuCgoyLiBzYWZlIG1vZGUoLWEgb3B0aW9uKTogQXV0byByZXBhaXIgYXMg
bG9uZyBhcyBubyBkYXRhL2ZpbGVzIGxvc3QoZWcuIApubGluaywgaXNpemUsIHhhdHRyX2NudCwg
d2hpY2ggY2FuIGJlIGNvcnJlY3RlZCB3aXRob3V0IGRyb3BwaW5nIG5vZGVzKSwgCm90aGVyd2lz
ZSByZXR1cm5zIGVycm9yIGNvZGUuCgozLiBkYW5nZXJvdXMgbW9kZSgteSBvcHRpb24pOiBGaXgg
aXMgYWx3YXlzIHN1Y2Nlc3NmdWwsIHVubGVzcyAKc3VwZXJibG9jayBpcyBjb3JydXB0ZWQuIFRo
ZXJlIGFyZSAyIHNpdHVhdGlvbnM6CgogICBhKSBUTkMgaXMgdmFsaWQ6IGZzY2sgd2lsbCBwcmlu
dCB3aGljaCBmaWxlIGlzIGRyb3BwZWQgYW5kIHdoaWNoIApmaWxlJ3MgZGF0YSBpcyBkcm9wcGVk
CgogICBiKSBUTkMgaXMgaW52YWxpZDogZnNjayB3aWxsIHNjYW4gYWxsIG5vZGVzIHdpdGhvdXQg
cmVmZXJlbmNpbmcgVE5DLCAKc2FtZSBhcyB0aGlzIHBhdGNoc2V0IGRvZXMKCgpRMTogSG93IGRv
IHlvdSB0aGluayBvZiB0aGlzIG1ldGhvZD8KClEyOiBNb2RlIDEsIDIgYW5kIDMoYSkgZGVwZW5k
IG9uIGpvdXJuYWwgcmVwbGF5aW5nLCBJIGZvdW5kIAp4ZnNfcmVwYWlyWzFdIHNob3VsZCBiZSB1
c2VkIGFmdGVyIG1vdW50aW5nL3VubW91bnRpbmcgeGZzIChMZXQga2VybmVsIApyZXBsYXkgam91
cm5hbCksIGlmIFVCSUZTIGRvZXMgc28sIHRoZXJlIGlzIG5vIG5lZWQgdG8gY29weSByZWNvdmVy
eSAKc3Vic3lzdGVtIGludG8gdXNlcnNwYWNlLCBidXQgdXNlciBoYXMgdG8gbW91bnQvdW5tb3Vu
dCBiZWZvcmUgZG9pbmcgCmZzY2suIEkgZm91bmQgZTJmc2NrIGhhcyBjb3BpZWQgcmVjb3Zlcnkg
Y29kZSBpbnRvIHVzZXJzcGFjZSwgc28gaXQgY2FuIApkbyBmc2NrIHdpdGhvdXQgbW91bnRpbmcv
dW5tb3VudGluZy4gSWYgVUJJRlMgZG9lcyBzbywgam91cm5hbCByZXBsYXlpbmcgCndpbGwgdXBk
YXRlIFROQyBhbmQgTFBULCBwbGVhc2UgcmVmZXJlbmNlIFEzKDEpLiBXaGljaCBtZXRob2QgZG8g
eW91IApzdWdnZXN0PwoKUTM6IElmIGZzY2sgZHJvcHMgb3IgdXBkYXRlcyBhIG5vZGUoZWcuIGRl
bnRyeSBsb3N0IGlub2RlLCBjb3JyZWN0ZWQgCmlub2RlKSBpbiBtb2RlIDEsMiBhbmQgMyhhKSwg
VE5DL0xQVCBzaG91bGQgYmUgdXBkYXRlZC4gVGhlcmUgYXJlIHR3byAKd2F5cyB1cGRhdGluZyBU
TkMgYW5kIExQVDoKCiAgIDEpIExpa2Uga2VybmVsIGRvZXMsIHdoaWNoIG1lYW5zIHRoYXQgbWFy
ayBkaXJ0eSBUTkMvTFBUIGZvciAKY29ycmVzcG9uZGluZyBicmFuY2hlcyBhbmQgZG9fY29tbWl0
KCkuIEl0IHdpbGwgY29weSBtdWNoIGNvZGUgaW50byAKdXNlcnNwYWNlLCBlZy4gdG5jLmMsIGxw
dC5jLCB0bmNfY29tbWl0LmMsCmxwdF9jb21taXQuYy4gSSBmZWFyIHRoZXJlIGV4aXN0cyByaXNr
cy4gRm9yIGV4YW1wbGUsIHRoZXJlIGlzIG5vIHNwYWNlIApsZWZ0IGZvciBuZXcgaW5kZXggbm9k
ZXMsIGdjIHNob3VsZCBiZSBwZXJmb3JtZWQ/IElmIHNvLCBnYy9scHQgZ2MgY29kZSAKc2hvdWxk
IGJlIGNvcGllZCB0b28uCgogICAyKSBSZWJ1aWxkIG5ldyBUTkMvTFBUIGJhc2VkIG9uIHZhbGlk
IG5vZGVzLiBUaGlzIHdheSBpcyBzaW1wbGUsIGJ1dCAKb2xkIGdvb2QgVE5DIGNvdWxkIGJlIGNv
cnJ1cHRlZCwgaXQgbWVhbnMgdGhhdCBwb3dlcmN1dCBkdXJpbmcgZnNjayBtYXkgCmxldCBVQklG
UyBpbWFnZSBtdXN0IGJlIHJlcGFpcmVkIGluIG1vZGUgMyhiKSBidXQgaXQgY291bGQgYmUgcmVw
YWlyZWQgCmluIG1vZGUgMlwzKGEpIGJlZm9yZSBpbnZva2luZyBmc2NrLgoKV2hpY2ggd2F5IGlz
IGJldHRlcj8KCgpbMV0gCmh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vZG9jdW1lbnRhdGlvbi9l
bi11cy9yZWRfaGF0X2VudGVycHJpc2VfbGludXgvOC9odG1sL21hbmFnaW5nX2ZpbGVfc3lzdGVt
cy9jaGVja2luZy1hbmQtcmVwYWlyaW5nLWEtZmlsZS1zeXN0ZW1fX21hbmFnaW5nLWZpbGUtc3lz
dGVtcyNwcm9jX3JlcGFpcmluZy1hbi14ZnMtZmlsZS1zeXN0ZW0td2l0aC14ZnNfcmVwYWlyX2No
ZWNraW5nLWFuZC1yZXBhaXJpbmctYS1maWxlLXN5c3RlbQoKPiBMb25nIHN0b3J5IHNob3J0LCBJ
J20gbm90IG9wcG9zZWQgdG8gdGhlIGlkZWEsIEkganVzdCB3YW50IHRvIG1ha2UKPiBzdXJlIHRo
YXQgdGhpcyBuZXcgdG9vbCBvciBmZWF0dXJlIGlzIG5vdCB1c2VkIGJsaW5kbHksIHNpbmNlCj4g
aXQgY2Fubm90IGRvIG1hZ2ljLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
