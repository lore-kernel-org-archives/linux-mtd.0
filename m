Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F0EC28B28
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AY3fkrUWv7on3NQNrWFls9n30Da+9vBxrT0ro8GrjPY=; b=JsMFVvhQsNVqp7
	YhkOR18j6HmkbuNFMtPxonHJVb8xLfNoAcUIJ8Et64UNX14LykUr/qkbhjb/4DFpD9S76PL94KmYS
	fNMq/bhMVGsgR+FO4pVlyLW0aQGy+hbcZgObNjm4ZeLFl8p8GVGzC+uAzYzH65g+rJWl2Q1/sCdk3
	hqeUvakGslzkZJSM7i+BkLHu4reflgYyKAQ4CktH72yImyzt0sM+PM1MyOLFqv9jRWED+0uOT0URr
	/kxSrVa+D7PVDxKI3a4kaSyt0DfkfmFGFtRPBRH+E8ZdeiBGpBrvOe86kvJhSmcI05aTTzPB+HzbQ
	LRHmsEhxF4MwJuTvkAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseiS-0000000AhyH-1r43;
	Thu, 13 Mar 2025 09:19:00 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseg8-0000000AhU7-1mGF
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 09:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741857396; x=1773393396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OlHTnQoywCSCuoi3FTq6oim2FtxvRr3TSS7h7lgSzTY=;
  b=W5xHGUJS9BiiPw0KdUuyZ8t3noMj7mJoAIFUtbCSBrHXqT8HJqMDyAR0
   JXRjc8w+XLewOEwWz+qKVZ7dWndyLGLtDplJkO76G1GjTHmib1+WnVUe9
   sHEpYPf1CZ14vmBldFNU1owAYGPZIDZslYTNCckYSyZ6AbkV2gkpruZeu
   fwS8ZYXZ/WsnLZZ81Lw2V9KMyQUhlKmW2ML7vRuMdVRaApdlFKu2X+kzA
   lFfHhIoEodrakUOJQ0e4tacM+cZmr5txKYF7nyJBaYLudAxQs3pBf8TnL
   wCTy/X/GtxbL92VW9YAlEhd1ZkBnwa3IUnXH2bag0xzulzo20RYqlTon1
   A==;
X-CSE-ConnectionGUID: 1s9VqHPNRjeMjQab7sLXPw==
X-CSE-MsgGUID: TLUiKlYXRdKQd6Jqfs1EHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42994263"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42994263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:16:35 -0700
X-CSE-ConnectionGUID: tgAyOsX5SHOFMeuHHdBVtQ==
X-CSE-MsgGUID: J6KkLHM6TOuyz/PUdGSjRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="151730926"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 13 Mar 2025 02:16:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D5EB31FC; Thu, 13 Mar 2025 11:16:32 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 1/1] mtd: mtdpart: Do not supply NULL to printf()
Date: Thu, 13 Mar 2025 11:15:53 +0200
Message-ID: <20250313091631.243346-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_021636_691733_B6E9CCA7 
X-CRM114-Status: UNSURE (   9.49  )
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

R0NDIGNvbXBpbGVyIGlzIG5vdCBoYXBweSBhYm91dCBOVUxMIGJlaW5nIHN1cHBsaWVkIGFzIHBy
aW50ZigpIHBhcmFtZXRlcjoKCmRyaXZlcnMvbXRkL210ZHBhcnQuYzo2OTM6MzQ6IGVycm9yOiDi
gJglc+KAmSBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZs
b3c9XQoKTW92ZSB0aGUgY29kZSBhZnRlciB0aGUgcGFyc2VyIHRlc3QgZm9yIE5VTEwsIGFuZCBk
cm9wIHRoZSB0ZXJuYXJ5IGNvbXBsZXRlbHkuClRoZSB1c2VyIGNhbiBkZWR1Y3QgdGhpcyBzaW5j
ZSB3aGVuIGl0J3Mgbm90IE5VTEwgdHdvIG1lc3NhZ2VzIHdpbGwgYmUgcHJpbnRlZC4KClNpZ25l
ZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwu
Y29tPgotLS0KCnYyOiBjaGFuZ2VkIGFwcHJvYWNoIHRvIHJlbW92ZSB0aGF0IHRlcm5hcnkgY29t
cGxldGVseSwgc2VlbXMgbGVzcyBoYWNraXNoCgogZHJpdmVycy9tdGQvbXRkcGFydC5jIHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKaW5k
ZXggNjgxMWE3MTQzNDlkLi45OTRlOGM1MWU2NzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL210
ZHBhcnQuYworKysgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKQEAgLTY5MCwxMCArNjkwLDkgQEAg
aW50IHBhcnNlX210ZF9wYXJ0aXRpb25zKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLCBjb25zdCBj
aGFyICpjb25zdCAqdHlwZXMsCiAJCQlwYXJzZXIgPSBtdGRfcGFydF9wYXJzZXJfZ2V0KCp0eXBl
cyk7CiAJCQlpZiAoIXBhcnNlciAmJiAhcmVxdWVzdF9tb2R1bGUoIiVzIiwgKnR5cGVzKSkKIAkJ
CQlwYXJzZXIgPSBtdGRfcGFydF9wYXJzZXJfZ2V0KCp0eXBlcyk7Ci0JCQlwcl9kZWJ1ZygiJXM6
IGdvdCBwYXJzZXIgJXNcbiIsIG1hc3Rlci0+bmFtZSwKLQkJCQlwYXJzZXIgPyBwYXJzZXItPm5h
bWUgOiBOVUxMKTsKIAkJCWlmICghcGFyc2VyKQogCQkJCWNvbnRpbnVlOworCQkJcHJfZGVidWco
IiVzOiBnb3QgcGFyc2VyICVzXG4iLCBtYXN0ZXItPm5hbWUsIHBhcnNlci0+bmFtZSk7CiAJCQly
ZXQgPSBtdGRfcGFydF9kb19wYXJzZShwYXJzZXIsIG1hc3RlciwgJnBwYXJ0cywgZGF0YSk7CiAJ
CQlpZiAocmV0IDw9IDApCiAJCQkJbXRkX3BhcnRfcGFyc2VyX3B1dChwYXJzZXIpOwotLSAKMi40
Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
