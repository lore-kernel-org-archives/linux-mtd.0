Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C84CCCFA1D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8fn6Y8WzF60TVtVol6C5/dIDbg2riqG2YEziT+QbBDo=; b=qnC2K1xwhlclA9
	Ei6/AVjHUaoq6CF7GhqrMjhbmBVMFOICampOiaqbfmMK+NT2Mw3ZMjzQxFtv0wo2f130jHvouqf50
	AkYipn89ofmJ/RxC6SgRFToCL+N8tZghQJClApHY6i2vgOBIwqMYmpwDTr0pJLiqOP7h7AfasfPlW
	HOYhDEpvriLK7Hn7Q426Ny3AQaIK9/Wi0PzjHU+OTp60qNFKqoWRpifuX55Xpk9s4jDR/8U5DcJl7
	CpHRufegDRX8C8cc/+dCI7EEdR20VRR388t7JOj5Gk9qUfFnyAGf5mOML7S6H45NyTmgUwNb3phCj
	UdB6j2+LHcfplVjon6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIK-0000000EAPZ-2rRj;
	Wed, 05 Nov 2025 17:27:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhII-0000000EANQ-1rJz
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Nov 2025 17:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HKjwLc9WMgewf//y7bZUVi151/7kk6WShUalaztiDao=; b=bv1/HIFNn0sH7kk7K8wVnu3smF
	toy3g49p6pu8hSTbrywsduJXvSnNAEMdx2ZEPw5hYb+qlKsnwG+ISCT691H0MKptcZNVYnpb+0SyI
	fePy54G2skQN3IPJJrrR5eQXp1bP71T6GjgIkrCq4QceTfITRbKbgnryG9tcMy1AUtfZh8k3sd3My
	Jh8qcrznTBBSw2OW64F+z9x6I6sDHKrtdi8APO+ytfJP52k7KdO6ZFmC+PQfOjEMEgGAlmcPnwgv5
	QYhy558ZPCvb2hLK285fyJwwj/zurOtvrtUeOoSZ4A7sZr6HP0vU4bQ8U9kAq0gEnMznJ5VdUh/6j
	iBCim7yg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgQW-00000002cVn-3GgC
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:32:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2D8CBC0E639;
	Wed,  5 Nov 2025 17:27:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1948E60693;
	Wed,  5 Nov 2025 17:27:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A58A710B50A4D;
	Wed,  5 Nov 2025 18:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762363644; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HKjwLc9WMgewf//y7bZUVi151/7kk6WShUalaztiDao=;
	b=Q0OMW6Aiio1vz08fxNMUflPROrTRHaX/bt1lUn+/6oEfHe82s1qDXLWwVrG5+kLHb36Z9l
	MFyLK28rAViy0SKFM44ffzWqGsanwYQJFgdlKfqqUsqMWUEpxkdfDu9+/bPqjZ3gpan9XL
	rWGbZAxWEGQWPrf3f8EV/dWenT1R/HAFP3N29Ba1q/4tWR3a5oVqfKo8MIVC3UQfyQHJGa
	g8d/7iagjH6MvJp+OfVKpluEDldrdQkPbAwYBBknE0tB7/MWW4yAd1oaVlpKCiRW0vwxqc
	AjN8/qB6u11M6Ei11ju2dRiGFmDmtGsvpPZn+dpfznaJtIteLFYW5oXpR2QICQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/6] Hello,
Date: Wed, 05 Nov 2025 18:26:59 +0100
Message-Id: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOOIC2kC/x3MQQqEMAxA0atI1hMwhdriVYZZjG3UbFJJQQXx7
 haXb/H/BZVNuMLYXWC8S5WiDfTpIK1/XRglN4PrnSfqPR6iU9GM+4AU0RJh3QS1GIY5xDS5EH0
 eoPWb8Szn+/7+7vsBHCEDUGsAAAA=
X-Change-ID: 20251105-winbond-v6-18-rc1-spi-nor-7f78cb2785d6
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_163204_856309_8BB3FC9B 
X-CRM114-Status: UNSURE (   7.18  )
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

SGVyZSBpcyBhIHNlcmllcyBhZGRpbmcgc3VwcG9ydCBmb3IgNiBXaW5ib25kIFNQSSBOT1IgY2hp
cHMuIERlc2NyaWJpbmcKdGhlc2UgY2hpcHMgaXMgbmVlZGVkIG90aGVyd2lzZSB0aGUgYmxvY2sg
cHJvdGVjdGlvbiBmZWF0dXJlIGlzIG5vdAphdmFpbGFibGUuIEV2ZXJ5dGhpbmcgZWxzZSBsb29r
cyBmaW5lIG90aGVyd2lzZS4KCkluIHByYWN0aWNlIEkgYW0gb25seSBhZGRpbmcgNiB2ZXJ5IHNp
bWlsYXIgSURzIGJ1dCBJIHNwbGl0IHRoZSBjb21taXRzCmJlY2F1c2UgdGhlIGFtb3VudCBvZiBt
ZXRhIGRhdGEgdG8gc2hvdyBwcm9vZiB0aGF0IGFsbCB0aGUgY2hpcHMgaGF2ZQpiZWVuIHRlc3Rl
ZCBhbmQgd29yayBpcyBwcmV0dHkgYmlnLgoKQXMgdGhlIGNvbW1pdHMgc2ltcGx5IGFkZCBhbiBJ
RCwgSSBhbSBDYydpbmcgc3RhYmxlIHdpdGggdGhlIGhvcGUgdG8KZ2V0IHRoZXNlIGJhY2twb3J0
ZWQgdG8gTFRTIGtlcm5lbHMgYXMgYWxsb3dlZCBieSB0aGUgc3RhYmxlIHJ1bGVzIChzZWUKbGlu
ayBiZWxvdywgYnV0IEkgaG9wZSBJIGFtIGRvaW5nIHRoaXMgcmlnaHQpLgoKTGluazogaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTcuNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMucnN0I0wxNQoKVGhhbmtzLApNaXF1w6hsCgotLS0K
TWlxdWVsIFJheW5hbCAoNik6CiAgICAgIG10ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIHN1cHBv
cnQgZm9yIFcyNVEwMU5XeHhJUSBjaGlwcwogICAgICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFk
ZCBzdXBwb3J0IGZvciBXMjVRMDFOV3h4SU0gY2hpcHMKICAgICAgbXRkOiBzcGktbm9yOiB3aW5i
b25kOiBBZGQgc3VwcG9ydCBmb3IgVzI1UTAyTld4eElNIGNoaXBzCiAgICAgIG10ZDogc3BpLW5v
cjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNUg1MTJOV3h4QU0gY2hpcHMKICAgICAgbXRk
OiBzcGktbm9yOiB3aW5ib25kOiBBZGQgc3VwcG9ydCBmb3IgVzI1SDAxTld4eEFNIGNoaXBzCiAg
ICAgIG10ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNUgwMk5XeHhBTSBj
aGlwcwoKIGRyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jIHwgMjQgKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21t
aXQ6IDQ3OWJhN2ZjNzA0OTM2Yjc0YTkxZWUzNTJmZTExM2Q2MzkxZDU2MmYKY2hhbmdlLWlkOiAy
MDI1MTEwNS13aW5ib25kLXY2LTE4LXJjMS1zcGktbm9yLTdmNzhjYjI3ODVkNgoKQmVzdCByZWdh
cmRzLAotLSAKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
