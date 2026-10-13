Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD5CA9ED2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYa/P5oyVZ8MizMp/Jvw3cp83/ypVhe6hUG2RkzluWs=; b=U7tpybtLyOBzSC
	ij/bW73UQGrbu7LBctL3ihGy0o8oIWoFC5BctqbuKW5FM5E53T5eOLbUX/Lv99XtWfbU+/GyLeZl0
	Sihy9jcCba5GoPjmuAHT5VLObR/9Za923zLvchJ3XbxMC+eLT8nRck8SbrzJoo1hgek0zHZFstgW0
	XW+RXnyA7spEnDixnnYwQoIh7mevxkdC4ThpKNsO82Vp/Fz1hpJT/kYbotqGWzF39Odgz9cP27dd2
	CAVl//GlGirTqeR2EWd/TQGQb+GF3GuPJL9eyr/9kCisYawdWVIBSD6ZfIbFhxlFHKwrkEnl99D78
	0ttUG7FzFjjGsaj6iotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaG3-0000000CecH-3ut4;
	Tue, 13 Oct 2026 11:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaFs-0000000Cean-38WU
	for linux-mtd@bombadil.infradead.org;
	Tue, 13 Oct 2026 11:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pRsd0+ITU/DhENFNJeUWb5wGX0cdOh0IA/UVGxrV/7w=; b=LlikXTGN1PQmiqDhgnPFOyZXwt
	ua8ieTukSWCcULHBplOo89rOgV/MXT6VZ1E/aRNhnZF9dAPxh+63Mxr64zVb5oJWJPPMq+VBUOsYd
	aBquLQtuAp1tJ97gV63p1XcEGkhIr0fLRZzhEHXWAiXH3SQYIOys5ktaY5Xg1B7ocvE5Blr/yEv+K
	S8z8tViYsH/zzLlULzpqEukJYEfRJUq8arHUUejnzwY/V1TCEZkSKoU+Ci5cVQXGJPA9CH3yBrg2I
	Vm6NkozyffIwR49A4VX1obaiDbcjoJTRq+sse1qj21JjYLAc70DZTsAnPPuzEh9EQAQW+zdp+UeZf
	cyNXCLRQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGaFp-0000000FSP7-2XqZ
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 11:01:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 70610C653E6;
	Tue, 13 Oct 2026 11:02:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBD8E60362;
	Tue, 13 Oct 2026 11:01:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF66D11D70DB0;
	Tue, 13 Oct 2026 13:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791889259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pRsd0+ITU/DhENFNJeUWb5wGX0cdOh0IA/UVGxrV/7w=;
	b=pa6q+aFWWBhpNbm91Cl8fTXViS2r51JQPutE+sx/neqqdCtEyFAs4GgOssai/IU8VWqWZ1
	t4tSjUnFkSTzrR0tLAu22j5TN1aQrzF7MEe+mx21XPeGFwVYhEWXoHCPUmD5yvP2whUG2A
	kOtRXPhSsx0fsmvskVnGBbVRGIGGx1UKGS4MbqhmYIqKYyrfEpSAHu6OLC4ORq2QK6v4i4
	rQpAOq/lyFJJxtm8L4vepYNp/VAchjDNCCXV6DeRldcbbLw0m3zIF6x58iMtwdMVPUTbqH
	ulUYuAkDJhGApzlQLsmS7dSVkqGfM3YLYTXF9J7cF+LlcddIQQWf1DcMGe0AyQ==
Message-ID: <0d2f1d4149cd136ace8c1f08dc48ea7f25c5975c.camel@bootlin.com>
Subject: Re: [PATCH 1/5] spi: spi-mem: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger	 <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Kees Cook <kees@kernel.org>, Tony Luck	
 <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, Tanmay Jagdale <tanmay@marvell.com>
Date: Tue, 13 Oct 2026 13:00:50 +0200
In-Reply-To: <eb16cf0a-6b7e-4ea3-89c5-61ba0729492d@sirena.org.uk>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
	 <20261005081141.33688-2-paul.cercueil@bootlin.com>
	 <asdVM883VTQy7WvH@sirena.co.uk>
	 <5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
	 <eb16cf0a-6b7e-4ea3-89c5-61ba0729492d@sirena.org.uk>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_120109_864745_AF69D6BF 
X-CRM114-Status: GOOD (  16.81  )
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

TGUgbWFyZGkgMTMgb2N0b2JyZSAyMDI2IMOgIDExOjQyICswMTAwLCBNYXJrIEJyb3duIGEgw6lj
cml0wqA6Cj4gT24gVHVlLCBPY3QgMTMsIDIwMjYgYXQgMTA6MjU6MDdBTSArMDIwMCwgUGF1bCBD
ZXJjdWVpbCB3cm90ZToKPiA+IExlIGpldWRpIDA4IG9jdG9icmUgMjAyNiDDoCAxMDozMiArMDIw
MCwgTWFyayBCcm93biBhIMOpY3JpdMKgOgo+IAo+ID4gPiBUaGlzIGFsc28gbmVlZHMgdG8gZW5z
dXJlIHRoYXQgdGhlIHF1ZXVlIGlzIGlkbGUgLSB3ZSdsbCBzdGlsbCBleGVjdXRlCj4gPiA+IHNw
aV9tZW1fYWNjZXNzX3N0YXJ0KCkgd2hpY2ggZmx1c2hlcyB0aGUgcXVldWUsIGFuZCB3ZSd2ZSBn
b3QgcnVudGltZSBQTQo+ID4gPiBvcGVyYXRpb25zIHRoZXJlIHdoaWNoIG1pZ2h0IGJlIGEgYml0
IGNoYWxsZW5naW5nIGluIGEgcGFuaWMgc2l0dWF0aW9uLgo+IAo+ID4gRG9lcyBpdCB0aG91Z2g/
IFRoZSBrZXJuZWwgaXMgcGFuaWNraW5nIHNvIHRoZSBxdWV1ZSB3b24ndCBiZSBwcm9jZXNzZWQK
PiA+IGFueW1vcmUsCj4gPiBpdCBzaG91bGQgYmUgZmluZSB0byBqdXN0IGlnbm9yZSBpdC4KPiAK
PiBEbyB0aGUgb3RoZXIgQ1BVcyBrbm93IHRoZXkncmUgcGFuaWNpbmcgeWV0LCBhbmQgd2hhdCBz
dGF0ZSBpcyB0aGUKPiBoYXJkd2FyZSBpbj/CoCBJJ20gYSBiaXQgbmVydm91cyBhYm91dCBhc3N1
bWluZyBwYW5pYyBnb3QgdGhpbmdzIGludG8gYQo+IGdvb2Qgc3RhdGUuCgpUaGUgb3RoZXIgQ1BV
cyBhcmUgc3RvcHBlZCwgeWVzLiBBdCB0aGF0IHBvaW50IHRoZXJlJ3Mgbm8gU01QLCBubyBwcmVl
bXB0aW9uLCBubwpJUlFzLCBubyB0aW1lIGFjY291bnRpbmcuCgpUaGUgaGFyZHdhcmUgaXMgc3Vw
cG9zZWQgdG8gYmUgaW4gaWRsZSBzdGF0ZSwgYW5kIHRoZSB3YXkgd2UgZW5zdXJlIHRoYXQgaXMg
YnkKY2hlY2tpbmcgdGhhdCB0aGUgY29udHJvbGxlcidzIGlvX211dGV4IC8gYnVzX2xvY2tfbXV0
ZXggYXJlIHVubG9ja2VkLiBJZiB0aGUKU1BJIGRyaXZlciB3YXMgYnVzeSB3aGVuIHRoZSBwYW5p
YyBvY2N1cmVkLCB3ZSBqdXN0IGJhaWwuCgpDaGVlcnMsCi1QYXVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
