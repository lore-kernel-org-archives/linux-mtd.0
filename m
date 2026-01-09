Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D236D232F6
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZbiMjwVZEKrdRsMUeMeH4YIXGzy3eLK3ly9uO6V430=; b=C3wDR4KvjLiN02
	E1WayozKBp77yC59i5gxzw9QSNcymUJ0RQajwhXJw+1kEyeHb7jjyTgGtVGGmmDIVIYVII5iKfnHI
	iL/Tj5LTyzMY/2ZfTyT+gRkjmD/zKNdnnuknWItZChexZ6wnKlc4tIsJsbk6QNk6ljLhGHztSPonA
	DwhRheqYzY/klhAe2dM9g0EitXI6dkcHXiiG85TllZvqhgp06AjjFxFuJR30+GjmKknW/aYzclpIN
	Vt7dfaNfvsMOdGLIyRhZGlEPv4oUcpjZl0o5jt2u97V0nkwnfRvZK/AkhOUOiTaxM+kV8F7sDptLI
	gOJtyFocyJW0RddIa+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8O0-00000001x6F-0qxg;
	Fri, 09 Jan 2026 09:02:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Nw-00000001x5g-3Zy8
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:02:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DB92EC1F6D1;
	Fri,  9 Jan 2026 09:01:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1261B60734;
	Fri,  9 Jan 2026 09:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21670103C885B;
	Fri,  9 Jan 2026 10:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767949335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CTgNQ8aQKCK1awytoBCTagqusNg0f5KtpE7Bd+9hU70=;
	b=O9taR1y3aXblZciBqRSMOSupr+ReveLz5o2s2I5yTRJOgfMafUOyTmpRscqBj/f+fZ5cLn
	MLzyU11frfLWtCNsnWvhVdSnOPGKuOlmRtiNtkApr0XYmslk/ngrb76fkq7lo9/xRyRXox
	YsZ6MpM2CATVxd+Z4fqxtzDhLGVOsKAmSLAELhMrDKAUFK3leQRotyrBVvfl9XeV8kbN0S
	SJxJJ4/VqjEGLba0YB2aQRK5P46bYw9ckUzwligbrlXSX7aQdIANw1urahcxZ0dOPZ8xs5
	mKselM63JX98wnzDCvO9OoIz0/P9AxleQNgv9QWBXcPhYZTmi7OgOxHgJeRWbw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Brian Norris <computersforpeace@gmail.com>,
  Kamal Dasu <kdasu.kdev@gmail.com>,  William Zhang
 <william.zhang@broadcom.com>,  Nick Terrell <terrelln@fb.com>,  David
 Sterba <dsterba@suse.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Simon Glass
 <sjg@chromium.org>,  Linus Walleij <linusw@kernel.org>,  Ulf Hansson
 <ulf.hansson@linaro.org>,  Marcus Folkesson <marcus.folkesson@gmail.com>,
  Tony Lindgren <tony@atomide.com>,  Roger Quadros <rogerq@kernel.org>,
  Hauke Mehrtens <hauke@hauke-m.de>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mmc@vger.kernel.org
Subject: Re: [PATCH 07/10] dt-bindings: mtd: Ensure partition node
 properties are documented
In-Reply-To: <20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org> (Rob
	Herring's message of "Thu, 08 Jan 2026 11:53:16 -0600")
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
	<20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 09 Jan 2026 10:02:07 +0100
Message-ID: <87fr8fxipc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010221_036589_BAA19F55 
X-CRM114-Status: GOOD (  12.32  )
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

SGVsbG8gUm9iLAoKT24gMDgvMDEvMjAyNiBhdCAxMTo1MzoxNiAtMDYsICJSb2IgSGVycmluZyAo
QXJtKSIgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFBhcnRpdGlvbiBub2RlcyB3aXRob3V0
IGEgY29tcGF0aWJsZSBoYXZlIG5vIHJlc3RyaWN0aW9ucyBvbiBhZGRpdGlvbmFsCj4gcHJvcGVy
dGllcy4gRml4IHRoaXMgYnkgZW5zdXJpbmcgJ3VuZXZhbHVhdGVkUHJvcGVydGllcycgaXMgc2V0
IHdoZW4KPiB0aGVyZSdzIG5vIGNvbXBhdGlibGUgcHJvcGVydHkuIElmIHRoZXJlIGlzIGEgY29t
cGF0aWJsZSBwcm9wZXJ0eSwgdGhlbgo+IHRoZXJlIHNob3VsZCBiZSBhIHNwZWNpZmljIHNjaGVt
YSBmb3IgaXQgd2hpY2ggd2lsbCBlbmZvcmNlCj4gJ3VuZXZhbHVhdGVkUHJvcGVydGllcycuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+IC0t
LQoKT3ZlcmFsbCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGlzIHNlcmllcywgSSd2ZSBiZWVu
IHNydWdnbGluZyB3aGlsZQpkZWZpbmluZyB0aGVzZSBhbmQgeW91ciBhcHByb2FjaCBzZWVtcyB2
ZXJ5IHJlbGV2YW50LiBJIGFtIGZpbmUgd2l0aCBhbGwKdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJp
ZXMsIGJ1dCB3aWxsIHdhaXQgYSBiaXQgZm9yIG90aGVycyB0byBtYWtlIGEgYml0Cm9mIGZlZWRi
YWNrLgoKWy4uLl0KCj4gKyRkZWZzOgo+ICsgIHBhcnRpdGlvbi1ub2RlOgo+ICsgICAgdHlwZTog
b2JqZWN0Cj4gKyAgICBpZjoKPiArICAgICAgbm90Ogo+ICsgICAgICAgIHJlcXVpcmVkOiBbIGNv
bXBhdGlibGUgXQo+ICsgICAgdGhlbjoKPiArICAgICAgJHJlZjogJyMnCj4gKyAgICAgIHVuZXZh
bHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArICAgIGVsc2U6Cj4gKyAgICAgICRyZWY6ICcjJwoK
VGhpcywgaG93ZXZlciwgaXMgdG90YWwgYmxhY2ttYWdpYyB0byBtZS4gV291bGQgeW91IG1pbmQg
ZXhwbGFpbmluZyB3aGF0CgogICAgICAkcmVmOiAnIycKCmluZGljYXRlcz8gSXMgdGhpcyBhIHBs
YWNlaG9sZGVyIGluZGljYXRpbmcgImEgcmVmZXJlbmNlIG11c3QgYmUgZ2l2ZW4/CgpBbHNvIEkg
ZG8gbm90IHVuZGVyc3RhbmQgdGhlIGZpbmFsIGVsc2UgY2FzZSwgd2hhdCBpcyBpdCBjb3Zlcmlu
Zz8KClRoYW5rcyBmb3IgdGhlIGxpdHRsZSBleHBsYW5hdGlvbiAob3IgeW91IGNhbiBnaXZlIG1l
IGEgcG9pbnRlciB0byBzb21lCnJlbGV2YW50IGRvYyBJIGNvdWxkIHJlYWQpLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
