Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B60C19776
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 18:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Uxi0oTLhs9To1rWDl3CrqRzG6CdMWCzLzFSsk7QoGM0=; b=aLC+MaYgiEd/orenn3gYvim1+U
	0tm5r3NrQ8ICrSpmpGruxONMbVLnDY32xxfXIPbzXhHEZ5aVcX/f4isn10oh/rBEjzejZTfr9SrYc
	xd0VOxVE7bWtQzieCHPekDkTKPfVtTaB0tewRFMPUVohKnYBDzG5NST+AwtMRkuEOIYzH+Wx2Xp/a
	SGU5zHMr/f2I8kLnRI22aSUDRn3tJOM4C3D1ffeUKQQ6PrRwufiq7tshWfKxJrL7n8LjT5+ymhdCe
	5hmqPRDTRgVOu86Yni9Z8Yn1O0cKJg0PUMl91Pq48bJgU/6oZL1U0CQ4lFvTjqRyW/NbOQp8gvWQu
	BQ6T+gGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMPL-00000004zp3-1jAN;
	Wed, 26 Feb 2025 18:45:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMPI-00000004zoH-2sdo
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 18:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 159425C748F;
	Wed, 26 Feb 2025 18:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BF2C4CED6;
	Wed, 26 Feb 2025 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740595519;
	bh=ERGSj8UoLV6emwDjg3zTNHnsZejqQWg/I0zbv9GeNbM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=T+/xF3t4tpA/bM8KzWexhY5qNBzCXfgQ4G02MVaEvRJRJ/N+6fo6LnPJKg/zvWnu5
	 uRXENvWQ/Wc9Wmy5R66SK8d7kaOyHlJftocHLw6W8arDA4WvSwgO9D2ICWPuE9Rto0
	 Jze6dVjvEuoISfK82Q6TL5xD2iYG694Q4BT+ndjZiCvH8CbvpPMi6OhV85MkmJPE+G
	 uUbf0BKxHR3OQK8RUNv/e0CCeLMi927pPpjhAg3b3xQpPRSQJMS5cmbwYEFG+Vhr9R
	 SbEAFRrdq7X92lEobC3h6YeMsckxVCdbuV2e2xSDUieVI3foINpDmJUFpCjK97Dkfm
	 G8achp3TuJCIg==
Date: Wed, 26 Feb 2025 12:45:17 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Crystal Wood <oss@buserror.net>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-mtd@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
 <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
Message-Id: <174059551678.3319332.12055848852503108874.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_104520_835317_A7437839 
X-CRM114-Status: GOOD (  16.98  )
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

Ck9uIFdlZCwgMjYgRmViIDIwMjUgMTg6MDE6NDEgKzAxMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
Ogo+IEZvcm1hbGl6ZSB0aGUgYmluZGluZyBhbHJlYWR5IHN1cHBvcnRlZCBieSB0aGUgZnNsX2Vs
YmNfbmFuZC5jIGRyaXZlcgo+IGFuZCB1c2VkIGluIHNldmVyYWwgZGV2aWNlIHRyZWVzIGluIGFy
Y2gvcG93ZXJwYy9ib290L2R0cy8uCj4gCj4gcmF3LW5hbmQtY2hpcC55YW1sIGlzIHJlZmVyZW5j
ZWQgaW4gb3JkZXIgdG8gYWNjb21tb2RhdGUgc2l0dWF0aW9ucyBpbgo+IHdoaWNoIHRoZSBFQ0Mg
cGFyYW1ldGVycyBzZXR0aW5ncyBhcmUgc2V0IGluIHRoZSBkZXZpY2UgdHJlZS4gT25lIHN1Y2gK
PiBleGFtcGxlIGlzIGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy90dXJyaXMxeC5kdHM6Cj4gCj4g
CS8qIE1UMjlGMkcwOEFCQUVBV1A6RSBOQU5EICovCj4gCW5hbmRAMSwwIHsKPiAJCWNvbXBhdGli
bGUgPSAiZnNsLHAyMDIwLWZjbS1uYW5kIiwgImZzbCxlbGJjLWZjbS1uYW5kIjsKPiAJCXJlZyA9
IDwweDEgMHgwIDB4MDAwNDAwMDA+Owo+IAkJbmFuZC1lY2MtbW9kZSA9ICJzb2Z0IjsKPiAJCW5h
bmQtZWNjLWFsZ28gPSAiYmNoIjsKPiAKPiAJCXBhcnRpdGlvbnMgeyAuLi4gfTsKPiAJfTsKPiAK
PiBSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiAtLS0KPiAKPiBWMzoKPiAtIHJl
bW92ZSB1bm5lY2Vzc2FyeSAjYWRkcmVzcy9zaXplLWNlbGxzIGZyb20gbmFuZCBub2RlIGluIGV4
YW1wbGUKPiAtIGFkZCBGcmFuayBMaSdzIHJldmlldyB0YWcKPiAtIGFkZCBtaXNzaW5nIGVuZCBv
ZiBkb2N1bWVudCBtYXJrZXIgKC4uLikKPiAtIGV4cGxhaW4gY2hvaWNlIHRvIHJlZmVyZW5jZSBy
YXctbmFuZC1jaGlwLnlhbWwKPiAKPiBWMjoKPiAtIHNwbGl0IG91dCBmcm9tIGZzbCxlbGJjIGJp
bmRpbmcgcGF0Y2gKPiAtIGNvbnN0cmFpbiAjYWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMK
PiAtIGFkZCBhIGdlbmVyYWwgZGVzY3JpcHRpb24KPiAtIHVzZSB1bmV2YWx1YXRlZFByb3BlcnRp
ZXM9ZmFsc2UgaW5zdGVhZCBvZiBhZGRpdGlvbmFsUHJvcGVydGllcz1mYWxzZQo+IC0gZml4IHBy
b3BlcnR5IG9yZGVyIHRvIGNvbXBseSB3aXRoIGR0cyBjb2Rpbmcgc3R5bGUKPiAtIGluY2x1ZGUg
cmF3LW5hbmQtY2hpcC55YW1sIGluc3RlYWQgb2YgbmFuZC1jaGlwLnlhbWwKPiAtLS0KPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwgfCA2OCArKysr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspCj4g
CgpNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24g
eW91ciBwYXRjaDoKCnlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoKCmR0c2NoZW1hL2R0YyB3YXJu
aW5ncy9lcnJvcnM6Ci9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9mc2wsZWxiYy1mY20tbmFuZC5leGFtcGxl
LmR0YjogbmFuZEAxLDA6ICRub2RlbmFtZTowOiAnbmFuZEAxLDAnIGRvZXMgbm90IG1hdGNoICde
bmFuZEBbYS1mMC05XSQnCglmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL210ZC9mc2wsZWxiYy1mY20tbmFuZC55YW1sIwoKZG9jIHJlZmVyZW5jZSBlcnJvcnMg
KG1ha2UgcmVmY2hlY2tkb2NzKToKClNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDI1MDIyNi1wcGN5YW1sLWVsYmMtdjMt
Mi1hOTBlZDcxZGE4MzhAcG9zdGVvLm5ldAoKVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2Vu
ZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5CnNob3VsZCBiZSBu
b3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGlu
Z19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCmVycm9yKHMpLCB0aGVuIG1ha2Ugc3Vy
ZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCmRhdGU6Cgpw
aXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1p
dCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlCnRoYXQgRFRf
U0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBj
aGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFs
bCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
