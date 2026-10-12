Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC0CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tGW2Igs9SW39OsnVIgq3Ame3ipW/iP9c8tp+bzHYCI=; b=E+tuwfzajB2P8p
	e0xlaPEDb00xkvFZ9n+fEjGEtDw5ELrJn4BqnAEeLSkuuPygxleNmj0VK+/7AMtoeqUdbjyTbHWMX
	yR4y9taZMydgDVw/eXUm3yJrv83I7VmBR3xohSCvnRDQfKquB8yaJu5Lnn5nRSG9I3BubWQjuVf3X
	50q5srfsyFTHuZId2R64Y1GHAYzNsmSIZZCq6O0KVEqIsrrKYyxVZArCXSq29U/uL7Tx0nxUOH5a5
	Qm2hm3e19pM6khyZVqZrRWgwDA4fMujmYPxwFaWxrkhtUWPv1QKgyTKZIuxuAZT+Pl4nc70NXwoOj
	qp577tHWZJ31oi+TTvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKlK-0000000BEmo-20KU;
	Mon, 12 Oct 2026 18:28:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKlG-0000000BElV-01rf
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:28:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 345E84E411FE
	for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2026 18:28:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0859E601A6;
	Mon, 12 Oct 2026 18:28:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 108B111D70CD7;
	Mon, 12 Oct 2026 20:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p8FY1M3Tv1hRQvQP6OVRnYrzYJdfnF28OpzD0RZsP+Y=;
	b=DislWmDUp3szNgdrMrKOMtotYsIuW+3DhrF6fNPEkayV1KSv7Ogdw6dZQAP0kDJG6dG9PQ
	91rgfzQzYyTrgMepxkKvy6p+w3eeVIT6MAbGr5Hgm1rTzjdgYHWA6MvH9zt9ZFsbTj+pnA
	XcV0lj/92TIJOCBLmG13vfxZTfK1+DE1CtQqyfqSKxCh1opk2gh2bLWNa/0oqVzKOQ3HJW
	y/SkNI4T5FULC/1VsNSBw0s+5WUNS+12GclwtZeAxnrcNTQPX7vTvv5BBbk2PRq6C4AnRI
	op0t+NtTvZ2EoQe9pWbsaP1e96YiF/38GH4V9pWcyj4ipe9QIcIJafYICWv+Xw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: also clamp the write buffer of an
 x16 part strapped to x8
In-Reply-To: <20261006052435.319751-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Tue, 6 Oct 2026 05:24:35 +0000")
References: <20260916162731.307959-1-orgads@gmail.com>
	<20261006052435.319751-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 20:28:29 +0200
Message-ID: <87ld82zsc2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112834_212155_0F1286D3 
X-CRM114-Status: GOOD (  12.59  )
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

SGkgT3JnYWQsCgpPbiAwNi8xMC8yMDI2IGF0IDA1OjI0OjM1IEdNVCwgT3JnYWQgU2hhbmVoIDxv
cmdhZHNAZ21haWwuY29tPiB3cm90ZToKCj4gQ29tbWl0IGNmYzVlYmM5NTQwZSAoIm10ZDogY2Zp
X2NtZHNldF8wMDAyOiBjYXAgdGhlIHdyaXRlLWJ1ZmZlciBjaHVuawo+IGF0IDI1NiBieXRlcyBv
biBhbiB4OCBkZXZpY2UiKSBsaW1pdHMgYSBXcml0ZSB0byBCdWZmZXIgdG8gMjU2IGJ5dGVzCj4g
d2hlbiBjZmktPmRldmljZV90eXBlIGlzIENGSV9ERVZJQ0VUWVBFX1g4LCBiZWNhdXNlIGRvX3dy
aXRlX2J1ZmZlcigpCj4gc2VuZHMgdGhlIHdvcmQgY291bnQgYXMgYSBzaW5nbGUgYnVzIHdvcmQg
YW5kIGFuIDgtYml0IGRhdGEgbGFuZQo+IHRydW5jYXRlcyBpdC4KPgo+IFRoZSBNMjlFVyB0aGF0
IGNvbW1pdCB3YXMgd3JpdHRlbiBmb3IgaXMgYW4geDE2IHBhcnQgc3RyYXBwZWQgdG8geDguCj4g
VGhlIHByb2JlIHJlcG9ydHMgaXQgYXMKPgo+ICAgcGh5c19tYXBwZWRfZmxhc2g6IEZvdW5kIDEg
eDE2IGRldmljZXMgYXQgMHgwIGluIDgtYml0IGJhbmsuCj4gICBNYW51ZmFjdHVyZXIgSUQgMHgw
MDAwODkgQ2hpcCBJRCAweDAwMDA3ZQo+Cj4gc28gaXRzIGRldmljZV90eXBlIGlzIENGSV9ERVZJ
Q0VUWVBFX1gxNiwgdGhlIGNsYW1wIGRvZXMgbm90IGFwcGx5LCBhbmQKPiBldmVyeSBmdWxsIDUx
Mi1ieXRlIGNodW5rIHN0aWxsIHRpbWVzIG91dDoKPgo+ICAgTVREIGRvX3dyaXRlX2J1ZmZlcl93
YWl0KCk6IHNvZnR3YXJlIHRpbWVvdXQsIGFkZHJlc3M6MHgwMDIyMDNmZi4KPgo+IFdoYXQgbGlt
aXRzIHRoZSBjb3VudCBpcyB0aGUgd2lkdGggb2YgZWFjaCBkZXZpY2UncyBkYXRhIGxhbmUsIG5v
dCB0aGUKPiBwYXJ0J3MgdHlwZS4gVGVzdCB0aGF0IGluc3RlYWQ6IG1hcF9iYW5rd2lkdGgobWFw
KSAvIGNmaV9pbnRlcmxlYXZlKGNmaSkKPiBpcyAxIGZvciBhbiB4OCBwYXJ0LCBmb3IgeDggcGFy
dHMgaW50ZXJsZWF2ZWQgb24gYSB3aWRlciBidXMsIGFuZCBmb3IgYW4KPiB4MTYgcGFydCBpbiBh
biA4LWJpdCBiYW5rLgo+Cj4gT24gdGhlIGJvYXJkIChPY3Rlb24gQ042MzM1LCB0aGUgc2FtZSBN
MjlFVykgd3JpdGVzIG9mIDEsIDIsIDMyLCA2NCBhbmQKPiAyNTYgYnl0ZXMgdG8gYW4gZXJhc2Vk
IHBhcnRpdGlvbiByZWFkIGJhY2sgY29ycmVjdGx5IGFuZCA1MTIsIDEwMjQsCj4gMjA0OCBhbmQg
NDA5NiBmYWlsZWQgd2l0aCB0aGUgdGltZW91dCBhYm92ZTsgd2l0aCB0aGlzIHBhdGNoIGV2ZXJ5
IHNpemUKPiB1cCB0byA2NCBLaUIgcmVhZHMgYmFjayBjb3JyZWN0bHkgYW5kIHRoZSB1LWJvb3Qg
ZW52aXJvbm1lbnQgY2FuIGJlCj4gc2F2ZWQgZnJvbSBMaW51eCBhZ2Fpbi4KPgoKSXQgbm8gbG9u
Z2VyIGFwcGxpZXMsIGNhbiB5b3UgcGxlYXNlIHJlYmFzZSBhbmQgcmVzZW5kPwoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
