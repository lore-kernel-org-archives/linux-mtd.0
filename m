Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAACC33CAF
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 21:53:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC188206B7
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 21:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WHjj4jWp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC188206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9vylX++OiDiG5ez1soILjRpsvvbqLGWLRN8KppIXG0=; b=WHjj4jWpTReKAV
	gjJycZB9jW+EMwS4iaRl9wIrWb42PpXJb3+i9qV+AbLXLANdCUXmTfrp4hXQaPKTkyG5lYBty286r
	a4HUOQY3evewgvxnuPSGwbGXe9VxmQvCJLOA0rzH2qVycPoMaSkq2JguePzhNMcjBkTNGa+hpPZBH
	a3mfkSRxqhuYDLIU27peQIdiyRYkdeosF5X1/SBtZ6UglcWXGRTyvZQw2oYVEWzjWCifHEXxGgEhm
	30NcOer+88OufsRro6Qik2E/4xp4Wfb9QjCnvSIu2eC98xh3+uPIAitTz6B+7OhxOKnrkH4zdRR4C
	W7BQj5Z3PGO/Xew87fcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itIV6-0007Us-8q; Sun, 19 Jan 2020 21:52:56 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itIV2-0007TZ-TJ
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 21:52:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id A65051815EA9E;
 Sun, 19 Jan 2020 22:52:47 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BYE0OVrVUX1P; Sun, 19 Jan 2020 22:52:46 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jXPPM9A4qDEB; Sun, 19 Jan 2020 22:52:46 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()
Date: Sun, 19 Jan 2020 22:52:33 +0100
Message-Id: <20200119215233.7292-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_135253_090219_519ECAC8 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T3JwaGFucyBhcmUgYWxsb3dlZCB0byBwb2ludCB0byBkZWxldGVkIGlub2Rlcy4KU28gLUVOT0VO
VCBpcyBub3QgYSBmYXRhbCBlcnJvci4KClJlcG9ydGVkLWJ5OiDQmtC+0YfQtdGC0LrQvtCyINCc
0LDQutGB0LjQvCA8Zmlkb19tYXhAaW5ib3gucnU+ClJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6ICJD
aHJpc3RpYW4gQmVyZ2VyIiA8Q2hyaXN0aWFuLkJlcmdlckBkZS5ib3NjaC5jb20+CkZpeGVzOiBl
ZTE0MzhjZTVkYzQgKCJ1YmlmczogQ2hlY2sgbGluayBjb3VudCBvZiBpbm9kZXMgd2hlbiBraWxs
aW5nIG9ycGhhbnMuIikKU2lnbmVkLW9mZi1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KLS0tCiBmcy91Ymlmcy9vcnBoYW4uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy91Ymlmcy9v
cnBoYW4uYyBiL2ZzL3ViaWZzL29ycGhhbi5jCmluZGV4IDU0ZDZkYjYxMTA2Zi4uMjY0NTkxNzM2
MGI5IDEwMDY0NAotLS0gYS9mcy91Ymlmcy9vcnBoYW4uYworKysgYi9mcy91Ymlmcy9vcnBoYW4u
YwpAQCAtNjg4LDE0ICs2ODgsMTQgQEAgc3RhdGljIGludCBkb19raWxsX29ycGhhbnMoc3RydWN0
IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19zY2FuX2xlYiAqc2xlYiwKIAogCQkJaW5vX2tl
eV9pbml0KGMsICZrZXkxLCBpbnVtKTsKIAkJCWVyciA9IHViaWZzX3RuY19sb29rdXAoYywgJmtl
eTEsIGlubyk7Ci0JCQlpZiAoZXJyKQorCQkJaWYgKGVyciAmJiBlcnIgIT0gLUVOT0VOVCkKIAkJ
CQlnb3RvIG91dF9mcmVlOwogCiAJCQkvKgogCQkJICogQ2hlY2sgd2hldGhlciBhbiBpbm9kZSBj
YW4gcmVhbGx5IGdldCBkZWxldGVkLgogCQkJICogbGlua2F0KCkgd2l0aCBPX1RNUEZJTEUgYWxs
b3dzIHJlYmlydGggb2YgYW4gaW5vZGUuCiAJCQkgKi8KLQkJCWlmIChpbm8tPm5saW5rID09IDAp
IHsKKwkJCWlmIChlcnIgPT0gMCAmJiBpbm8tPm5saW5rID09IDApIHsKIAkJCQlkYmdfcmN2cnko
ImRlbGV0aW5nIG9ycGhhbmVkIGlub2RlICVsdSIsCiAJCQkJCSAgKHVuc2lnbmVkIGxvbmcpaW51
bSk7CiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
