Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC3C369B2
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Apr 2025 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4mXXXMUj2KDdHZMJF29kRUz94oPYKjT50ozGTlFyT48=; b=plxp0JRhBIz5rt93oJo95CVSzQ
	/YwG7of2B6E6SltSqIe6QI6fzWcOLnINlQwL452e3derGldZi+4A+DkmlyaskOBbGLNsEI6bIrUGT
	cXvFqHzbJAM7xV8dEBZg9tH025j6j1oiGhBpkpp3KKDiH2CaI8wV/r9BronM6m7VAKRpaQqNQMqr9
	laB6oDMON939yKTWesgJtJWAaWNLr8j3y/rO1BuUTXlZWcWfxu7ry6mlg8k5RX/9VTGVhm2lFpzGR
	yEp07nw+eEZx1z3MxeVKxCiMlOxf4Oo1y98qEmWr8+rJ4JlRouEXxce3PygEziijpQDrivFLT+nIQ
	lpBgwCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3eMH-0000000GBNk-1qlL;
	Sat, 12 Apr 2025 17:09:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3eME-0000000GBNJ-1YuS
	for linux-mtd@lists.infradead.org;
	Sat, 12 Apr 2025 17:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C56B4A44B;
	Sat, 12 Apr 2025 17:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08093C4CEE5;
	Sat, 12 Apr 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744477767;
	bh=3ld2o6Mj/F94jH7yDDeMdOra5lZxxX/tPTJX7Yh+cYE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IWRVIa6sQUgho1AjQlyyF1dR2vufCEmTq5gfMz6DO89U8OuHsnIbwwUFu1fxxmr6+
	 BLz2rnOjdLDRYzOxg7nfywH0THh5hUeHHf1E/ZwEUFt/2pgaUo/c2Ng5kYhiKKNXFJ
	 Al+SEkYxWCrzi7MUCzebwi0KcDKaAUClL3IZEI34S7THE1Cx7GAUT8OtdTKm4x4xmu
	 wf/ddAueD5ctLxkxcb7AnVLoDyZbdiaU5BnTBRt2sGw+maqs/GpQOPjbsBw9I6gBpZ
	 q29EMBZGXGGSU4CbJYJ+x5ELE8ADYaX37sNResOcYTYCLnhx4IbIUclRItuVsF4wNR
	 x8LOU/42YAXxA==
Date: Sat, 12 Apr 2025 12:09:26 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Crystal Wood <oss@buserror.net>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 Naveen N Rao <naveen@kernel.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Richard Weinberger <richard@nod.at>, 
 Nicholas Piggin <npiggin@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
 <20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net>
Message-Id: <174447776475.1354537.103427368501741372.robh@kernel.org>
Subject: Re: [PATCH v5 4/4] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_100930_451740_7FF32D00 
X-CRM114-Status: GOOD (  19.99  )
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

Ck9uIFNhdCwgMTIgQXByIDIwMjUgMTU6MTY6MDUgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
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
d29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDI1MDQx
Mi1wcGN5YW1sLWVsYmMtdjUtNC0wM2YwZTU3NzEzOWZAcG9zdGVvLm5ldAoKVGhlIGJhc2UgZm9y
IHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBl
bmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5b3UgYWxyZWFkeSBy
YW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCmVycm9y
KHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1h
IGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgpQbGVhc2Ug
Y2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJz
ZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEg
ZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBi
ZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
