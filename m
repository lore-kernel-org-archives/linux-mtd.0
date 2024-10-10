Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F39CCEDDA9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2024 03:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSVaaNw1Q6taR5/n3kOyoM4QQgF7xHuInvto2vCgZI4=; b=nGqknZjxolnyww/oFfbuKndvnb
	i7jznW7K67jaan/NfBONbsVM8MaumTZghx9qvmxDUePpIbpCu9AzXjqtT/CzoNY0K1ZMh+nUuibgM
	Bd0+9kbXO8sf7SEzFinHnbZuh15zZQ/rgNHym0WWCHxRrszaQw0Dc3AHuvwrg/EllZvfrmorKrKxZ
	JabsUr00oUPuEGSvUsrodWjD5pUlLWvbD3fKdfzCO0WLmTDtcSZYokdJYLQTnkx1/OQX77lA1mfrz
	iMLp2cfUXWj1HcpyIf217x0oFpXxP0Z/jDpY76rdDoiWQOAa36SjGk05IGaqNk6u6A44b0Vy9chvG
	tbtc0kgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syjXp-0000000BN02-34sQ;
	Thu, 10 Oct 2024 03:08:53 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syjWr-0000000BMu3-2ogl
	for linux-mtd@lists.infradead.org;
	Thu, 10 Oct 2024 03:07:55 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XPF5p4fbLz1j9dk;
	Thu, 10 Oct 2024 11:06:38 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 93E2B140360;
	Thu, 10 Oct 2024 11:07:44 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Oct 2024 11:07:43 +0800
Subject: Re: [PATCH 2/4] ubi: Expose mean erase counter for fastmap in sysfs
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Rickard x Andersson <rickaran@axis.com>, Rickard Andersson
	<rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
 <20241004082208.1103202-2-rickard.andersson@axis.com>
 <1351167a-6313-9e98-eafd-c8c9e6fe1a5f@huawei.com>
 <62bf5f12-cae1-d3d9-bebf-7b30ed81a726@axis.com>
 <372320c9-fdf8-ef7d-f9f7-4728b9cd3fe5@huawei.com>
Message-ID: <9059f872-55c2-76db-3b65-af97afeb4fdc@huawei.com>
Date: Thu, 10 Oct 2024 11:07:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <372320c9-fdf8-ef7d-f9f7-4728b9cd3fe5@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_200754_177784_033DDE69 
X-CRM114-Status: GOOD (  19.88  )
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

5ZyoIDIwMjQvMTAvMTAgMTA6NTgsIFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4g5ZyoIDIwMjQvMTAv
OSAyMTo0NCwgUmlja2FyZCB4IEFuZGVyc3NvbiDlhpnpgZM6Cj4+IE9uIDEwLzgvMjQgMTE6Mjcs
IFpoaWhhbyBDaGVuZyB3cm90ZToKPj4+IOWcqCAyMDI0LzEwLzQgMTY6MjIsIFJpY2thcmQgQW5k
ZXJzc29uIOWGmemBkzoKPj4+PiBTaW5jZSB0aGUgZmFzdG1hcCBhcmVhIGhhcyBpdHMgb3duIHdl
YXIgbGV2ZWxsaW5nIGl0IGlzIHZhbHVhYmxlIHRvCj4+Pj4gcHJvdmlkZSBhIG1lYW4gdmFsdWUg
Zm9yIHRoYXQgYXJlYS4gVGhpcyB2YWx1ZSBjYW4gYmUgdXNlZCBpbiBvcmRlcgo+Pj4+IHRvIGVz
dGltYXRlIGxpZmUgZXhwZWN0YW5jeSBvZiB0aGUgZmxhc2guCj4+Pj4KPj4+Cj4+PiBUaGVyZSBh
cmUgMiBjYXNlcyBzaG93biBhcyBmb2xsb3dpbmc6Cj4+PiAxKSBmYXN0bWFwIGlzIGRpc2FibGVk
OiBXZSBjYW4gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIHdlYXItbGV2ZWxpbmcgCj4+PiBhbGdvcml0
aG0gd29ya3MgZmluZSBieSBjb21wYXJpbmcgJ21heF9lYycgd2l0aCAnbWVhbl9lYycuCj4+PiAy
KSBmYXN0bWFwIGlzIGVuYWJsZWQ6IFRoZSBtYXhfZWMgbWF5IGNvbWUgZnJvbSBmaXJzdCA2NCBQ
RUJzKGZhc3RtYXAgCj4+PiBhcmVhKSwgb3IgaXQgbWF5IGNvbWUgZnJvbSBkYXRhIGFyZWEocG51
bSA+IDY0KSwgaG93IGNhbiB3ZSBkZXRlcm1pbmUgCj4+PiB3aGV0aGVyIHRoZSB3ZWFyLWxldmVs
aW5nIGFsZ29yaXRobSB3b3JrcyBmaW5lIGZvciBkYXRhIGFyZWE/Cj4+Cj4+IFRoYW5rcyBmb3Ig
dGhlIGZlZWRiYWNrLgo+Pgo+PiBNeSBtYWluIGdvYWwgaXMgdG8gcHJvdmlkZSBtZWFuIHZhbHVl
cyB0byBkZXRlcm1pbmUgaG93IHdvcm4gZG93biB0aGUgCj4+IGZsYXNoIGlzLiBJIGFtIHNvcnQg
b2YgYXNzdW1pbmcgdGhhdCB0aGUgd2VhciBsZXZlbGluZyBhbGdvcml0aG0gd29ya3MgCj4+IGJ1
dCB0aGF0IGl0IHByZXZpb3VzbHkgaGFkIGJ1Z3MsIHdoaWNoIG1hZGUgaXQgZGlmZmljdWx0IHRv
IHVzZSBtYXhfZWMgCj4+IHRvIGdldCBhIGNvbXBsZXRlIHBpY3R1cmUgb2YgdGhlIHdlYXIuCj4+
IEkgY291bGQgYWRkIG1heF9lY19mYXN0bWFwIGZvciBzeW1tZXRyeSBpZiB5b3Ugd2FudD8gVGhl
biBJIHdpbGwgbWFrZSAKPj4gbWF4X2VjX2Zhc3RtYXAgY292ZXIgYmxvY2tzIDAgLSA2MywgYW5k
IG1heF9lYyB3aWxsIGNvdmVyIDAgLSBMQVNUX0JMT0NLLgo+Pgo+IAo+IEhvdyBhYm91dCBwcm92
aWRpbmcgZm91ciB2YXJpYWJsZXM6Cj4gMS4gbWVhbl9lY19kYXRhOiBtZWFuIGVjIGZvciBkYXRh
IGFyZWEKPiAyLiBtYXhfZWNfZGF0YTptYXggZWMgZm9yIGRhdGEgYXJlYQo+IDMuIG1lYW5fZWNf
ZmFzdG1hcDptZWFuIGVjIGZvciBmYXN0bWFwIGFyZWEKPiA0LiBtYXhfZWNfZmFzdG1hcDptYXgg
ZWMgZm9yIGZhc3RtYXAgYXJlYQo+IAo+IElmIENPTkZJR19NVERfVUJJX0ZBU1RNQVAgaXMgZW5h
YmxlZCwgYWxsIHZhcmlhYmxlcyBhcmUgZGlzcGxheWVkIHVuZGVyIAo+IHN5c2ZzLCBtZWFuX2Vj
X2RhdGEgYW5kIG1heF9lY19kYXRhIGFyZSBjYWxjdWxhdGVkIGJ5IDY0fkxBU1RfUEVCLCAKPiBt
ZWFuX2VjX2Zhc3RtYXAgYW5kIG1heF9lY19mYXN0bWFwIGFyZSBjYWxjdWxhdGVkIGJ5IDB+NjQg
UEVCcywgZGVzcGl0ZSAKPiB3aGF0ZXZlciAndWJpLT5mbV9kaXNhYmxlZCcgaXMuCj4gSWYgQ09O
RklHX01URF9VQklfRkFTVE1BUCBpcyBkaXNhYmxlZCwgb25seSBtZWFuX2VjX2RhdGEgYW5kIG1h
eF9lY19kYXRhIAo+IGFyZSBkaXNwbGF5ZWQgdW5kZXIgc3lzZnMsIHRoZSBtZWFuX2VjX2RhdGEg
YW5kIG1heF9lY19kYXRhIGFyZSAKPiBjYWxjdWxhdGVkIGJ5IGFsbCBQRUJzLgo+IAoKQmVzaWRl
cyB0aGF0LCB5b3UgY2FuIGFkZCBhIHZhcmlhYmxlIG5hbWVkIG1lYW5fZWMgd2hpY2ggY291bGQg
c3RvcmUgdGhlIAphdmVyYWdlIGVjIGNvdW50ZXIgZnJvbSBhbGwgUEVCcywgc28geW91IGNhbiBr
bm93IHRoZSBvdmVyYWxsIHdvcm4gZG93biAKb2YgdGhlIGZsYXNoLiBBbHRob3VnaCB0aGlzIHZh
bHVlIGNhbiBiZSBjYWxjdWxhdGVkIGJ5IG1lYW5fZWNfZmFzdG1hcCwgCm1lYW5fZWNfZGF0YSBh
bmQgdG90YWxfZXJhc2VibG9ja3MuCj4+Pgo+Pj4gJ2lmICghdWJpLT5mbV9kaXNhYmxlZCkpJyBp
cyBlbm91Z2guCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGViX2NvdW50ID0gVUJJX0ZN
X01BWF9TVEFSVDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAwOyAvKiBObyBmYXN0bWFwIG9uIHRoaXMgVUJJIGRldmljZSAqLwo+
Pj4KPj4+IElmIHdlIGZvcm1hdCAvZGV2L210ZFggYnkgY29tbWFuZCAndWJpZm9ybWF0IC1lIDAn
LCB0aGUgcmV0dXJuIHZhbHVlIAo+Pj4gJzAnIG1heSBjb25mdXNlIHVzLCBpdCBtZWFucyB0aGF0
IHRoZSBmYXN0bWFwIGlzIGRpc2FibGVkIG9yIHRoZSAKPj4+IG1lYW5fZWNfZmFzdG1hcCBpcyAw
Lgo+Pgo+PiBEbyB5b3UgcHJlZmVyIHRoZSBmdW5jdGlvbiAiZGV2X2F0dHJpYnV0ZV9zaG93IiB0
byByZXR1cm4gLUVOT0RFViBpbiAKPj4gY2FzZSB3ZSBoYXZlIG5vIGZhc3RtYXA/IEkuZSB0aGlz
IGJlaGF2aW9yOgo+Pgo+PiAvc3lzL2NsYXNzL3ViaS91YmkwICMgY2F0IG1lYW5fZWNfZmFzdG1h
cAo+PiBjYXQ6IHJlYWQgZXJyb3I6IE5vIHN1Y2ggZGV2aWNlCj4+Cj4+IEJlc3QgcmVnYXJkcywK
Pj4gUmlja2FyZCBBbmRlcnNzb24KPj4KPj4KPj4gLgo+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
