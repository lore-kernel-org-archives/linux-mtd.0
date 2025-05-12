Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839F3C3ABCB
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=514JSsyHbrMrEtU2yvzVbQ8Ytjk0A+5fb+MSaFhHvpg=; b=J7aImuE4mF/Ynl
	0o5UTXRow2FmelNRRNJnFT4a4y0ZwEWPyCnFsS5IPSU+2Kfa9j25O4Q0/di7uUBUHTsFH6MivynDT
	qiEDUEW8n+jQuLDIytJO2eFmhFrJc2On4IC39IqBiNzprRKE8p92mgVUJoq9bjilXTcoID849gRRP
	V/4C6ENI1zlHagEXP0L4oadUSr0ohBeFQT+RSv7AjvnWTJHqWEHBu852IJd4+lkjVUwGtEx68bIG7
	IaMpYTIu6r/Fb8q4zkI+a7pkpNA3RISnujE+KDT+p86bUkXoQ8EzGtYN/B73Lj/Xa3cWWTwg9jDnx
	cmpagGobq56g7qg9SqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVnC-00000009zbt-3XuK;
	Mon, 12 May 2025 16:14:14 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVQw-00000009wUm-1wex
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 15:51:16 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id EB095A0AC9;
	Mon, 12 May 2025 17:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=fCPzAe2GOYDHU/PDRCZB
	IwbMD0TgaIUDGr1FA9yLtAQ=; b=IfBjpsxoKu5DFgXZnszE5ZsHyO4ryROVNdiB
	cvaonLyeidIXYQeIoNjIbLyB4tFNz+7DJ9rYMUYi0J4eDJUz3zhodY0pfAcRvOPY
	VtgFyviRXW4ZjIoS0uNlVzDPuREDWkS5t9UNXOZOsxrFTY1H6yfksOFAgaU4CSf9
	sTmY9CYd34jq461Lb10QQ/nD1PyBQN/cFJppw7mENJ4gmkndcMWEwuYWRwVjziZB
	NLy3D4cTtEflC1VgxH64Opf7J+b/AfGckDEcNy3QLdQ6WOAzqIaqDZlAUDu2F6Sd
	BIg5EZ4oc/rbuvlTUMvUkFIWynLAh7VeJZq/3hFW8IWRPKjL1l3eXnejMN1J01c7
	8XZW0im6cNdBLkNsS/wK4yF4+C8X8BXZYuSWX1XlG/Pgg+JceFUiA4Py2s1PJ6Fk
	JcyDfznXxjG7yLexqvYF4hBG0iD91j2l6P8Zf2/vAONoEEE/A/jMTq7zDXmGIal9
	v2tVOJYXPh9FhqSOd108HEtenAQAvp2OZyIdKhY5/Yj/OsFOADrt8zBascFisVVh
	oRn0RpmPiiM8TnRkDVF0juM7AGuaF6AY3H/2lDrF83XjXxNgVw4XLrDtrg30W1xx
	FaoO25iX2R6wMIw6bwSEwj6MfHGdnBLQy8v5eSmEL7a+4QRoQBBs9e3/FUS0fztj
	vzLrRHI=
Message-ID: <2c2ff01f-b6e2-4b9e-958a-c4c405518a54@prolan.hu>
Date: Mon, 12 May 2025 17:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
 <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
 <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
 <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu> <87r00ugcat.fsf@bootlin.com>
 <1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at>
 <87y0v1g7xz.fsf@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <87y0v1g7xz.fsf@bootlin.com>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_085114_965105_FC7CB741 
X-CRM114-Status: GOOD (  11.62  )
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

SGksCgpPbiAyMDI1LiAwNS4gMTIuIDE3OjMzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIDEy
LzA1LzIwMjUgYXQgMTc6MjM6MTYgKzAyLCBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9k
LmF0PiB3cm90ZToKPiAKPj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4gVm9u
OiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+Pj4gVGhlIHBy
b2JsZW0gd2UgX2hhdmVfIHRob3VnaCBoYXBwZW5zIHRvIGJlIGEgYml0IGRpZmZlcmVudDogaGVy
ZSB3ZSBhcmUKPj4+PiBibHVyc2VkIHdpdGggYSBzeXN0ZW0gdGhhdCBjb3JydXB0cyBkYXRhIGF0
IGEgbm90aWNlYWJsZQo+Pj4+IHByb2JhYmlsaXR5LiBCdXQgdGhlIG1vZGVsIGlzIHRoZSBzYW1l
OiBhIHN0b2NoYXN0aWMgcHJvY2VzcyBpbnRyb2R1Y2luZwo+Pj4+IGJpdCBlcnJvcnMgb24gd3Jp
dGUuIEJ1dCBJIHNpbmNlcmVseSBob3BlIG5vIG9uZSBlbHNlIGhhcyB0aGlzIHByb2JsZW0sCj4+
Pj4gYW5kIHRoaXMgaXMgKm5vdCogdGhlIHByaW1hcnkgYWltIG9mIHRoaXMgcGF0Y2g7IGl0IGp1
c3QgaGFwcGVucyB0bwo+Pj4+IHNvbHZlIG91ciBpc3N1ZSBhcyB3ZWxsLiBCdXQgSSBpbnRlbmQg
aXQgdG8gYmUgdXNlZnVsIGZvciB0aGUgbGFyZ2VyCj4+Pj4gTGludXggY29tbXVuaXR5LCB0aHVz
IHRoZSBwcmltYXJ5IGdvYWwgaXMgdG8gc29sdmUgdGhlIGZpcnN0IGlzc3VlLgo+Pj4KPj4+IEkg
ZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIHRoZXJlIGJ1dCBJIGRvbid0IGRpc2xpa2UgdGhp
cyBpZGVhCj4+PiBiZWNhdXNlIGl0IG1pZ2h0IGFsc28gaGVscCB0cm91Ymxlc2hvb3RpbmcgZXJy
b3JzIHNvbWV0aW1lcy4gSXQgaXMgdmVyeQo+Pj4gaGFyZCB0byB1bmRlcnN0YW5kIGlzc3VlcyB3
aGljaCBoYXBwZW4gdG8gYmUgZGlzY292ZXJlZCB3YXkgYWZ0ZXIgdGhleQo+Pj4gaGF2ZSBiZWVu
IGdlbmVyYXRlZCAodHlwaWNhbGx5IGR1cmluZyBhIHJlYWQsIHdheSBsYXRlciB0aGFuIGEgImZh
dWx0eSIKPj4+IHdyaXRlKS4gSGF2aW5nIHRoaXMgcGFyYW5vaWQgb3B0aW9uIHdvdWxkIGdpdmUg
YSBtb3JlIHN5bmNocm9ub3VzCj4+PiBhcHByb2FjaCB3aGljaCBpcyBlYXNpZXIgdG8gd29yayB3
aXRoIHNvbWV0aW1lcy4KPj4KPj4gVUJJIG9mZmVycyB0aGlzIGFscmVhZHksIHRoZXJlIGlzIGEg
d3JpdGUgc2VsZi1jaGVjayBhcyBwYXJ0IG9mIHRoZSBpbwo+PiBjaGVja3MgdGhhdCBjYW4gYmUg
ZW5hYmxlZAo+PiB2aWEgZGVidWdmcyBwZXIgVUJJIGRldmljZS4KPj4gU28gZm9yIHRyb3VibGVz
aG9vdGluZyB0aGlzIHNob3VsZCBiZSBnb29kIGVub3VnaC4KPj4gVGhlcmUgaXMgcm9vbSBmb3Ig
aW1wcm92ZW1lbnQsIHRob3VnaC4gQ3VycmVudGx5IGl0IHVzZXMgdm1hbGxvYygpLgo+IAo+IFVC
SSBpcyBmdWxsIG9mIHVuY292ZXJlZCByZXNvdXJjZXMgOi0pCgpGb3Igc3VyZS4gUGx1cywgZXZl
biB0aG91Z2ggd2UgdXNlIFVCSSArIFVCSUZTLCB0aGF0IG1heSBub3QgbmVjZXNzYXJpbHkgCmJl
IHRoZSBjYXNlIGZvciBvdGhlcnMuIE1heWJlIHNvbWVvbmUgdXNlcyBtdGRibG9jayArIHNvbWUg
CiJjb252ZW50aW9uYWwiIEZTIChleHQqLCBmMmZzIGV0Yy4pLiBPciBtYXliZSB0aGV5IHVzZSBK
RkZTLiBPciBtYXliZSBubyAKRlMgYXQgYWxsLiBXZSBzaG91bGQgc3RpbGwgYWxsb3cgdXNlcnNw
YWNlIG9yIGhpZ2hlciBGUyBsYXllcnMgdG8gYmUgCm5vdGlmaWVkIG9mIHRoZSBwcm9ibGVtLgoK
QmVuY2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
