Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F462CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvGa6MhJl8oDK/BJN0g1xssxMM1pVxWojVXLo9+0F8U=; b=wrA1mNHf+Hz4zx
	V7uYzsnN7yG2ZTNEjOZxYzX/GLLJpA/HLZRdeukn4RqO5OKPrmKHFQPN5ZmRyjSVuqKw7x7zW5VM9
	s6wqZjcdWUj31KNr3Wpl5BYqGTZXQkXf0ybiBytoKBvYLtQl2fKVFmQ9kcYXIOSOD5cqdlyOwqpMJ
	rcIdAR3/jkgzllAymMasq5u9DRiAtcbodXF1Gpi3KshFFAbSy7Zhxv+1U5GN5dstyuSTqz1022UO4
	FRxZ79pP++o4Yxp6rcIn86apQ9x5sjuPVx/9e5LniEdXHL2lKqBpkh6B/I6SDEzOsEkFCLgWFUGDd
	Exbcv5LyVHiZZ76a6Hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqprm-0001Qw-0o;
	Thu, 12 Oct 2023 07:12:18 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqprj-0001PV-0b
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 07:12:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E788240004;
	Thu, 12 Oct 2023 07:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697094726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gUyEMS1q0fC0UAof2Vqf/bmiL6uURnF5y3TtaUUHCzY=;
	b=Y9d/fS0EBbOzRlvTRZ5L/tG9ANVdRNMenyyzmOl36Hg1ML+NiAoh8jqdGn51RtU0KZ5d1Z
	0c4PVbqo3FLyS4GoHRKpwuk6lPf491BY+uUVldbEP0O0LE4Zxmon/DIUpB7UIAZddA2pzR
	as0kmUI6rbywmQQT9RUWFJ084WGh+u1W+xiZS5eFpdxW8+0Zb3SlYz5QZ+ubIwBJmwmSOP
	SwJF30GOu+Mk1Lb3VE9GJAmGHL3UgGraByXfk0kKsdeAwYM6UtN6VZ1sg50+qibQ+phmpn
	dT19qyZkvjTQIJrLXv1R/Z4ALTd4bi+UoUiLxK1xrmgPEuYXDh/DZsfNkBJbqQ==
Date: Thu, 12 Oct 2023 09:12:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 3/4] mtd: rawnand: brcmnand: pass host struct to
 bcmnand_ctrl_poll_status
Message-ID: <20231012091202.7c963f3f@xps-13>
In-Reply-To: <trinity-d3f78d82-f01e-4c98-9afa-18c5f7ddfd1c-1697071308619@3c-app-mailcom-lxa05>
References: <trinity-d3f78d82-f01e-4c98-9afa-18c5f7ddfd1c-1697071308619@3c-app-mailcom-lxa05>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_001215_376864_17215D33 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpkcmVnYW5AbWFpbC5jb20gd3JvdGUgb24gVGh1LCAxMiBPY3QgMjAyMyAwMjo0MTo0OCAr
MDIwMDoKCj4gcGFzcyBob3N0IHN0cnVjdCB0byBiY21uYW5kX2N0cmxfcG9sbF9zdGF0dXMgaW5z
dGVhZCBvZiBjdHJsIHN0cnVjdCwKCkNhcGl0YWwgbGV0dGVyCgo+IHNpbmNlIHJlYWwgdGltZSBz
dGF0dXMgcmVxdWlyZXMgaG9zdCwgYW5kIGN0cmwgaXMgYSBtZW1iZXIgb2YgaG9zdC4KCnJlYWwg
dGltZSBzdGF0dXM/IEknbSBzb3JyeSB0aGlzIGNvbW1pdCBsb2cgaXMgbm90IHZlcnkgY2xlYXIu
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFJlZ2FuIDxkcmVnYW5AbWFpbC5jb20+Cj4gCgpU
aGlzIG5ldyBsaW5lIHNob3VsZCBiZSBkcm9wcGVkIChpbiBhbGwgeW91ciBjb21taXQgbG9ncykK
Cj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MjogYWRkZWQgdGhpcyBwYXRjaCBpbiBzZXJpZXMKClRo
ZSB2ZXJzaW9uaW5nIGlzIHdyb25nIGJ0dywgeW91IHNob3VsZCBjb250aW51b3VzbHkgaW5jcmVh
c2UgdGhlCmNvdW50ZXIsIHRoaXMgaXMgbm90IGp1c3QgeW91ciBzZWNvbmQgdmVyc2lvbi4gQW5k
IGFzIEkgc2FpZCBwbGVhc2UgdXNlCmI0IG9yIGdpdC1zZW5kLWVtYWlsIHNvIHBhdGNoZXMgMisg
YXJlIGFuc3dlcnMgb2YgcGF0Y2ggMSBhbmQgaW4gbXkKaW5ib3ggaXQgbG9va3MgbGlrZSA0IHJl
bGF0ZWQgcGF0Y2hlcyBpbnN0ZWFkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
