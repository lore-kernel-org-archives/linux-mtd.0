Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B631DE95A99
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByWwj8lhksOs5a5/1V6EBjgACoY25VETmdxnI9MH7mM=; b=gPISgdWjQIEp5+
	nypmmqEDBDizvCupqdez8ndCV0e7aqsJwYI9QWs3pR8z9TJgvWCNarHDWUmAy+ztpbqgim6r381ar
	6Od1cq/EQ6mdD+S9OhmE186Qj7zWU3rKkMEgQ1Mw9QJUVAWFRAiKSyzvWQgS+D6LvVMCEAPRs1+E6
	+7b62S9JTiltomZRZlOresM1UEzIGH4GMFqOVjD5skfZb2NYxULiIMaPAi0r1KoKs9WQIK1ZfeYwO
	QGDpR82z/gC3wHexGZihlOT1smbKKPjxaRkYyZXp0uddeiNa55o48ctek/uZu+qlQNbOOiRIB4APr
	tWPnvVXP9Qbc6XEm/ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyi-009E0j-2t;
	Sun, 08 Oct 2023 20:02:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyY-009Due-14
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-0001V1-F3; Sun, 08 Oct 2023 22:01:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-000EzT-2t; Sun, 08 Oct 2023 22:01:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-00Bf0J-Pw; Sun, 08 Oct 2023 22:01:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH 06/20] mtd: powernv_flash: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:29 +0200
Message-Id: <20231008200143.196369-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SNxKBQN3w7wXtWV2/V/mud+9ty25OkXgeLAIa2U5Vkg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlRlrmaVvTdZQ4QWv02eoLmfX/9QfcGSzOzGTQxljTYd0 5tUWZI6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZhI8XT2//EVEjLSThUiW+dF 1Crlf3DUPLlz4uwmM4FFypEBmpapnvdvif4RV9eQYjze/r1e5cXfpzw8bxOu/5Qt/vnGry7Zy/K O+MXeR6FSSzr/lb1LO1v+sPH7i1KbXgujbxxLPxlM+Nb28fy5UMb7q8W41TeqJHqdLndS6VveGf G01//MdNErsQmnI2vvhRaLLH9vmvBTL8ndQmij9e7v2YIafeLdDK9tVyYumL/Zxevwq8ptGQ1vp VXmc1288c05K21N7FH3o7INGz5qzHbT29n8MzFz5pGkrYEvNoncPn9hxSKug2pP4p/V5T8/fMQk 2m5doZ6AulRqNPOrTLOvayeLHdTwb38/Wetm6GZ93vvKAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130206_369791_861001EF 
X-CRM114-Status: GOOD (  16.44  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9kZXZpY2VzL3Bvd2VybnZfZmxhc2guYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL2RldmljZXMvcG93ZXJudl9mbGFzaC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9wb3dlcm52
X2ZsYXNoLmMKaW5kZXggMzZlMDYwMzg2ZTU5Li42NjA0NGY0ZjViYWQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL2RldmljZXMvcG93ZXJudl9mbGFzaC5jCisrKyBiL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvcG93ZXJudl9mbGFzaC5jCkBAIC0yNjUsMTQgKzI2NSwxMiBAQCBzdGF0aWMgaW50IHBvd2Vy
bnZfZmxhc2hfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICAqCiAgKiBSZXR1
cm5zIDAKICAqLwotc3RhdGljIGludCBwb3dlcm52X2ZsYXNoX3JlbGVhc2Uoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHBvd2VybnZfZmxhc2hfcmVsZWFzZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBwb3dlcm52X2ZsYXNoICpkYXRh
ID0gZGV2X2dldF9kcnZkYXRhKCYocGRldi0+ZGV2KSk7CiAKIAkvKiBBbGwgcmVzb3VyY2VzIHNo
b3VsZCBiZSBmcmVlZCBhdXRvbWF0aWNhbGx5ICovCiAJV0FSTl9PTihtdGRfZGV2aWNlX3VucmVn
aXN0ZXIoJmRhdGEtPm10ZCkpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIHBvd2VybnZfZmxhc2hfbWF0Y2hbXSA9IHsKQEAgLTI4NSw3ICsyODMs
NyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBwb3dlcm52X2ZsYXNoX2RyaXZlciA9
IHsKIAkJLm5hbWUJCT0gInBvd2VybnZfZmxhc2giLAogCQkub2ZfbWF0Y2hfdGFibGUJPSBwb3dl
cm52X2ZsYXNoX21hdGNoLAogCX0sCi0JLnJlbW92ZQkJPSBwb3dlcm52X2ZsYXNoX3JlbGVhc2Us
CisJLnJlbW92ZV9uZXcJPSBwb3dlcm52X2ZsYXNoX3JlbGVhc2UsCiAJLnByb2JlCQk9IHBvd2Vy
bnZfZmxhc2hfcHJvYmUsCiB9OwogCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
