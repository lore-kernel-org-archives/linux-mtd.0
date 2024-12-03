Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688BFE74AC8
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 19:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0CLGGF8+XSCM8lUCPIksk6I6gzpTyAxzFGws9B/YGUM=; b=VwyMJ7i0dSbvurvDqjz38brKAv
	/GNe7Nr9e+lSm+Jh5f7NHAbCXFRq+FT2Iog41jaMVTLtIjfxAC0zQ8IqHbPB9OxlUSJ3lpq49e+e1
	qMPjf5hUNy4ENHapekOHshPvES7I+1rZkmceuxSqsaceSM/4he6oyD8kGljvez1l+hWuFQoEnvUvp
	sHQOQ6gmjDY4gOSDD9CMqzlex4LHi4q5AyPFTNfQP/AAkcY9Uwl7OOe3ohqElCXpCMWEmPuC/DGAq
	xBP+asKSKqTjF8K0ElDboLQbnZP6i8bi1XFO1HSMYfIhG8Tm4DdEqfqgD1TwXlXZnEed6Nc9bfGnM
	H0aboHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYHI-0000000ARgO-0Ku8;
	Tue, 03 Dec 2024 19:09:44 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYHE-0000000ARfu-1Uws
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 19:09:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E78802F330E;
	Tue,  3 Dec 2024 20:09:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 02vAHf3eohnS; Tue,  3 Dec 2024 20:09:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 49D2A2F332D;
	Tue,  3 Dec 2024 20:09:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fBXDwqR0EptP; Tue,  3 Dec 2024 20:09:36 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 216ED2F330E;
	Tue,  3 Dec 2024 20:09:36 +0100 (CET)
Date: Tue, 3 Dec 2024 20:09:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <rickard.andersson@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <149851565.29327533.1733252975843.JavaMail.zimbra@nod.at>
In-Reply-To: <20241127091050.1254359-2-rickard.andersson@axis.com>
References: <20241127091050.1254359-1-rickard.andersson@axis.com> <20241127091050.1254359-2-rickard.andersson@axis.com>
Subject: Re: [PATCH v2 2/2] ubi: Implement ioctl for detailed erase counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: Implement ioctl for detailed erase counters
Thread-Index: Vljsj72iVOU2FKPLOmHGsvOhGvbN0A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_110940_703059_A98F635D 
X-CRM114-Status: GOOD (  16.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Umlja2FyZCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJSaWNrYXJk
IFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4gQW46ICJyaWNoYXJk
IiA8cmljaGFyZEBub2QuYXQ+LCAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LAo+ICJyaWNr
YXJkMzE0IGFuZGVyc3NvbiIgPHJpY2thcmQzMTQuYW5kZXJzc29uQGdtYWlsLmNvbT4KPiBDQzog
IlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4sICJrZXJu
ZWwiIDxrZXJuZWxAYXhpcy5jb20+Cj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAyNy4gTm92ZW1iZXIg
MjAyNCAxMDoxMDo1MAo+IEJldHJlZmY6IFtQQVRDSCB2MiAyLzJdIHViaTogSW1wbGVtZW50IGlv
Y3RsIGZvciBkZXRhaWxlZCBlcmFzZSBjb3VudGVycwoKPiBDdXJyZW50bHksICJtYXhfZWMiIGNh
biBiZSByZWFkIGZyb20gc3lzZnMsIHdoaWNoIHByb3ZpZGVzIGEgbGltaXRlZAo+IHZpZXcgb2Yg
dGhlIGZsYXNoIGRldmljZeKAmXMgd2Vhci4gSW4gY2VydGFpbiBjYXNlcywgc3VjaCBhcyBidWdz
IGluCj4gdGhlIHdlYXItbGV2ZWxpbmcgYWxnb3JpdGhtLCBzcGVjaWZpYyBibG9ja3MgY2FuIGJl
IHdvcm4gZG93biBtb3JlCj4gdGhhbiBvdGhlcnMsIHJlc3VsdGluZyBpbiB1bmV2ZW4gd2VhciBk
aXN0cmlidXRpb24uIEFsc28gc29tZSB1c2UgY2FzZXMKPiBjYW4gd2VhciB0aGUgZXJhc2UgYmxv
Y2tzIG9mIHRoZSBmYXN0bWFwIGFyZWEgbW9yZSBoZWF2aWx5IHRoYW4gb3RoZXIKPiBwYXJ0cyBv
ZiBmbGFzaC4KPiBQcm92aWRpbmcgZGV0YWlsZWQgZXJhc2UgY291bnRlciB2YWx1ZXMgZ2l2ZSBh
IGJldHRlciB1bmRlcnN0YW5kaW5nIG9mCj4gdGhlIG92ZXJhbGwgZmxhc2ggd2VhciBhbmQgaXMg
bmVlZGVkIHRvIGJlIGFibGUgdG8gY2FsY3VsYXRlIGZvciBleGFtcGxlCj4gZXhwZWN0ZWQgbGlm
ZSB0aW1lLgo+IFRoZXJlIGV4aXN0cyBtb3JlIGRldGFpbGVkIGluZm8gaW4gZGVidWdmcywgYnV0
IHRoaXMgaW5mb3JtYXRpb24gaXMKPiBvbmx5IGF2YWlsYWJsZSBmb3IgZGVidWcgYnVpbGRzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2thcmQgQW5kZXJzc29uIDxyaWNrYXJkLmFuZGVyc3NvbkBh
eGlzLmNvbT4KPiAtLS0KPiBkcml2ZXJzL210ZC91YmkvY2Rldi5jIHwgOTYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDk2IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2NkZXYuYyBiL2RyaXZl
cnMvbXRkL3ViaS9jZGV2LmMKPiBpbmRleCAwZDhmMDRjZjAzYzUuLjY4MWNmODUyNmUyZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJp
L2NkZXYuYwo+IEBAIC04MjgsNiArODI4LDk2IEBAIHN0YXRpYyBpbnQgcmVuYW1lX3ZvbHVtZXMo
c3RydWN0IHViaV9kZXZpY2UgKnViaSwKPiAJcmV0dXJuIGVycjsKPiB9Cj4gCj4gKwo+ICtzdGF0
aWMgaW50IHViaV9nZXRfZWNfaW5mbyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJp
X2VjaW5mb19yZXEgX191c2VyCj4gKnVyZXEpCj4gK3sKPiArCXN0cnVjdCB1YmlfZWNpbmZvX3Jl
cSByZXE7Cj4gKwlzdHJ1Y3QgdWJpX3dsX2VudHJ5ICp3bDsKPiArCWludCBpOwo+ICsJaW50IHBl
YjsKPiArCWludCBlbmRfcGViOwo+ICsJaW50IGVyciA9IDA7Cj4gKwlpbnQgbWF4X2VsZW07Cj4g
KwlpbnQzMl90ICplcmFzZV9jb3VudGVyczsKPiArCj4gKwkvKiBDb3B5IHRoZSBpbnB1dCBhcmd1
bWVudHMgKi8KPiArCWVyciA9IGNvcHlfZnJvbV91c2VyKCZyZXEsIHVyZXEsIHNpemVvZihzdHJ1
Y3QgdWJpX2VjaW5mb19yZXEpKTsKPiArCWlmIChlcnIpIHsKPiArCQllcnIgPSAtRUZBVUxUOwo+
ICsJCWdvdG8gb3V0Owo+ICsJfQo+ICsKPiArCS8qIENoZWNrIGlucHV0IGFyZ3VtZW50cyAqLwo+
ICsJaWYgKHJlcS5sZW5ndGggPD0gMCB8fCByZXEuc3RhcnQgPCAwKSB7Cj4gKwkJZXJyID0gLUVJ
TlZBTDsKPiArCQlnb3RvIG91dDsKPiArCX0KPiArCj4gKwltYXhfZWxlbSA9IHJlcS5sZW5ndGg7
Cj4gKwo+ICsJLyogV2UgY2FuIG5vdCByZWFkIG1vcmUgdGhhbiB0aGUgdG90YWwgYW1vdW50IG9m
IFBFQnMgKi8KPiArCWlmIChtYXhfZWxlbSA+IHViaS0+cGViX2NvdW50KQo+ICsJCW1heF9lbGVt
ID0gdWJpLT5wZWJfY291bnQ7Cj4gKwo+ICsJLyogQ2hlY2sgZm9yIG92ZXJmbG93ICovCj4gKwlp
ZiAocmVxLnN0YXJ0ICsgbWF4X2VsZW0gPCByZXEuc3RhcnQpIHsKCllvdSBjYW4gdXNlIGNoZWNr
X2FkZF9vdmVyZmxvdygpIG9yIGEgc2ltaWxhciBoZWxwZXIuCgo+ICsJCWVyciA9IC1FSU5WQUw7
Cj4gKwkJZ290byBvdXQ7Cj4gKwl9Cj4gKwo+ICsJZXJhc2VfY291bnRlcnMgPSBrbWFsbG9jX2Fy
cmF5KG1heF9lbGVtLAo+ICsJCQkJICAgICAgIHNpemVvZihpbnQzMl90KSwKPiArCQkJCSAgICAg
ICBHRlBfS0VSTkVMKTsKCkkgZG9uJ3QgdGhpbmsgdGhpcyB0ZW1wb3JhbGx5IGJ1ZmZlciBpcyBu
ZWVkZWQuCkVzcGVjaWFsbHkgc2luY2UgdGhlIGFsbG9jYXRpb24gaXMgdXNlcnNwYWNlIGNvbnRy
b2xsZWQgYW5kIHVuYm91bmQsCml0IGNhbiBiZSBhIHByb2JsZW0gbGF0ZXIuCgo+ICsJaWYgKCFl
cmFzZV9jb3VudGVycykgewo+ICsJCWVyciA9IC1FTk9NRU07Cj4gKwkJZ290byBvdXQ7Cj4gKwl9
Cj4gKwo+ICsJZW5kX3BlYiA9IHJlcS5zdGFydCArIG1heF9lbGVtOwo+ICsJaWYgKGVuZF9wZWIg
PiB1YmktPnBlYl9jb3VudCkKPiArCQllbmRfcGViID0gdWJpLT5wZWJfY291bnQ7Cj4gKwo+ICsJ
aSA9IDA7Cj4gKwlmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5kX3BlYjsgaSsrLCBwZWIr
Kykgewo+ICsJCWludCBlYzsKPiArCj4gKwkJaWYgKHViaV9pb19pc19iYWQodWJpLCBwZWIpKSB7
Cj4gKwkJCWVyYXNlX2NvdW50ZXJzW2ldID0gVUJJX1VOS05PV047Cj4gKwkJCWNvbnRpbnVlOwo+
ICsJCX0KPiArCj4gKwkJc3Bpbl9sb2NrKCZ1YmktPndsX2xvY2spOwo+ICsKPiArCQl3bCA9IHVi
aS0+bG9va3VwdGJsW3BlYl07Cj4gKwkJaWYgKHdsKQo+ICsJCQllYyA9IHdsLT5lYzsKPiArCQll
bHNlCj4gKwkJCWVjID0gVUJJX1VOS05PV047Cj4gKwo+ICsJCXNwaW5fdW5sb2NrKCZ1YmktPnds
X2xvY2spOwo+ICsKPiArCQllcmFzZV9jb3VudGVyc1tpXSA9IGVjOwoKTXkgaWRlYSB3YXkgdXNp
bmcgdGhlcmUgc29tZXRoaW5nIGxpa2UgX19wdXRfdXNlcigpIHRvIGRpcmVjdGx5IHdyaXRlIHRo
ZQpyZWNvcmQgdG8gdXNlcnNwYWNlIG1lbW9yeS4KV2l0aCBhbiBhY2Nlc3Nfb2soKSBjaGVjayBi
ZWZvcmUgeW91IGNhbiBtYWtlIHN1cmUgdGhhdCB0aGUgd2hvbGUgZGVzdGluYXRpb24KaXMgd2l0
aGluIHVzZXJzcGFjZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
