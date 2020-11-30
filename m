Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B047DC64E7B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 15:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F57D20719
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 15:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="feMyvJMQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="PB0ZQmwF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F57D20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7eTPqFQ4vXgjNUD/rkrHJzHOjeHb4VIiq3aiQmXy4pk=; b=feMyvJMQfs2rX8VfdrKMX3ZyBe
	kf5z8iverahcHvgvy2+XO7fJbzkW7x/pqIqb0VL5htQLneUapTXMvvqIYKLEDrIKFJePdXS7qUb1R
	sGr4qQUL15rYsYKoTuh2w0LMFjpR8BACKpPDr+xT1ZUVxxu2ivc31ZTWhq/878ZuP43+CDxT1udQm
	BYyzqGCETynP04zBNApU00xYWtJ8uJ0tKAoD3Br15nlI30b20bieM/Q31+9lY14JDpl52w8i7bU7F
	fkQ9MecSGgKI4phs09XhkFoaaRiGSJO/A7+RQLLbA6EHG+EjuBkVX8rY+ZJzloC9yZq6xOH0n7G++
	fNPh0OKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjl2q-0006JH-0f; Mon, 30 Nov 2020 15:24:52 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjl2m-0006I2-JO
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 15:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1606749879;
 bh=5+U793qEgJ/jb9OmcVYf63Yh/ejUyZBNttGan64SZjM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=PB0ZQmwF7GHfFxn/OJiPglDWxuMSUUT44MoAirqrAzR/kjNsJcjz7CaIzGq5ABLux
 LLfTJex+Sf2VouVB9rit0BDd17VjXCXyue8eIKE62oSBuGUVNt3LykEawVEtX3uduO
 Z31MQa0HtdkbMzBnMhbHFdOvd7YcCCjHXyaY+H0k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1kUh2427gJ-00Kde1; Mon, 30
 Nov 2020 16:24:39 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: Fix multiple typos
Date: Mon, 30 Nov 2020 16:24:15 +0100
Message-Id: <20201130152416.1283972-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:tuRJKz0CiM5kci92vMAABw+dDJAybLVWSscZlQPGm5EMtFbIdTy
 Y/sFeu/UbcYG+cjlV55g+Z6u5SJMPtU65hyk6L7tkDNibBTnCZN+lfwIfRi3kjCUitdx4uV
 WC4RIl0Ww1fZkG63wlVov7F4cdkUoQ0GGT6QFVmuVZUBv1E3+0iATGhALxOWQLiX/rWUTdq
 7vNdaEIKn0fvm8lRivX1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mfjaYp6oJAA=:7pAQ/ZNyl6UsTcfiOLYBnC
 CvuecukH2WCgQpi48RvTsjxl+X3K+SwLt7jV9gahf6wMQ7nckr2ADvsRcwd1WeqXu+89j85Md
 Qjj59G0JYZ4dUwwyR5VVeshY57p5Lq/ewo8pJmgY8od/gnKM7yrJLGTeP/KiRKcXtLih+tP3Q
 JG9J/OfC04W/+3oYcCcu0cAj94J4TcjJ9S3fZLqLStdC7XwBlzIT8VvuQfuV/PhBPgO3mvgED
 c9tn/COJHtPyRGXhmUAmqDB5Mf+0q8oS6/JcGe+1bsTy+aSkwQ80Kf7C2TY7gwpkwJE2AjKb7
 2JRQOEysPtTfhG+JOlhiJd9imQAoG7m2pULBbyzfJBuwuMvu0gQU1Qal5u+KDtTzATqfaW9gL
 SLqeg0Cgt+lykF8+HTYaudWCT5Gs5VMB26Dxk9WH2zNDRvOjRwToTgqvpbTpju8bIfKQqhmrF
 xn/HcCOH5JLiNIcewX7c/iZ1mblj4+LYDiD79jhlDcpOcIQDejqXdKB4g0gFVTjpO9tl7xOxz
 AeVqGkbSII0yoX5XNtECsoJvH0j5JhZr21oQd+X4YeWF2hQwoK5/qSxG4tyUhdLeeY5SymvC5
 CSSguA63vhTVJgVrdr73a7w7hYVxiqFbgCpX/YR+5VeR0r1QiYxBBWj80qOJeuAVA5NBAyac3
 nuUmlGsGUv1pRCtKaTWhLFj2pqz1pKNX+h96P5dqIC+y40n0G27Q7L0u8EaEFtM1ZJrSc2Pxb
 Q0rn4zK0JH8VQdbNJOPKFMVZGamp5mFr9i1quhEuRTBwLo6lNO3RGVBddElve9JuTVb/vh+mu
 uvQTxpW8IqAzdqQMnyybceyfb8d3NC9Pv3y69UCiubnYX9JYBhKLiQC7IK04ua/saJlyD6140
 PT2faJKagxTwvUsYqn8Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_102448_929959_F2889514 
X-CRM114-Status: GOOD (  15.96  )
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlcmUgYXJlIGEgZmV3IHR5cG9zIGluIGNvbW1lbnRzIGluIHRoZSBTUEkgTk9SIGZyYW1ld29y
azsgZml4IHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0PgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICB8IDQgKyst
LQogZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMgIHwgMiArLQogaW5jbHVkZS9saW51eC9tdGQv
c3BpLW5vci5oIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwppbmRleCBmMGFlN2EwMTcwM2ExLi5iMjI0YjI3NTEyNWEz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYworKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL2NvcmUuYwpAQCAtMTQ0Nyw3ICsxNDQ3LDcgQEAgc3RhdGljIGludCBzcGlfbm9y
X2VyYXNlX211bHRpX3NlY3RvcnMoc3RydWN0IHNwaV9ub3IgKm5vciwgdTY0IGFkZHIsIHUzMiBs
ZW4pCgogLyoKICAqIEVyYXNlIGFuIGFkZHJlc3MgcmFuZ2Ugb24gdGhlIG5vciBjaGlwLiAgVGhl
IGFkZHJlc3MgcmFuZ2UgbWF5IGV4dGVuZAotICogb25lIG9yIG1vcmUgZXJhc2Ugc2VjdG9ycy4g
IFJldHVybiBhbiBlcnJvciBpcyB0aGVyZSBpcyBhIHByb2JsZW0gZXJhc2luZy4KKyAqIG9uZSBv
ciBtb3JlIGVyYXNlIHNlY3RvcnMuICBSZXR1cm4gYW4gZXJyb3IgaWYgdGhlcmUgaXMgYSBwcm9i
bGVtIGVyYXNpbmcuCiAgKi8KIHN0YXRpYyBpbnQgc3BpX25vcl9lcmFzZShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwgc3RydWN0IGVyYXNlX2luZm8gKmluc3RyKQogewpAQCAtMjUzNyw3ICsyNTM3LDcg
QEAgc3BpX25vcl9zZWxlY3RfdW5pZm9ybV9lcmFzZShzdHJ1Y3Qgc3BpX25vcl9lcmFzZV9tYXAg
Km1hcCwKIAkJfQoKIAkJLyoKLQkJICogT3RoZXJ3aXNlLCB0aGUgY3VycmVudCBlcmFzZSBzaXpl
IGlzIHN0aWxsIGEgdmFsaWQgY2FuZGl0YXRlLgorCQkgKiBPdGhlcndpc2UsIHRoZSBjdXJyZW50
IGVyYXNlIHNpemUgaXMgc3RpbGwgYSB2YWxpZCBjYW5kaWRhdGUuCiAJCSAqIFNlbGVjdCB0aGUg
YmlnZ2VzdCB2YWxpZCBjYW5kaWRhdGUuCiAJCSAqLwogCQlpZiAoIWVyYXNlICYmIHRlc3RlZF9l
cmFzZS0+c2l6ZSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9zZmRwLmMKaW5kZXggZTJhNDNkMzllYjVmNC4uMDViMjJjNjU3Njgz
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMKKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9zZmRwLmMKQEAgLTU5LDcgKzU5LDcgQEAgc3RydWN0IHNmZHBfYmZwdF9yZWFk
IHsKCiBzdHJ1Y3Qgc2ZkcF9iZnB0X2VyYXNlIHsKIAkvKgotCSAqIFRoZSBoYWxmLXdvcmQgYXQg
b2Zmc2V0IDxzaGlmdD4gaW4gRFdPUkQgPGR3b2FyZD4gZW5jb2RlcyB0aGUKKwkgKiBUaGUgaGFs
Zi13b3JkIGF0IG9mZnNldCA8c2hpZnQ+IGluIERXT1JEIDxkd29yZD4gZW5jb2RlcyB0aGUKIAkg
KiBvcCBjb2RlIGFuZCBlcmFzZSBzZWN0b3Igc2l6ZSB0byBiZSB1c2VkIGJ5IFNlY3RvciBFcmFz
ZSBjb21tYW5kcy4KIAkgKi8KIAl1MzIJCQlkd29yZDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbXRkL3NwaS1ub3IuaCBiL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaAppbmRleCA2MGJh
YzJjMGVjNDU2Li41ODJlZTA0ZWVlYTIwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9z
cGktbm9yLmgKKysrIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCkBAIC00MDYsNyArNDA2
LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2aWNlX25vZGUgKnNwaV9ub3JfZ2V0X2ZsYXNo
X25vZGUoc3RydWN0IHNwaV9ub3IgKm5vcikKICAqIEBuYW1lOgl0aGUgY2hpcCB0eXBlIG5hbWUK
ICAqIEBod2NhcHM6CXRoZSBoYXJkd2FyZSBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkIGJ5IHRoZSBj
b250cm9sbGVyIGRyaXZlcgogICoKLSAqIFRoZSBkcml2ZXJzIGNhbiB1c2UgdGhpcyBmdWN0aW9u
IHRvIHNjYW4gdGhlIFNQSSBOT1IuCisgKiBUaGUgZHJpdmVycyBjYW4gdXNlIHRoaXMgZnVuY3Rp
b24gdG8gc2NhbiB0aGUgU1BJIE5PUi4KICAqIEluIHRoZSBzY2FubmluZywgaXQgd2lsbCB0cnkg
dG8gZ2V0IGFsbCB0aGUgbmVjZXNzYXJ5IGluZm9ybWF0aW9uIHRvCiAgKiBmaWxsIHRoZSBtdGRf
aW5mb3t9IGFuZCB0aGUgc3BpX25vcnt9LgogICoKLS0KMi4yOS4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
