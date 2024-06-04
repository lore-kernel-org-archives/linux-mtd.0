Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2750C25B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=diPlVGbu2z/ev+Pl/xeFMQcxIzCfALB6hlJvmQMLFVA=; b=rreDw4vqX7C/S8g4dv+0O8f3Q/
	ZNYamJojyzapTC2m2vWeOtKh7W8MnGQ5mclqoMoRPB1wgwX598QcCaqnpdD3ouPXZWfExN7m8G9Bp
	9z+eEx/1y0rl6f1sIZ5MSghJpLmS3tB0xz7wuNTJld2qadyT8L51ySaL+h3M7f8krj1OQLC6Xw0rd
	dsnsXhiLk1EM6ObzJ9CEXeOw3h3ESnuqTeYNKzyvFjd8H2q9d99N2YPaVdgCiD2vsDpSYgQbXgLWK
	VVQjBWQUMtzsfvHZdV76db4zoagkLnKpGf84ixfCKKMw2Tpj9+/UYZYk/6XWAqwCpPipOywns5oke
	U3EHfrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENx0-00000001QXs-3F2i;
	Tue, 04 Jun 2024 06:47:18 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENww-00000001QV9-3MCL
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 06:47:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 549986195FFA;
	Tue,  4 Jun 2024 08:47:03 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id YzDUPDSwBJ_A; Tue,  4 Jun 2024 08:47:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9CA466196362;
	Tue,  4 Jun 2024 08:47:02 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BFJurwzu1JWs; Tue,  4 Jun 2024 08:47:02 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7C98D6195FFA;
	Tue,  4 Jun 2024 08:47:02 +0200 (CEST)
Date: Tue, 4 Jun 2024 08:47:02 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Rickard x Andersson <rickaran@axis.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>
Message-ID: <1076184265.187322.1717483622377.JavaMail.zimbra@nod.at>
In-Reply-To: <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com> <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
Subject: Re: Lots of fastmap writes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Lots of fastmap writes
Thread-Index: 3yRJ1E2LDWGWd7ZXTjaCXmF4uE27+Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_234715_218580_ACC6F5E1 
X-CRM114-Status: GOOD (  10.43  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiUmlja2FyZCB4IEFuZGVyc3NvbiIgPHJpY2th
cmFuQGF4aXMuY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJsaW51eC1tdGQiIDxs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBDQzogInJpY2thcmQzMTQgYW5kZXJzc29u
IiA8cmlja2FyZDMxNC5hbmRlcnNzb25AZ21haWwuY29tPgo+IEdlc2VuZGV0OiBEaWVuc3RhZywg
NC4gSnVuaSAyMDI0IDAzOjQxOjIxCj4gQmV0cmVmZjogUmU6IExvdHMgb2YgZmFzdG1hcCB3cml0
ZXMKCj4g5ZyoIDIwMjQvNi8zIDE2OjU1LCBSaWNrYXJkIHggQW5kZXJzc29uIOWGmemBkzoKPj4g
SGksCj4+IAo+PiBJIGhhdmUgYSBzeXN0ZW0gcnVubmluZyBMaW51eCA1LjEwIHdoaWNoIGxvZ3Mg
cXVpdGUgYSBsb3QgdG8gYSBkYXRhYmFzZS4KPj4gVGhlIHN5c3RlbSBoYXMgYmVlbiBydW5uaW5n
IE9LIHNpbmNlIGJlZm9yZSBDaHJpc3RtYXMgYnV0IG5vdyBpdCB1c3VhbGx5Cj4+IGZhaWxzIGFm
dGVyIGEgZmV3IGhvdXJzIHdpdGggZXJyb3JzIGxpa2UgdGhlc2U6Cj4+IAo+PiBNYXnCoCA2IDIy
OjI5OjU4IDE3Mi4yNi4yMDMuOTDCoMKgIHdhcm5pbmcgdWJpMiB3YXJuaW5nOiB1YmlfaW9fcmVh
ZDogZXJyb3IKPj4gLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNTggYnl0ZXMgZnJvbSBQ
RUIgMToyMzA4NzIsIHJlYWQgb25seSA1OAo+PiBieXRlcywgcmV0cnkKPj4gTWF5wqAgNyAwMDox
MTowOCAxNzIuMjYuMjAzLjkwwqDCoCB3YXJuaW5nIHViaTIgd2FybmluZzogdWJpX2lvX3JlYWQ6
IGVycm9yCj4+IC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVC
IDQwOjIzOTc1MiwgcmVhZCBvbmx5IDU4Cj4+IGJ5dGVzLCByZXRyeQo+PiBNYXnCoCA3IDAwOjEx
OjA4IDE3Mi4yNi4yMDMuOTDCoMKgIGVycsKgwqDCoMKgIHViaTIgZXJyb3I6IHViaV9pb19yZWFk
OiBlcnJvcgo+PiAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA1OCBieXRlcyBmcm9tIFBF
QiA0MDoyMzk3NTIsIHJlYWQgNTggYnl0ZXMKPj4gCj4+IEZhc3RtYXAgaXMgdXNlZCBvbiB0aGlz
IHN5c3RlbS4gVGhlIEVDQyBlcnJvcnMgYXJlIHVzdWFsbHkgaW4gdGhlCj4+IGZhc3RtYXAgYXJl
YSwgZXJhc2UgYmxvY2tzIDAtIDYzLgo+PiAKPj4gV2hlbiBsb29raW5nIG1vcmUgY2xvc2VseSBh
dCB0aGUgZXJhc2UgY291bnRlcnMgdGhleSBsb29rIHNvbWV0aGluZyBsaWtlCj4+IHRoaXM6Cj4+
IAo+PiAwIC0gNjM6IDI5NjAwCj4+IDY0IC0gMjA0MzogMjIwMAoKQXJlIGFsbCBvZiB0aGUgZmly
c3QgNjQgTEVCcyB3b3JuIG91dCB0aGF0IGJhZGx5IG9yIGp1c3Qgb25lPwogCj4gVHJ5IHRoaXMg
c2VyaWVzIG9mIHBhdGNoZXMKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAy
MzA4MTIwODAwMDUuMzE2MjEyNS0yLWNoZW5nemhpaGFvMUBodWF3ZWkuY29tL1QvCj4+IAo+PiBJ
dCBzZWVtcyBsaWtlIDMwICUgb2YgdGhlIHdyaXRlcyBhcmUgd3JpdGVzIHRvIHRoZSBmYXN0bWFw
IGFyZWEuIEFueQo+PiBpZGVhcyBvZiB3aGF0IGNhbiBjYXVzZSB0aGlzIG1hbnkgd3JpdGVzIHRv
IHRoZSBmYXN0bWFwIGFyZWE/IEhlYXZ5IGxvYWQ/Cj4+IAo+PiBBbnkgaWRlYXMgYXJlIHdlbGNv
bWUuCj4+IAo+PiBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHg5OCwgQ2hp
cCBJRDogMHhkYwo+PiBuYW5kOiBUb3NoaWJhIFRDNThOVkcyUzBIIDRHIDMuM1YgOC1iaXQKPj4g
bmFuZDogNTEyIE1pQiwgU0xDLCBlcmFzZSBzaXplOiAyNTYgS2lCLCBwYWdlIHNpemU6IDQwOTYs
IE9PQiBzaXplOiAyNTYKPj4gbmFuZDogMiBjaGlwcyBkZXRlY3RlZAo+PiAKPj4gVUJJRlMgKHVi
aTI6MCk6IE1vdW50aW5nIGluIGF1dGhlbnRpY2F0ZWQgbW9kZQo+PiBVQklGUyAodWJpMjowKTog
YmFja2dyb3VuZCB0aHJlYWQgInViaWZzX2JndDJfMCIgc3RhcnRlZCwgUElEIDE4Nwo+PiBVQklG
UyAodWJpMjowKTogVUJJRlM6IG1vdW50ZWQgVUJJIGRldmljZSAyLCB2b2x1bWUgMCwgbmFtZSAi
ZGF0YV92b2x1bWUiCj4+IFVCSUZTICh1YmkyOjApOiBMRUIgc2l6ZTogMjUzOTUyIGJ5dGVzICgy
NDggS2lCKSwgbWluLi9tYXguIEkvTyB1bml0Cj4+IHNpemVzOiA0MDk2IGJ5dGVzLzQwOTYgYnl0
ZXMKPj4gVUJJRlMgKHViaTI6MCk6IEZTIHNpemU6IDUwNTExMDUyOCBieXRlcyAoNDgxIE1pQiwg
MTk4OSBMRUJzKSwgam91cm5hbAo+PiBzaXplIDI1Mzk1MjAwIGJ5dGVzICgyNCBNaUIsIDEwMCBM
RUJzKQo+PiBVQklGUyAodWJpMjowKTogcmVzZXJ2ZWQgZm9yIHJvb3Q6IDQ2NzY1NzUgYnl0ZXMg
KDQ1NjYgS2lCKQo+PiBVQklGUyAodWJpMjowKTogbWVkaWEgZm9ybWF0OiB3NS9yMCAobGF0ZXN0
IGlzIHc1L3IwKSwgVVVJRAo+PiA5OTBBNDYwRC1BNTVFLTRCNTgtQUNBRC0wMUZFQkM3QUY4Mzks
IHNtYWxsIExQVCBtb2RlbAo+PiAKPj4gdWJpMjogZGVmYXVsdCBmYXN0bWFwIHBvb2wgc2l6ZTog
MTAwCj4+IHViaTI6IGRlZmF1bHQgZmFzdG1hcCBXTCBwb29sIHNpemU6IDUwCj4+IHViaTI6IGF0
dGFjaGluZyBtdGQ1Cj4+IHViaTI6IGF0dGFjaGVkIGJ5IGZhc3RtYXAKPj4gdWJpMjogZmFzdG1h
cCBwb29sIHNpemU6IDEwMAo+PiB1YmkyOiBmYXN0bWFwIFdMIHBvb2wgc2l6ZTogNTAKCkFzIFpo
aWhhbyBDaGVuZyBzYWlkLCBoaXMgcGF0Y2ggc2VyaWVzIG1pZ2h0IGhlbHAuCk1ha2luZyB0aGUg
ZmFzdG1hcCBwb29scyBsYXJnZXIgaXMgYWxzbyBhbiBvcHRpb24uCldpdGggbGFyZ2VyIHBvb2xz
LCBmYXN0bWFwIG5lZWRzIHdyaXRlIGxlc3Mgb2Z0ZW4sIGJ1dCBzY2FuCm1vcmUgYXQgYXR0YWNo
IHRpbWUuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
