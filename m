Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604D6C35FF7
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 21:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z+wYmf70jzzPmCNLmbHnyu9EIparDAb4yL+8CRn+hLI=; b=SgDOKmzswbsy61
	baRcl+G5dwRTr2Q7XXdotApGBI4HuwaXxjMwQa8+0SkgEyj523stWNE4l/COjbl+PB9JyFP9cuQMM
	/cRvgramewYMz5WkmAFi5srUfjoQRbPvl/NhwMNsx1GHMfbXJ0lq6Ujj0vv6oFNvU4R3Ak6Ebc2UG
	NqPUFa2Ug+5nCgnVgp/VewpcMLQqLmDdzbhem+hVa9nQluASN/xi+u3zt72V5jtS3gPmarQ5FEXdt
	4uH20ECGtAsCx6Ldtuhdlntq1WXI8BQHAvq9FnjRDiO9N/4xjXv7/2a6M0jibU9T555F4wQIRTsch
	0q16ttuTwa4FlTpDYFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDa-0000000CX0N-3HhY;
	Thu, 13 Mar 2025 21:35:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDV-0000000CWxx-1CtF
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 21:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B51C9A48744;
	Thu, 13 Mar 2025 21:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F786C4CEDD;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=QXdqznCl6zlXKgo7A3qnzu5GYl6y2ulHGCxl1/kb/sM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UGMGL3X9r+/+B7Ki1dz7aIIx3BVj6/jw9e3hQejj2HY56lhR90Ei9eMd2ExJnuVl4
	 nhzlqoKVI4s14JjbEOFjHBXKkMxkXm7ztnSIM6zmtw/B/MM017gC+4IJzAvblOZBvg
	 jcPEwT1Gbo5rA9ZOdDQ2rUIE43QDYeqnt+XTQlja/Ae/LwDdtpkj8dojIZeVJLC/Xz
	 fdg5No0SHcndQ9rhJAKCS7lL72cMqE42jrWkP4rzaInu0VF8qHkcJNKl1mmdZNlfjY
	 Fu0shyD2k9+c7DxeVA4OdeTT2ds+GRTACXc1yIcWHX5XPj1WUgZ4CD8s4nCQxb7gAU
	 Hrb0QHhHUK7LQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5D2C282DE;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v4 0/4] Freescale Enhanced Local Bus Controller (eLBC)
 binding YAML conversion
Date: Thu, 13 Mar 2025 22:35:43 +0100
Message-Id: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK9P02cC/1XMTQ7CIBCG4as0sxZDoVXqynuYLviZWpJaCBBi0
 3B3sYkLl+9MvmeHiMFihFuzQ8Bso3Vrje7UgJ7l+kRiTW1glPWUMUq815t8LQQXpYlSoh+6dlL
 1CXXiA072fXCPsfZsY3JhO/TMv9cfdPmHMieUyIGiubZGCi7u3sWE7rxigrGU8gF6bWhZqQAAA
 A==
X-Change-ID: 20250220-ppcyaml-elbc-bb85941fb250
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=2006;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=QXdqznCl6zlXKgo7A3qnzu5GYl6y2ulHGCxl1/kb/sM=;
 b=J/Kgwixg8aMdL6wWzPE1z788ocud2C9oulADJ11L1/1i6gab2H/myIHxU679xZWjMAKxfa4mZ
 mc8dKDOOrNbBF0PZBjh7Pbrdg+VriwAxg4w5LMKXlA9m2IyQfvgVzuB
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_143549_468960_A631F900 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
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
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgY29udmVydHMgdGhlIGZzbCxlbGJjIGJpbmRpbmcgdG8gWUFNTCBhbmQgYWRk
cyBuZXcgYmluZGluZ3MKZm9yIHJlbGF0ZWQgZGV2aWNlcyAocGFydGljdWxhciBraW5kcyBvZiBj
aGlwIG9uIHRoZSBlTEJDKS4KCkZvciByZWFkYWJpbGl0eSwgdGhlIGV4aXN0aW5nIHVuaXQgYWRk
cmVzcyBzeW50YXggb2YgPGNzPiw8b2Zmc2V0PgooZS5nLiBuYW5kQDEsMCkgaXMga2VwdC4gVGhp
cyByZXN1bHRzIGluIGEgZmV3IGR0YyB2YWxpZGF0aW9uIHdhcm5pbmdzLAp3aGVuIGNvbWJpbmVk
IHdpdGggb3RoZXIgY2hvaWNlcyBpbiB0aGlzIHBhdGNoc2V0OgoKLSBGb3IgY29tcGF0aWJpbGl0
eSB3aXRoIGV4aXN0aW5nIGtlcm5lbHMgd2hpY2ggZG9uJ3QgZXhwbGljaXRseSBwcm9iZQogIHVu
ZGVyIGFuIGVMQkMgY29udHJvbGxlciwgdGhlICJzaW1wbGUtYnVzIiBjb21wYXRpYmxlIHN0cmlu
ZyBpcyBrZXB0CiAgb24gZUxCQyBjb250cm9sbGVyIG5vZGVzLiBUaGUgdmFsaWRhdGlvbiBsb2dp
YyByZXF1aXJlcyBhIGxpbmVhciB1bml0CiAgYWRkcmVzcywgdGhvdWdoIChlLmcuIEAxMDAwMDAw
MDAgaW5zdGVhZCBvZiBAMSwwKQoKVGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgd2VyZSBwcmV2
aW91c2x5IHBhcnQgb2YgdGhlIGZvbGxvd2luZyBzZXJpZXMsCndoaWNoIHR1cm5lZCBvdXQgdG8g
YmUgdG9vIGxhcmdlIGFuZCB1bndpZWxkeToKW1BBVENIIHYyIDAwLzEyXSBZQU1MIGNvbnZlcnNp
b24gb2Ygc2V2ZXJhbCBGcmVlc2NhbGUvUG93ZXJQQyBEVCBiaW5kaW5ncwpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzIwMjUwMjA3LXBwY3lhbWwtdjItMC04MTM3YjBjNDI1MjZAcG9zdGVv
Lm5ldC8KCkNoYW5nZWxvZ3MgYXJlIHByZXNlbnQgaW4gdGhlIGluZGl2aWR1YWwgcGF0Y2hlcy4K
ClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQpDaGFu
Z2VzIGluIHY0OgotIFJlaW50cm9kdWNlIHBhdGNoICJkdC1iaW5kaW5nczogbXRkOiByYXctbmFu
ZC1jaGlwOiBSZWxheCBub2RlIG5hbWUgcGF0dGVybiIKLSBMaW5rIHRvIHYzOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjUwMjI2LXBwY3lhbWwtZWxiYy12My0wLWE5MGVkNzFkYTgzOEBw
b3N0ZW8ubmV0CgotLS0KSi4gTmV1c2Now6RmZXIgKDQpOgogICAgICBkdC1iaW5kaW5nczogbXRk
OiByYXctbmFuZC1jaGlwOiBSZWxheCBub2RlIG5hbWUgcGF0dGVybgogICAgICBkdC1iaW5kaW5n
czogbWVtb3J5LWNvbnRyb2xsZXJzOiBBZGQgZnNsLGVsYmMtZ3BjbS11aW8KICAgICAgZHQtYmlu
ZGluZ3M6IG5hbmQ6IEFkZCBmc2wsZWxiYy1mY20tbmFuZAogICAgICBkdC1iaW5kaW5nczogbWVt
b3J5LWNvbnRyb2xsZXJzOiBDb252ZXJ0IGZzbCxlbGJjIHRvIFlBTUwKCiAuLi4vbWVtb3J5LWNv
bnRyb2xsZXJzL2ZzbCxlbGJjLWdwY20tdWlvLnlhbWwgICAgICB8ICA1OSArKysrKysrKwogLi4u
L2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy55YW1sICAgICAgfCAxNTggKysr
KysrKysrKysrKysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNsLGVsYmMt
ZmNtLW5hbmQueWFtbCB8ICA2OCArKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9yYXctbmFuZC1jaGlwLnlhbWwgICAgIHwgICAyICstCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9wb3dlcnBjL2ZzbC9sYmMudHh0ICAgICAgICB8ICA0MyAtLS0tLS0KIDUgZmlsZXMgY2hhbmdl
ZCwgMjg2IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDIw
MTRjOTVhZmVjZWUzZTc2Y2E0YTU2OTU2YTkzNmUyMzI4M2YwNWIKY2hhbmdlLWlkOiAyMDI1MDIy
MC1wcGN5YW1sLWVsYmMtYmI4NTk0MWZiMjUwCgpCZXN0IHJlZ2FyZHMsCi0tIApKLiBOZXVzY2jD
pGZlciA8ai5uZUBwb3N0ZW8ubmV0PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
