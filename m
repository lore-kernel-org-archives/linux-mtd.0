Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982FEC46CD2
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 02:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oAjDwuXgt+TRqD7903J1QFxPw35YsFaN9bzd8OX8dw=; b=2iEn8qt1elEAMYExyZ5ZOSgfuA
	OcFoVWy0XK2DLQ/QWq7/ayE54u4keCCCROH2/EtAiPCNvkwTLzSxbWmveq49cr8RKR6BlCjApt2g8
	7cp4NXR9CwuEbux9XsiNfN/OEyjXH5OIr92Z+Wvici0vfaoeoKltj0+TJ0O9HitJ8KwkpBLoJgeK9
	nci7hxi+fNOILkZg3dNIvXhVZkIxEUZ6TeQW19Pk/psq8dY8Oc3IS0xc1EbSaaZIRUburctsteofg
	EnLPgMPmCwheTFuuyGHlGP/nlJUpjeOY2/9XVyFE+nWGdBhak3QU5fXYKm6zZnKBLMS652WNWn2fn
	FgtWjjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6eI-00Eukw-1K;
	Tue, 23 Jan 2024 02:36:26 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6eF-00EukD-12
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 02:36:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TJrmp4ZGBz1wnBJ;
	Tue, 23 Jan 2024 10:35:54 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 23122140416;
	Tue, 23 Jan 2024 10:36:16 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 10:36:15 +0800
Subject: Re: [PATCH 01/15] ubifs: Set page uptodate in the correct place
To: Matthew Wilcox <willy@infradead.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<stable@vger.kernel.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-2-willy@infradead.org>
 <5ad7b6ed-664b-7426-c557-1495711a6100@huawei.com>
 <Za5-UJU0tqT9CYQj@casper.infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f96965c0-8464-c12c-7e5c-95ba74d10b7d@huawei.com>
Date: Tue, 23 Jan 2024 10:36:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Za5-UJU0tqT9CYQj@casper.infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_183623_543790_5C340FBA 
X-CRM114-Status: GOOD (  12.91  )
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

5ZyoIDIwMjQvMS8yMiAyMjo0MCwgTWF0dGhldyBXaWxjb3gg5YaZ6YGTOgo+IE9uIE1vbiwgSmFu
IDIyLCAyMDI0IGF0IDAzOjIyOjQ1UE0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4g5Zyo
IDIwMjQvMS8yMSA3OjA4LCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSDlhpnpgZM6Cj4+PiBQYWdl
IGNhY2hlIHJlYWRzIGFyZSBsb2NrbGVzcywgc28gc2V0dGluZyB0aGUgZnJlc2hseSBhbGxvY2F0
ZWQgcGFnZQo+Pj4gdXB0b2RhdGUgYmVmb3JlIHdlJ3ZlIG92ZXJ3cml0dGVuIGl0IHdpdGggdGhl
IGRhdGEgaXQncyBzdXBwb3NlZCB0byBoYXZlCj4+PiBpbiBpdCB3aWxsIGFsbG93IGEgc2ltdWx0
YW5lb3VzIHJlYWRlciB0byBzZWUgb2xkIGRhdGEuICBNb3ZlIHRoZSBjYWxsCj4+PiB0byBTZXRQ
YWdlVXB0b2RhdGUgaW50byB1Ymlmc193cml0ZV9lbmQoKSwgd2hpY2ggaXMgYWZ0ZXIgd2UgY29w
aWVkIHRoZQo+Pj4gbmV3IGRhdGEgaW50byB0aGUgcGFnZS4KPj4KPj4gVGhpcyBzb2x1dGlvbiBs
b29rcyBnb29kIHRvIG1lLCBhbmQgSSB0aGluayAnU2V0UGFnZVVwdG9kYXRlJyBzaG91bGQgYmUK
Pj4gcmVtb3ZlZCBmcm9tIHdyaXRlX2JlZ2luX3Nsb3coc2xvdyBwYXRoKSB0b28uCj4gCj4gSSBk
aWRuJ3QgYm90aGVyIGJlY2F1c2Ugd2UgaGF2ZSBqdXN0IHJlYWQgaW50byB0aGUgcGFnZSBzbyBp
dCBpcwo+IHVwdG9kYXRlLiAgQSByYWNpbmcgcmVhZCB3aWxsIHNlZSB0aGUgZGF0YSBmcm9tIGJl
Zm9yZSB0aGUgd3JpdGUsIGJ1dAo+IHRoYXQncyBhbiBhY2NlcHRhYmxlIG9yZGVyaW5nIG9mIGV2
ZW50cy4KPiAuCj4gCgpJIGNhbid0IGZpbmQgd2hlcmUgdGhlIHBhZ2UgaXMgcmVhZCBhbmQgc2V0
IHVwdG9kYXRlLiBJIHRoaW5rIHRoZSAKdW5pbml0aWFsaXplZCBkYXRhIGNhbiBiZSBmb3VuZCBp
biBmb2xsb3dpbmcgcGF0aDoKCiAgICAgICB3cml0ZXIgICAgICAgICAgICAgICByZWFkZXIKdWJp
ZnNfd3JpdGVfYmVnaW4KICBwYWdlMSA9IGdyYWJfY2FjaGVfcGFnZV93cml0ZV9iZWdpbgogIGVy
ciA9IGFsbG9jYXRlX2J1ZGdldCAvLyBFTk9TUEMKICB1bmxvY2tfcGFnZShwYWdlMSkKICBwdXRf
cGFnZShwYWdlMSkKICB3cml0ZV9iZWdpbl9zbG93CiAgIHBhZ2UyID0gZ3JhYl9jYWNoZV9wYWdl
X3dyaXRlX2JlZ2luCiAgIFNldFBhZ2VDaGVja2VkKHBhZ2UyKQogICBTZXRQYWdlVXB0b2RhdGUo
cGFnZTIpCiAgICAgICAgICAgICAgICAgZ2VuZXJpY19maWxlX3JlYWRfaXRlcgogICAgICAgICAg
ICAgICAgICBmaWxlbWFwX3JlYWQKICAgICAgICAgICAgICAgICAgIGZpbGVtYXBfZ2V0X3BhZ2Vz
CiAgICAgICAgICAgICAgICAgICAgZmlsZW1hcF9nZXRfcmVhZF9iYXRjaAogICAgICAgICAgICAg
ICAgICAgIGlmICghZm9saW9fdGVzdF91cHRvZGF0ZSkgLy8gcGFnZTIgaXMgdXB0b2RhdGUKICAg
ICAgICAgICAgICAgICAgIGNvcHlfZm9saW9fdG9faXRlciAvLyByZWFkIHVuaW5pdGlhbGl6ZWQg
cGFnZSBjb250ZW50IQpjb3B5X3BhZ2VfZnJvbV9pdGVyX2F0b21pYyAvLyBjb3B5IGRhdGEgdG8g
Y292ZXIgdW5pbml0aWFsaXplZCBwYWdlIGNvbnRlbnQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
