Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4B4E6BF20
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZLzUCd6kYcHQ+KDcSveWmTgLeWV0mbdSH9M3oKi6fg=; b=HI8HsTaw8vx7NE
	EkETdXn6D4v5pxC7AjG6fq5F5Mc9OxT04fV6qu+DM55xHSZttjnZassu/PYb/EIN18RBl2Iv0/jju
	b2tFrAqZLgsuZCWMGVBf50+YztSajzH1JV4LPtw6rZrcIKvQfEES2ZCVuUxxt7En7WIiWxz8KkS8l
	LIwRju3CTPU44TbpoKqrq+VOrw9u5TolVwEPP6BDxvG5UjE628YCKtRqfHJIlOWvdOvGcVZSIETSO
	3mpZLdFhX1I9JgFYWFBDd37aQuq2VbcXZMSPBJ2q5R6BIV2g7nDOx2Ve0UMKJLUNZNg0DDbb/6rmD
	k712+Q6MFfhK7CqSU4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqcX-00000001fZe-2QEm;
	Fri, 30 Jan 2026 15:41:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqcU-00000001fZE-1VCG
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 15:41:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 83FC8C22F5F;
	Fri, 30 Jan 2026 15:41:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C4366075A;
	Fri, 30 Jan 2026 15:41:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD0E3119A8886;
	Fri, 30 Jan 2026 16:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769787670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2oml+n/bMIQByTs3a8KsvMfpNJ/A/mGJECRJcu3JpJM=;
	b=D3rp9v7MWo6vuFyyEad8j7tYG8HeJYBUM1dWIRMpNTg7SbY+CUtL63EieH83B8zl79rCsi
	f7He4Cot/vM176sMGF9eCxgDCjJjQ6jPIjZ4zDtA7xF3g3uKbSa6qrqgREfjlmwr7M4lhg
	7QQhHnbxnM41bO32VvJSHyP9OTzGBLH97jEuyknF4m4tebo9TCQwsIJSGpRpg7p0HnpvtG
	KNzdoqgsHiNgWzfXB6wVXgfgIe38RDS4jzRcreVg9xa8qNV6ftSVP4UTdO6Udv0I9Qgkzu
	JXxYIZCufqMHVHQUI0cpBqBWY+/4OhMfzdJjExu+oNKBNH1DHBdadPuLZb7BFg==
Mime-Version: 1.0
Date: Fri, 30 Jan 2026 16:40:59 +0100
Message-Id: <DG21D6PIVG01.11GV9Y3YCGP1O@bootlin.com>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v15 0/3] mtd: Add support for stacked memories
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com>,
 "Michal Simek" <monstr@monstr.eu>, "Bernhard Frauendienst"
 <kernel@nospam.obeliks.de>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
 <176971398683.256348.665652099075371899.b4-ty@bootlin.com>
 <87h5s3i31r.fsf@bootlin.com>
In-Reply-To: <87h5s3i31r.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_074114_543830_DD69FC53 
X-CRM114-Status: GOOD (  17.00  )
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

SGkgTWlxdcOobCwKCk9uIEZyaSBKYW4gMzAsIDIwMjYgYXQgMzozMiBQTSBDRVQsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gSGVsbG8sCj4KPiBPbiAyOS8wMS8yMDI2IGF0IDIwOjE1OjMyICswMSwg
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPj4gT24g
VGh1LCAyOSBKYW4gMjAyNiAxMzowOToyNiArMDEwMCwgTHVjYSBDZXJlc29saSB3cm90ZToKPj4+
IFtUTDtEUiBmb3IgdjE1OiBhcyBhZ3JlZWQgd2l0aCBBbWl0IEknbSBzZW5kaW5nIGEgbmV3IGl0
ZXJhdGlvbiBvZiBoaXMKPj4+IHBhdGNoZXMgdG8gZml4IHRoZSBidWlsZC10aW1lIGZhaWx1cmUg
ZHVlIHRvIGEgbW9kdWxlIGRlcGVuZGVuY3kKPj4+IGxvb3AuIE9yaWdpbmFsIGNvdmVyIGZvbGxv
d3MuXQo+Pj4KPj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3RhY2tlZCBzdXBwb3J0IGJ5IGVu
aGFuY2luZyB0aGUgZXhpc3RpbmcgbXRkLWNvbmNhdAo+Pj4gZHJpdmVyIHRvIGJlIG1vcmUgZ2Vu
ZXJpYy4KPj4+Cj4+PiBbLi4uXQo+Pgo+PiBUaGFuayB5b3UgZm9yIGZpbmFsbHkgcmUtc2VuZGlu
ZyB0aGUgc2VyaWVzIGFmdGVyIGZpeGluZyB0aGUgcm9ib3QKPj4gd2FybmluZywgSSB3aWxsIG5v
dCB3YWl0IGZvciBtZXJnaW5nIGl0IGJlY2F1c2UgdGhpcyBuZWVkcyB0byBmaW5hbGx5Cj4+IGdl
dCBpbiwgYW5kIGl0J3MgYmVlbiBvdmVyIHRoZSBtYWlsaW5nIGxpc3QgZm9yIDggbW9udGhzIHdp
dGgganVzdCBhCj4+IEtjb25maWcgc3ltYm9sIHRvIGZpeCwgc286Cj4KPiBVbmZvcnR1bmF0ZWx5
LCBmb3IgdGhlIHRoaXJkIHRpbWUsIHRoaXMgc2VyaWVzIGJyZWFrcyB3aGVuIHJvYm90cyBnbwo+
IG92ZXIgaXQgKHNlZSB0aGUgb2Uta2J1aWxkLWFsbEBsaXN0cy5saW51eC5kZXYgTUwpLCBzbyBJ
IHdpbGwgZHJvcCBpdAo+IGFnYWluIDotLwoKT2gsIG5vIQoKRm9yIHRoZSByZWNvcmRzLCBoZXJl
IGFyZSB0aGUgcmVwb3J0czoKCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFs
bC8yMDI2MDEzMDIwNDguVHlBMFVoODEtbGtwQGludGVsLmNvbS9ULyN1CiAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDEzMDIwMDEubUd3UHdoR0UtbGtwQGludGVs
LmNvbS9ULyN1CgpNeSBiYWQsIEkgYXBwYXJlbnRseSBoYXZlbid0IHRlc3RlZCB3aXRoIENPTkZJ
R19NVERfUEFSVElUSU9ORURfTUFTVEVSCmRpc2FibGVkIG9uIHRoZSBmaW5hbCBjb2RlLiBTb3Jy
eSBhYm91dCB0aGF0IQoKQXQgYSBxdWljayBsb29rIEkgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQg
Zml4OgoKCWRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9t
dGRjb3JlLmMKCWluZGV4IDM3NjAwNjVjNGUwOC4uNDhkZTI2OWY0NTE0IDEwMDY0NAoJLS0tIGEv
ZHJpdmVycy9tdGQvbXRkY29yZS5jCgkrKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKCUBAIC0y
NjM4LDggKzI2MzgsMTAgQEAgc3RhdGljIGludCBfX2luaXQgaW5pdF9tdGQodm9pZCkKCgkgc3Rh
dGljIHZvaWQgX19leGl0IGNsZWFudXBfbXRkKHZvaWQpCgkgewoJKwlpZiAoSVNfUkVBQ0hBQkxF
KENPTkZJR19NVERfVklSVF9DT05DQVQpKSB7CgkgCQltdGRfdmlydF9jb25jYXRfZGVzdHJveV9q
b2lucygpOwoJIAkJbXRkX3ZpcnRfY29uY2F0X2Rlc3Ryb3lfaXRlbXMoKTsKCSsJfQoJIAlkZWJ1
Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoZGZzX2Rpcl9tdGQpOwoJIAljbGVhbnVwX210ZGNoYXIoKTsK
CSAJaWYgKHByb2NfbXRkKQoKSXQgcGFzc2VzIG15IG15IHF1aWNrIGJ1aWxkIHRlc3RzLCBidXQg
SSdsbCB3YWl0IHVudGlsIG5leHQgd2VlayB0byBkb3VibGUKY2hlY2sgYW5kIHRlc3Qgb24gaGFy
ZHdhcmUgYmVmb3JlIHJlc2VuZGluZy4KCkx1Y2EKCi0tCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
