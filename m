Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E09C35FF3
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DsGJeXK5due5lStjFg5WN7gwWH9J2M39O1rsGA6C3g=; b=EHnVJGkPAkSXn4
	gL14Hj4AHiWOfr7rDVRYoCRU9u4uuBFkC/3kcXONoTWgrS03MjyCAJXGQYVe/osL3p2L0to1uQpX9
	NXbSJHD9PvkcliC31e35A4s+kMovvpGlaDlDzePRAtmXgGN3zFhZ2PIj/+GRIFDGkFGqp7hKg8cE/
	2yXIs8UDiPztHP4RwPa5IITa4kaQsuv+8IsBWNAGZ50ueb7ajq13dL2vn6FGtvao3BdugqlvDnmZf
	8fbLdy/IsPgrbaXF6+sRL7JqVSqGO7qrU57FPUvHHCLhxc1u/AmYIjJHXLUPP1JKYwf2CYxD7ZCe1
	asiIVWYS2nza6c1gt+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDX-0000000CWzP-3IdL;
	Thu, 13 Mar 2025 21:35:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqDV-0000000CWxz-1D1F
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 21:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 305EA5C5F3B;
	Thu, 13 Mar 2025 21:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A823C4CEEA;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=29z3wRwOCbrYFJhrHEd02uoJUqdaA1ekxWQFQrQotpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qi8Mb83DPQcxOwpJUpOwU451pOwTebiNJrgNeBrTpA63J83AZg30QoQcIkQYSfrhv
	 46oGohIuYsvQic6z6AfrPaIDD684kHCRjF/2Q6zh/DwyWZ9nQGcDY73lFKEF1puK5C
	 rc4O09wp5+NkrwsqZ+WbZuQuF1r0OH3OXnZ2e1FhAO4R2MFrpJvx8ji9yDK8T4Qe/D
	 sUfecbB+ZCvXjKxAzOtJlbGd2ws4t3OdbrNWJNJ2/F7UKnkeHILWUU5rGL4kklMg4Y
	 t8+hERQzWu5cl1c8EiM+K4dmXYpJo/A07MJpBneXJ0rSfTr8m/ylv198gPXsR9oJ0f
	 NEOTN5yFg+buw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3075AC35FF1;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 13 Mar 2025 22:35:44 +0100
Subject: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
MIME-Version: 1.0
Message-Id: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
In-Reply-To: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=1483;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=yPgY1z7mg/3dcZuzAQmURU+bDX68s9E0YWQYCk73u2A=;
 b=TiGBn5/omWDqmmLaDYByMyKwn3FP8MKFA347zo4v6yuRXDARcPhBHg/qDZ7YtYAYDRNFvDA0h
 53muitjhV2cDO/0YZJ+D5+FcGeK2zPgVfVIqJHclzEtsmonRa/ttpQ9
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_143549_440267_F673C2C6 
X-CRM114-Status: GOOD (  10.93  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKSW4gc29tZSBzY2VuYXJp
b3MsIHN1Y2ggYXMgdW5kZXIgdGhlIEZyZWVzY2FsZSBlTEJDIGJ1cywgdGhlcmUgYXJlIHJhdwpO
QU5EIGNoaXBzIHdpdGggYSB1bml0IGFkZHJlc3MgdGhhdCBoYXMgYSBjb21tYSBpbiBpdCAoY3Ms
b2Zmc2V0KS4KRm9yIHJlYXNvbnMgb2YgY29tcGF0aWJpbGl0eSB3aXRoIGhpc3RvcmljYWwgZGV2
aWNlIHRyZWVzIGFuZApyZWFkYWJpbGl0eSBvZiB0aGUgdW5pdCBhZGRyZXNzZXMsIHRoaXMgZm9y
bWF0IGlzIGtlcHQuCgpSZWxheCB0aGUgJG5vZGVuYW1lIHBhdHRlcm4gaW4gcmF3LW5hbmQtY2hp
cC55YW1sIHRvIGFsbG93IHN1Y2ggdW5pdAphZGRyZXNzZXMuIFVuZm9ydHVuYXRlbHkgJG5vbmVu
YW1lcyBkZWZpbmVkIGluIGJpbmRpbmdzIHRoYXQgcmVmZXJlbmNlCnJhdy1uYW5kCgpTaWduZWQt
b2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KClY0OgotIHJlaW50
cm9kdWNlIHBhdGNoIHRvIHNpbGVuY2UgZHRjIHZhbGlkYXRpb24gZXJyb3IsIGFmdGVyIGRpc2N1
c3Npb24KICB3aXRoIFJvYiBIZXJyaW5nIGFuZCBNaXF1w6hsIFJheW5hbAotIGFkZCBzb21lIG1v
cmUgZGV0YWlsIHRvIHRoZSBjb21taXQgbWVzc2FnZQotIHJlbW92ZSB1bml0IGFkZHJlc3MgZm9y
bWF0IHJhdGhlciB0aGFuIGV4dGVuZGluZyBpdAogIChvbGQgcGF0dGVybjogIl5uYW5kQFthLWYw
LTldKCxbMC05YS1mXSopPyQiKQoKVjM6Ci0gcmVtb3ZlIHBhdGNoIGFmdGVyIGRpc2N1c3Npb24g
d2l0aCBNaXF1w6hsIFJheW5hbAoKVjI6Ci0gbmV3IHBhdGNoCi0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yYXctbmFuZC1jaGlwLnlhbWwgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Jhdy1uYW5kLWNoaXAueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtY2hpcC55YW1sCmlu
ZGV4IDA5MjQ0OGQ3YmZjNWNjZDI0NmNhNGIyMzQxNDY0ZTE4NzIyYTJkNTEuLmQ2NTVmNjY3M2Zj
MzFiMWQ5ZWU3Y2Q3MzRjYmUxZDMxMGY4ODA5MGIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtY2hpcC55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtY2hpcC55YW1sCkBAIC0yNSw3
ICsyNSw3IEBAIGRlc2NyaXB0aW9uOiB8CiAKIHByb3BlcnRpZXM6CiAgICRub2RlbmFtZToKLSAg
ICBwYXR0ZXJuOiAiXm5hbmRAW2EtZjAtOV0kIgorICAgIHBhdHRlcm46ICJebmFuZEAiCiAKICAg
cmVnOgogICAgIGRlc2NyaXB0aW9uOgoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
