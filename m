Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1ABC282DB
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CDA218D8
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RebXlCqE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcoRJHeB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CDA218D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guESd47XbNAiZQr0CRoeg6khNk2QPlIyPvbhSwl6sUE=; b=RebXlCqEkkBDGD
	3bgV86VIrcWNsN8RF6ucUUEqhyoxJIxCNm89CmWYOvzCXRuSFp6EOdLp/3bS0ZRdm1iAQxF1IAOXr
	gByS7D7clb4JwVZ55UlFEmaWk12zzhS/9KB7c0H78Ze4x9BsUOsiCktHMc4hhvepkobBZa4jli+Zz
	qZ60BcZUtS2oSKzHTH9IR05FPty5bX0+4BeXOmQkmZcNEpuXyfTj3q4IaGDsOx/Fla3R0d0nOE1eo
	xxbJvNUKk/EwcmLsYC5XYB83QGfYQDBHlEd6dRmCT/gxmX6fIYTNypyZ6NUBS28uFYxk1MSWSqf71
	boC11H/O19z+Qi8gC22g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqIh6-0005KT-2q; Sun, 03 Feb 2019 14:24:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqIh2-0005Jm-SC
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 14:24:22 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93F102084A;
 Sun,  3 Feb 2019 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549203860;
 bh=PrXer47KHA40S2YqkSEELxve4hCip8gF445pVwtHm/A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hcoRJHeBfU6/8YFjJ+eMaI36hMnLgWme4GDaDwPLJYkv7Z2//AjQyqgy+16cuzsa7
 xZAozvNWZT4Q7s0acQL6qHjJbO68085xsYrXXyomhXx1/ju+gTQxKC6xVesbCkDP/5
 WggQQaxTLhHgWd8XA6qeBt7L/nnm9qyqxZFBG5So=
Date: Sun, 3 Feb 2019 15:24:08 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/9] mtd: rawnand: jz4780: Add support for the JZ4740
Message-ID: <20190203152408.2795de7e@bbrezillon>
In-Reply-To: <1549203050.1950.3@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-5-paul@crapouillou.net>
 <20190203083151.4fc29c5b@bbrezillon>
 <1549202213.1950.1@crapouillou.net>
 <20190203150827.401ac31d@bbrezillon>
 <1549203050.1950.3@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_062420_950489_5E9C666B 
X-CRM114-Status: GOOD (  26.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwMyBGZWIgMjAxOSAxMToxMDo1MCAtMDMwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IExlIGRpbS4gMyBmw6l2ci4gMjAxOSDDoCAxMTowOCwg
Qm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+IAo+IGEgw6ljcml0IDoKPiA+
IE9uIFN1biwgMDMgRmViIDIwMTkgMTA6NTY6NTMgLTAzMDAKPiA+IFBhdWwgQ2VyY3VlaWwgPHBh
dWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKPiA+ICAgCj4gPj4gIExlIGRpbS4gMyBmw6l2ci4g
MjAxOSDDoCA0OjMxLCBCb3JpcyBCcmV6aWxsb24gCj4gPj4gPGJicmV6aWxsb25Aa2VybmVsLm9y
Zz4KPiA+PiAgYSDDqWNyaXQgOiAgCj4gPj4gID4gT24gU2F0LCAgMiBGZWIgMjAxOSAyMDoxOToy
MSAtMDMwMAo+ID4+ICA+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90
ZToKPiA+PiAgPiAgCj4gPj4gID4+ICBBZGQgc3VwcG9ydCBmb3IgcHJvYmluZyB0aGUgano0Nzgw
LW5hbmQgZHJpdmVyIG9uIHRoZSBKWjQ3NDAgU29DCj4gPj4gID4+IGZyb20KPiA+PiAgPj4gIElu
Z2VuaWMuCj4gPj4gID4+Cj4gPj4gID4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4KPiA+PiAgPj4gIC0tLQo+ID4+ICA+Pgo+ID4+ICA+PiAgQ2hh
bmdlczoKPiA+PiAgPj4KPiA+PiAgPj4gIHYyOiAtIEFkZCBzdXBwb3J0IGZvciB0aGUgSlo0NzQw
IGFuZCBub3QgdGhlIEpaNDcyNUI6IHRoZXkgICAKPiA+PiBiZWhhdmUgIAo+ID4+ICA+PiB0aGUK
PiA+PiAgPj4gICAgICAgIHNhbWUsIGFuZCBKWjQ3NDAgaXMgZnVsbHkgdXBzdHJlYW0gd2hpbGUg
Slo0NzI1QiBpcyBub3QuICAgCj4gPj4gVGhlICAKPiA+PiAgPj4gICAgICAgIEpaNDcyNUIgZGV2
aWNldHJlZSB3aWxsIHRoZW4gc2ltcGx5IHVzZSB0aGUKPiA+PiAgPj4gImluZ2VuaWMsano0NzQw
LW5hbmQiCj4gPj4gID4+ICAgICAgICBjb21wYXRpYmxlIHN0cmluZy4KPiA+PiAgPj4gICAgICAt
IEZpeCB0aGUgbnVtYmVyIG9mIGJ5dGVzIGZvciB0aGUgRUNDIHdoZW4gdGhlIEVDQyBzdHJlbmd0
aCAgIAo+ID4+IGlzICAKPiA+PiAgPj4gNC4KPiA+PiAgPj4gICAgICAgIFRoaXMgaXMgbmVlZGVk
IGZvciB0aGUgSlo0NzQwLCB3aGljaCB1c2VzIFJlZWQtU29sb21vbgo+ID4+ICA+PiBpbnN0ZWFk
IG9mCj4gPj4gID4+ICAgICAgICBCQ0guCj4gPj4gID4+Cj4gPj4gID4+ICAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvaW5nZW5pYy9qejQ3ODBfbmFuZC5jIHwgNDgKPiA+PiAgPj4gKysrKysrKysrKysr
KysrKystLS0tLSAgCj4gPj4gID4KPiA+PiAgPiBJZiB3ZSdyZSBnb2luZyB0byBtYWtlIHRoZSBk
cml2ZXIgY29tcGF0aWJsZSB3aXRoIGp6NDc0MCBhbmQgICAKPiA+PiBqejQ3MjViICAKPiA+PiAg
PiBtYXliZSB3ZSBzaG91bGQgcmVuYW1lIHRoZSBzb3VyY2UgZmlsZXMgano0N3h4X3tuYW5kLGJj
aH0ue2MsaH0uICAKPiA+PiAKPiA+PiAgSSBkb24ndCBrbm93IGFib3V0IHRoYXQuIEFkZGluZyBz
dXBwb3J0IGZvciBuZXcgaGFyZHdhcmUgaXNuJ3QgYSAKPiA+PiBnb29kCj4gPj4gIHJlYXNvbiB0
bwo+ID4+ICByZW5hbWUgdGhlIGRyaXZlciwgb3Igc28gSSd2ZSBiZWVuIHRvbGQgYXJvdW5kIGhl
cmUsIGFzIHlvdSB0aGVuIAo+ID4+IG1ha2UKPiA+PiAgaXQgaGFyZGVyCj4gPj4gIHRvIHJldmll
dyB0aGUgZ2l0IGhpc3Rvcnkgb2YgdGhlIGRyaXZlci4gIAo+ID4gCj4gPiBZb3UgYWxyZWFkeSBt
b3ZlIGZpbGVzIHRvIGEgc3ViLWRpcmVjdG9yeSBzbyB0aGF0IGRvZXNuJ3QgbWFrZSBhIGh1Z2UK
PiA+IGRpZmZlcmVuY2UsIGhpc3Rvcnkgd2lsbCBiZSBoYXJkIHRvIGZvbGxvdyBiZWNhdXNlIG9m
IHRoaXMgbW92ZSAKPiA+IGFueXdheS4gIAo+IAo+IFllcywgYnV0IGlmIEkgbWVyZ2UgdGhlICpf
YmNoLmMgZmlsZXMgdG9nZXRoZXIsIGFuZCBldmVudHVhbGx5IGRyb3AKPiBqejQ3NDAtbmFuZC5j
LCBkb2VzIGl0IHN0aWxsIG1ha2Ugc2Vuc2UgdG8gbW92ZSB0byBhIHN1Yi1kaXJlY3Rvcnk/Cj4g
CgpTdGlsbCBwcmVmZXIgdG8gbWFrZSB0aGluZ3MgZXhwbGljaXQgb3ZlciBwcmVzZXJ2aW5nIGZp
bGUgbmFtZXMgdG8KbWFrZSBnaXQgbG9nIDxwYXRoPiBoaXN0b3J5IGxpbmVhci4gQW5kIGFueXdh
eSwgaG93IGhhcmQgaXMgaXQgdG8gZmlndXJlCm91dCB0aGF0IHRoZSBsYXN0IGNvbW1pdCBpbiBn
aXQgbG9nIGRyaXZlcnMvbXRkL25hbmQvcmF3Lzxkcml2ZXI+LmMgaXMKbW92aW5nIHRoZSBmaWxl
ICh0aGVyZSBtaWdodCBldmVuIGJlIGFuIG9wdGlvbiBmb3IgdGhhdCk/CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
