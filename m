Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33172C47DDB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 04:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGerT5svhmkuIQQt+8xQaLELV5WTGav7NdRwPTMh200=; b=ShovpjiAI8W8vcKW1tLC1nmcG+
	YOWAi+ZnjMc5NaiT3lNmySBDtmji3M3s31miYWEswqubUtfGVFVzudk9L7SF8GjfQQkZr/kWjb3WR
	zX7R2/nTRUUoufGA2N9NNHOyfAtDcDHgU3LiAJDtUk5dwgv3YFDgGQ6OCePR1Z/XNfYZ8W0qjFatm
	TjO6Nd8C388apf45jFU+nFJ5VI73cyuZ1xEIarokSiO9/5DBRc+zyaqmzfHTq6lYf1JfirqS8Lfjj
	fzTVKRsV2vb9M6oaPO2RTwGoFJW2BhaB7cTYGhZSY+9VjSEHC2iEOtmDmNVr1ZNW5nCBOe92x4veN
	0UFuGstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8OF-00F46s-1K;
	Tue, 23 Jan 2024 04:27:59 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8OC-00F46C-10
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 04:27:58 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TJvD027Ydz29kb3;
	Tue, 23 Jan 2024 12:26:08 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 781741A016F;
	Tue, 23 Jan 2024 12:27:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 12:27:35 +0800
Subject: Re: [PATCH 08/15] ubifs: Convert ubifs_write_begin() to use a folio
To: Matthew Wilcox <willy@infradead.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-9-willy@infradead.org>
 <0f015efd-4142-764c-24b3-e413f5e16d4c@huawei.com>
 <Za5-_9hwEdPhI-or@casper.infradead.org>
 <1df263aa-99bc-81d2-305e-f5c7a6cc690c@huawei.com>
 <Za8tVQv_V0084b-C@casper.infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <915710b3-88a9-8b08-82a4-728f0c52866a@huawei.com>
Date: Tue, 23 Jan 2024 12:27:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Za8tVQv_V0084b-C@casper.infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_202756_555046_16438694 
X-CRM114-Status: GOOD (  16.69  )
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

5ZyoIDIwMjQvMS8yMyAxMTowNywgTWF0dGhldyBXaWxjb3gg5YaZ6YGTOgo+IE9uIFR1ZSwgSmFu
IDIzLCAyMDI0IGF0IDEwOjE1OjUwQU0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4g5Zyo
IDIwMjQvMS8yMiAyMjo0MywgTWF0dGhldyBXaWxjb3gg5YaZ6YGTOgo+Pj4gT24gTW9uLCBKYW4g
MjIsIDIwMjQgYXQgMDc6NTE6MDNQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+Pj4+IFdo
eSBub3QgbGVuID09IGZvbGlvX3NpemUoZm9saW8pPyBBbHRob3VnaCAnbGVuID49IGZvbGlvX3Np
emUoZm9saW8pJyBpcyBub3QKPj4+PiB3cm9uZy4KPj4+Cj4+PiBUaGlzIGlzIGJhc2VkIG9uIG15
IGV4cGVyaWVuY2Ugd2l0aCBpb21hcC4gIFRvZGF5LCB0aGUgY2FsbGVyIHBhc3NlcyBpbgo+Pj4g
bWluKGxlbmd0aC1vZi13cml0ZSwgUEFHRV9TSVpFKS4gIEluIG9yZGVyIHRvIGJlIGFibGUgdG8g
Y3JlYXRlIGxhcmdlCj4+PiBmb2xpb3MgaW4gdGhlIHdyaXRlIHBhdGgsIHdlIHdhbnQgdG8gY2hh
bmdlIHRoZSBjYWxsZXIgb2Ygd3JpdGVfYmVnaW4KPj4+IHRvIHBhc3MgaW4gdGhlIGxlbmd0aCBv
ZiB0aGUgd3JpdGUsIHNvIHdlIGNhbiBzZWUgYSBsZW4gd2hpY2ggaXMgbGFyZ2VyCj4+PiB0aGFu
IHRoZSBzaXplIG9mIHRoZSBmb2xpbyB3ZSBmb3VuZC4KPj4KPj4gSSBndWVzcyB5b3UgYXJlIHBy
ZXBhcmluZyBmb3IgYWRkaW5nIGxhcmdlIGZvbGlvIHN1cHBvcnQgZm9yCj4+IGdlbmVyaWNfcGVy
Zm9ybV93cml0ZSBwYXRoLCBtYXkgSSBoYXZlIGEgbG9vayBmb3IgdGhlIGRlbW8gY29kZT8gSSdt
IGEKPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjQwMTExMTky
NTEzLjM1MDU3NjktMS13aWxseUBpbmZyYWRlYWQub3JnLwo+IChub3cgd2l0aGRyYXduIGJlY2F1
c2UgaXQgYnJlYWtzIGV4dDQpCj4gCj4+IGxpdHRsZSBjb25mdXNlZCBmb3IgdGhpcyB3b3JkcyAi
d2Ugd2FudCB0byBjaGFuZ2UgdGhlIGNhbGxlciBvZiB3cml0ZV9iZWdpbgo+PiB0byBwYXNzIGlu
IHRoZSBsZW5ndGggb2YgdGhlIHdyaXRlIi4gQWNjb3JkaW5nIHRvIHRoZSBpbXBsZW1lbnRhdGlv
biBvZgo+PiBpb21hcF93cml0ZV9pdGVyKCksIEkgZmluZCB0aGUgd3JpdGUgbGVuZ3RoIGluIGVh
Y2ggaXRlcmF0aW9uIGlzCj4+IG1pbih3cml0ZV9ieXRlcywgZm9saW9fc2l6ZSksIHNvIEkgZ3Vl
c3MgdGhlIHdyaXRlIGxlbmd0aCBwYXNzZWQgaW4KPj4gdWJpZnNfd3JpdGVfYmVnaW4gd29uJ3Qg
ZXhjZWVkIGZvbGlvX3NpemUuCj4gCj4gQnV0IHRoYXQgaGFwcGVucyBhZnRlciB3cml0ZV9iZWdp
biwgYmVjYXVzZSB3ZSBkb24ndCBrbm93IHdoYXQgdGhlIGZvbGlvCj4gc2l6ZSB3aWxsIGJlIHVu
dGlsIHdlJ3ZlIGNhbGxlZCB3cml0ZV9iZWdpbi4KPiAKPiBpZSB3ZSBjYWxsIHdyaXRlX2JlZ2lu
LCBwYXNzaW5nIGluIHRoZSBzaXplIHJlbWFpbmluZyBmcm9tIHRoZSB3cml0ZS4KPiBJZiB3cml0
ZV9iZWdpbiBmaW5kcyBhbiBleGlzdGluZyBmb2xpbyBpbiB0aGUgcGFnZSBjYWNoZSwgd2UgdXNl
IGl0Lgo+IElmIG5vdCwgd2UgYWxsb2NhdGUgYSBmb2xpbyBiYXNlZCBvbiB0aGUgc2l6ZSBvZiB0
aGUgd3JpdGUuICBBZnRlcgo+IHdyaXRlX2JlZ2luIHJldHVybnMgYSBmb2xpbywgd2UgbGltaXQg
dGhlIG51bWJlciBvZiBieXRlcyBjb3BpZWQgdG8gdGhlCj4gc2l6ZSBvZiB0aGUgZm9saW8uCj4g
Lgo+IAoKTWFrZXMgc2Vuc2UuIFRoYW5rcyBmb3IgdGhlIGV4cGxhaW5hdGlvbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
