Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE53CCCFA03
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHInnq1i9VUFyQdwz1yA3AyDqmbgJjX8SF1U5Ik8qss=; b=kcZy0ndbW8Z4HI
	bOQOytZ3ZLNrRHY0SHLvIqtKViV+e8BLt3Yv24LwBVjFbb8MrLKaBJfuA7CYprw5uwY/S9x96vJzG
	QmK9mORdk1eBvZgfXxZ71jumU+0LWpfIwt6KJkn/uet1d+QE8IabDH4KV3QEJxFxGk/iJlFpjFxXu
	vaClon4u7l4cMZ1S8g7Xeb9c2Mo8g5gpAjwrWGK1rJrYMuT822A/TacL+D12XDNj9zdvXyVQLOvCU
	MZotRCp+ZnGt6MfVmKzlgHgrNSxUwYhPDxWefQaPOAhVUXEjDKjIfcHpGyB03+nlp8vdpBC23Ir/A
	UJ8Q7gVOnbJYYZ7sS2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGw0z-0000000F8R2-0igw;
	Thu, 06 Nov 2025 09:10:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGw0v-0000000F8PI-09mR
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 09:10:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1902A4E4155E;
	Thu,  6 Nov 2025 09:10:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E229C6068C;
	Thu,  6 Nov 2025 09:10:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B6C9102F2506;
	Thu,  6 Nov 2025 10:10:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762420236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QlKEcZeAc1190MKGLBijNhcT+YDIGjvAChGhzCE/GH8=;
	b=nqQAP4Pt23iUC2IyfmF8qi8PH3UAztMGXpZuWZfM9xhz88G3MTYdxQpuSzyk9Z3D+10Y7s
	R25UD7bGMsTQA9bHF9J86EmMAe0m8gy8AZTBuQC6kTwyjuxgn5Jzi5imq06kWKSbnmVKCf
	Tb0GkBHdD2NoPtVQJ7Mw7pv9+IDpD9/vdzT66nKsm2J8CUK2EtiU49KPf4b97pYihJMQUu
	QcbdoE7chXeMVq4JWxGP0HVWGlhgCyHhBa8YWf7e/+aogV+nnWe96cQ2EDnhyHWp0p1b5r
	Idnb0HwH/4x4/ZzjwSFh1I8MgEH7Y5W1hP6mDxA5HdhEpXm68AW//g4mv6CH9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  chengzhihao1@huawei.com,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/1] mtd: ubi: skip programming unused bits in ubi headers
In-Reply-To: <20251106054940.2728641-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Thu, 6 Nov 2025 13:49:40 +0800")
References: <20251106054940.2728641-1-linchengming884@gmail.com>
	<20251106054940.2728641-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 06 Nov 2025 10:10:27 +0100
Message-ID: <87o6pf8r24.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_011041_560463_30B77399 
X-CRM114-Status: GOOD (  22.17  )
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

SGVsbG8sCgpPbiAwNi8xMS8yMDI1IGF0IDEzOjQ5OjQwICswOCwgQ2hlbmcgTWluZyBMaW4gPGxp
bmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8
Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+Cj4gVGhpcyBwYXRjaCBwcmV2ZW50cyB1bm5lY2Vz
c2FyeSBwcm9ncmFtbWluZyBvZiBiaXRzIGluIGVjX2hkciBhbmQKPiB2aWRfaGRyIHRoYXQgYXJl
IG5vdCB1c2VkIG9yIHJlYWQgZHVyaW5nIG5vcm1hbCBVQkkgb3BlcmF0aW9uLiBUaGVzZQo+IHVu
dXNlZCBiaXRzIGFyZSB0eXBjaWFsbHkgYWxyZWFkeSBzZXQgdG8gMSBpbiBlcmFzZWQgZmxhc2gg
YW5kIGRvIG5vdAo+IG5lZWQgdG8gYmUgZXhwbGljaXRseSBwcm9ncmFtbWVkIHRvIDAgaWYgdGhl
eSBhcmUgbm90IHVzZWQuCj4KPiBQcm9ncmFtbWluZyBzdWNoIHVudXNlZCBhcmVhcyBvZmZlcnMg
bm8gZnVuY3Rpb25hbCBiZW5lZml0IGFuZCBtYXkKPiByZXN1bHQgaW4gdW5uZWNlc3NhcnkgZmxh
c2ggd2VhciwgcmVkdWNpbmcgdGhlIG92ZXJhbGwgbGlmZXRpbWUgb2YgdGhlCj4gZGV2aWNlLiBC
eSBza2lwcGluZyB0aGVzZSB3cml0ZXMsIHdlIHByZXNlcnZlIHRoZSBmbGFzaCBzdGF0ZSBhcyBt
dWNoIGFzCj4gcG9zc2libGUgYW5kIG1pbmltaXplIHdlYXIgY2F1c2VkIGJ5IHJlZHVuZGFudCBv
cGVyYXRpb25zLgo+Cj4gVGhpcyBjaGFuZ2UgZW5zdXJlcyB0aGF0IG9ubHkgbmVjZXNzYXJ5IGZp
ZWxkcyBhcmUgd3JpdHRlbiB3aGVuIHByZXBhcmluZwo+IFVCSSBoZWFkZXJzLCBpbXByb3Zpbmcg
Zmxhc2ggZWZmaWNpZW5jeSB3aXRob3V0IGFmZmVjdGluZyBmdW5jdGlvbmFsaXR5Lgo+Cj4gQWRk
aXRpb25hbGx5LCB0aGUgS2lveGlhIFRDNThOVkcxUzNIVEEwMCBkYXRhc2hlZXQgKHBhZ2UgNjMp
IGFsc28gbm90ZXMKPiB0aGF0IGNvbnRpbnVvdXMgcHJvZ3JhbS9lcmFzZSBjeWNsaW5nIHdpdGgg
YSBoaWdoIHBlcmNlbnRhZ2Ugb2YgJzAnIGJpdHMKPiBpbiB0aGUgZGF0YSBwYXR0ZXJuIGNhbiBh
Y2NlbGVyYXRlIGJsb2NrIGVuZHVyYW5jZSBkZWdyYWRhdGlvbi4KPiBUaGlzIGZ1cnRoZXIgc3Vw
cG9ydHMgYXZvaWRpbmcgbGFyZ2UgMHgwMCBwYXR0ZXJucy4KPgo+IExpbms6IGh0dHBzOi8vZXVy
b3BlLmtpb3hpYS5jb20vY29udGVudC9kYW0va2lveGlhL25ld2lkci9wcm9kdWN0aW5mby9kYXRh
c2hlZXQvMjAxOTEwL0RTVF9UQzU4TlZHMVMzSFRBMDAtVERFX0VOXzMxNDQyLnBkZgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KClRo
YW5rcyBmb3IgdGhpcyB2ZXJ5IGNsZWFyIGFuZCBkZXRhaWxlZCBjb21taXQgbG9nLCBhcyB3ZWxs
IGFzIGZvciB0aGUKd2VsbCB3cml0dGVuIGNvdmVyIGxldHRlci4gSSBhbSBwZXJzb25hbGx5IGZp
bmUgd2l0aCB0aGUgb3ZlcmFsbCBpZGVhIG9mCmNsZWFyaW5nIHRoZXNlIHVudXNlZCBiaXRzIHRv
IDEuIFlldCwgSSBoYXZlIG9uZSBjb25jZXJuIHJlZ2FyZGluZyB0aGUKaW1wbGVtZW50YXRpb24s
IHBsZWFzZSBzZWUgYmVsb3cuCgo+IC0tLQo+ICBkcml2ZXJzL210ZC91YmkvaW8uYyB8IDcgKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvdWJpL2lvLmMgYi9kcml2ZXJzL210ZC91YmkvaW8uYwo+IGluZGV4IGE0OTk5
YmNlNC4uYzIxMjQyYTE0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9pby5jCj4gKysr
IGIvZHJpdmVycy9tdGQvdWJpL2lvLmMKPiBAQCAtODY4LDYgKzg2OCw4IEBAIGludCB1YmlfaW9f
d3JpdGVfZWNfaGRyKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtLAo+ICAJCXJldHVy
biAtRVJPRlM7Cj4gIAl9Cj4gIAo+ICsJbWVtc2V0KChjaGFyICopZWNfaGRyICsgVUJJX0VDX0hE
Ul9TSVpFLCAweEZGLCB1YmktPmVjX2hkcl9hbHNpemUgLSBVQklfRUNfSERSX1NJWkUpOwo+ICsK
PiAgCWVyciA9IHViaV9pb193cml0ZSh1YmksIGVjX2hkciwgcG51bSwgMCwgdWJpLT5lY19oZHJf
YWxzaXplKTsKPiAgCXJldHVybiBlcnI7Cj4gIH0KPiBAQCAtMTE1MCw2ICsxMTUyLDExIEBAIGlu
dCB1YmlfaW9fd3JpdGVfdmlkX2hkcihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwK
PiAgCQlyZXR1cm4gLUVST0ZTOwo+ICAJfQo+ICAKPiArCWlmICh1YmktPnZpZF9oZHJfc2hpZnQp
Cj4gKwkJbWVtc2V0KChjaGFyICopcCwgMHhGRiwgdWJpLT52aWRfaGRyX2Fsc2l6ZSAtIFVCSV9W
SURfSERSX1NJWkUpOwo+ICsJZWxzZQo+ICsJCW1lbXNldCgoY2hhciAqKXAgKyBVQklfVklEX0hE
Ul9TSVpFLCAweEZGLCB1YmktPnZpZF9oZHJfYWxzaXplIC0gVUJJX1ZJRF9IRFJfU0laRSk7CgpI
ZXJlIEkgYW0gcmVhY2hpbmcgdGhlIGxpbWl0cyBvZiBteSBVQkkga25vd2xlZGdlLCBzbyBJIHdv
dWxkIHByZWZlcgpSaWNoYXJkIHRvIChpbil2YWxpZGF0ZSB3aGF0IEkgYW0gc2F5aW5nLCBidXQg
QUZBSVUsIHRoZSBWSUQgaGVhZGVyIGNhbgpiZSBsaXRlcmFsbHkgYW55d2hlcmUgaW4gdGhlIHBh
Z2UsIG5vdCBqdXN0IGF0IHRoZSBzdGFydCBvciBlbmQgb2YgYQpzdWJwYWdlLCBzbyBpbiB0aGUg
dmlkX2hkcl9zaGlmdCBJIHdvdWxkIGV4cGVjdCBzb21lIGV4dHJhIG1hdGhzIHRvCmhhcHBlbiwg
bm8/CgpIZXJlIGlzIGFuIGV4Y2VycHQgb2YgdGhlIG1haW4gY29tbWVudCBhdCB0aGUgdG9wIG9m
IHRoZSBpby5jIGZpbGU6CgogICAgKiBBcyBpdCB3YXMgbm90ZWQgYWJvdmUsIHRoZSBWSUQgaGVh
ZGVyIG1heSBzdGFydCBhdCBhIG5vbi1hbGlnbmVkCiAgICAqIG9mZnNldC4gRm9yIGV4YW1wbGUs
IGluIGNhc2Ugb2YgYSAyS2lCIHBhZ2UgTkFORCBmbGFzaCB3aXRoIGEgNTEyCiAgICAqIGJ5dGVz
IHN1Yi1wYWdlLCB0aGUgVklEIGhlYWRlciBtYXkgcmVzaWRlIGF0IG9mZnNldCAxOTg0IHdoaWNo
IGlzCiAgICAqIHRoZSBsYXN0IDY0IGJ5dGVzIG9mIHRoZSAqIGxhc3Qgc3ViLXBhZ2UgKEVDIGhl
YWRlciBpcyBhbHdheXMgYXQKICAgICogb2Zmc2V0IHplcm8pLgoKSSBhbSBub3Qgc3VyZSB0aGlz
IGlzIHN1cGVyIGNvbW1vbiB0b2RheSB0aG91Z2guCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
