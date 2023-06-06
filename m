Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690BFC7EE2A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 06:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P1Edzhy0Rs5/ubBs41hbjHJ5LRumnginUmXCS8uPEkU=; b=3+M6+0dinnPw3Nq/YslUxaOzbI
	Q1FJDvU0S9y7+HAL7QQqX5cn5sv/WolAlQ0qxxug5yzm4F+i5xMlBXiAfgf+skNgJuvLUSg9nhtf+
	dPCwoXMelWTcRr7qTEw+aJN15SMiT4bAnWQu1sg9URu0A4BwnLCbwmVNnRJSVS2X/zyP11bZqrm2V
	anZS4u9r1Jg25Gv1DPc/yNW3MzO5p7GK5McS6CQMnVBAnuyZciAZ1+VgNwD6yYtytQSVExZ/0gm+V
	4mhhO9aLTkvr+8FITpZBucr4Iui48AH3QhkSH6ToWflQpXhjBJvg/QGX8xYOi2OPz5PNKqb90qNv8
	8Ze6SBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6PxE-000L4d-2v;
	Tue, 06 Jun 2023 06:14:04 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6PxB-000L3g-0L
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 06:14:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D93F8616B2CC;
	Tue,  6 Jun 2023 08:13:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id VRpeKDLk3BOS; Tue,  6 Jun 2023 08:13:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3951A616B2CF;
	Tue,  6 Jun 2023 08:13:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AtPtdJJHZKmp; Tue,  6 Jun 2023 08:13:55 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1ACD5616B2CC;
	Tue,  6 Jun 2023 08:13:55 +0200 (CEST)
Date: Tue, 6 Jun 2023 08:13:55 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Message-ID: <406990820.3686390.1686032035024.JavaMail.zimbra@nod.at>
In-Reply-To: <ZH6mixCMHce1S+vK@casper.infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org> <20230605165029.2908304-5-willy@infradead.org> <2059298337.3685966.1686001020185.JavaMail.zimbra@nod.at> <ZH6mixCMHce1S+vK@casper.infradead.org>
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Convert do_writepage() to take a folio
Thread-Index: A5loe1Q509hPXo6nbPIZcSN7fgpWow==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_231401_451295_9D311D9F 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

TWF0dGhldywKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJNYXR0aGV3
IFdpbGNveCIgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gbGVuIGlzIGZvbGlvX3NpemUoKSwgd2hp
Y2ggaXMgbm90IDAuCj4gCj4gICAgICAgIGxlbiA9IG9mZnNldF9pbl9mb2xpbyhmb2xpbywgaV9z
aXplKTsKCm9mZnNldF9pbl9mb2xpbyhmb2xpbywgaV9zaXplKSBjYW4gZ2l2ZSAwLgoKRnVydGhl
ciBpdCB3aWxsIGNhbGwgZG9fd3JpdGVwYWdlKCkgd2l0aCBsZW4gYmVpbmcgMC4KSSBjYW4gYWN0
dWFsbHkgdHJpZ2dlciB0aGlzIGNhc2UuCgpCeSBhZGRpbmcgdGhlIGZvbGxvd2luZyB1Ymlmc19h
c3NlcnQoKSBJIGNhbiBjYXRjaCB0aGUgd3JpdGUgc2lkZS4KSWYgdGhlIGZpbGUgbGVuZ3RoIGlz
IGEgbXVsdGlwbGUgb2YgUEFHRV9TSVpFICg0ayksIGl0IHdpbGwgdHJpZ2dlci4KCmRpZmYgLS1n
aXQgYS9mcy91Ymlmcy9maWxlLmMgYi9mcy91Ymlmcy9maWxlLmMKaW5kZXggNjdjZjUxMzhjY2M0
OC4uZGMzOWVhMzY4Y2EyYiAxMDA2NDQKLS0tIGEvZnMvdWJpZnMvZmlsZS5jCisrKyBiL2ZzL3Vi
aWZzL2ZpbGUuYwpAQCAtMTA1OSw2ICsxMDU5LDggQEAgc3RhdGljIGludCB1Ymlmc193cml0ZXBh
Z2Uoc3RydWN0IGZvbGlvICpmb2xpbywgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMsCiAg
ICAgICAgZm9saW9femVyb19zZWdtZW50KGZvbGlvLCBvZmZzZXRfaW5fZm9saW8oZm9saW8sIGlf
c2l6ZSksIGxlbik7CiAgICAgICAgbGVuID0gb2Zmc2V0X2luX2ZvbGlvKGZvbGlvLCBpX3NpemUp
OwogCisgICAgICAgdWJpZnNfYXNzZXJ0KGMsIGxlbiA+IDApOworCiAgICAgICAgaWYgKGlfc2l6
ZSA+IHN5bmNlZF9pX3NpemUpIHsKICAgICAgICAgICAgICAgIGVyciA9IGlub2RlLT5pX3NiLT5z
X29wLT53cml0ZV9pbm9kZShpbm9kZSwgTlVMTCk7CiAgICAgICAgICAgICAgICBpZiAoZXJyKQoK
WyAgIDQ0LjU2OTExMF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgNTkpOiB1Ymlmc19hc3NlcnRf
ZmFpbGVkOiBVQklGUyBhc3NlcnQgZmFpbGVkOiBsZW4gPiAwLCBpbiBmcy91Ymlmcy9maWxlLmM6
MTA2MgpbICAgNDQuNTcxMzU5XSBVQklGUyB3YXJuaW5nICh1YmkwOjAgcGlkIDU5KTogdWJpZnNf
cm9fbW9kZS5wYXJ0LjY6IHN3aXRjaGVkIHRvIHJlYWQtb25seSBtb2RlLCBlcnJvciAtMjIKWyAg
IDQ0LjU3Mjk5OF0gQ1BVOiAxIFBJRDogNTkgQ29tbToga3dvcmtlci91ODoyIE5vdCB0YWludGVk
IDYuNC4wLXJjNS0wMDAwNC1nZDUwNGI4MTViNzFjLWRpcnR5ICMxOQpbICAgNDQuNTc0MTM5XSBI
YXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklP
UyByZWwtMS4xNS4wLTAtZzJkZDRiOWItcmVidWlsdC5vcGVuc3VzZS5vcmcgMDQvMDEvMjAxNApb
ICAgNDQuNTc0MTQxXSBXb3JrcXVldWU6IHdyaXRlYmFjayB3Yl93b3JrZm4gKGZsdXNoLXViaWZz
XzBfMCkKWyAgIDQ0LjU3NDE0OF0gQ2FsbCBUcmFjZToKWyAgIDQ0LjU3NDE2Ml0gIDxUQVNLPgpb
ICAgNDQuNTc0MTY1XSAgZHVtcF9zdGFja19sdmwrMHgzMi8weDUwClsgICA0NC41NzQxNzJdICB1
Ymlmc193cml0ZXBhZ2UrMHgyNWEvMHgyNzAKWyAgIDQ0LjU3ODA5Nl0gIHdyaXRlX2NhY2hlX3Bh
Z2VzKzB4MTMyLzB4M2EwClsgICA0NC41NzgxMDNdICA/IF9fcGZ4X3ViaWZzX3dyaXRlcGFnZSsw
eDEwLzB4MTAKWyAgIDQ0LjU3ODEwN10gID8gdmlydHF1ZXVlX2FkZF9zZ3MrMHg3Yi8weDkwClsg
ICA0NC41NzgxMTNdICBkb193cml0ZXBhZ2VzKzB4ZDMvMHgxYTAKWyAgIDQ0LjU3ODExNl0gID8g
a3ZtX2Nsb2NrX3JlYWQrMHgxNC8weDMwClsgICA0NC41NzgxMjFdICA/IGt2bV9zY2hlZF9jbG9j
a19yZWFkKzB4NS8weDIwClsgICA0NC41NzgxMjVdICBfX3dyaXRlYmFja19zaW5nbGVfaW5vZGUr
MHgzYy8weDM1MApbICAgNDQuNTc4MTI4XSAgd3JpdGViYWNrX3NiX2lub2RlcysweDFjOS8weDQ2
MApbICAgNDQuNTc4MTMzXSAgX193cml0ZWJhY2tfaW5vZGVzX3diKzB4NWEvMHhjMApbICAgNDQu
NTgyNTA4XSAgd2Jfd3JpdGViYWNrKzB4MjMwLzB4MmMwClsgICA0NC41ODI1MTNdICB3Yl93b3Jr
Zm4rMHgzMDEvMHg0MzAKWyAgIDQ0LjU4MjUxNV0gID8ga3ZtX2Nsb2NrX3JlYWQrMHgxNC8weDMw
ClsgICA0NC41ODI1MTldICA/IGt2bV9zY2hlZF9jbG9ja19yZWFkKzB4NS8weDIwClsgICA0NC41
ODI1MjNdICA/IHNjaGVkX2Nsb2NrX2NwdSsweGQvMHgxOTAKWyAgIDQ0LjU4MjUyN10gID8gX19z
bXBfY2FsbF9zaW5nbGVfcXVldWUrMHhhMS8weDExMApbICAgNDQuNTgyNTMyXSAgcHJvY2Vzc19v
bmVfd29yaysweDFmMy8weDNmMApbICAgNDQuNTgyNTM4XSAgd29ya2VyX3RocmVhZCsweDI1LzB4
M2IwClsgICA0NC41ODYxOTZdICA/IF9fcGZ4X3dvcmtlcl90aHJlYWQrMHgxMC8weDEwClsgICA0
NC41ODYyMDFdICBrdGhyZWFkKzB4ZGUvMHgxMTAKWyAgIDQ0LjU4NjIwNF0gID8gX19wZnhfa3Ro
cmVhZCsweDEwLzB4MTAKWyAgIDQ0LjU4NjIwN10gIHJldF9mcm9tX2ZvcmsrMHgyYy8weDUwClsg
ICA0NC41ODYyMTJdICA8L1RBU0s+CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
