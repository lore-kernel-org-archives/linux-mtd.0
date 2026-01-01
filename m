Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D643EED630
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jan 2026 19:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zUw+0reNIl3SHu9eIPlfz6/+kIyg43AeEfOb11uCHnY=; b=UyoX9OCL2RO3eyOdji1vHxb1vy
	rmmqvtNypmjkZGrsU6g/qQlYkpY7JQa4tONscSz1I5h5mvCvYop+oJQF5So86l1neFev/k5F51fe7
	fEjVTUoX0Vi/m6LfAUIeBBW/HYMz2XrMPNcV7sTYo/injUrpYM2Xk1h7dEKaqJiSdTELMZSMy5a1o
	g/h3Ej8fdnmvXwEH2LGevBoIUXoKRaFMHMEIeWUp4kO2Idh2ejVenQyMKT3z23SWy+hqZ+XfG/8xF
	y5aBUkJreQD1gQfa5ysBcpx/2OLSMbPdR2HN4PGhYPOnrZvxIZSKHuQnTdEt/X3ZH7L0wOUpT51ss
	eD5TYl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbNzT-00000007Ryk-14J1;
	Thu, 01 Jan 2026 19:05:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbNzP-00000007RyY-2Ylc
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jan 2026 19:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4070860017;
	Thu,  1 Jan 2026 19:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7332C4CEF7;
	Thu,  1 Jan 2026 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767294338;
	bh=mseGt6+VHgHN7F4TpAc+qL+VGig9rDMl7YN6BM1+ev8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b0uHkHFzr4KV7ajqa51J9yc08IaeWzmeQ80SP1tI5zE4dUUiwy4+hN6Da/ZNEoi43
	 bB/jsXsQEv3lQ8aUP6I3CCjT/pJkPedmr/g+/d+rYdjFqutNmvzCXvZKgMTsyokL5/
	 nu9fmXCLhIw/zSJ5gqDDMHN5HxrWljhATnNM9KCosZTgN6zpCBoMv78zqFbe3ho9Ld
	 fFMOAnq1tr4Bdiv6XG4UGl0XvpdMoyNHhgrg+uIfiKavKZTlaHIe2Al7Ig6wU8gOlI
	 CZUt30xPP0c9Ij0CVwGYupUOBvILl8ZX5mnbjFh/0SN7X06cBNkXCE8PQB14loNa4J
	 uK/hzwCPfgNrQ==
Date: Thu, 01 Jan 2026 13:05:36 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mtd@lists.infradead.org, 
 Naveen N Rao <naveen@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 Christophe Leroy <chleroy@kernel.org>, David Airlie <airlied@gmail.com>, 
 Crystal Wood <oss@buserror.net>, linux-kernel@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20260101-ppcyaml-elbc-v5-4-251c7f14a06c@posteo.net>
References: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
 <20260101-ppcyaml-elbc-v5-4-251c7f14a06c@posteo.net>
Message-Id: <176729433680.1704817.8344719442516572763.robh@kernel.org>
Subject: Re: [PATCH RESEND v5 4/4] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
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

Ck9uIFRodSwgMDEgSmFuIDIwMjYgMTc6NTg6MTcgKzAxMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
Ogo+IENvbnZlcnQgdGhlIEZyZWVzY2FsZSBsb2NhbGJ1cyBjb250cm9sbGVyIGJpbmRpbmdzIGZy
b20gdGV4dCBmb3JtIHRvCj4gWUFNTC4gQ29tcGFyZWQgdG8gdGhlIC50eHQgdmVyc2lvbiwgdGhl
IFlBTUwgYmluZGluZyBjb250YWlucyBhIG5ldwo+IHVzYWdlIGV4YW1wbGUgd2l0aCBGQ00gTkFO
RCBmbGFzaCwgYW5kIGEgZnVsbCBsaXN0IG9mIGNvbXBhdGlibGUgc3RyaW5ncwo+IGJhc2VkIG9u
IGN1cnJlbnQgdXNhZ2UgaW4gYXJjaC9wb3dlcnBjL2Jvb3QvZHRzLy4KPiAKPiBOb3RlIHRoYXQg
dGhlIGJvdGggdGhlIGNvbXBhdGlibGUgc3RyaW5ncyBhbmQgdGhlIHVuaXQgYWRkcmVzcyBmb3Jt
YXQKPiBhcmUga2VwdCBhcy1pcywgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBrZXJu
ZWxzIGFuZCBkZXZpY2UKPiB0cmVlcywgYXMgd2VsbCBhcyB1bml0IGFkZHJlc3MgcmVhZGFiaWxp
dHkuIFRoaXMgcmVzdWx0cyBpbiBkdHMKPiB2YWxpZGF0aW9uIHdhcm5pbmdzOgo+IAo+ICAgV2Fy
bmluZyAoc2ltcGxlX2J1c19yZWcpOiAvZXhhbXBsZS0wL2xvY2FsYnVzQGYwMDEwMTAwL2JvYXJk
LWNvbnRyb2xAMSwwOgo+ICAgc2ltcGxlLWJ1cyB1bml0IGFkZHJlc3MgZm9ybWF0IGVycm9yLCBl
eHBlY3RlZCAiMTAwMDAwMDAwIgo+IAo+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxq
Lm5lQHBvc3Rlby5uZXQ+Cj4gLS0tCj4gCj4gVjU6Cj4gLSBmaXggcmVmZXJlbmNlIHRvIGZzbC9s
YmMudHh0IGluCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9z
c2QxMjg5ZmIudHh0Cj4gCj4gVjQ6Cj4gLSBubyBjaGFuZ2VzCj4gCj4gVjM6Cj4gLSBtb3ZlIHRo
aXMgcGF0Y2ggYWZ0ZXIgdGhlIEdQQ00vRkNNIHBhdGNoZXMgdG8gZHRzY2hlbWEvZHRjIHdhcm5p
bmdzCj4gICBkdWUgdG8gbWlzc2luZyBiaW5kaW5ncyBmb3IgZnNsLGVsYmMtZ3BjbS11aW8gYW5k
IGZzbCxlbGJjLWZjbS1uYW5kCj4gLSBhZGQgInNpbXBsZS1idXMiIGFnYWluLCBmb3IgY29tcGF0
aWJpbGl0eSB3aXRoIGV4aXN0aW5nIERUcy9kcml2ZXJzCj4gICBiYXNlZCBvbiBkaXNjdXNzaW9u
IHdpdGggQ3J5c3RhbCBXb29kIGFuZCBSb2IgSGVycmluZwo+IC0gZml4IGZzbCxwcTItbG9jYWxi
dXMgY29tcGF0aWJsZSBwcm9wZXJ0aWVzIGJhc2VkIG9uIG1nY29nZS5kdHMgLyBlcDgyNDhlLmR0
cwo+ICAgKHdhcyBtaXNzaW5nICJzaW1wbGUtYnVzIikKPiAtIGFkZCBib2FyZC1jb250cm9sIChi
Y3NyKSBleGFtcGxlIGFnYWluLCBub3cgdXNpbmcgdGhlIGNvbXBhdGlibGUKPiAgIHN0cmluZyBs
aXN0ZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2JvYXJkL2ZzbCxiY3Ny
LnlhbWwKPiAtIHJlbW92ZSBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGZyb20gZXhhbXBsZQo+
IC0gcmV3b3JrIHRoZSBjb21taXQgbWVzc2FnZQo+IAo+IFYyOgo+IC0gZml4IG9yZGVyIG9mIHBy
b3BlcnRpZXMgaW4gZXhhbXBsZXMsIGFjY29yZGluZyB0byBkdHMgY29kaW5nIHN0eWxlCj4gLSBt
b3ZlIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxl
cnMKPiAtIGNsYXJpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIGEgdGlueSBiaXQKPiAtIHJlbW92ZSB1
bm5lY2Vzc2FyeSBtdWx0aWxpbmUgbWFya2VycyAofCkKPiAtIGRlZmluZSBhZGRyZXNzIGZvcm1h
dCBpbiBwYXR0ZXJuUHJvcGVydGllcwo+IC0gdHJpbSBzdWJqZWN0IGxpbmUgKHJlbW92ZSAiYmlu
ZGluZyIpCj4gLSByZW1vdmUgdXNlIG9mICJzaW1wbGUtYnVzIiwgYmVjYXVzZSBpdCdzIHRlY2hu
aWNhbGx5IGluY29ycmVjdAo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3NzZDEyODlmYi50eHQgICAgICB8ICAgMiArLQo+ICAuLi4vYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL2ZzbCxlbGJjLnlhbWwgICAgICB8IDE1OCArKysrKysrKysrKysrKysrKysrKysKPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvbGJjLnR4dCAgICAgICAgfCAgNDMg
LS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTU5IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9u
cygtKQo+IAoKTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hl
Y2snIG9uIHlvdXIgcGF0Y2g6Cgp5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6CgpkdHNjaGVtYS9k
dGMgd2FybmluZ3MvZXJyb3JzOgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLmV4YW1wbGUuZHRzOjI5LjIzLTM0LjE1OiBXYXJuaW5n
IChzaW1wbGVfYnVzX3JlZyk6IC9leGFtcGxlLTAvbG9jYWxidXNAZjAwMTAxMDAvZmxhc2hAMCww
OiBzaW1wbGUtYnVzIHVuaXQgYWRkcmVzcyBmb3JtYXQgZXJyb3IsIGV4cGVjdGVkICIwIgpEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJj
LmV4YW1wbGUuZHRzOjM2LjMxLTM5LjE1OiBXYXJuaW5nIChzaW1wbGVfYnVzX3JlZyk6IC9leGFt
cGxlLTAvbG9jYWxidXNAZjAwMTAxMDAvYm9hcmQtY29udHJvbEAxLDA6IHNpbXBsZS1idXMgdW5p
dCBhZGRyZXNzIGZvcm1hdCBlcnJvciwgZXhwZWN0ZWQgIjEwMDAwMDAwMCIKRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy5leGFtcGxl
LmR0czo0MS4zMS00Ni4xNTogV2FybmluZyAoc2ltcGxlX2J1c19yZWcpOiAvZXhhbXBsZS0wL2xv
Y2FsYnVzQGYwMDEwMTAwL3NpbXBsZS1wZXJpcGhAMiwwOiBzaW1wbGUtYnVzIHVuaXQgYWRkcmVz
cyBmb3JtYXQgZXJyb3IsIGV4cGVjdGVkICIyMDAwMDAwMDAiCkRvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBsZS5kdHM6ODIu
MjMtODkuMTU6IFdhcm5pbmcgKHNpbXBsZV9idXNfcmVnKTogL2V4YW1wbGUtMS9sb2NhbGJ1c0Bl
MDAwNTAwMC9mbGFzaEAwLDA6IHNpbXBsZS1idXMgdW5pdCBhZGRyZXNzIGZvcm1hdCBlcnJvciwg
ZXhwZWN0ZWQgIjAiCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29u
dHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBsZS5kdHM6OTEuMjItOTcuMTU6IFdhcm5pbmcgKHNpbXBs
ZV9idXNfcmVnKTogL2V4YW1wbGUtMS9sb2NhbGJ1c0BlMDAwNTAwMC9uYW5kQDEsMDogc2ltcGxl
LWJ1cyB1bml0IGFkZHJlc3MgZm9ybWF0IGVycm9yLCBleHBlY3RlZCAiMTAwMDAwMDAwIgoKZG9j
IHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToKClNlZSBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvZGV2aWNldHJlZS9wYXRjaC8yMDI2MDEwMS1wcGN5YW1s
LWVsYmMtdjUtNC0yNTFjN2YxNGEwNmNAcG9zdGVvLm5ldAoKVGhlIGJhc2UgZm9yIHRoZSBzZXJp
ZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5CnNo
b3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2Ug
ZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCmVycm9yKHMpLCB0aGVu
IG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRv
CmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgpQbGVhc2UgY2hlY2sgYW5k
IHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3Rl
CnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBz
cGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0
byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
