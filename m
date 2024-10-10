Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88FBCEDDB7
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2024 02:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4erdTAE3KZwJfecbqpfYbgYUksFQya0pjnj8ZtpjK0=; b=IcP+nKLEC30tTGcJGEB5jx0i46
	FeoBNI2mZoYluIw6tUK0IcCOAPqrXgvjLAVQKaSRp4PovElGsrj2GvEz2tgzjFPn1UmUYiE2V/OI1
	J109lzY7A8dQIszBuXgrznYE3VPaC4wNrqu1RIId+vUEIPnUQlEQEplS/KDxTrxpGeg+JVfIWIdB2
	a3K6Lwy+RdBmDoyTyL0IXYnkjJF5iEmgdhx5XoC6co42B9Vh+vnDBoGRv+MDFNa8dveFVYCnWv/23
	JtSNKrO1G/FgQG25M/+HRvezkVch/2t8VYT9nN4eB8Mn+EKp5dJhjinppQe75LCH8YbRVrFVzb7UA
	KtdMSR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syjOJ-0000000BLa0-3P7l;
	Thu, 10 Oct 2024 02:59:03 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syjOF-0000000BLWx-2F5f
	for linux-mtd@lists.infradead.org;
	Thu, 10 Oct 2024 02:59:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XPDvX1ZCvz1SCNt;
	Thu, 10 Oct 2024 10:57:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E45B61A0190;
	Thu, 10 Oct 2024 10:58:50 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Oct 2024 10:58:50 +0800
Subject: Re: [PATCH 2/4] ubi: Expose mean erase counter for fastmap in sysfs
To: Rickard x Andersson <rickaran@axis.com>, Rickard Andersson
	<rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
 <20241004082208.1103202-2-rickard.andersson@axis.com>
 <1351167a-6313-9e98-eafd-c8c9e6fe1a5f@huawei.com>
 <62bf5f12-cae1-d3d9-bebf-7b30ed81a726@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <372320c9-fdf8-ef7d-f9f7-4728b9cd3fe5@huawei.com>
Date: Thu, 10 Oct 2024 10:58:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <62bf5f12-cae1-d3d9-bebf-7b30ed81a726@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_195900_060742_3E6FA073 
X-CRM114-Status: GOOD (  19.45  )
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

5ZyoIDIwMjQvMTAvOSAyMTo0NCwgUmlja2FyZCB4IEFuZGVyc3NvbiDlhpnpgZM6Cj4gT24gMTAv
OC8yNCAxMToyNywgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiDlnKggMjAyNC8xMC80IDE2OjIyLCBS
aWNrYXJkIEFuZGVyc3NvbiDlhpnpgZM6Cj4+PiBTaW5jZSB0aGUgZmFzdG1hcCBhcmVhIGhhcyBp
dHMgb3duIHdlYXIgbGV2ZWxsaW5nIGl0IGlzIHZhbHVhYmxlIHRvCj4+PiBwcm92aWRlIGEgbWVh
biB2YWx1ZSBmb3IgdGhhdCBhcmVhLiBUaGlzIHZhbHVlIGNhbiBiZSB1c2VkIGluIG9yZGVyCj4+
PiB0byBlc3RpbWF0ZSBsaWZlIGV4cGVjdGFuY3kgb2YgdGhlIGZsYXNoLgo+Pj4KPj4KPj4gVGhl
cmUgYXJlIDIgY2FzZXMgc2hvd24gYXMgZm9sbG93aW5nOgo+PiAxKSBmYXN0bWFwIGlzIGRpc2Fi
bGVkOiBXZSBjYW4gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIHdlYXItbGV2ZWxpbmcgCj4+IGFsZ29y
aXRobSB3b3JrcyBmaW5lIGJ5IGNvbXBhcmluZyAnbWF4X2VjJyB3aXRoICdtZWFuX2VjJy4KPj4g
MikgZmFzdG1hcCBpcyBlbmFibGVkOiBUaGUgbWF4X2VjIG1heSBjb21lIGZyb20gZmlyc3QgNjQg
UEVCcyhmYXN0bWFwIAo+PiBhcmVhKSwgb3IgaXQgbWF5IGNvbWUgZnJvbSBkYXRhIGFyZWEocG51
bSA+IDY0KSwgaG93IGNhbiB3ZSBkZXRlcm1pbmUgCj4+IHdoZXRoZXIgdGhlIHdlYXItbGV2ZWxp
bmcgYWxnb3JpdGhtIHdvcmtzIGZpbmUgZm9yIGRhdGEgYXJlYT8KPiAKPiBUaGFua3MgZm9yIHRo
ZSBmZWVkYmFjay4KPiAKPiBNeSBtYWluIGdvYWwgaXMgdG8gcHJvdmlkZSBtZWFuIHZhbHVlcyB0
byBkZXRlcm1pbmUgaG93IHdvcm4gZG93biB0aGUgCj4gZmxhc2ggaXMuIEkgYW0gc29ydCBvZiBh
c3N1bWluZyB0aGF0IHRoZSB3ZWFyIGxldmVsaW5nIGFsZ29yaXRobSB3b3JrcyAKPiBidXQgdGhh
dCBpdCBwcmV2aW91c2x5IGhhZCBidWdzLCB3aGljaCBtYWRlIGl0IGRpZmZpY3VsdCB0byB1c2Ug
bWF4X2VjIAo+IHRvIGdldCBhIGNvbXBsZXRlIHBpY3R1cmUgb2YgdGhlIHdlYXIuCj4gSSBjb3Vs
ZCBhZGQgbWF4X2VjX2Zhc3RtYXAgZm9yIHN5bW1ldHJ5IGlmIHlvdSB3YW50PyBUaGVuIEkgd2ls
bCBtYWtlIAo+IG1heF9lY19mYXN0bWFwIGNvdmVyIGJsb2NrcyAwIC0gNjMsIGFuZCBtYXhfZWMg
d2lsbCBjb3ZlciAwIC0gTEFTVF9CTE9DSy4KPiAKCkhvdyBhYm91dCBwcm92aWRpbmcgZm91ciB2
YXJpYWJsZXM6CjEuIG1lYW5fZWNfZGF0YTogbWVhbiBlYyBmb3IgZGF0YSBhcmVhCjIuIG1heF9l
Y19kYXRhOm1heCBlYyBmb3IgZGF0YSBhcmVhCjMuIG1lYW5fZWNfZmFzdG1hcDptZWFuIGVjIGZv
ciBmYXN0bWFwIGFyZWEKNC4gbWF4X2VjX2Zhc3RtYXA6bWF4IGVjIGZvciBmYXN0bWFwIGFyZWEK
CklmIENPTkZJR19NVERfVUJJX0ZBU1RNQVAgaXMgZW5hYmxlZCwgYWxsIHZhcmlhYmxlcyBhcmUg
ZGlzcGxheWVkIHVuZGVyIApzeXNmcywgbWVhbl9lY19kYXRhIGFuZCBtYXhfZWNfZGF0YSBhcmUg
Y2FsY3VsYXRlZCBieSA2NH5MQVNUX1BFQiwgCm1lYW5fZWNfZmFzdG1hcCBhbmQgbWF4X2VjX2Zh
c3RtYXAgYXJlIGNhbGN1bGF0ZWQgYnkgMH42NCBQRUJzLCBkZXNwaXRlIAp3aGF0ZXZlciAndWJp
LT5mbV9kaXNhYmxlZCcgaXMuCklmIENPTkZJR19NVERfVUJJX0ZBU1RNQVAgaXMgZGlzYWJsZWQs
IG9ubHkgbWVhbl9lY19kYXRhIGFuZCBtYXhfZWNfZGF0YSAKYXJlIGRpc3BsYXllZCB1bmRlciBz
eXNmcywgdGhlIG1lYW5fZWNfZGF0YSBhbmQgbWF4X2VjX2RhdGEgYXJlIApjYWxjdWxhdGVkIGJ5
IGFsbCBQRUJzLgoKPj4KPj4gJ2lmICghdWJpLT5mbV9kaXNhYmxlZCkpJyBpcyBlbm91Z2guCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZWJfY291bnQgPSBVQklfRk1fTUFYX1NUQVJUOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAwOyAvKiBObyBmYXN0bWFwIG9uIHRoaXMgVUJJIGRldmljZSAqLwo+Pgo+PiBJZiB3ZSBmb3Jt
YXQgL2Rldi9tdGRYIGJ5IGNvbW1hbmQgJ3ViaWZvcm1hdCAtZSAwJywgdGhlIHJldHVybiB2YWx1
ZSAKPj4gJzAnIG1heSBjb25mdXNlIHVzLCBpdCBtZWFucyB0aGF0IHRoZSBmYXN0bWFwIGlzIGRp
c2FibGVkIG9yIHRoZSAKPj4gbWVhbl9lY19mYXN0bWFwIGlzIDAuCj4gCj4gRG8geW91IHByZWZl
ciB0aGUgZnVuY3Rpb24gImRldl9hdHRyaWJ1dGVfc2hvdyIgdG8gcmV0dXJuIC1FTk9ERVYgaW4g
Cj4gY2FzZSB3ZSBoYXZlIG5vIGZhc3RtYXA/IEkuZSB0aGlzIGJlaGF2aW9yOgo+IAo+IC9zeXMv
Y2xhc3MvdWJpL3ViaTAgIyBjYXQgbWVhbl9lY19mYXN0bWFwCj4gY2F0OiByZWFkIGVycm9yOiBO
byBzdWNoIGRldmljZQo+IAo+IEJlc3QgcmVnYXJkcywKPiBSaWNrYXJkIEFuZGVyc3Nvbgo+IAo+
IAo+IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
