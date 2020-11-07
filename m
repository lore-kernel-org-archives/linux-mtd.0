Return-Path: <SRS0=mw3I=EN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC932C388F7
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 13:44:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 841FA206ED
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 13:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EdqpB1eT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="QJxGKw74"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 841FA206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J3PoeBUMtKxdMcrRr/h4WscGrTjIYGvYzFuejRUkZkA=; b=EdqpB1eT2S8jT2vYnA/zcAGsfy
	KjX+ToTxaI/JKar65wScgttRQx5aRckPmyGtz9rBeCgyFxYo/XZgMn4eBvEhdiD97UDawQbq3LCgY
	ALOQh6eIoTrXHB7bWwwKk/OSry+eRf+wGaLs4zW6gLNHHPXcLBihxu4VeWnJmfUgPo36X5tJxXunx
	bb+RcYO+zaVtXg/gHbdDe52ATUPtjIk3hNDSq/tFaHfpXk3bgoGhystmLthPyUcv6ezJXMhFr6ta6
	6YLWKd3+vteA5qN0jY8d01PQ1OY/eTyonFlRn0ZeexZRJFluGonZ/eDu/0xHgusdJPHAn+E/Yd+iy
	L94PGG8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOUE-0004Y3-70; Sat, 07 Nov 2020 13:42:34 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOU7-0004XP-Iy
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2020 13:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604756527;
 bh=5HgqEvvJiH/bZLPEWmKV16KDFdLKNOtgtdg08AcddNE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=QJxGKw74yjzwZcA5YC0NcK+scU/tWV8IOqHh9438zcIfHg+G0VOOR+ZBEg5zUoGL9
 ZU72vVfHzJiNN1T2HAhaCMtQuLmnq1tJXFA0KXBewLCd1ry5fysv6FLrQAsVGiG3QG
 ncayklwWJ+/U3AcCDgKfLC2WUPaX7JZRTq60AflE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f5T-1kcE5Z46s3-004AbJ; Sat, 07
 Nov 2020 14:42:07 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Fix multiple typos
Date: Sat,  7 Nov 2020 14:41:51 +0100
Message-Id: <20201107134151.1071327-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:DTS66gvIc0DDkzLq0yp1rJp3/B+3nK0vtp69pRD/TyKz+mGY/4F
 6lbLmwaM4tBVAdunsrFOzHtQNscFFZm7b5BbV9HFiJecgABDqgLliI2mWhpcs0bmwhu/cYZ
 nCZyR9GJSDoUAmegDe2xxyHcHhoFcSDp2hmSnMc3OBZeK7l2lu5dSk4velEnHhwprFzaHi+
 59RRmDx8jiHxAGccMX0Dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/WkoJTRTv4U=:cb1BQr7r5je6Dfh2jjoiLf
 SyeP/1KeP8gMwE2d7CQiNIRfK+8ohnNTcbOjS3NdiASteZj621LnPohHVxY17qLtRUIR3TJX5
 dFp2/eBZlPjlskrLZjGNPjkejD52Pz/nhgxF8XHNFN8PWgu7yDS3NJr2+CWm68P7XXrtiLJmu
 fVMrnOtmvy93HAONgz7HOfUdmyKVPJrHwZaKboXECKSENTeU2kbpmhqR5XKnZtxAvZb53vWQU
 k2DaZolu1Hk7hqX78BT8C2jpE1WBTXWCsF51L1SVSrui2rOAo1BdhRDLEOepzoI5Mw9VHB9D8
 jrDz3hn/0CrSBRdMw/U+o0nTQAe2GLMtHLstvSDBUFs0ZbcnEYkrDCJjA2cW3vTVZ33hlUFpF
 4pjxyBCVPK1CWDfB/7T1wK4Po2ImCsH0buvklwtvqVQ4QWyT1rDzAHUBVICcOELlfPw5ru14/
 GuI2IqFLndQwchevYRbizt+3n8qQnL8XgzQC5YXyJf4EAASSsOXZQjg7JQFWskCsFDAO8C+FS
 fdzpwAdxwMIC5CL7bb/AP88hywT4BuyUGyoSVvRFWHzlogLnTkkAQcCjjkdq0BSyeAc2F9gaW
 XUECpVzF9lmTRIJCdMzjtYQ8aKYO8wrk5ojvcrigfPl21z1VGTGprnJ30FcHrvyMOUgxiBY1y
 P45e1q8Dg48a+mVuvrxmREgPAPjsIbseimwybaBlFYAn1rhhCl6HCWz2Yd7R/kP66p/dfYjnT
 wC7Bb6WtvLJp/b4E4dypJkh+baWAEBAm28N6oMsYDHa7W8vaXfPcZ8Z9l/eD/D/WNma/CFBj3
 yQGs3ED7wWzM88x8ZQKeWq55kurko1xzlfILFpkoTMrbdKS15pqG9oDNHZBSZFQDXbSa82kLe
 V+fN2ZQvU3qW2g/YF19hZ0UWrR5OvrtFLjg6zYwxk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_084227_832098_F1FA90BB 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgfCA0ICsrLS0KIGRyaXZlcnMvbXRk
L3NwaS1ub3Ivc2ZkcC5jICB8IDIgKy0KIGluY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCB8IDIg
Ky0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMKaW5kZXggMDM2OWQ5OGIyZDEyZS4uODVjMDcwNDk0NTI1OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKQEAgLTE0NDcsNyArMTQ0Nyw3IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9lcmFzZV9tdWx0aV9z
ZWN0b3JzKHN0cnVjdCBzcGlfbm9yICpub3IsIHU2NCBhZGRyLCB1MzIgbGVuKQoKIC8qCiAgKiBF
cmFzZSBhbiBhZGRyZXNzIHJhbmdlIG9uIHRoZSBub3IgY2hpcC4gIFRoZSBhZGRyZXNzIHJhbmdl
IG1heSBleHRlbmQKLSAqIG9uZSBvciBtb3JlIGVyYXNlIHNlY3RvcnMuICBSZXR1cm4gYW4gZXJy
b3IgaXMgdGhlcmUgaXMgYSBwcm9ibGVtIGVyYXNpbmcuCisgKiBvbmUgb3IgbW9yZSBlcmFzZSBz
ZWN0b3JzLiAgUmV0dXJuIGFuIGVycm9yIGlmIHRoZXJlIGlzIGEgcHJvYmxlbSBlcmFzaW5nLgog
ICovCiBzdGF0aWMgaW50IHNwaV9ub3JfZXJhc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVj
dCBlcmFzZV9pbmZvICppbnN0cikKIHsKQEAgLTI1MzcsNyArMjUzNyw3IEBAIHNwaV9ub3Jfc2Vs
ZWN0X3VuaWZvcm1fZXJhc2Uoc3RydWN0IHNwaV9ub3JfZXJhc2VfbWFwICptYXAsCiAJCX0KCiAJ
CS8qCi0JCSAqIE90aGVyd2lzZSwgdGhlIGN1cnJlbnQgZXJhc2Ugc2l6ZSBpcyBzdGlsbCBhIHZh
bGlkIGNhbmRpdGF0ZS4KKwkJICogT3RoZXJ3aXNlLCB0aGUgY3VycmVudCBlcmFzZSBzaXplIGlz
IHN0aWxsIGEgdmFsaWQgY2FuZGlkYXRlLgogCQkgKiBTZWxlY3QgdGhlIGJpZ2dlc3QgdmFsaWQg
Y2FuZGlkYXRlLgogCQkgKi8KIAkJaWYgKCFlcmFzZSAmJiB0ZXN0ZWRfZXJhc2UtPnNpemUpCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc2ZkcC5jCmluZGV4IGUyYTQzZDM5ZWI1ZjQuLjA1YjIyYzY1NzY4MzIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2Zk
cC5jCkBAIC01OSw3ICs1OSw3IEBAIHN0cnVjdCBzZmRwX2JmcHRfcmVhZCB7Cgogc3RydWN0IHNm
ZHBfYmZwdF9lcmFzZSB7CiAJLyoKLQkgKiBUaGUgaGFsZi13b3JkIGF0IG9mZnNldCA8c2hpZnQ+
IGluIERXT1JEIDxkd29hcmQ+IGVuY29kZXMgdGhlCisJICogVGhlIGhhbGYtd29yZCBhdCBvZmZz
ZXQgPHNoaWZ0PiBpbiBEV09SRCA8ZHdvcmQ+IGVuY29kZXMgdGhlCiAJICogb3AgY29kZSBhbmQg
ZXJhc2Ugc2VjdG9yIHNpemUgdG8gYmUgdXNlZCBieSBTZWN0b3IgRXJhc2UgY29tbWFuZHMuCiAJ
ICovCiAJdTMyCQkJZHdvcmQ7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9zcGktbm9y
LmggYi9pbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmgKaW5kZXggNjBiYWMyYzBlYzQ1Ni4uNTgy
ZWUwNGVlZWEyMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCisrKyBi
L2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaApAQCAtNDA2LDcgKzQwNiw3IEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IGRldmljZV9ub2RlICpzcGlfbm9yX2dldF9mbGFzaF9ub2RlKHN0cnVjdCBz
cGlfbm9yICpub3IpCiAgKiBAbmFtZToJdGhlIGNoaXAgdHlwZSBuYW1lCiAgKiBAaHdjYXBzOgl0
aGUgaGFyZHdhcmUgY2FwYWJpbGl0aWVzIHN1cHBvcnRlZCBieSB0aGUgY29udHJvbGxlciBkcml2
ZXIKICAqCi0gKiBUaGUgZHJpdmVycyBjYW4gdXNlIHRoaXMgZnVjdGlvbiB0byBzY2FuIHRoZSBT
UEkgTk9SLgorICogVGhlIGRyaXZlcnMgY2FuIHVzZSB0aGlzIGZ1bmN0aW9uIHRvIHNjYW4gdGhl
IFNQSSBOT1IuCiAgKiBJbiB0aGUgc2Nhbm5pbmcsIGl0IHdpbGwgdHJ5IHRvIGdldCBhbGwgdGhl
IG5lY2Vzc2FyeSBpbmZvcm1hdGlvbiB0bwogICogZmlsbCB0aGUgbXRkX2luZm97fSBhbmQgdGhl
IHNwaV9ub3J7fS4KICAqCi0tCjIuMjguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
