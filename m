Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A22C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5cWylBgQaK+IaSH0SoED51RGXKRux07e1Mjm+Z+EmY4=; b=ctpAYQ1aTRszdb2Ut1KQgyx8RU
	Oa5W6FdYfQDFHMNmGx8UsBtbbB0XJ1cqr2tv6Hq2xl7cEFvfujf7ImHyUZhXSoU6bIZxSNCZ5IvqI
	YiiMP8jzPYAF+9VK6QI9pUzLe3yGDSOh1xq+iQJAh6Bb/3wdTTbWSH42SXvVTUsvjYU93YM6gwlcY
	dZunqZQFYZ0xNVl25pRpcQUXDhDSjqaoMRu5pJCOYXQfXo5Uw97u38VH/FkU3AGJgWwOhCUSYrC1r
	9TUJ13PcMWooQk9I8TUJsqNeJWEu8BwGweiJX8qc/A9N7+VBnR1PGvruVVFQ0gVGBZK0fyeI7OrxI
	RLpSCQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrOg-0000000Cerz-0GjK;
	Thu, 13 Mar 2025 22:51:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrOQ-0000000CenI-31MI
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 22:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 223E5A471F0;
	Thu, 13 Mar 2025 22:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B44AC4CEDD;
	Thu, 13 Mar 2025 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741906269;
	bh=k+D1DYsJJtPHtdNWmrJpXnR7aYZC7cxXGtQBxIHdhTc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Uo+ZoH8D60bULMR/Z7T4I8xA3fsPkSjE5yfqOon/YjEcGXxMvg7YZb06xfS22P2Gt
	 cLUOdfmMfbFprxJw3OQVHZw9qNX9TyjM5ar7vOJmvWE8QXKqRVcFN9DXnhMn0fZCby
	 9LrWxJTFtMl90r4z2tcD5QX7wNpCFjZDRG0KGYLqnT56LJGqH+BQDqXArzCp2D6RlN
	 HYwKa77PcuqPXFopfYW9pjtBvQkpMoK+GBmriMVnC9MJOOAudxtawlUXYQU5xPYp6A
	 iKed2qW1JaTbayoeuKvba2liRmwE2dBV9Xp/MGwkmytGzpGwn7aWht1DKAyxZolXFU
	 d6t1jctx8+5CA==
Date: Thu, 13 Mar 2025 17:51:08 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Naveen N Rao <naveen@kernel.org>, devicetree@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Frank Li <Frank.Li@nxp.com>, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250313-ppcyaml-elbc-v4-4-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
 <20250313-ppcyaml-elbc-v4-4-55903722d9ea@posteo.net>
Message-Id: <174190626852.565.9247018798608897062.robh@kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_155110_887775_FF26C69D 
X-CRM114-Status: GOOD (  19.52  )
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

Ck9uIFRodSwgMTMgTWFyIDIwMjUgMjI6MzU6NDcgKzAxMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
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
Lm5lQHBvc3Rlby5uZXQ+Cj4gLS0tCj4gCj4gVjQ6Cj4gLSBubyBjaGFuZ2VzCj4gCj4gVjM6Cj4g
LSBtb3ZlIHRoaXMgcGF0Y2ggYWZ0ZXIgdGhlIEdQQ00vRkNNIHBhdGNoZXMgdG8gZHRzY2hlbWEv
ZHRjIHdhcm5pbmdzCj4gICBkdWUgdG8gbWlzc2luZyBiaW5kaW5ncyBmb3IgZnNsLGVsYmMtZ3Bj
bS11aW8gYW5kIGZzbCxlbGJjLWZjbS1uYW5kCj4gLSBhZGQgInNpbXBsZS1idXMiIGFnYWluLCBm
b3IgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIERUcy9kcml2ZXJzCj4gICBiYXNlZCBvbiBk
aXNjdXNzaW9uIHdpdGggQ3J5c3RhbCBXb29kIGFuZCBSb2IgSGVycmluZwo+IC0gZml4IGZzbCxw
cTItbG9jYWxidXMgY29tcGF0aWJsZSBwcm9wZXJ0aWVzIGJhc2VkIG9uIG1nY29nZS5kdHMgLyBl
cDgyNDhlLmR0cwo+ICAgKHdhcyBtaXNzaW5nICJzaW1wbGUtYnVzIikKPiAtIGFkZCBib2FyZC1j
b250cm9sIChiY3NyKSBleGFtcGxlIGFnYWluLCBub3cgdXNpbmcgdGhlIGNvbXBhdGlibGUKPiAg
IHN0cmluZyBsaXN0ZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2JvYXJk
L2ZzbCxiY3NyLnlhbWwKPiAtIHJlbW92ZSBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGZyb20g
ZXhhbXBsZQo+IC0gcmV3b3JrIHRoZSBjb21taXQgbWVzc2FnZQo+IAo+IFYyOgo+IC0gZml4IG9y
ZGVyIG9mIHByb3BlcnRpZXMgaW4gZXhhbXBsZXMsIGFjY29yZGluZyB0byBkdHMgY29kaW5nIHN0
eWxlCj4gLSBtb3ZlIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMKPiAtIGNsYXJpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIGEgdGlueSBiaXQKPiAt
IHJlbW92ZSB1bm5lY2Vzc2FyeSBtdWx0aWxpbmUgbWFya2VycyAofCkKPiAtIGRlZmluZSBhZGRy
ZXNzIGZvcm1hdCBpbiBwYXR0ZXJuUHJvcGVydGllcwo+IC0gdHJpbSBzdWJqZWN0IGxpbmUgKHJl
bW92ZSAiYmluZGluZyIpCj4gLSByZW1vdmUgdXNlIG9mICJzaW1wbGUtYnVzIiwgYmVjYXVzZSBp
dCdzIHRlY2huaWNhbGx5IGluY29ycmVjdAo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbWVtb3J5LWNv
bnRyb2xsZXJzL2ZzbCxlbGJjLnlhbWwgICAgICB8IDE1OCArKysrKysrKysrKysrKysrKysrKysK
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvbGJjLnR4dCAgICAgICAgfCAg
NDMgLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDQzIGRlbGV0
aW9ucygtKQo+IAoKTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdf
Y2hlY2snIG9uIHlvdXIgcGF0Y2g6Cgp5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6CgpkdHNjaGVt
YS9kdGMgd2FybmluZ3MvZXJyb3JzOgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLmV4YW1wbGUuZHRzOjI5LjIzLTM0LjE1OiBXYXJu
aW5nIChzaW1wbGVfYnVzX3JlZyk6IC9leGFtcGxlLTAvbG9jYWxidXNAZjAwMTAxMDAvZmxhc2hA
MCwwOiBzaW1wbGUtYnVzIHVuaXQgYWRkcmVzcyBmb3JtYXQgZXJyb3IsIGV4cGVjdGVkICIwIgpE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxl
bGJjLmV4YW1wbGUuZHRzOjM2LjMxLTM5LjE1OiBXYXJuaW5nIChzaW1wbGVfYnVzX3JlZyk6IC9l
eGFtcGxlLTAvbG9jYWxidXNAZjAwMTAxMDAvYm9hcmQtY29udHJvbEAxLDA6IHNpbXBsZS1idXMg
dW5pdCBhZGRyZXNzIGZvcm1hdCBlcnJvciwgZXhwZWN0ZWQgIjEwMDAwMDAwMCIKRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy5leGFt
cGxlLmR0czo0MS4zMS00Ni4xNTogV2FybmluZyAoc2ltcGxlX2J1c19yZWcpOiAvZXhhbXBsZS0w
L2xvY2FsYnVzQGYwMDEwMTAwL3NpbXBsZS1wZXJpcGhAMiwwOiBzaW1wbGUtYnVzIHVuaXQgYWRk
cmVzcyBmb3JtYXQgZXJyb3IsIGV4cGVjdGVkICIyMDAwMDAwMDAiCkRvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBsZS5kdHM6
ODIuMjMtODkuMTU6IFdhcm5pbmcgKHNpbXBsZV9idXNfcmVnKTogL2V4YW1wbGUtMS9sb2NhbGJ1
c0BlMDAwNTAwMC9mbGFzaEAwLDA6IHNpbXBsZS1idXMgdW5pdCBhZGRyZXNzIGZvcm1hdCBlcnJv
ciwgZXhwZWN0ZWQgIjAiCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBsZS5kdHM6OTEuMjItOTcuMTU6IFdhcm5pbmcgKHNp
bXBsZV9idXNfcmVnKTogL2V4YW1wbGUtMS9sb2NhbGJ1c0BlMDAwNTAwMC9uYW5kQDEsMDogc2lt
cGxlLWJ1cyB1bml0IGFkZHJlc3MgZm9ybWF0IGVycm9yLCBleHBlY3RlZCAiMTAwMDAwMDAwIgoK
ZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToKV2FybmluZzogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3NkMTI4OWZiLnR4dCByZWZlcmVu
Y2VzIGEgZmlsZSB0aGF0IGRvZXNuJ3QgZXhpc3Q6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wb3dlcnBjL2ZzbC9sYmMudHh0CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3NzZDEyODlmYi50eHQ6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wb3dlcnBjL2ZzbC9sYmMudHh0CgpTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAyNTAzMTMtcHBjeWFtbC1lbGJj
LXY0LTQtNTU5MDM3MjJkOWVhQHBvc3Rlby5uZXQKClRoZSBiYXNlIGZvciB0aGUgc2VyaWVzIGlz
IGdlbmVyYWxseSB0aGUgbGF0ZXN0IHJjMS4gQSBkaWZmZXJlbnQgZGVwZW5kZW5jeQpzaG91bGQg
YmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLgoKSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2Jp
bmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQplcnJvcihzKSwgdGhlbiBtYWtl
IHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bwpkYXRl
OgoKcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQoKUGxlYXNlIGNoZWNrIGFuZCByZS1z
dWJtaXQgYWZ0ZXIgcnVubmluZyB0aGUgYWJvdmUgY29tbWFuZCB5b3Vyc2VsZi4gTm90ZQp0aGF0
IERUX1NDSEVNQV9GSUxFUyBjYW4gYmUgc2V0IHRvIHlvdXIgc2NoZW1hIGZpbGUgdG8gc3BlZWQg
dXAgY2hlY2tpbmcKeW91ciBzY2hlbWEuIEhvd2V2ZXIsIGl0IG11c3QgYmUgdW5zZXQgdG8gdGVz
dCBhbGwgZXhhbXBsZXMgd2l0aCB5b3VyIHNjaGVtYS4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
