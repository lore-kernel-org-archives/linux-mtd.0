Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB0C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Message-ID:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8c8TTEAZlZ27y4mX9LdbFvztsVesyGpJVPC9eIpxvWk=; b=wj3kJIb6nsi/ha
	C3Md8lYwPzYgIcDW/qcBm5scPmCzeso0KApZoLFmk175iah0TlGJkiAZ8T/HVdcH9t0objtZ8ZD9P
	mN40+840gKn2JxL17ULaulOBtJgTcia1InAUY4D5aojRUany5QS39douF5XPE9BCvipem/C7p/XNT
	pBUElwA5qi1pEAD4gikmcJk/I+BiAR8eb1Wx7ve1v/DjNt7gJQhAEzQHzNr512jVIKV2bWKPJ1qo4
	39Thnn2Oh3tjPcDfnZT2Q+3wtg5rj5VdysyL2JezLuuxZ3I2qQkFYnHf6tXqd4BZg02VMxSuQ4eAb
	sQQimeyw5h87ImOCB0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUoI-006Jde-I9; Mon, 16 May 2022 07:06:30 +0000
Received: from sender11-op-o11.zoho.eu ([31.186.226.225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUoA-006JZk-Ju
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 07:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1652684772; cv=none; d=zohomail.eu; s=zohoarc; 
 b=Ngw7i+0UWu7Qdbil8j+grmG8yJ1wunVJtZJGAOxIqr/+JVsg6BMwqoocN/3bRvzdiiMgziQxTSHQEMO8cUSsqBFTE7PB93xr79hBNJBI7Vz5anbq0rGrrmrXd0LvNzvdd+OxhFfYcZ67TMi8yChrNpZLPGIRpH7T8V4GnDlRqnk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1652684772;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=LehfBAU/QvIra7OAgcW4TPq9bLABt9XwCeJZGewh1TA=; 
 b=X0RAg8jgQ/SeF7bxmUVmj8bn3Vc4WNbf1DexcrxorAZL8Evkq7kfTL0l5WLmD/+dRgmS/6OuU5KJKI3FnkpiPX+t2YUnpT/gquf6W35yk5g6G/WB8ZuZCFAsHggzZW7vevpPk1hgwYsuLGrR3/TmyJNE4jW0PhP5PF0M2PQG5fA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=kempniu.pl;
 spf=pass  smtp.mailfrom=kernel@kempniu.pl;
 dmarc=pass header.from=<kernel@kempniu.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652684772; 
 s=zmail; d=kempniu.pl; i=kernel@kempniu.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=LehfBAU/QvIra7OAgcW4TPq9bLABt9XwCeJZGewh1TA=;
 b=QhGQBq5FWlhvbilFYEJvQteh6s5HQJjUrrvUDpGtDn8+UoVoHhbNe0XKO9RCWXYb
 PdTjTIww0Dg+n3cg3TvhkvnClCqcwIbfzMsJs6b5Xs4UZKSGV/j2XdSQ3GpmqH4Pg0k
 /OMz2Ipt1wHfGC7YOPXBFIXL+jfIwiZGpl8ATyyc=
Received: from larwa.hq.kempniu.pl (212.180.138.61 [212.180.138.61]) by
 mx.zoho.eu with SMTPS id 16526847706676.485162993223867;
 Mon, 16 May 2022 09:06:10 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-ID: <20220516070601.11428-3-kernel@kempniu.pl>
Subject: [PATCH 2/2] mtdchar: use kvmalloc() for potentially large allocations
Date: Mon, 16 May 2022 09:06:01 +0200
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516070601.11428-1-kernel@kempniu.pl>
References: <20220516070601.11428-1-kernel@kempniu.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_000622_984727_89D749C1 
X-CRM114-Status: GOOD (  11.13  )
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

bXRkY2hhcl93cml0ZV9pb2N0bCgpIGNhbGxzIGttYWxsb2MoKSB3aXRoIHRoZSAnc2l6ZScgYXJn
dW1lbnQgc2V0IHRvCnRoZSBzbWFsbGVyIG9mIHR3byB2YWx1ZXM6IHRoZSB3cml0ZSByZXF1ZXN0
J3MgZGF0YS9PT0IgbGVuZ3RoIHByb3ZpZGVkCmJ5IHVzZXIgc3BhY2UgYW5kIHRoZSBlcmFzZSBi
bG9jayBzaXplIG9mIHRoZSBNVEQgZGV2aWNlLiAgSWYgdGhlIGxhdHRlcgppcyBsYXJnZSwga21h
bGxvYygpIG1heSBub3QgYmUgYWJsZSB0byBzZXJ2ZSBzdWNoIGFsbG9jYXRpb24gcmVxdWVzdHMu
ClVzZSBrdm1hbGxvYygpIGluc3RlYWQuICBDb3JyZXNwb25kaW5nbHksIHJlcGxhY2Uga2ZyZWUo
KSBjYWxscyB3aXRoCmt2ZnJlZSgpIGNhbGxzLgoKU3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIFdlaW5i
ZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgpTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIEvEmXBpZcWEIDxr
ZXJuZWxAa2VtcG5pdS5wbD4KLS0tCiBkcml2ZXJzL210ZC9tdGRjaGFyLmMgfCAxMCArKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNoYXIuYyBiL2RyaXZlcnMvbXRkL210ZGNoYXIuYwpp
bmRleCBiMjcwMGY4NDY3ZmYuLjA1ODYwMjg4YTdhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bXRkY2hhci5jCisrKyBiL2RyaXZlcnMvbXRkL210ZGNoYXIuYwpAQCAtNjIzLDE2ICs2MjMsMTYg
QEAgc3RhdGljIGludCBtdGRjaGFyX3dyaXRlX2lvY3RsKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAog
CiAJZGF0YnVmX2xlbiA9IG1pbl90KHNpemVfdCwgcmVxLmxlbiwgbXRkLT5lcmFzZXNpemUpOwog
CWlmIChkYXRidWZfbGVuID4gMCkgewotCQlkYXRidWYgPSBrbWFsbG9jKGRhdGJ1Zl9sZW4sIEdG
UF9LRVJORUwpOworCQlkYXRidWYgPSBrdm1hbGxvYyhkYXRidWZfbGVuLCBHRlBfS0VSTkVMKTsK
IAkJaWYgKCFkYXRidWYpCiAJCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAKIAlvb2JidWZfbGVuID0g
bWluX3Qoc2l6ZV90LCByZXEub29ibGVuLCBtdGQtPmVyYXNlc2l6ZSk7CiAJaWYgKG9vYmJ1Zl9s
ZW4gPiAwKSB7Ci0JCW9vYmJ1ZiA9IGttYWxsb2Mob29iYnVmX2xlbiwgR0ZQX0tFUk5FTCk7CisJ
CW9vYmJ1ZiA9IGt2bWFsbG9jKG9vYmJ1Zl9sZW4sIEdGUF9LRVJORUwpOwogCQlpZiAoIW9vYmJ1
ZikgewotCQkJa2ZyZWUoZGF0YnVmKTsKKwkJCWt2ZnJlZShkYXRidWYpOwogCQkJcmV0dXJuIC1F
Tk9NRU07CiAJCX0KIAl9CkBAIC02ODIsOCArNjgyLDggQEAgc3RhdGljIGludCBtdGRjaGFyX3dy
aXRlX2lvY3RsKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCQl1c3Jfb29iICs9IG9wcy5vb2JyZXRs
ZW47CiAJfQogCi0Ja2ZyZWUoZGF0YnVmKTsKLQlrZnJlZShvb2JidWYpOworCWt2ZnJlZShkYXRi
dWYpOworCWt2ZnJlZShvb2JidWYpOwogCiAJcmV0dXJuIHJldDsKIH0KLS0gCjIuMzYuMQoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
