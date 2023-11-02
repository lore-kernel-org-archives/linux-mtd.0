Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCAFC001B0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kU6z3NjOFxt7jKXx/BxOY0IUODmJlGDdN8T6Uo8eDN8=; b=JFjfVO2J78z3Ij
	H1I44vpdFLKJRdmUZKDAYzLnbVu8SQulGi3FrCcDEbN5PWlZEqFr5BNZYRLn7vgKz5xDbBuhgdehd
	/8saCnuLGFIliuD5j1l8k3Y2As1pL0TF3D1QHE1RUK9cY3om17BlzoWN5oH8eCu5f18Ly3KwggUJe
	vnmUpNEa2pj4bvlTfp4dVDIpfF/4f/SzJgyN/2p+9igvwtNuDWIHE/VwJPEChCByMpyfC5TSnEPFz
	wS6Hj05GKq8D8J+MujOVpMy1FKaJerru6fZ+EOm6LKAWl+PCtyHxScx4Eo0THYymLYTNCPZ6B4YAu
	9ozgJNkAbBj3/Wt1xsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmU-00ALmE-0Q;
	Thu, 02 Nov 2023 22:03:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfmR-00ALkp-2U
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 22:03:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmF-0007aD-W9; Thu, 02 Nov 2023 23:03:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmE-006AFI-87; Thu, 02 Nov 2023 23:02:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyfmD-00BwFF-Um; Thu, 02 Nov 2023 23:02:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Richard Weinberger <richard@nod.at>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 0/4] mtd: Convert to platform remove callback returning (part II)
Date: Thu,  2 Nov 2023 23:02:47 +0100
Message-ID: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sQWLnUyrccFa20466o/5pTHw6E4ZhGDOfB4JewpElFs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQXmfbHb1/E3rUvcFJ/stIyLy3+ivTN6va+z5lx02KSG mRN7rd0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjAR81wOhiax2Q8Ff7A1BBY6 dDVcF79voj7DledM03mhU0IdphycXSfjWFeqmMdy+yYU9f7v85/h92uKcu0y8d67P4Sd1k3jYXD NTjkYnVhVG6J6oNH57d5Ip5n2n00ey37guix5p7764K39pvc51xlOYC6dr7dCaMktrS2P5vOUMc 5n7+zySeAN2ya6sL6Gsfj26njfO+ISFX4KzpLeLy8Fn4mfbnQ9rujAE99L/1XdVk5Pb+85c3udX n/6L++bUrsUfun6si6ImPi2OPzI7HKZRu9feqHs/wwX/vhV9+qrU8aC4nUmXbee5oXbb9E21BS6 WJz1ZLXpoxuNEobTkp9YfBZg2mxhlmZo90Zb6JKQ4FUA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_150311_814044_43263A71 
X-CRM114-Status: GOOD (  11.55  )
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

SGVsbG8sCgp0aGlzIHNlcmllcyBpcyB0aGUgc3VjY2Vzc29yIHRvIHRoZSBzZXJpZXMgIm10ZDog
Q29udmVydCB0byBwbGF0Zm9ybQpyZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIiBzZW50IGVhcmxp
ZXIgc3RhcnRpbmcgd2l0aCBNZXNzYWdlLUlkOgoyMDIzMTAwODIwMDE0My4xOTYzNjktMS11Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUuCgpUaGUgYnJjbW5hbmQgcGF0Y2ggaXMgbmV3LCBt
eSBjb2NjaW5lbGxlIHNjcmlwdCBkaWRuJ3QgZmluZCB0aGF0IG9uZQpiYWNrIHRoZW4gYmVjYXVz
ZSB0aGUgcmVtb3ZlIGZ1bmN0aW9uIGlzIGluIGEgZGlmZmVyZW50IGNvbXBpbGF0aW9uCnVuaXQg
dGhhbiB0aGUgZHJpdmVycy4KClRoZSB0eHg5bmRmbWMgZHJpdmVyIG5vdyB3YXMgY29udmVydGVk
IHRvIGEgbm9ybWFsIHBsYXRmb3JtX2RyaXZlciBmaXJzdAooaS5lLiBvbmUgdGhhdCBkb2Vzbid0
IHVzZSBwbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKSkgYXMKc3VnZ2VzdGVkL3JlcXVlc3RlZCBieSBN
aXF1ZWwuCgpXaXRoIHRoaXMgc2VyaWVzIGFsbCBvZiBkcml2ZXJzL210ZCBkb2Vzbid0IG1ha2Ug
dXNlIG9mCnBsYXRmb3JtX2RyaXZlcjo6cmVtb3ZlIGFueSBtb3JlIGFuZCBzbyB3ZSdyZSByZWFk
eSB0byBjaGFuZ2UgdGhpcwpmdW5jdGlvbiBhY2NvcmRpbmcgdG8gdGhlIHBsYW4gZGVzY3JpYmVk
IGluIGNvbW1pdCA1YzVhNzY4MGU2N2IKKCJwbGF0Zm9ybTogUHJvdmlkZSBhIHJlbW92ZSBjYWxs
YmFjayB0aGF0IHJldHVybnMgbm8gdmFsdWUiKQoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWlu
ZS1Lw7ZuaWcgKDQpOgogIG10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAogIG10ZDogcmF3bmFuZDogdHh4
OW5kZm1jOiBTd2l0Y2ggdG8gbW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpCiAgbXRkOiByYXduYW5k
OiB0eHg5bmRmbWM6IERyb3AgaWYgYmxvY2sgd2l0aCBhbHdheXMgZmFsc2UgY29uZGl0aW9uCiAg
bXRkOiByYXduYW5kOiB0eHg5bmRmbWM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZwogICAgdm9pZAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jj
bTYzMTM4X25hbmQuYyB8ICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9iY202
MzY4X25hbmQuYyAgfCAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYmNtYV9u
YW5kLmMgICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgICAgICB8ICA0ICstLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmggICAgICB8ICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtc3RiX25h
bmQuYyAgfCAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvaXByb2NfbmFuZC5j
ICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jICAgICAgICAgICAg
ICB8IDEzICsrKysrLS0tLS0tLS0KIDggZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogYWI1NzcxNjQ0OWIzNDM4YzAxMzZmNmY0MTJh
MmU1OWUwY2YwMzdhOQotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
