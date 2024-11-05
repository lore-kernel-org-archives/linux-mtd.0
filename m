Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822AFD1CA0E
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2024 02:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9OBOVnyjD86Aty3c7yJm6zLQ4DgKCHQACbSzw0e6aQ=; b=yzIPBeHMjS43st/Kbe3ZSNTfsI
	G5ijA9vHaSJLv3juXDBsgBv6vnCjU7hVSOS0+fOh6F9/ApnKq/mUwU2hxNcH4tdYYrosFgMtQ/DvI
	3vLGMFeVGMe7EBYdS1iO5qvM69432e9Z27QTXB+YujQrJzq+Sud2krqPKp69PnpYryOAmrMrVC4V4
	Hrx4KeTDv8TGRktgfv+BjeiOvjWAAygdZybyRvvACocCS2+r8lw9/yyDjGCuAK6fXLHNOl8TUnMHa
	EUsCG5xNQ1U5LOXIx296GDyoF9ZrkzqllGuBSsZJ6tfoZ1AwckEnMtv3yt2TpY76D4ZDxLJmySkXh
	P8Fos6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t896t-0000000Fdmx-2WKK;
	Tue, 05 Nov 2024 02:15:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t896q-0000000FdmL-3FIY
	for linux-mtd@lists.infradead.org;
	Tue, 05 Nov 2024 02:15:58 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XjBhv4p1RzpY2r;
	Tue,  5 Nov 2024 10:13:51 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 179F8180104;
	Tue,  5 Nov 2024 10:15:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 5 Nov 2024 10:15:45 +0800
Subject: Re: Block based OTA update needs mtdblock
To: Pintu Agarwal <pintu.ping@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5cdff557-c90f-6acc-7245-a2fb2406ecb9@huawei.com>
Date: Tue, 5 Nov 2024 10:15:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_181556_988150_64AFB8EB 
X-CRM114-Status: GOOD (  19.75  )
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

5ZyoIDIwMjQvMTEvNSAwOjAxLCBQaW50dSBBZ2Fyd2FsIOWGmemBkzoKPiBIaSBBbGwsCj4gCj4g
Rm9yIG9uZSBvZiBvdXIgYXV0b21vdGl2ZSBwcm9kdWN0cyB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcg
Y29uZmlndXJhdGlvbjoKPiBRQyBjaGlwc2V0LCBhcm02NCwgS2VybmVsLTUuMTUsIE5BTkQgRmxh
c2ggMUdCLCBBL0Igc3lzdGVtLCBVQkkKPiB2b2x1bWVzIChzcXVhc2hmcywgdWJpZnMpLCBETS12
ZXJpdHkgZm9yIHJvb3RmcyAoc3F1YXNoZnMpLCBzaW1wbGUKPiBidXN5Ym94IHBsYXRmb3JtLgo+
IAo+IEZvciBPVEEgdXBkYXRlcyB3ZSBoYXZlIGEgc3Ryb25nIGRlcGVuZGVuY3kgd2l0aCBNVERf
QkxPQ0suCj4gCj4gVGlsbCBub3csIHdlIHdlcmUgdXNpbmcgdWJpYmxvY2sgZm9yIG1vdW50aW5n
IHNxdWFzaGZzIHZvbHVtZXMgYW5kCj4gY29tcGxldGVseSBnb3QgcmlkIG9mIG10ZF9ibG9jayBi
eSBjb25maWd1cmluZyBpdCBhcyBhIGxvYWRhYmxlCj4gbW9kdWxlLgo+IEJ1dCwgd2UgYWxzbyBu
ZWVkIHRvIHN1cHBvcnQgT1RBIHVwZGF0ZXMgKEZ1bGwsIEluY3JlbWVudGFsKSBvbiBBL0IKPiB2
b2x1bWVzIHVzaW5nIHRoZSBzYW1lIEFuZHJvaWQgT1RBIGZyYW1ld29yay4KPiBodHRwczovL3Nv
dXJjZS5hbmRyb2lkLmNvbS9kb2NzL2NvcmUvb3RhL25vbmFiL2Jsb2NrCj4gCj4gT1RBIHVwZGF0
ZSB3aWxsIGJlIGFwcGxpZWQgdG8gdGhlIEIgKGluYWN0aXZlKSBwYXJ0aXRpb24uCj4gT1RBIHVw
ZGF0ZXMgcHJlZmVyIGJsb2NrIGJhc2VkIHVwZGF0ZSBvdmVyIGZpbGUgYmFzZWQgZXNwZWNpYWxs
eSBmb3IKPiBkbS12ZXJpdHkgZW5hYmxlZCBkZXZpY2VzLgo+IAo+IE5vdywgdGhlIHByb2JsZW0g
aXMsIG9uIE1URCB3ZSBvbmx5IGhhdmUgMiBvcHRpb25zIGZvciBibG9jayBiYXNlZAo+IHVwZGF0
ZXM7IHViaV9ibG9jayBvciBtdGRfYmxvY2suCj4gV2UgY2Fubm90IHVzZSB1YmlibG9jayBmb3Ig
T1RBIHVwZGF0ZXMgYXMgaXQgaXMgcmVhZCBvbmx5Lgo+IEZvciBmdWxsIHVwZGF0ZSB2b2x1bWUs
IHdlIGNhbiB1c2UgInViaXVwZGF0ZXZvbCIgaW50ZXJmYWNlIHRvCj4gY29tcGxldGVseSByZXBs
YWNlIHRoZSB2b2x1bWUgY29udGVudCwgYnV0IGZvciBwYXJ0aWFsIG9yIGluY3JlbWVudGFsCj4g
dXBkYXRlIHdlIG5lZWQgdG8gdXBkYXRlIG9ubHkgc3BlY2lmaWMgYmxvY2tzIGFuZCBub3QgZW50
aXJlCj4gcGFydGl0aW9ucy4KPiBUaHVzLCB3ZSBoYXZlIHRvIHVzZSB0aGUgTVREX0JMT0NLICgv
ZGV2L210ZGJsb2NrKSBpbnRlcmZhY2UgdG8KPiBzdXBwb3J0IGJsb2NrIGJhc2VkIE9UQSB1cGRh
dGVzIG9uIFVCSSB2b2x1bWVzLgo+IFRodXMsIGR1cmluZyBvdGEgdXBkYXRlcyAob25seSkgd2Ug
bmVlZCB0byBpbnN0YWxsIHRoZSBtdGRibG9jawo+IG1vZHVsZSwgcGVyZm9ybSB0aGUgdXBkYXRl
IGFuZCB0aGVuIHVuaW5zdGFsbCB0aGUgbW9kdWxlLgoKSGkgUGludHUsIGhvdyBkbyB5b3UgZXhw
b3J0IHRoZSBtdGRibG9jayBkZXZpY2Ugb3ZlciBvbiBhbiBVQkkgdm9sdW1lPyAKQnkgdGhlIGds
dWViaT8KPiAKPiBUaGF0IG1lYW5zLCB3ZSBjYW5ub3QgY29tcGxldGVseSBnZXQgcmlkIG9mIE1U
RF9CTE9DSyBmcm9tIG91ciBwcm9kdWN0Cj4gZXNwZWNpYWxseSBmb3IgT1RBIHVzZSBjYXNlcy4K
PiAKPiBJcyB0aGlzIHRoZSBvbmx5IHdheSwgb3IgZG8gd2UgaGF2ZSBhbnkgb3RoZXIgb3B0aW9u
IHRvIHN1cHBvcnQgT1RBCj4gdXBkYXRlcyBvdmVyIFVCSSB2b2x1bWVzID8KPiAKPiAKPiBUaGFu
ayB5b3UsCj4gUmVnYXJkcywKPiBQaW50dQo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
