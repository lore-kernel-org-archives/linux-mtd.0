Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D2ED68B26
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxEKUq5X9te2P2+qn7I7Yg6Cbv6Ab0yYnhr5TjJHftg=; b=cIK7/DxYnXhvOa4I1fm9vvBGmD
	B18qmJT7xEsNK+RIfuS+spxFNcsbCLtB9dNCz48LG5Ua8gimMxcmV2lbjx5Et/2QScIhCUlrM/MQO
	yaqF62tPXtrBnVTeR2iwuoTdlDOQT69R8oSMtliYOkNLvjLhQd9lfrjKrnW1jjS8WAywRtMocLozB
	LXiSYcMsxS5CFzo3ZOTOpjZmsvjfJ4PKwL+P5I9M2cqLyvDCAbRur0My12WCMKBNX45nlcNWjj4H6
	SRCLPzM2+1+1IJqj6XCQ9+2RASWpqf0DC7AWx+Gd2A3vzPqaBH8V4vnv/Iul4DMmDvIvC6CLWOWGS
	VxNOXtxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaYl-0000000A9gx-1cx9;
	Thu, 14 Nov 2024 14:10:59 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaYh-0000000A9fR-2ZEf
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 14:10:57 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xq2B74mFJz1ypZG;
	Thu, 14 Nov 2024 22:10:55 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DB01E18002B;
	Thu, 14 Nov 2024 22:10:43 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Nov 2024 22:10:43 +0800
Subject: Re: Some information about direct-io support on ubifs
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
CC: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
References: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com>
 <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com>
 <CAOf5uwm=nLLcyvtc7EGK=rdu6N+j6t6_hYyCWcB3QMACOAEx2A@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8df70e11-3278-06ed-5952-c808035bb679@huawei.com>
Date: Thu, 14 Nov 2024 22:10:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAOf5uwm=nLLcyvtc7EGK=rdu6N+j6t6_hYyCWcB3QMACOAEx2A@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_061056_093667_B2C9410D 
X-CRM114-Status: GOOD (  22.22  )
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

5ZyoIDIwMjQvMTEvMTEgMjM6MDgsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSDlhpnpgZM6
Cj4gSGkKPiAKPiBPbiBNb24sIE5vdiAxMSwgMjAyNCBhdCAzOjE14oCvUE0gWmhpaGFvIENoZW5n
IDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Cj4+IOWcqCAyMDI0LzExLzExIDE3
OjM3LCBNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkg5YaZ6YGTOgo+Pj4gSGkgYWxsCj4+Pgo+
Pj4gSSB3b3VsZCBsaWtlIHRvIGhhdmUgc29tZSBpbmZvcm1hdGlvbiBvbiBob3cgdG8gaW1wbGVt
ZW50IGRpcmVjdC1pbwo+Pj4gc3VwcG9ydCBpbiB1Ymlmcy4gSSBoYXZlIHRyaWVkIHRvIG1vdW50
IHNxdWFzaGZzIGltYWdlIGFzIGZpbGUgaW4KPj4+IHViaWZzIHVzaW5nIGxvb3BiYWNrIGFuZCBk
aXJlY3QtaW8gYnV0IGl0IHNlZW1zIHRoYXQgbG9vcCBjYW4gbm90Cj4+PiBoYW5kbGUgd2hlbiB0
aGlzIGlzIG9uIHRvcCBvZiB1Ymlmcy4gRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBmcm9tIHRoZQo+
Pj4gY29kZSBpdCBzZWVtcyB0aGF0IHRoZSByZXF1aXJlbWVudCBpcyB0aGF0IHRoZSBkaXJlY3Qt
aW8gaXMKPj4+IGltcGxlbWVudGVkIGluIHRoZSBmaWxlc3lzdGVtIHdoZXJlIHRoZSBmaWxlIGlz
IHN0b3JlZC4gSSBoYXZlCj4+PiBzaW11bGF0ZWQgdXNpbmcgbmFuZCBzaW0uIFRoZSBpZGVhIGlz
IHRvIHJlZHVjZSB0aGUgYnVmZmVyaW5nLiBJJ20KPj4+IG9wZW4gdG8gaGF2ZSBvdGhlciBzdWdn
ZXN0aW9ucyByZWdhcmRpbmcgdGhpcyB0b28uCj4+Pgo+Pj4gTWljaGFlbAo+Pj4gLgo+Pj4KPj4g
SGkgTWljaGFlbCwKPj4gVGhlcmUgaXMgYSBkaXNjdXNzaW9uKDkgeWVhcnMgYWdvKSBhYm91dCB1
YmlmcyBkaW9bMV0sIG9mIGNvdXJzZSB3ZQo+PiBjYW5ub3QgaW1wbGVtZW50IGl0IGFzIGEgZmFr
ZSBpbnRlcmZhY2Ugbm93Lgo+PiBCZWZvcmUgdGFsa2luZyBhYm91dCBhZGRpbmcgZGlvIHN1cHBv
cnQgZm9yIFVCSUZTLCBsZXQgbWUga25vdyBzb21lCj4+IGJhY2tncm91bmQgaW5mb3JtYXRpb24u
IFdoYXQncyB0aGUgcHVycG9zZSBvZiB1c2luZyBkaW8gZm9yIG9wZW5pbmcKPj4gc3F1YXNoZnMg
aW1hZ2UgZmlsZT8gV2hhdCdzIHRoZSBnb2FsIG9mIHJlZHVjaW5nIGJ1ZmZlciB5b3UgbWVudGlv
bmVkCj4+IGFib3ZlLCBCZXR0ZXIgcGVyZm9ybWFuY2U/IExlc3MgbWVtb3J5IHVzYWdlPwo+Pgo+
Pgo+PiBbMV0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNDQwMDE2NTUzLTI2NDgx
LTItZ2l0LXNlbmQtZW1haWwtcmljaGFyZEBub2QuYXQvCj4gCj4gCj4gVGhlIGdvYWwgaXMgbGVz
cyBtZW1vcnkgdXNhZ2UuIEVhY2ggc3F1YXNoZnMgaXMgbW91bnRlZCB1c2luZyBsb29wYmFjawo+
IGRldmljZSwgc28gYWNjb3JkaW5nCj4gdG8gc29tZSB0aHJlYWQgb24gZGlyZWN0LWlvLCBJIHVu
ZGVyc3RhbmQgdGhhdCB3ZSB0aGVuIG5vdCBoYXZlCj4gYnVmZmVyaW5nIHR3byB0aW1lcyBvbiB1
YmlmcyBsZXZlbCBhbmQgbG9vcAo+IGxldmVsLCBidXQgdGhlIHRocmVhZCB3YXMgbm90IGNsZWFy
IHRvIG1lLiBUaGUgZGV2aWNlIGhhcyB2ZXJ5IGxpbWl0ZWQKPiBjYXBhYmlsaXR5IGFuZCBtZW1v
cnkuIEkgaGF2ZSBkb25lIHNvbWUKPiB0ZXN0IHdpdGggZnVzZSAgYnV0IEkgZGlkIG5vdCBoYXZl
IG51bWJlcnMgdG8gY29tcGFyZSB0aGVtCj4gCgpIaSBNaWNoYWVsLAoKSSB0aGluayBpdCBpcyBw
b3NzaWJsZSB0byBzdXBwb3J0IERJTyBmb3IgVUJJRlMgaW4gdGhlb3J5LCBidXQgaXQgaXMgbm90
IAphbiBlYXN5IHRhc2suIFdlIG5lZWQgdG8gaW1lcGxlbWVudCByZWFkL3dyaXRlIGZ1bmN0aW9u
cywgYW5kIHdlIHNob3VsZCAKaXRlcmF0ZSB1c2VyIGRhdGEgYnl0ZXMgYnkgVUJJRlNfQkxPQ0tf
U0laRSB1bml0LgoxLiBUaGluZ3Mgc2hvdWxkIGJlIGRvbmUgaW4gd3JpdGUgZnVuY3Rpb246CiAg
ICAxKSBEbyBzcGFjZSByZXNlcnZhdGlvbiwgcmVmZXIgdG8gdWJpZnNfd3JpdGVfYmVnaW4gLT4g
CmFsbG9jYXRlX2J1ZGdldCwgb2YgY291cmNlIHRoZSBvcmlnaW4gJ3JlcS5uZXdfcGFnZScgY2Fu
bm90IGJlIHVzZWQgYW5kIAp3ZSBzaG91bGQgZGVmaW5lIGEgbmV3IGJ1ZGdldCB0eXBlIGJhc2Vk
IG9uIFVCSUZTX0JMT0NLX1NJWkUuCiAgICAyKSByZWNvcmQgdXNlciBkYXRhIGluIGRhdGEgbm9k
ZSwgcmVmZXIgdG8gZG9fd3JpdGVwYWdlIC0+IAp1Ymlmc19qbmxfd3JpdGVfZGF0YQogICAgMykg
aW52YWxpZGF0ZSBwYWdlIGNhY2hlIGFmdGVyIGlvIGNvbXBsZXRlLCByZWZlciB0byBkaW9fY29t
cGxldGUgLT4gCmtpb2NiX2ludmFsaWRhdGVfcG9zdF9kaXJlY3Rfd3JpdGUKICAgIDQpIHJlbGVh
c2UgYnVkZ2V0LCByZWZlciB0byBkb193cml0ZXBhZ2UgLT4gCnJlbGVhc2VfbmV3X3BhZ2VfYnVk
Z2V0L3JlbGVhc2VfZXhpc3RpbmdfcGFnZV9idWRnZXQKMi4gVGhpbmdzIHNob3VsZCBiZSBkb25l
IGluIHJlYWQgZnVuY3Rpb246CiAgICAxKSBzeW5jIHBhZ2UgY2FjaGUgZGF0YSB0byBkaXNrLCBt
YWtlIHN1cmUgdGhhdCBkaW8gcmVhZGluZyBnZXQgdGhlIApsYXRlc3QgdXNlciBkYXRhLCByZWZl
ciB0byBfX2Jsb2NrZGV2X2RpcmVjdF9JTyAtPiAKZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5n
ZQogICAgMikgcmVhZCBkYXRhIGZyb20gVUhJRlMsIHJlZmVyIHRvIGRvX3JlYWRwYWdlIC0+IHJl
YWRfYmxvY2sKTWF5YmUgdGhlcmUgYXJlIG1hbnkgdHJpdmlhbCBkZXRhaWxzIGR1cmluZyBkZXZl
bG9waW5nLgo+IAo+IE1pY2hhZWwKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
