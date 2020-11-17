Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2521C388F9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 01:26:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3876A2468E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 01:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AiAIZ6Y9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3876A2468E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lf4eBmJKucoTXGDc3h3y0FZ7TQ/icYztPNeli65ZAOg=; b=AiAIZ6Y9Mmiui33y41Bm2V88u
	kz98EzVECqf4Vz6ZtHrKenx8BLnLeJoRqgmib6HEcWeKO+IN/wX+hVuh+NCxhvnH9glB+yHERWsAj
	dhkXcxLDjxd9o6C/n35K9Qcy0HVIUp0DuxOcAEJYTDLzYG9bmbRKEsK2DvjHbDdaD3ZHT1unM7mUY
	PDLrjj+5ajRIgM1Xm83RrMLgxHnPOAuB341TS/jgGs/4fETL5BpMRlO4P9ndUrCM/0sddflQSMw+S
	8NLJ6qyyFKvoRCTEX3L/+HA5uvkLEmj0DCZpQc/gTkTPDq2pa11JRQ38v+XSc2p26TjiiiEawUbHj
	VTRisq+aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kepkG-0005er-VE; Tue, 17 Nov 2020 01:25:21 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kepkD-0005eM-In
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 01:25:18 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZpC86y4JzkYxZ;
 Tue, 17 Nov 2020 09:24:52 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 17 Nov 2020 09:25:09 +0800
Subject: Re: [PATCH] ubifs: wbuf: Don't leak kernel memory to flash
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20201116210530.26230-1-richard@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bfea268f-b5c2-5467-7b17-5eef7b0269ce@huawei.com>
Date: Tue, 17 Nov 2020 09:25:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201116210530.26230-1-richard@nod.at>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_202517_894059_7F373F29 
X-CRM114-Status: GOOD (  18.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMC8xMS8xNyA1OjA1LCBSaWNoYXJkIFdlaW5iZXJnZXIg0LS1wDoKPiBXcml0ZSBidWZm
ZXJzIHVzZSBhIGttYWxsb2MoKSdlZCBidWZmZXIsIHRoZXkgY2FuIGxlYWsKPiB1cCB0byBzZXZl
biBieXRlcyBvZiBrZXJuZWwgbWVtb3J5IHRvIGZsYXNoIGlmIHdyaXRlcyBhcmUgbm90Cj4gYWxp
Z25lZC4KPiBTbyB1c2UgdWJpZnNfcGFkKCkgdG8gZmlsbCB0aGVzZSBnYXBzIHdpdGggcGFkZGlu
ZyBieXRlcy4KPiBUaGlzIHdhcyBuZXZlciBhIHByb2JsZW0gd2hpbGUgc2Nhbm5pbmcgYmVjYXVz
ZSB0aGUgc2Nhbm5lciBsb2dpYwo+IG1hbnVhbGx5IGFsaWducyBub2RlIGxlbmd0aHMgYW5kIHNr
aXBzIG92ZXIgdGhlc2UgZ2Fwcy4KPiAKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4g
Rml4ZXM6IDFlNTE3NjRhM2MyYWMwNWEyICgiVUJJRlM6IGFkZCBuZXcgZmxhc2ggZmlsZSBzeXN0
ZW0iKQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
Cj4gLS0tCj4gICBmcy91Ymlmcy9pby5jIHwgMTMgKysrKysrKysrKystLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL2lvLmMgYi9mcy91Ymlmcy9pby5jCj4gaW5kZXggN2U0YmZhZjI4NzFmLi5lYWU5
Y2Y1YTU3YjAgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvaW8uYwo+ICsrKyBiL2ZzL3ViaWZzL2lv
LmMKPiBAQCAtMzE5LDcgKzMxOSw3IEBAIHZvaWQgdWJpZnNfcGFkKGNvbnN0IHN0cnVjdCB1Ymlm
c19pbmZvICpjLCB2b2lkICpidWYsIGludCBwYWQpCj4gICB7Cj4gICAJdWludDMyX3QgY3JjOwo+
ICAgCj4gLQl1Ymlmc19hc3NlcnQoYywgcGFkID49IDAgJiYgIShwYWQgJiA3KSk7Cj4gKwl1Ymlm
c19hc3NlcnQoYywgcGFkID49IDApOwo+ICAgCj4gICAJaWYgKHBhZCA+PSBVQklGU19QQURfTk9E
RV9TWikgewo+ICAgCQlzdHJ1Y3QgdWJpZnNfY2ggKmNoID0gYnVmOwo+IEBAIC03NjQsNiArNzY0
LDEwIEBAIGludCB1Ymlmc193YnVmX3dyaXRlX25vbG9jayhzdHJ1Y3QgdWJpZnNfd2J1ZiAqd2J1
Ziwgdm9pZCAqYnVmLCBpbnQgbGVuKQo+ICAgCQkgKiB3cml0ZS1idWZmZXIuCj4gICAJCSAqLwo+
ICAgCQltZW1jcHkod2J1Zi0+YnVmICsgd2J1Zi0+dXNlZCwgYnVmLCBsZW4pOwo+ICsJCWlmIChh
bGlnbmVkX2xlbiA+IGxlbikgewo+ICsJCQl1Ymlmc19hc3NlcnQoYywgYWxpZ25lZF9sZW4gLSBs
ZW4gPCA4KTsKPiArCQkJdWJpZnNfcGFkKGMsIHdidWYtPmJ1ZiArIHdidWYtPnVzZWQgKyBsZW4s
IGFsaWduZWRfbGVuIC0gbGVuKTsKPiArCQl9Cj4gICAKPiAgIAkJaWYgKGFsaWduZWRfbGVuID09
IHdidWYtPmF2YWlsKSB7Cj4gICAJCQlkYmdfaW8oImZsdXNoIGpoZWFkICVzIHdidWYgdG8gTEVC
ICVkOiVkIiwKPiBAQCAtODU2LDEzICs4NjAsMTggQEAgaW50IHViaWZzX3didWZfd3JpdGVfbm9s
b2NrKHN0cnVjdCB1Ymlmc193YnVmICp3YnVmLCB2b2lkICpidWYsIGludCBsZW4pCj4gICAJfQo+
ICAgCj4gICAJc3Bpbl9sb2NrKCZ3YnVmLT5sb2NrKTsKPiAtCWlmIChhbGlnbmVkX2xlbikKPiAr
CWlmIChhbGlnbmVkX2xlbikgewo+ICAgCQkvKgo+ICAgCQkgKiBBbmQgbm93IHdlIGhhdmUgd2hh
dCdzIGxlZnQgYW5kIHdoYXQgZG9lcyBub3QgdGFrZSB3aG9sZQo+ICAgCQkgKiBtYXguIHdyaXRl
IHVuaXQsIHNvIHdyaXRlIGl0IHRvIHRoZSB3cml0ZS1idWZmZXIgYW5kIHdlIGFyZQo+ICAgCQkg
KiBkb25lLgo+ICAgCQkgKi8KPiAgIAkJbWVtY3B5KHdidWYtPmJ1ZiwgYnVmICsgd3JpdHRlbiwg
bGVuKTsKPiArCQlpZiAoYWxpZ25lZF9sZW4gPiBsZW4pIHsKPiArCQkJdWJpZnNfYXNzZXJ0KGMs
IGFsaWduZWRfbGVuIC0gbGVuIDwgOCk7Cj4gKwkJCXViaWZzX3BhZChjLCB3YnVmLT5idWYgKyBs
ZW4sIGFsaWduZWRfbGVuIC0gbGVuKTsKPiArCQl9Cj4gKwl9Cj4gICAKPiAgIAlpZiAoYy0+bGVi
X3NpemUgLSB3YnVmLT5vZmZzID49IGMtPm1heF93cml0ZV9zaXplKQo+ICAgCQl3YnVmLT5zaXpl
ID0gYy0+bWF4X3dyaXRlX3NpemU7Cj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
