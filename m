Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71ACD2ECFD
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 01:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjDSWTzBE2qC6YBCoTaRkMkfIMh3aZUW9X4Ww9A79V8=; b=4tarN2/aUOAnXj
	SQebdwoAoqgYnhl/eo/g6iVtZSMuhY1DFjLqxbZNKlOvFd9tbUIoU8R28OaUjRVs1RyTukal2RpO8
	Yxr0B47dYL+8cdK3IiplphJMrj4KrOlvTWh/z05MOKZwn/hjmJxvYizTweEQdjxMgUjtJmYyJHSWy
	uWBFAS3pc2U3DmiXeUSowlYStSVV4lIPXNp7FCrCFjdI0Hp+PCMNqeXSDEOqqouX28JldKylLcvYJ
	kskXMTBtfrcJ5WYp2wonwjqlAE751PXpsaJ4ZVzy6DPbkzZJVV2zNJh52yvwaTAzHGRBk/Gu0iWws
	3AMNbp/W/mdIJO/+OrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rd-000000033d9-0j6I;
	Tue, 20 Jan 2026 01:49:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rc-000000033ck-0a3u
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 01:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15ABB6015A;
	Tue, 20 Jan 2026 01:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09D0C116C6;
	Tue, 20 Jan 2026 01:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768873738;
	bh=g/uMQusRPTzXLgyH55SF2Z0Ew27f2Lx3R56DScAIcKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ncyo4giv2phgkfri7JiliRauLyWNGyPHeJ7eBayc+j+tixYyhVmHowa/m4lPQ1UH1
	 5LpZkYZ/yBich6u93+kfAo9UaIPDemKL4XZX4mlpbf2NfCFeKBdRn/B3aLX0/ptu8c
	 k0rviGH3w/irU75dZ1gyGKjIMQiv9SeWr1oyQLgvjs9MnfjsZ79a5YE5XWZdGGCgid
	 QC9Fy4buIEv5Aw+XF7ZZUy+OXXBpkvm10vpB5eHf0SVE3uxpe2qLONpFFeb2bKZxG7
	 mm4dyEo2nU94gC8AXqsWaqPIStNQIPoN3BCJuW5Q85oUxzyFLvXfgFvImwhAER7nUm
	 xOD7dw562bH2g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:48:23 -0600
Subject: [PATCH v2 02/10] dt-bindings: mtd: fixed-partitions: Move
 "compression" to partition node
MIME-Version: 1.0
Message-Id: <20260119-dt-mtd-partitions-v2-2-77ebb958a312@kernel.org>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
In-Reply-To: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, 
 Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Simon Glass <simon.glass@canonical.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
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

VGhlICJjb21wcmVzc2lvbiIgcHJvcGVydHkgaXMgZGVmaW5lZCBpbiB0aGUgd3JvbmcgcGxhY2Ug
YXMgaXQgYXBwbGllcwp0byBpbmRpdmlkdWFsIHBhcnRpdGlvbnMgbm9kZXMsIG5vdCBhbGwgbm9k
ZXMuCgpGaXhlczogOGJhYmE4ZDUyZmY1ICgiZHQtYmluZGluZ3M6IG10ZDogZml4ZWQtcGFydGl0
aW9uczogQWRkIGNvbXByZXNzaW9uIHByb3BlcnR5IikKUmV2aWV3ZWQtYnk6IFNpbW9uIEdsYXNz
IDxzaW1vbi5nbGFzc0BjYW5vbmljYWwuY29tPgpSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPgpTaWduZWQtb2ZmLWJ5
OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgICAgICB8IDE4IC0tLS0tLS0tLS0t
LS0tLS0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9u
LnlhbWwgIHwgMTggKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFy
dGl0aW9ucy55YW1sCmluZGV4IDYyMDg2MzY2ODM3Yy4uNzNkNzRjMGY1Y2I3IDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQt
cGFydGl0aW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKQEAgLTI5LDI0ICsyOSw2IEBAIHBy
b3BlcnRpZXM6CiAKICAgIiNzaXplLWNlbGxzIjogdHJ1ZQogCi0gIGNvbXByZXNzaW9uOgotICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZwotICAgIGRlc2Ny
aXB0aW9uOiB8Ci0gICAgICBDb21wcmVzc2lvbiBhbGdvcml0aG0gdXNlZCB0byBzdG9yZSB0aGUg
ZGF0YSBpbiB0aGlzIHBhcnRpdGlvbiwgY2hvc2VuCi0gICAgICBmcm9tIGEgbGlzdCBvZiB3ZWxs
LWtub3duIGFsZ29yaXRobXMuCi0KLSAgICAgIFRoZSBjb250ZW50cyBhcmUgY29tcHJlc3NlZCB1
c2luZyB0aGlzIGFsZ29yaXRobS4KLQotICAgIGVudW06Ci0gICAgICAtIG5vbmUKLSAgICAgIC0g
YnppcDIKLSAgICAgIC0gZ3ppcAotICAgICAgLSBsem9wCi0gICAgICAtIGx6NAotICAgICAgLSBs
em1hCi0gICAgICAtIHh6Ci0gICAgICAtIHpzdGQKLQogcGF0dGVyblByb3BlcnRpZXM6CiAgICJA
WzAtOWEtZl0rJCI6CiAgICAgJHJlZjogcGFydGl0aW9uLnlhbWwjCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFy
dGl0aW9uLnlhbWwKaW5kZXggODBkMDQ1MmEyYTMzLi4wYjk4OTAzN2EwMDUgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRp
b24ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvcGFydGl0aW9uLnlhbWwKQEAgLTEwOCw2ICsxMDgsMjQgQEAgcHJvcGVydGllczoKICAg
ICAgIHdpdGggdGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1lbmTi
gJkgaXMgbm90IHByb3ZpZGVkLAogICAgICAgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KIAor
ICBjb21wcmVzc2lvbjoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9zdHJpbmcKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgQ29tcHJlc3Npb24gYWxnb3JpdGht
IHVzZWQgdG8gc3RvcmUgdGhlIGRhdGEgaW4gdGhpcyBwYXJ0aXRpb24sIGNob3NlbgorICAgICAg
ZnJvbSBhIGxpc3Qgb2Ygd2VsbC1rbm93biBhbGdvcml0aG1zLgorCisgICAgICBUaGUgY29udGVu
dHMgYXJlIGNvbXByZXNzZWQgdXNpbmcgdGhpcyBhbGdvcml0aG0uCisKKyAgICBlbnVtOgorICAg
ICAgLSBub25lCisgICAgICAtIGJ6aXAyCisgICAgICAtIGd6aXAKKyAgICAgIC0gbHpvcAorICAg
ICAgLSBsejQKKyAgICAgIC0gbHptYQorICAgICAgLSB4egorICAgICAgLSB6c3RkCisKIGlmOgog
ICBub3Q6CiAgICAgcmVxdWlyZWQ6IFsgcmVnIF0KCi0tIAoyLjUxLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
