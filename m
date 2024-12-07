Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E4CE7717B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zGsKshZ+lRn90HvSmQL7W6yC/VFeaN1J/WbFjhK/ps=; b=YeH2LMQ+fbC18nVKF+VHcVZ/eu
	r2bNZe6duefwXkl8hq+bFTc9AIwQSb+HzvGHVHKGoMt3o2JM53zi+pJS6kiB3d8VAfxiGDEzEjQAp
	IXDj5Ps3y6ETQ0AMJIEz0eDfXO33lmige9srvp4ZvCza63ZC4vlwgvIKxFwGXl4BsbmlIXLSclL+R
	daMkwk5eB7h606BHKe23U2oRuJ42nMeTvUuIb+i1WOLjPnpg49NqQqvk7tJFJcQIE5f64tN7cLazj
	1m9MHMb49MoDNE1z8uxwGwzUfvbTiwOOee79fezBe2hAVDhi43t4dl+jBuPsFeh+mGJLs8IIyxH5m
	+VUD7RoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJr4y-00000003m2e-20U6;
	Sat, 07 Dec 2024 09:26:24 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJr4v-00000003m21-1ExU
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 09:26:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Y52jk282CzgZ7R;
	Sat,  7 Dec 2024 17:23:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 825031800D9;
	Sat,  7 Dec 2024 17:26:13 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Dec 2024 17:26:12 +0800
Subject: Re: [PATCH v3 2/2] ubi: Implement ioctl for detailed erase counters
To: Richard Weinberger <richard@nod.at>, Rickard X Andersson
	<rickard.andersson@axis.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, rickard314 andersson
	<rickard314.andersson@gmail.com>, kernel <kernel@axis.com>
References: <20241206115127.2304701-1-rickard.andersson@axis.com>
 <20241206115127.2304701-2-rickard.andersson@axis.com>
 <adeb2ad0-f922-9bb6-db68-deaf7983704b@huawei.com>
 <745357310.45555475.1733558789826.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e2d4bf96-8d16-649c-a274-bd0c7df9fe19@huawei.com>
Date: Sat, 7 Dec 2024 17:26:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <745357310.45555475.1733558789826.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_012621_669538_D27F5C0C 
X-CRM114-Status: GOOD (  20.03  )
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

5ZyoIDIwMjQvMTIvNyAxNjowNiwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPgo+PiBBbjogIlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFu
ZGVyc3NvbkBheGlzLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAibGludXgtbXRk
Igo+PiDlnKggMjAyNC8xMi82IDE5OjUxLCBSaWNrYXJkIEFuZGVyc3NvbiDlhpnpgZM6Cj4+PiBD
dXJyZW50bHksICJtYXhfZWMiIGNhbiBiZSByZWFkIGZyb20gc3lzZnMsIHdoaWNoIHByb3ZpZGVz
IGEgbGltaXRlZAo+Pj4gdmlldyBvZiB0aGUgZmxhc2ggZGV2aWNl4oCZcyB3ZWFyLiBJbiBjZXJ0
YWluIGNhc2VzLCBzdWNoIGFzIGJ1Z3MgaW4KPj4+IHRoZSB3ZWFyLWxldmVsaW5nIGFsZ29yaXRo
bSwgc3BlY2lmaWMgYmxvY2tzIGNhbiBiZSB3b3JuIGRvd24gbW9yZQo+Pj4gdGhhbiBvdGhlcnMs
IHJlc3VsdGluZyBpbiB1bmV2ZW4gd2VhciBkaXN0cmlidXRpb24uIEFsc28gc29tZSB1c2UgY2Fz
ZXMKPj4+IGNhbiB3ZWFyIHRoZSBlcmFzZSBibG9ja3Mgb2YgdGhlIGZhc3RtYXAgYXJlYSBtb3Jl
IGhlYXZpbHkgdGhhbiBvdGhlcgo+Pj4gcGFydHMgb2YgZmxhc2guCj4+PiBQcm92aWRpbmcgZGV0
YWlsZWQgZXJhc2UgY291bnRlciB2YWx1ZXMgZ2l2ZSBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9m
Cj4+PiB0aGUgb3ZlcmFsbCBmbGFzaCB3ZWFyIGFuZCBpcyBuZWVkZWQgdG8gYmUgYWJsZSB0byBj
YWxjdWxhdGUgZm9yIGV4YW1wbGUKPj4+IGV4cGVjdGVkIGxpZmUgdGltZS4KPj4+IFRoZXJlIGV4
aXN0cyBtb3JlIGRldGFpbGVkIGluZm8gaW4gZGVidWdmcywgYnV0IHRoaXMgaW5mb3JtYXRpb24g
aXMKPj4+IG9ubHkgYXZhaWxhYmxlIGZvciBkZWJ1ZyBidWlsZHMuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+Pj4g
LS0tCj4+PiAgICBkcml2ZXJzL210ZC91YmkvY2Rldi5jIHwgNzIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0
aW9ucygrKQo+Pgo+PiBIaSBSaWNrYXJkLiBTb21lIHNtYWxsIG5pdHMgYmVsb3cuCj4gCj4gUGxl
YXNlIGFsc28gcnVuIGNoZWNrcGF0Y2gucGwsIHRoZXJlIGFyZSBzb21lIGNvZGluZyBzdHlsZSBp
c3N1ZXMuCj4gT3ZlcmFsbCB0aGUgY2hhbmdlIGxvb2tzIGdvb2QgdG8gbWUgYW5kIGNhbiBiZSBt
ZXJnZWQgc29vbiEKPiAKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2NkZXYu
YyBiL2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMKPj4+IGluZGV4IDBkOGYwNGNmMDNjNS4uYmNkYzQ3
Mzc0NTc4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2NkZXYuYwo+Pj4gKysrIGIv
ZHJpdmVycy9tdGQvdWJpL2NkZXYuYwo+Pj4gQEAgLTgyOCw2ICs4MjgsNzIgQEAgc3RhdGljIGlu
dCByZW5hbWVfdm9sdW1lcyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAo+Pj4gICAgCXJldHVybiBl
cnI7Cj4+PiAgICB9Cj4+PiAgICAKPj4+ICtzdGF0aWMgaW50IHViaV9nZXRfZWNfaW5mbyhzdHJ1
Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX2VjaW5mb19yZXEgX191c2VyCj4+PiAqdXJl
cSkKPj4+ICt7Cj4+PiArCXN0cnVjdCB1YmlfZWNpbmZvX3JlcSByZXE7Cj4+PiArCXN0cnVjdCB1
Ymlfd2xfZW50cnkgKndsOwo+Pj4gKwlpbnQgaTsKPj4KPj4gV2UgY2FuIHVzZSBhIG9idmlvdXMg
bmFtZSBsaWtlICdyZWFkX2NudCcgb3IgJ3JlYWRfbGVuZ3RoJywgaW5zdGVhZCBvZiAnaScuCj4+
PiArCWludCBwZWI7Cj4+PiArCWludCBlbmRfcGViOwo+Pj4gKwo+Pj4gKwkvKiBDb3B5IHRoZSBp
bnB1dCBhcmd1bWVudHMgKi8KPj4+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZyZXEsIHVyZXEsIHNp
emVvZihzdHJ1Y3QgdWJpX2VjaW5mb19yZXEpKSkKPj4+ICsJCXJldHVybiAtRUZBVUxUOwo+Pj4g
Kwo+Pj4gKwkvKiBDaGVjayBpbnB1dCBhcmd1bWVudHMgKi8KPj4+ICsJaWYgKHJlcS5sZW5ndGgg
PD0gMCB8fCByZXEuc3RhcnQgPCAwKQo+Pgo+PiBIb3cgYWJvdXQgJ2lmIChyZXEubGVuZ3RoIDw9
IDAgfHwgcmVxLnN0YXJ0IDwgMCB8fCByZXEuc3RhcnQgPj0KPj4gdWJpLT5wZWJfY291bnQpJz8g
VGhlbiAnaWYgKHJlcS5zdGFydCA+IGVuZF9wZWIpJyBiZWxvdyBjYW4gYmUgZGVsZXRlZC4KPj4+
ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4gKwlpZiAoY2hlY2tfYWRkX292ZXJmbG93KHJl
cS5zdGFydCwgcmVxLmxlbmd0aCwgJmVuZF9wZWIpKQo+Pgo+PiBIb3cgYWJvdXQgJ2lmICh1bmxp
a2VseShjaGVja19hZGRfb3ZlcmZsb3cocmVxLnN0YXJ0LCByZXEubGVuZ3RoLAo+PiAmZW5kX3Bl
YikpKScgPwo+IAo+IFdlbGwsIHRoaXMgaXMgbm90IGEgaG90IHBhdGguIFdoYXQgaXMgdGhlIGJl
bmVmaXQgb2YgYW4gdW5saWtlbHkoKSBoZXJlPwoKTWF5YmUgdGhlICd1bmxpa2VseScgaXMgbm90
IG5lZWRlZCwgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhlIHVzZXIgd2lsbCAKY2FsbCB0aGlzIGlv
Y3RsIGZyZXF1ZW50bHkuIEknbSBhbHNvIGZpbmUgd2l0aG91dCB0aGUgJ3VubGlrZWx5Jy4KPiAK
Pj4+ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4gKwlpZiAoZW5kX3BlYiA+IHViaS0+cGVi
X2NvdW50KQo+Pj4gKwkJZW5kX3BlYiA9IHViaS0+cGViX2NvdW50Owo+Pj4gKwo+Pj4gKwlpZiAo
cmVxLnN0YXJ0ID4gZW5kX3BlYikKPj4KPj4gVGhpcyBjaGVjayBjYW4gYmUgcmVtb3ZlZC4KPj4+
ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4gKwkvKiBDaGVjayBhY2Nlc3MgcmlnaHRzIGJl
Zm9yZSBmaWxsaW5nIGVyYXNlX2NvdW50ZXJzIGFycmF5ICovCj4+PiArCWlmICghYWNjZXNzX29r
KHVyZXEtPmVyYXNlX2NvdW50ZXJzLCAoZW5kX3BlYi1yZXEuc3RhcnQpICogc2l6ZW9mKGludDMy
X3QpKSkKPj4+ICsJCXJldHVybiAtRUZBVUxUOwo+Pgo+PiBXZSBjYW4gdXNlICdwdXRfdXNlcicg
YmVsb3cgdG8gcmVwbGFjZSB0aGUgY2hlY2sgJ2FjY2Vzc19vaycuCj4gCj4gRGVwZW5kaW5nIG9u
IHRoZSBhcmNoaXRlY3R1cmUsIGFjY2Vzc19vaygpIGNhbiBiaXQgcmF0aGVyIGV4cGVuc2l2ZS4K
PiBUaGF0J3Mgd2h5IHVzaW5nIGFjY2Vzc19vaygpIG9uY2Ugb24gdGhlIHdob2xlIHJhbmdlIGFu
ZCB0aGVuIHVzaW5nCj4gdGhlIGNoZWFwIF9fcHV0X3VzZXIoKSBpbiBsb29wcyBpcyBhIGNvbW1v
biBwYXR0ZXJuLgoKTWFrZSBzZW5zZS4gcGxlYXNlIGtlZXAgdXNpbmcgYWNjZXNzX29rKCkgb25j
ZSBhbmQgdGhlbiBpbnZva2luZyAKX19wdXRfdXNlcigpIGluIGxvb3AuCj4gCj4+Cj4+IGZvciAo
cGViID0gcmVxLnN0YXJ0OyBwZWIgPCBlbmRfcGViOyBpKyssIHBlYisrKSB7Cj4+IAlpbnQgZWMg
PSBVQklfVU5LTk9XTjsKPj4KPj4gCWlmICghdWJpX2lvX2lzX2JhZCh1YmksIHBlYikpIHsKPj4g
CQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7Cj4+IAkJd2wgPSB1YmktPmxvb2t1cHRibFtwZWJd
Owo+PiAJCWlmICh3bCkKPj4gCQkJZWMgPSB3bC0+ZWM7Cj4+IAkJZWxzZQo+PiAJCQllYyA9IFVC
SV9VTktOT1dOOwo+PiAJCXNwaW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOwo+PiAJfQo+Pgo+PiAJ
aWYgKHVubGlrZWx5KHB1dF91c2VyKGVjLCB1cmVxLT5lcmFzZV9jb3VudGVycytpKSkpCj4+IAkJ
cmV0dXJuIC1FRkFVTFQ7Cj4+IH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
