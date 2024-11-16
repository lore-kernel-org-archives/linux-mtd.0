Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CEAD68BD0
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Nov 2024 02:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrobKsAoXW4QfQGgU5tJgHxBeu7e9a1/X2CDu5Y9nOM=; b=CuDp/OOM93mxJUK8/bGxi4PEgt
	jjlIfX8NKPjxTQmIg4+cqex1tSvdp1SGzDSUwUX2j2/7PMKwnO4f2IpMpiwwjmsY4nNSCKVoazIMb
	QNLckgqmCU2mVZ98CVP48N2zTugR8FYovmOqpHeXPkXw7Qwr4kzNJVszPUn0wbicqpZeWUvPqJdUv
	w+GOhyugBjrBSERc0wCT6s/Rn2rrfAoftF0a4QbQCL/PDRTEdP542QzQUfbr2FT0a9jfZALpZwMlN
	7Jha1vNvhkIRxJtpAXDYXvkFs09ktuBRjHkEFyTDv73IzBNHrjURHVlxTuEYYms5iFtqzTDmwaG/P
	K2ntEJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC8yP-00000004pWW-2umE;
	Sat, 16 Nov 2024 02:55:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC8yM-00000004pVw-2UPw
	for linux-mtd@lists.infradead.org;
	Sat, 16 Nov 2024 02:55:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xqz321wZRz10RWy;
	Sat, 16 Nov 2024 10:53:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 291631800A2;
	Sat, 16 Nov 2024 10:55:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 16 Nov 2024 10:55:34 +0800
Subject: Re: [PATCH v3 01/10] ubi: Expose mean erase counter in sysfs
To: Rickard x Andersson <rickaran@axis.com>, Richard Weinberger
	<richard@nod.at>
CC: Rickard X Andersson <rickard.andersson@axis.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, rickard314 andersson
	<rickard314.andersson@gmail.com>, kernel <kernel@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
 <1034679385.201190.1730925253564.JavaMail.zimbra@nod.at>
 <fde85cfc-8b66-37fd-3884-ad4d65930378@huawei.com>
 <66292421.21714319.1731610221872.JavaMail.zimbra@nod.at>
 <c57b8b7d-a773-0d51-8f38-2a2ac8c0e31b@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6a2e0584-35ae-4d74-9d5c-400db8b25c0b@huawei.com>
Date: Sat, 16 Nov 2024 10:55:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c57b8b7d-a773-0d51-8f38-2a2ac8c0e31b@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_185542_989699_698E524A 
X-CRM114-Status: GOOD (  19.16  )
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

5ZyoIDIwMjQvMTEvMTUgMTc6MDAsIFJpY2thcmQgeCBBbmRlcnNzb24g5YaZ6YGTOgo+IE9uIDEx
LzE0LzI0IDE5OjUwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IC0tLS0tIFVyc3Byw7xu
Z2xpY2hlIE1haWwgLS0tLS0KPj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPgo+Pj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiUmlja2FyZCBY
IEFuZGVyc3NvbiIgCj4+PiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4+PiBDQzogImxp
bnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgInJpY2thcmQzMTQgCj4+
PiBhbmRlcnNzb24iIDxyaWNrYXJkMzE0LmFuZGVyc3NvbkBnbWFpbC5jb20+LCAia2VybmVsIgo+
Pj4gPGtlcm5lbEBheGlzLmNvbT4KPj4+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCA3LiBOb3ZlbWJl
ciAyMDI0IDAyOjM5OjQ1Cj4+PiBCZXRyZWZmOiBSZTogW1BBVENIIHYzIDAxLzEwXSB1Ymk6IEV4
cG9zZSBtZWFuIGVyYXNlIGNvdW50ZXIgaW4gc3lzZnMKPj4KPj4+IOWcqCAyMDI0LzExLzcgNDoz
NCwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPj4+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBN
YWlsIC0tLS0tCj4+Pj4+IFZvbjogIlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVy
c3NvbkBheGlzLmNvbT4KPj4+Pj4gVGhlcmUgZXhpc3RzIG1vcmUgZGV0YWlsZWQgaW5mbyBpbiBk
ZWJ1Z2ZzLCBidXQgdGhpcyBpbmZvcm1hdGlvbiBpcwo+Pj4+PiBvbmx5IGF2YWlsYWJsZSBmb3Ig
ZGVidWcgYnVpbGRzLgo+Pj4+Cj4+Pj4gSWYgdGhlIGRldGFpbGVkIGluZm8gaXMgdXNlZnVsIGZv
ciByZWd1bGFyIHVzZXJzcGFjZSB3ZSBjYW4gYWxzbyB0aGluawo+Pj4+IG9mIGFkZGluZyBhIG5v
bi1kZWJ1Z2ZzIGludGVyZmFjZSBmb3IgaXQuCj4+Pj4gRS5nLiBhbiBpb2N0bCgpIHRoYXQgcmV0
dXJucyB0aGlzIGRhdGEgaW4gYmluYXJ5IGZvcm0uCj4+Pgo+Pj4gVGhpcyBtZXRob2Qgc291bmRz
IGJldHRlci4KPj4KPj4gUmlja2FyZCwgd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBvcHRp
b24/Cj4+Cj4+IFRoYW5rcywKPj4gLy9yaWNoYXJkCj4gCj4gSGksCj4gCj4gSSB3b3VsZCBwcmVm
ZXIgdG8ga2VlcCBpdCBpbiBzeXNmcy4gV2UgYWxyZWFkeSBoYXZlIHRoZSBmb2xsb3dpbmcgaW4g
Cj4gc3lzZnMgKC9zeXMvY2xhc3MvdWJpL3ViaVgpIHRoYXQgaXMgcmVsYXRlZCB0byBmbGFzaCB3
ZWFyOgo+IAo+IC1yLS1yLS1yLS3CoMKgwqAgMSByb290IHJvb3TCoMKgwqDCoMKgIDQwOTYgT2N0
IDI0IDA4OjU0IGF2YWlsX2VyYXNlYmxvY2tzCj4gLXItLXItLXItLcKgwqDCoCAxIHJvb3Qgcm9v
dMKgwqDCoMKgwqAgNDA5NiBOb3YgMTUgMDg6MjYgYmFkX3BlYl9jb3VudAo+IC1yLS1yLS1yLS3C
oMKgwqAgMSByb290IHJvb3TCoMKgwqDCoMKgIDQwOTYgTm92IDE1IDA4OjI2IG1heF9lYwo+IC1y
LS1yLS1yLS3CoMKgwqAgMSByb290IHJvb3TCoMKgwqDCoMKgIDQwOTYgT2N0IDI0IDA4OjU0IHJl
c2VydmVkX2Zvcl9iYWQKPiAKPiBXaXRoIG15IHBhdGNoIHNlcmllcyB0aGUgZm9sbG93aW5nIHdp
bGwgYmUgYWRkZWQgZm9yIG5vcm1hbCBidWlsZHM6Cj4gCj4gLXItLXItLXItLcKgwqDCoCAxIHJv
b3Qgcm9vdMKgwqDCoMKgwqAgNDA5NiBOb3YgMTUgMDg6MjYgbWVhbl9lYwo+IAo+IElmIGZhc3Rt
YXAgaXMgZW5hYmxlZCAoQ09ORklHX01URF9VQklfRkFTVE1BUD15KSBhbHNvIHRoZSBmb2xsb3dp
bmcgaXMgCj4gYWRkZWQ6Cj4gCj4gLXItLXItLXItLcKgwqDCoCAxIHJvb3Qgcm9vdMKgwqDCoMKg
wqAgNDA5NiBOb3YgMTUgMDg6MjYgbWF4X2VjX2RhdGEKPiAtci0tci0tci0twqDCoMKgIDEgcm9v
dCByb290wqDCoMKgwqDCoCA0MDk2IE5vdiAxNSAwODoyNiBtYXhfZWNfZmFzdG1hcAo+IC1yLS1y
LS1yLS3CoMKgwqAgMSByb290IHJvb3TCoMKgwqDCoMKgIDQwOTYgTm92IDE1IDA4OjI2IG1lYW5f
ZWNfZGF0YQo+IC1yLS1yLS1yLS3CoMKgwqAgMSByb290IHJvb3TCoMKgwqDCoMKgIDQwOTYgTm92
IDE1IDA4OjI2IG1lYW5fZWNfZmFzdG1hcAo+IAo+IElmIHlvdSB0aGluayB0aGUgYWJvdmUgaXMg
dG9vICJibG9hdGVkIiBpbiB0aGUgZmFzdG1hcCBjYXNlIAo+IChDT05GSUdfTVREX1VCSV9GQVNU
TUFQPXkpIHdlIGNvdWxkIHJlZHVjZSB0aGUgYWRkaXRpb25hbCBmaWxlcyBpbiB0aGUgCj4gZmFz
dG1hcCBjYXNlIHRvIHRoZSBmb2xsb3dpbmcgKE1vcmUgc2ltaWxhciB0byBteSBWMSB2ZXJzaW9u
IG9mIHRoZSAKPiBwYXRjaCBzZXJpZXMpOgo+IAo+IC1yLS1yLS1yLS3CoMKgwqAgMSByb290IHJv
b3TCoMKgwqDCoMKgIDQwOTYgTm92IDE1IDA4OjI2IG1lYW5fZWNfZmFzdG1hcAo+IAo+IFRoYW5r
cywKPiBSaWNrYXJkIEEuCj4gCj4gLgoKSGkgUmlja2FyZC4gTGV0J3MgcmVvcmdhbml6ZSBvdXIg
dGhvdWdodHMuCgoxLiBXZSBuZWVkIHRvIGtub3cgdGhlIG92ZXJhbGwgZmxhc2ggd2VhciwgaW5j
bHVkaW5nOgogICAxKSBJcyB0aGUgZmxhc2ggb3Zlci9hcHByb2FjaGluZyBsaWZldGltZT8gLSB0
aGUgJ21heF9lYycgY291bGQgdGVsbCB1cwogICAyKSBIb3cgd29ybiBkb3duIHRoZSBmbGFzaCBp
cyBpbiBkaWZmZXJlbnQgYXJlYXM/IHRoZSAnbWVhbl9lYycgY291bGQgCnRlbGwgdXMgdGhlIG92
ZXJhbGwgc2l0dWF0aW9uLCB0aGUgJ21lYW5fZWNfZGF0YScgYW5kICdtZWFuX2VjX2Zhc3RtYXAn
IApjb3VsZCB0ZWxsIHVzIG1vcmUgZGV0YWlscyBpbiBkaWZmZXJlbnQgYXJlYXMuCiAgIDMpIERv
ZXMgdGhlIHdlYXItbGV2ZWxpbmcgYWxnb3JpdGhtIHdvcmsgY29ycmVjdGx5PyB0aGUgCidtYXhf
ZWNfZGF0YScsICdtaW5fZWNfZGF0YScgY291bGQgYmUgdXNlZCB0byBqdWRnZSB3aGV0aGVyIFBF
QnMgdXNhZ2UgCmluIGRhdGEgYXJlYSBpcyBiYWxhbmNlZO+8jHRoZSAnbWF4X2VjX2Zhc3RtYXAn
LCAnbWluX2VjX2Zhc3RtYXAnIGNvdWxkIGJlIAp1c2VkIHRvIGp1ZGdlIHdoZXRoZXIgUEVCcyB1
c2FnZSBpbiBmYXN0bWFwIGFyZWEgaXMgYmFsYW5jZWQuCjIuIEtlcm5lbCBvbmx5IHByb3ZpZGVz
IG1lY2hhbmlzbXMsIHVzZXIgcHJvZ3JhbSBpbXBsZW1lbnRzIGxvZ2ljIHRvIApzYXRpc2Z5IHdo
YXQgdXNlciB3YW50cy4KMy4gSSB0aGluayBwb2ludHMgMS0xKX4zKSBiZWxvbmdzIHRvIHVzZXIg
cmVxdWlyZW1lbnRzLCB0aGV5IGNhbiBiZSAKaW1wbGVtZW50ZWQgYWNjb3JkaW5nIHRvIHRoZSBy
YXcgZWMgc3RhdGlzdGljcyhkZWJ1Z2ZzIGludGVyZmFjZSwgb3IgCmFjY29yZGluZyB0byBSaWNo
YXJkJ3Mgc3VnZ2VzdGlvbiBwcm92aWRpbmcgYSBuZXcgaW9jdGwpLgpXaHkgZG8gSSB0aGluayBw
b2ludHMgMS0xKX4zKSBiZWxvbmcgdG8gdXNlciBsb2dpYz8gVGhleSBhcmUgY3VzdG9taXplZCAK
YW5kIGNhbiBvbmx5IGJlIHVzZWQgaW4gc3BlY2lmaWMgc2NlbmFyaW9zLCBub3QgbGlrZSAnbWF4
X2VjJywgCidiYWRfcGViX2NvdW50JyBhbmQgJ2xlYl9zaXplJyB3aGljaCBhcmUgZ2VuZXJhbCBm
ZWF0dXJlcyBvZiBVQkkgYW5kIGJlIAp3aWRlbHkgdXNlZC4gRm9yIGV4YW1wbGUsIGlmIHNvbWVk
YXkgb25lIHVzZXIgd2FudHMgdG8ga25vd24gdGhlIG1lZGlhbSAKZWMgY291bnQgaW4gZGF0YSBh
bmQgZmFzdG1hcCBhcmVhcywgdHdvIGludGVyZmFjZXMgd2lsbCBiZSBhZGRlZCBpbiAKc3lzZnMs
IHdoaWNoIGxvb2tzIGJsb2F0ZWQoVGhlcmUgYXJlIHRvbyBtYW55IGJlc3Bva2UgaW50ZXJmYWNl
cyB1bmRlciAKc3lzZnMpLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
