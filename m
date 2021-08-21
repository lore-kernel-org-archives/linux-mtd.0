Return-Path: <SRS0=Ynzp=NM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004E9C4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 08:07:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974B5611ED
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 08:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 974B5611ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lL1WSTwd81qKPvbM0edpO+P2CvllRAcktz2InY4vkVA=; b=zJx3QUfFj6W4sF
	BN0O2S5ZdB3N0LE+HUsDTBvVkscx9rH4UGTAmZziHaEUDgYio18p/BS27DuYIkiDJ0UeQz7NA+2iS
	IMGTnV65PqNRSMkuku6K3/SIEN3frs8WKU5mH2YNWcSt5+GSPR7yFwBxBChU2qkH/JY1wx7M6Y84o
	3t/d33oBqqgHttlpCgTXpJCEydGMu1BNOOiDxHlD4B5qyG4WYKoKapOeHEIDijrHPRTASoDYysG96
	M+bBrhTvcQmGpowbx0mSWe1C1YHpGe69zRkxZo4W3J7POYSPE9eTEfKCKXyMgdtJrzlkIt0ZAAPzv
	QHT4PbfU5WJ9V5dN5o2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHM1L-00CbTG-Lo; Sat, 21 Aug 2021 08:06:27 +0000
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHM1I-00CbSm-77
 for linux-mtd@lists.infradead.org; Sat, 21 Aug 2021 08:06:26 +0000
Received: from pop-os.home ([90.126.253.178]) by mwinf5d09 with ME
 id k7yn2500M3riaq2037ynGU; Sat, 21 Aug 2021 09:58:50 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Aug 2021 09:58:50 +0200
X-ME-IP: 90.126.253.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 boris.brezillon@collabora.com, lee.jones@linaro.org,
 segher@kernel.crashing.org, dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mtd: rawnand: cafe: Fix a resource leak in the error handling
 path of 'cafe_nand_probe()'
Date: Sat, 21 Aug 2021 09:58:45 +0200
Message-Id: <fd313d3fb787458bcc73189e349f481133a2cdc9.1629532640.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_010624_442127_6F9747B2 
X-CRM114-Status: UNSURE (   9.83  )
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

QSBzdWNjZXNzZnVsICdpbml0X3JzX25vbl9jYW5vbmljYWwoKScgY2FsbCBzaG91bGQgYmUgYmFs
YW5jZWQgYnkgYQpjb3JyZXNwb25kaW5nICdmcmVlX3JzKCknIGNhbGwgaW4gdGhlIGVycm9yIGhh
bmRsaW5nIHBhdGggb2YgdGhlIHByb2JlLCBhcwphbHJlYWR5IGRvbmUgaW4gdGhlIHJlbW92ZSBm
dW5jdGlvbi4KClVwZGF0ZSB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBhY2NvcmRpbmdseS4KCkZp
eGVzOiA4YzYxYjdhN2Y0ZDQgKCJbTVREXSBbTkFORF0gVXNlIHJzbGliIGZvciBDQUbDiSBFQ0Mi
KQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3
YW5hZG9vLmZyPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9jYWZlX25hbmQuYwppbmRleCBkMGU4ZmZkNTVjMjIuLmNiYTJlYWRkYjBmYyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvY2FmZV9uYW5kLmMKQEAgLTc1MSw3ICs3NTEsNyBAQCBzdGF0aWMgaW50IGNhZmVf
bmFuZF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJCSAgIkNBRkUgTkFORCIsIG10ZCk7
CiAJaWYgKGVycikgewogCQlkZXZfd2FybigmcGRldi0+ZGV2LCAiQ291bGQgbm90IHJlZ2lzdGVy
IElSUSAlZFxuIiwgcGRldi0+aXJxKTsKLQkJZ290byBvdXRfaW9yOworCQlnb3RvIG91cl9mcmVl
X3JzOwogCX0KIAogCS8qIERpc2FibGUgbWFzdGVyIHJlc2V0LCBlbmFibGUgTkFORCBjbG9jayAq
LwpAQCAtNzk1LDYgKzc5NSw4IEBAIHN0YXRpYyBpbnQgY2FmZV9uYW5kX3Byb2JlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2LAogCS8qIERpc2FibGUgTkFORCBJUlEgaW4gZ2xvYmFsIElSUSBtYXNrIHJl
Z2lzdGVyICovCiAJY2FmZV93cml0ZWwoY2FmZSwgfjEgJiBjYWZlX3JlYWRsKGNhZmUsIEdMT0JB
TF9JUlFfTUFTSyksIEdMT0JBTF9JUlFfTUFTSyk7CiAJZnJlZV9pcnEocGRldi0+aXJxLCBtdGQp
OworIG91cl9mcmVlX3JzOgorCWZyZWVfcnMoY2FmZS0+cnMpOwogIG91dF9pb3I6CiAJcGNpX2lv
dW5tYXAocGRldiwgY2FmZS0+bW1pbyk7CiAgb3V0X2ZyZWVfbXRkOgotLSAKMi4zMC4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
