Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32114C982D8
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 19:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+J0mTgBgVtDxxp2DaXtKs7gHtiTudx32HRo4h0VIUE=; b=PiziEH1ne9J3kh
	rJ6lD+OTKNzr18vuplr1sYZ5823NL1Ua+/G2ogDT000RzHlT39uYqrJqmO4ugqsbyUurFpou71V1I
	DlxaeJiD/rpGCE/elFvpW0G40ehBiEjqfmzd2giKkQH0rSsL8NJzz37H8Um87/tzunVa10Vohoc+n
	IRPTIWSW70VPr0FaSVn09JLKB4SYYR2SAhPF0H/l4H6cNO7BwSLMFPNMkfEmANtPRarlv4zWsdc4N
	OffGritWVMw+19wMQCcUVyTq6Io8j2lX+W1u62+VWLvwnLH9Wjfi1mImMDQOQPgeEimlSUZHnAfF/
	7lreIsaYwNE7+x8KmEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MpL-00000000HBF-2Cw4;
	Sun, 20 Sep 2026 19:03:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MpK-00000000HB9-1Dsl
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 19:03:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C4114024D;
	Sun, 20 Sep 2026 19:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D3B1F000FF;
	Sun, 20 Sep 2026 19:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789931029;
	bh=uctREekJWe2tktIr51UN2v2iX/QbiRDqbdXt9T790Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ETvVvOkYral8ovAAwmT4vAbJd6JYEYV6Z9HLDw/lKsOINOvQChdECow0Cu3ESNnbM
	 nkV8Rz5CCTlKXopFOPP54olYlEPqd9N0+IWJooL3nd0UpgebvaiRrU8HEgFQ6+fqUg
	 XqYbm5UvSE9ee3tAPShA7P6C9PtTJcOj4qIM0xM1qdmEVKggARmL9FMO/19YeesCK5
	 Vyheyv+/NDqPwNd7KxzkK0R1J763t0UwR5hMYjb1zJy1X7UpV7E4hmuidgN8KGIpD9
	 tNyK7hUkAiHLqo7hqcEkRNWhOBt402eqVf1MPYz9DsRk/WZSHmTSAsTTIHFFZ9PMD+
	 kbcXDqY90+/8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mtd: block2mtd: defer device open out of param/sysfs
 write
To: miquel.raynal@bootlin.com, richard@nod.at, "Chris Roy" <iam@thechris.in>, vigneshr@ti.com
Cc: syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, joern@barelysecure.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
In-Reply-To: <20260920185132.1266699-1-iam@thechris.in>
References: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
 <20260920185132.1266699-1-iam@thechris.in>
Date: Sun, 20 Sep 2026 19:03:48 +0000
Message-Id: <20260920190348.B4D3B1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogYmxvY2sybXRk
OiB1c2UtYWZ0ZXItZnJlZSBhbmQgcmVzb3VyY2UgbGVhayBvbiBpbml0IGZhaWx1cmUKLSBbSGln
aF0gbXRkOiBibG9jazJtdGQ6IHN5c2ZzIGxvY2sgaW52ZXJzaW9uIGJ5cGFzc2VzIHdvcmtxdWV1
ZSBkZWZlcnJhbAotLQoKY29tbWl0IGMzZjNlYmQ4NmVjYzYzZGQwN2U2YTIyZDg1MjdlYWRhZWI3
NjE2MzMKQXV0aG9yOiBDaHJpcyBSb3kgPGlhbUB0aGVjaHJpcy5pbj4KCm10ZDogYmxvY2sybXRk
OiBkZWZlciBkZXZpY2Ugb3BlbiBvdXQgb2YgcGFyYW0vc3lzZnMgd3JpdGUKClRoaXMgcGF0Y2gg
ZGVmZXJzIGJsb2NrMm10ZF9zZXR1cCgpIGRldmljZSBvcGVuaW5nIHRvIGEgZGVkaWNhdGVkIG9y
ZGVyZWQKd29ya3F1ZXVlIHRvIHByZXZlbnQgbG9ja2RlcC1kZXRlY3RlZCBsb2NrIGludmVyc2lv
biBiZXR3ZWVuIFZGUyBhbmQKa2VybmZzL292ZXJsYXlmcyBkdXJpbmcgc3lzZnMgd3JpdGVzLiBU
aGUgc2V0dXAgd29yayBpcyBleGVjdXRlZCB2aWEgYQpkeW5hbWljYWxseSBhbGxvY2F0ZWQgd29y
ayBpdGVtLCBwcmVzZXJ2aW5nIHN5bmNocm9ub3VzIGJlaGF2aW9yIHdpdGgKd2FpdF9mb3JfY29t
cGxldGlvbigpLgoKQ2xvc2VzOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0
aWQ9N2NhYjZhMTk2MTlmMWI4ZWZjMDAKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvYmxvY2sybXRkLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCj4gaW5kZXgg
MzQ5ZmEwN2JlMzE0Yy4uMzBhYzkzMjViZGQyYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9k
ZXZpY2VzL2Jsb2NrMm10ZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQu
YwpbIC4uLiBdCj4gQEAgLTQ2MSwzMSArNDY2LDg1IEBAIHN0YXRpYyBpbnQgYmxvY2sybXRkX3Nl
dHVwMihjb25zdCBjaGFyICp2YWwpClsgLi4uIF0KPiAgc3RhdGljIGludCBibG9jazJtdGRfc2V0
dXAoY29uc3QgY2hhciAqdmFsLCBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtICprcCkKPiAgewpb
IC4uLiBdCj4gKwlpZiAoc2V0dXBfd3EpIHsKPiArCQlyZXQgPSBibG9jazJtdGRfc2V0dXBfZGVm
ZXIodmFsKTsKPiArCX0gZWxzZSB7Cj4gKwkJLyogTm90IHlldCBkZWZlcnJlZCB0byBzZXR1cF93
cTsgc2FmZSB0byBjYWxsIHNldHVwMiBkaXJlY3RseSAqLwo+ICsJCW11dGV4X2xvY2soJmxpc3Rf
bXV0ZXgpOwo+ICsJCXJldCA9IGJsb2NrMm10ZF9zZXR1cDIodmFsKTsKPiArCQltdXRleF91bmxv
Y2soJmxpc3RfbXV0ZXgpOwo+ICsJfQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGV2YWx1YXRpbmcg
c2V0dXBfd3EgaGVyZSBieXBhc3MgdGhlIHdvcmtxdWV1ZSBkZWZlcnJhbCBhbmQgcmUtaW50cm9k
dWNlCnRoZSBzeXNmcyBsb2NrIGludmVyc2lvbj8KClNpbmNlIG1vZF9zeXNmc19zZXR1cCgpIGV4
cG9zZXMgbW9kdWxlIHBhcmFtZXRlcnMgdG8gc3lzZnMgYmVmb3JlCmRvX2luaXRfbW9kdWxlKCkg
Y2FsbHMgYmxvY2sybXRkX2luaXQoKSwgc2V0dXBfd3EgY2FuIGJlIE5VTEwgZHVyaW5nIGEKY29u
Y3VycmVudCBzeXNmcyB3cml0ZS4KClRoaXMgd291bGQgY2F1c2UgdGhlIHN5c2ZzIHdyaXRlciB0
byBleGVjdXRlIGJsb2NrMm10ZF9zZXR1cDIoKSBpbmxpbmUgdW5kZXIKdGhlIHN5c2ZzIGtlcm5m
cyBsb2NrLgoKQWRkaXRpb25hbGx5LCBzaW5jZSBzZXR1cF93cSBpcyBhc3NpZ25lZCBpbiBibG9j
azJtdGRfaW5pdCgpIHdpdGhvdXQgbWVtb3J5CmJhcnJpZXJzIChzdWNoIGFzIHNtcF9zdG9yZV9y
ZWxlYXNlKCkgYW5kIHNtcF9sb2FkX2FjcXVpcmUoKSksIGNvbmN1cnJlbnQKc3lzZnMgd3JpdGVy
cyBtaWdodCBvYnNlcnZlIGEgc3RhbGUgTlVMTCBwb2ludGVyIGV2ZW4gYWZ0ZXIgaW5pdGlhbGl6
YXRpb24KY29tcGxldGVzLgoKPiArCj4gKwlrZXJuZWxfcGFyYW1fbG9jayhrcC0+bW9kKTsKPiAr
CW1vZHVsZV9wdXQoa3AtPm1vZCk7Cj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICAKPiBAQCAt
NDk2LDEwICs1NTUsMTcgQEAgc3RhdGljIGludCBfX2luaXQgYmxvY2sybXRkX2luaXQodm9pZCkK
PiAgewo+ICAJaW50IHJldCA9IDA7Cj4gIAo+ICsJc2V0dXBfd3EgPSBhbGxvY19vcmRlcmVkX3dv
cmtxdWV1ZSgiYmxvY2sybXRkIiwgMCk7Cj4gKwlpZiAoIXNldHVwX3dxKQo+ICsJCXJldHVybiAt
RU5PTUVNOwoKW1NldmVyaXR5OiBIaWdoXQpDYW4gcmV0dXJuaW5nIC1FTk9NRU0gaGVyZSBsZWFk
IHRvIGEgdXNlLWFmdGVyLWZyZWUgYW5kIHJlc291cmNlIGxlYWs/CgpJZiBwYXJhbWV0ZXJzIGFy
ZSBwcm92aWRlZCBkdXJpbmcgbW9kdWxlIGxvYWQKKGUuZy4sIGluc21vZCBibG9jazJtdGQua28g
YmxvY2sybXRkPS4uLiksIGJsb2NrMm10ZF9zZXR1cCgpIGlzIGV4ZWN1dGVkCmJlZm9yZSBibG9j
azJtdGRfaW5pdCgpLiBCZWNhdXNlIHNldHVwX3dxIGlzIE5VTEwgYXQgdGhhdCB0aW1lLCBpdApz
eW5jaHJvbm91c2x5IHJlZ2lzdGVycyB0aGUgTVREIGRldmljZSBpbiB0aGUgYmxvY2sybXRkX3Nl
dHVwKCkgZWxzZSBicmFuY2gKc2hvd24gYWJvdmUuCgpJZiBhbGxvY19vcmRlcmVkX3dvcmtxdWV1
ZSgpIHN1YnNlcXVlbnRseSBmYWlscyBoZXJlLCBpdCByZXR1cm5zIC1FTk9NRU0gYW5kCmFib3J0
cyB0aGUgbW9kdWxlIGxvYWQuCgpUaGUga2VybmVsIGZyZWVzIHRoZSBtb2R1bGUgbWVtb3J5IHdp
dGhvdXQgY2FsbGluZyBibG9jazJtdGRfZXhpdCgpLCBsZWF2aW5nCnRoZSByZWdpc3RlcmVkIE1U
RCBkZXZpY2UgaG9sZGluZyBkYW5nbGluZyBmdW5jdGlvbiBwb2ludGVycyB0byB0aGUgdW5sb2Fk
ZWQKbW9kdWxlIHRleHQuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYwOTIwMTg1MTMyLjEyNjY2OTktMS1pYW1AdGhlY2hyaXMuaW4/
cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
