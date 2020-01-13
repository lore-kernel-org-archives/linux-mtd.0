Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C887CC33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:52:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDAB2081E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RccpuSvb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BDAB2081E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VTkD43nDDFjWutwhfotnrHKOBrQAXKnr35naZWU24vs=; b=RccpuSvbrNk82u
	5P4bqkvY7FOSWW9+KMJgtYyB0YhUp5zx9Bw3nTED3nx1+Pe+EiSF7oA0F0atkAlmKGCq1m7pOYk9G
	JFB+nhXWMzN5k1yRIBwyMmcR7t1akUTt8LNrp/wE2OPE/3gXTffYhFDj8xYFUSCKmOof5EKP8dJHk
	oW8mLo20Zuedzw0xCwA9i4RRTDRPOwKZYrC5UMjgIRiYU2I0Mmz/W1Zrqgt3u9PgVRtKFdRSA7eRU
	QbGhrTJvCwUsHKWD1vlkA/cEOxyaACr+qtZi3TOAsOd0HgJDVXsPpLayF+FYXc2HQ2B0Xh5+fCbWQ
	4leCGvFGFaPbBIHMyAaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqxKP-000321-F4; Mon, 13 Jan 2020 10:52:13 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqxKK-00030R-T9
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 10:52:10 +0000
Received: from ramsan ([84.195.182.253]) by laurent.telenet-ops.be with bizsmtp
 id pmry210015USYZQ01mryH4; Mon, 13 Jan 2020 11:52:01 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iqxK9-0000up-Tz; Mon, 13 Jan 2020 11:51:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iqxK9-0006lD-R3; Mon, 13 Jan 2020 11:51:57 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Fix ino_t format warnings in orphan_delete()
Date: Mon, 13 Jan 2020 11:51:56 +0100
Message-Id: <20200113105156.25945-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_025209_096626_904294A9 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gYWxwaGEgYW5kIHMzOTB4OgoKICAgIGZzL3ViaWZzL2RlYnVnLmg6MTU4OjExOiB3YXJuaW5n
OiBmb3JtYXQg4oCYJWx14oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIHVuc2ln
bmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUg4oCYaW5vX3Qge2FrYSB1bnNpZ25l
ZCBpbnR94oCZIFstV2Zvcm1hdD1dCiAgICAuLi4KICAgIGZzL3ViaWZzL29ycGhhbi5jOjEzMjoz
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYZGJnX2dlbuKAmQogICAgICAgZGJnX2dl
bigiZGVsZXRlZCB0d2ljZSBpbm8gJWx1Iiwgb3JwaC0+aW51bSk7CiAgICAuLi4KICAgIGZzL3Vi
aWZzL29ycGhhbi5jOjE0MDozOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYZGJnX2dl
buKAmQogICAgICAgZGJnX2dlbigiZGVsZXRlIGxhdGVyIGlubyAlbHUiLCBvcnBoLT5pbnVtKTsK
Cl9fa2VybmVsX2lub190IGlzICJ1bnNpZ25lZCBsb25nIiBvbiBtb3N0IGFyY2hpdGVjdHVyZXMs
IGJ1dCBub3Qgb24KYWxwaGEgYW5kIHMzOTB4LCB3aGVyZSBpdCBpcyAidW5zaWduZWQgaW50Ii4g
IEhlbmNlIHdoZW4gcHJpbnRpbmcgYW4KaW5vX3QsIGl0IHNob3VsZCBhbHdheXMgYmUgY2FzdCB0
byAidW5zaWduZWQgbG9uZyIgZmlyc3QuCgpGaXggdGhpcyBieSByZS1hZGRpbmcgdGhlIHJlY2Vu
dGx5IHJlbW92ZWQgY2FzdHMuCgpGaXhlczogODAwOWNlOTU2YzNkMjgwMiAoInViaWZzOiBEb24n
dCBsZWFrIG9ycGhhbnMgb24gbWVtb3J5IGR1cmluZyBjb21taXQiKQpTaWduZWQtb2ZmLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KIGZzL3ViaWZzL29y
cGhhbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL29ycGhhbi5jIGIvZnMvdWJpZnMvb3JwaGFu
LmMKaW5kZXggNTRkNmRiNjExMDZmZmM0NS4uZWRmNDNkZGQ3ZGNlNDc3OSAxMDA2NDQKLS0tIGEv
ZnMvdWJpZnMvb3JwaGFuLmMKKysrIGIvZnMvdWJpZnMvb3JwaGFuLmMKQEAgLTEyOSw3ICsxMjks
NyBAQCBzdGF0aWMgdm9pZCBfX29ycGhhbl9kcm9wKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1
Y3QgdWJpZnNfb3JwaGFuICpvKQogc3RhdGljIHZvaWQgb3JwaGFuX2RlbGV0ZShzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX29ycGhhbiAqb3JwaCkKIHsKIAlpZiAob3JwaC0+ZGVs
KSB7Ci0JCWRiZ19nZW4oImRlbGV0ZWQgdHdpY2UgaW5vICVsdSIsIG9ycGgtPmludW0pOworCQlk
YmdfZ2VuKCJkZWxldGVkIHR3aWNlIGlubyAlbHUiLCAodW5zaWduZWQgbG9uZylvcnBoLT5pbnVt
KTsKIAkJcmV0dXJuOwogCX0KIApAQCAtMTM3LDcgKzEzNyw3IEBAIHN0YXRpYyB2b2lkIG9ycGhh
bl9kZWxldGUoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19vcnBoYW4gKm9ycGgp
CiAJCW9ycGgtPmRlbCA9IDE7CiAJCW9ycGgtPmRuZXh0ID0gYy0+b3JwaF9kbmV4dDsKIAkJYy0+
b3JwaF9kbmV4dCA9IG9ycGg7Ci0JCWRiZ19nZW4oImRlbGV0ZSBsYXRlciBpbm8gJWx1Iiwgb3Jw
aC0+aW51bSk7CisJCWRiZ19nZW4oImRlbGV0ZSBsYXRlciBpbm8gJWx1IiwgKHVuc2lnbmVkIGxv
bmcpb3JwaC0+aW51bSk7CiAJCXJldHVybjsKIAl9CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
