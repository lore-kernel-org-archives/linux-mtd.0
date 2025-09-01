Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A54CA0FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHp4+0dYKBUBny2vdEr0+eo4iRv3rFX11f2Xvb46JEo=; b=EK62hZ79j64k2a
	xGy+1N4xtp0w5fcfPxRytsYzJrOPEDU03q/q2x+1/Lvysk5WfJ7384v4ewOaeMeS2r38dyIeacLtH
	zaJ0TeUDYsFE7Jycgg0W8UVFkiAUvfdjfr5kV2qmNOX1JcorEbvKyu5T0jDEx5pzjVOWVAF+1FuNv
	pN787ZspUTDdAkFnUR9GoU+EJsQ74+tRhmxIYltsV0j56t84DstX9BWv7uv8nBuQApK/PJrapsKza
	aRU9r9TkyPygMVuvZNngVXsHmohko/kTOsk+X2YL6euIKwjlQkwp9kxvZZ9bGWCABu7PVMQ1YARXQ
	iqvm4FHNkrM7k8dVZ5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oy-0000000CtLX-0Tfq;
	Mon, 01 Sep 2025 14:47:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3bu-0000000CQCK-1LHb
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2FA141A0A08;
	Mon,  1 Sep 2025 12:26:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 044AD60699;
	Mon,  1 Sep 2025 12:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6D601C22DA15;
	Mon,  1 Sep 2025 14:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YCqaE2ySIm63FisMTJw+SXZ6ZQeQnKmc9VEQeBOhYn0=;
	b=U+LMqe9iV+Swgehee0pXcKAhLo0/LDdrz1Ai5aPoKhYqOroiF2TWliFgjrp26Ht9lomvJT
	hwss5BxWG1+miMipU3yEWy9H7QbaMG//0xxedQ5AJbsVzl+Lxz/HYXc4vLx5gbhAgweuGu
	YxFA59FUOIB47sxOqKaQhs05cRqnn8ZH8qA1y2qrpJOGBRGVs4koV42imwxQmIiSBDool3
	0MjNgHxADWyLSpvVQPviodq7pTETuyYX7vfTN28+T4sVOW/t9H9NfBQx8CN/QzjsMBv0lA
	12PzWREHJWSLnv9raIOvD1iErCrWX0urZXxWTolgapgCfFZH5abDQ86SHur1UQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomasw@gmail.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Raag Jadav <raag.jadav@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <def775b1d7afe43720d2a1778735e764a01cb017.1753950712.git.geert+renesas@glider.be>
References: <def775b1d7afe43720d2a1778735e764a01cb017.1753950712.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] mtd: MTD_INTEL_DG should depend on DRM_I915 or
 DRM_XE
Message-Id: <175672956260.48300.15057365027365895620.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:02 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052610_506491_88BA8F8E 
X-CRM114-Status: UNSURE (   8.07  )
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

T24gVGh1LCAzMSBKdWwgMjAyNSAxMDozNToxNCArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IEludGVsIERpc2NyZXRlIEdyYXBoaWNzIG5vbi12b2xhdGlsZSBtZW1vcnkgaXMgb25s
eSBwcmVzZW50IG9uIEludGVsCj4gZGlzY3JldGUgZ3JhcGhpY3MgZGV2aWNlcywgYW5kIGl0cyBh
dXhpbGlhcnkgZGV2aWNlIGlzIGluc3RhbnRpYXRlZCBieQo+IHRoZSBJbnRlbCBpOTE1IGFuZCBY
ZTIgRFJNIGRyaXZlcnMuICBIZW5jZSBhZGQgZGVwZW5kZW5jaWVzIG9uIERSTV9JOTE1Cj4gYW5k
IERSTV9YRSwgdG8gcHJldmVudCBhc2tpbmcgdGhlIHVzZXIgYWJvdXQgdGhpcyBkcml2ZXIgd2hl
bgo+IGNvbmZpZ3VyaW5nIGEga2VybmVsIHdpdGhvdXQgSW50ZWwgZ3JhcGhpY3Mgc3VwcG9ydC4K
PiAKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDog
TVREX0lOVEVMX0RHIHNob3VsZCBkZXBlbmQgb24gRFJNX0k5MTUgb3IgRFJNX1hFCiAgICAgIGNv
bW1pdDogZjU0NGJmMDNhNzcxZWU3NDZiOTA4ZTlhMDhlY2I5N2M2NWEzNTA1NQoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
