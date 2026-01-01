Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004FAEEB579
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jan 2026 16:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxJbdqlMUpKHgPGdYdhxiPkqS0ef0QkVK2CAuFsxss0=; b=IEPWptQsRA6k4F
	YU53YPasMVs+7hdY+DQKfL7YG0e/K9G+mZqqGAqOD5ZS93vSzapYNuF2RtvdafdASTRGmnu8bIA5g
	bHObrwav/5RJzDikdGTdab1We7kmMGZUb0uEys/e7R/wl2MY+4quWwupK6g2Gg37b4gJj2bO5g7yy
	4zO3jECXPJVmg9XGS3nBrc2+CsCpGuj9Thhtb31OBPRaLDhJ29MlHEtAUqaNXRj0/sWIQHsZrs7Ki
	W9wBsdPSz9zcYQOYszcsiXi4qmPUiOjLwwzHxuWpYvfPyF2psS4pnodZdjVMYGYTOgQ4YQC3Yhjfn
	cjisbGZh80bxzdVDlvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbM0V-00000007MeP-07o7;
	Thu, 01 Jan 2026 16:58:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbM0R-00000007McV-2a4Z
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jan 2026 16:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E96D44495;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B845C19421;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767286714;
	bh=nCUlGdy1LiHaJ2ajH+Pk5P8y8S4BG2jUiiD913ir+NY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MjFHcnYZ3lNfodof9zJni+I+Poxg98qhWozF25MLd1/chhzIugur4kGZ5EK/q/TGb
	 sXu96qLZWwPHJauqsuaqm5ZaxSfJYDhtn2tsJcRBNIeagy3+dd3vlIAgpJMHTvLIhB
	 kp2v6WMBAOO8L6Ff3v8+Eo2WfM5yEPWPxBo6UW2S9jF7QmdCygDFqCLFRSg5hk003v
	 +RwLilEyZQYNM8AGtE2JePg1nsM3oU7665Bf2OD50+CLJ5F5Zxmbq/rNyJwAct7BpD
	 d1sANYpExn/+1e6vdYTYkF/uyMT2f8FGTOqoETo+/Eei0GzXIGqEjA2P97rHrCQNKn
	 /ukNevBn1NN8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153EAEED626;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 17:58:14 +0100
Subject: [PATCH RESEND v5 1/4] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
MIME-Version: 1.0
Message-Id: <20260101-ppcyaml-elbc-v5-1-251c7f14a06c@posteo.net>
References: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
In-Reply-To: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767286712; l=1491;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=EJ9cqjRClj/DlBIVopL2aU8EyEf/7MEDGKU7+90KqQA=;
 b=A9xr4ME48fGE5vkHnKWyrFvYLcL0s+dUseugN8Gw83AijN/QlKngo22OaxGarXoT3Qyxw2L94
 bLaHIhO/qYlCR8KnKQJB4p/ihK5ryD2GW8WCNmCTmfZZVXw7dp3GEIX
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_085835_699089_529B7E2E 
X-CRM114-Status: GOOD (  12.08  )
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
YW1lcyBkZWZpbmVkIGluIGJpbmRpbmdzIHRoYXQgcmVmZXJlbmNlCnJhdy1uYW5kCgpSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTog
Si4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCgpWNToKLSBBZGQgUm9iJ3MgcmV2
aWV3IHRhZwoKVjQ6Ci0gcmVpbnRyb2R1Y2UgcGF0Y2ggdG8gc2lsZW5jZSBkdGMgdmFsaWRhdGlv
biBlcnJvciwgYWZ0ZXIgZGlzY3Vzc2lvbgogIHdpdGggUm9iIEhlcnJpbmcgYW5kIE1pcXXDqGwg
UmF5bmFsCi0gYWRkIHNvbWUgbW9yZSBkZXRhaWwgdG8gdGhlIGNvbW1pdCBtZXNzYWdlCi0gcmVt
b3ZlIHVuaXQgYWRkcmVzcyBmb3JtYXQgcmF0aGVyIHRoYW4gZXh0ZW5kaW5nIGl0CiAgKG9sZCBw
YXR0ZXJuOiAiXm5hbmRAW2EtZjAtOV0oLFswLTlhLWZdKik/JCIpCgpWMzoKLSByZW1vdmUgcGF0
Y2ggYWZ0ZXIgZGlzY3Vzc2lvbiB3aXRoIE1pcXXDqGwgUmF5bmFsCgpWMjoKLSBuZXcgcGF0Y2gK
LS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Jhdy1uYW5kLWNoaXAu
eWFtbCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3
LW5hbmQtY2hpcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9y
YXctbmFuZC1jaGlwLnlhbWwKaW5kZXggMDkyNDQ4ZDdiZmM1Y2MuLmQ2NTVmNjY3M2ZjMzFiIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Jhdy1uYW5k
LWNoaXAueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Jh
dy1uYW5kLWNoaXAueWFtbApAQCAtMjUsNyArMjUsNyBAQCBkZXNjcmlwdGlvbjogfAogCiBwcm9w
ZXJ0aWVzOgogICAkbm9kZW5hbWU6Ci0gICAgcGF0dGVybjogIl5uYW5kQFthLWYwLTldJCIKKyAg
ICBwYXR0ZXJuOiAiXm5hbmRAIgogCiAgIHJlZzoKICAgICBkZXNjcmlwdGlvbjoKCi0tIAoyLjUx
LjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
