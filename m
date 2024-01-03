Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105A2C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jan 2024 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFvAF8BmhT+aPdTgPZgSa02kXBrdODW2WYICuajhjx4=; b=GBismCsUxVMGtnKABpW4FZmaq7
	8o6ZiwQqPrmA7SXaEdYGTmUj/OCu4SHVAYKgIl5Z8am1mT+amTQmJEOjajRlbAQc3G84PSthMGp2i
	QmWkGHOY5KOE0cZqnqTjpwO3eFZwPBTfxSm6Gs4HZ2wkRK76dGasMsabXyLzCcWIJt8aiEJQpduV2
	3F9V4qiBYP+GNmeM88Mo/MQxizZh/c5hsF9J/VNmBLkRzoWzBlmPGYHUuWHBmhrTKkeXgGydJji8D
	x7gRglUqPNbaYgHqB/yZKKzAq4jEPXNi7S67D88gTj0UX888XYQMhKhWA90AyIg+KBv0PL+8E3EZG
	p81xkg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0bZ-00AqHN-2w;
	Wed, 03 Jan 2024 12:44:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0bW-00AqEv-0U
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jan 2024 12:44:16 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4T4qCT52zrzZfPt;
	Wed,  3 Jan 2024 20:43:49 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 39F7D180076;
	Wed,  3 Jan 2024 20:44:03 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 20:44:02 +0800
Subject: Re: [PATCH RFC 00/17] ubifs: Add filesystem repair support
From: Zhihao Cheng <chengzhihao1@huawei.com>
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
 <460eb02e-8937-282c-62c5-6ea606324b0e@huawei.com>
Message-ID: <cc6e93a3-3d3c-6bae-51d9-d8cdd8ca0e4c@huawei.com>
Date: Wed, 3 Jan 2024 20:44:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <460eb02e-8937-282c-62c5-6ea606324b0e@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_044414_368946_DFD41B71 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

5ZyoIDIwMjQvMS8zIDExOjE4LCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+IOWcqCAyMDI0LzEvMyA0
OjQ1LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBN
YWlsIC0tLS0tCj4+PiBWb246ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4KPj4+IEkgY29tZSB1cCB3aXRoIGFub3RoZXIgd2F5IHRvIGltcGxlbWVudCBmc2NrLnViaWZz
Ogo+Pj4KPj4+IFRoZXJlIGFyZSB0aHJlZSBtb2RlczoKPj4+Cj4+PiAxLiBjb21tb24gbW9kZShu
byBvcHRpb25zKTogQXNrIHVzZXIgd2hldGhlciB0byBmaXggYXMgbG9uZyBhcyBhIHByb2JsZW0K
Pj4+IGlzIGRldGVjdGVkLgo+Pgo+PiBNYWtlcyBzZW5zZS4KPj4KPj4+IDIuIHNhZmUgbW9kZSgt
YSBvcHRpb24pOiBBdXRvIHJlcGFpciBhcyBsb25nIGFzIG5vIGRhdGEvZmlsZXMgbG9zdChlZy4K
Pj4+IG5saW5rLCBpc2l6ZSwgeGF0dHJfY250LCB3aGljaCBjYW4gYmUgY29ycmVjdGVkIHdpdGhv
dXQgZHJvcHBpbmcgbm9kZXMpLAo+Pj4gb3RoZXJ3aXNlIHJldHVybnMgZXJyb3IgY29kZS4KPj4K
Pj4gTWFrZXMgc2Vuc2UuCj4+PiAzLiBkYW5nZXJvdXMgbW9kZSgteSBvcHRpb24pOiBGaXggaXMg
YWx3YXlzIHN1Y2Nlc3NmdWwsIHVubGVzcwo+Pj4gc3VwZXJibG9jayBpcyBjb3JydXB0ZWQuIFRo
ZXJlIGFyZSAyIHNpdHVhdGlvbnM6Cj4+Cj4+IFBsZWFzZSBub3QgdXNlICIteSIuIFVzdWFsbHkg
Ii15IiBzdGFuZHMgZm9yICJhbnN3ZXIgeWVzIHRvIGFsbCAKPj4gcXVlc3Rpb25zIi4KPj4gQnV0
IHNlbGVjdGluZyBuYW1lcyBmb3IgY29tbWFuZCBsaW5lIGZsYWdzIGlzIGN1cnJlbnRseSBteSBs
ZWFzdCBjb25jZXJuLgo+Pj4gwqDCoCBhKSBUTkMgaXMgdmFsaWQ6IGZzY2sgd2lsbCBwcmludCB3
aGljaCBmaWxlIGlzIGRyb3BwZWQgYW5kIHdoaWNoCj4+PiBmaWxlJ3MgZGF0YSBpcyBkcm9wcGVk
Cj4+Cj4+IFNvdW5kcyBhbHNvIGdvb2QuCj4+PiDCoMKgIGIpIFROQyBpcyBpbnZhbGlkOiBmc2Nr
IHdpbGwgc2NhbiBhbGwgbm9kZXMgd2l0aG91dCByZWZlcmVuY2luZyBUTkMsCj4+PiBzYW1lIGFz
IHRoaXMgcGF0Y2hzZXQgZG9lcwo+Pgo+PiBJJ2QgbWFrZSB0aGlzIGEgZGlzdGluY3QgbW9kZS4K
Pj4gSXQgY2FuIGJlIHVzZWQgdG8gcmVidWlsZCBpbmRleCBhbmQgTEVCIHByb3BlcnR5IHRyZWVz
Lgo+PiBUaGlzIGlzIGJhc2ljYWxseSBhICJkcm9wIHRyZWVzIGFuZCByZWJ1aWxkIiBtb2RlLgo+
Pgo+IAo+IE9LLCB0aGVuIGZzY2sgd2lsbCBoYXZlIGZvdXIgbW9kZXMuCgpIb3cgYWJvdXQgbWVy
Z2luZyAzKGEpIGFuZCAzKGIpIGFzIG9uZSBtb2RlKGRhbmdlcm91cyBtb2RlKT8gSWYgZnNjayBj
YW4gCmdldCBhIGdvb2QgVE5DKGFsbCBub24tbGVhZiBpbmRleCBub2RlcyBhcmUgdmFsaWQpLCBm
c2NrIGV4ZWN1dGVzIGFzIAozKGEpIGRlc2NyaWJlcy4gSWYgZnNjayBjYW5ub3QgZmluZCBhIGdv
b2QgVE5DLCBmc2NrIGV4ZWN1dGVzIGFzIDMoYikgCmFuZCByZW1pbmRzIHVzZXIgdGhhdCAiVE5D
IGlzIGRhbWFnZWQsIG5vZGVzIGRyb3BwaW5nIGlzIG5vdCBhd2FyZWQiLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
