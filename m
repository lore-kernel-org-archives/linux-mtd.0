Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AB0C79F89
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0lcQMcLbxIQcFY+zTh8KM/Rp118YWLX2EO8olyAZxI=; b=uOx0V0QG4TAlU7
	buNwEMxuSc9Obahh+SUDfL5Efqnpwob9jAlDmQCPK+C4roUsAeGcDk5DguIBUhLwnw3t8SZSCwGhA
	PqFTai9iBXeqgd51B8Wdmoa/vn1T8lBBjDB7/JVb+h/OPAUd3ZOo4yJqFZx/IWSw185auZzqzP8rl
	E0F4fm3dVeOT3jpcZ0cRfUTZEA7kBGPd89E988tFgsIyCKc0F+GAt9We92colKKR03Vo8SZampGTe
	iQ/arKbNRICptDMkUZIi2DR+QS/RAG4GOo6xx2cme3rThURGn0NTBA1BJlzO2YcOrhPDjQhK+qts1
	yywr2LUyWqSrS13flAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YXZ-00000006oHv-1Od6;
	Mon, 07 Sep 2026 12:33:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YXW-00000006oG8-0n7g
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 12:33:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 370001A1A35;
	Mon,  7 Sep 2026 12:33:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 096D960383;
	Mon,  7 Sep 2026 12:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C21BD11C79353;
	Mon,  7 Sep 2026 14:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788784408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W3Swg/3Aww/HrVatIhFO5ktuwEuVhc0PGPbbJ75c/r8=;
	b=Ixpd1Skk8Ws8EbxOBNWcmd4NigI856JcjOJ9d691wpAYFNeZyAoS3LfYWMITdvzdMbfdJj
	jlH7b1ZkANQEmfPxaXJ0gr9LBMjQG49Pe8hgVV4pUjiw0V9SEMfJiNu3F8Ld7Do6J1Z+UR
	nVo3OGLmYeIMCQQ83ndB2O5eobO8CPpXt4r0FbmpIyDZgwQzfhKUJy1aWW+HDmwb0UoPku
	QHEvA0EpczDfJy0FrunzxPbn+am1qP0cxy7T+hT/B8jr33dBHXAvencOXF9VYT12Hrzh86
	rZeuKtr6qufjv0cqd3yeHDJ+kWA97swvDzKMRUb4hGljHOPUopU1nsV305xo8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: fzz <1768315307@qq.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Richard Weinberger
 <richard@nod.at>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com> (fzz's
	message of "Mon, 7 Sep 2026 19:10:40 +0800")
References: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 07 Sep 2026 14:33:24 +0200
Message-ID: <87jyoxw8a3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_053334_371868_E76AED6A 
X-CRM114-Status: GOOD (  16.94  )
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

SGVsbG8sCgpPbiAwNy8wOS8yMDI2IGF0IDE5OjEwOjQwICswOCwgZnp6IDwxNzY4MzE1MzA3QHFx
LmNvbT4gd3JvdGU6Cgo+IFdoZW4gc3F1YXNoZnMgcmVhZHMgZmlsZXMgdGhyb3VnaCBtdGRibG9j
aywgdGhlIG10ZGJsb2NrIGxheWVyCj4gc3BsaXRzIEkvTyBpbnRvIDUxMi1ieXRlIHNlY3RvcnMu
IEZvciBhIDRLLXBhZ2UgU1BJIE5BTkQsIHRoaXMKPiBtZWFucyByZWFkaW5nIHRoZSBzYW1lIHBh
Z2UgOCB0aW1lcyAoNDA5NiAvIDUxMiksIGdlbmVyYXRpbmcgN3gKPiByZWR1bmRhbnQgU1BJIHJl
YWQtZnJvbS1jYWNoZSBvcGVyYXRpb25zLiBFYWNoIHN1Y2ggb3BlcmF0aW9uCj4gaW52b2x2ZXMg
YSBmdWxsIFNQSSBidXMgdHJhbnNhY3Rpb24sIHNpZ25pZmljYW50bHkgc2xvd2luZyBkb3duCj4g
Ym9vdCB0aW1lIGFuZCBmaWxlIGFjY2Vzcy4KPgo+IENhY2hlIHRoZSBsYXN0IHN1Y2Nlc3NmdWxs
eSByZWFkIHBhZ2UgaW4gc3BpbmFuZF9kZXZpY2UgdG8gYXZvaWQKPiB0aGVzZSByZWR1bmRhbnQg
b3BlcmF0aW9ucy4gV2hlbiB0aGUgc2FtZSB7dGFyZ2V0LCBlcmFzZWJsb2NrLAo+IHBhZ2V9IGlz
IHJlcXVlc3RlZCBjb25zZWN1dGl2ZWx5LCB0aGUgZGF0YSBpcyBzZXJ2ZWQgZGlyZWN0bHkKPiBm
cm9tIHRoZSBib3VuY2UgYnVmZmVyIChkYXRhYnVmKSB2aWEgbWVtY3B5LCBza2lwcGluZyB0aGUg
U1BJCj4gdHJhbnNhY3Rpb24gZW50aXJlbHkuCj4KPiBUaGUgY2FjaGUgaXMgaW52YWxpZGF0ZWQg
b24gd3JpdGUgYW5kIGVyYXNlIG9wZXJhdGlvbnMuIFJBVyByZWFkcywKPiBPT0IgcmVhZHMsIGFu
ZCBjb250aW51b3VzIHJlYWRzIGFyZSBleGNsdWRlZCBmcm9tIGNhY2hpbmcgdG8KPiBtYWludGFp
biBjb3JyZWN0bmVzcy4KCldoeSB3b3VsZCB5b3UgdXNlIG10ZGJsb2NrIG9uIHRvcCBvZiBhIFNQ
SSBOQU5EPyBJdCBzb3VuZHMgbGlrZSBhIHZlcnkKYmFkIGNob2ljZS4KCk1heWJlIG10ZGJsb2Nr
IGl0c2VsZiBjb3VsZCBiZSBpbXByb3ZlZCB0byBhdm9pZCA1MTJCIGFjY2Vzc2VzIGluc3RlYWQ/
Cgo+IFNpZ25lZC1vZmYtYnk6IGZ6eiA8MTc2ODMxNTMwN0BxcS5jb20+CgpVbmZvcnR1bmF0ZWx5
LCBmb3IgbGljZW5zaW5nIGFuZCBjb3B5cmlnaHQgcmVhc29ucywgcHNldWRvbnltcyBhcmUgbm90
CmFsbG93ZWQgaW4gdGhlIExpbnV4IGtlcm5lbC4KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICBp
bmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggfCAgOSArKysrKysrKysKPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4g
aW5kZXggOGJmOTMwMWYyNWU3Li5mYzA4MjEyN2JkYTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4g
QEAgLTU1Nyw3ICs1NTcsMTQgQEAgc3RhdGljIGludCBzcGluYW5kX3JlYWRfZnJvbV9jYWNoZV9v
cChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gIAkJCQkJCSAgICByZXEtPm9vYmxl
bik7Cj4gIAkJZWxzZQo+ICAJCQltZW1jcHkocmVxLT5vb2JidWYuaW4sIHNwaW5hbmQtPm9vYmJ1
ZiArIHJlcS0+b29ib2ZmcywKPiAtCQkJICAgICAgIHJlcS0+b29ibGVuKTsKPiArCQkJCXJlcS0+
b29ibGVuKTsKClNwdXJpb3VzIGNoYW5nZS4KCj4gKwl9Cj4gKwoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
