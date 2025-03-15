Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C63AC35FF7
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gWQK9PCond4RJIc2Lnd6wQkUkC8tVQ9QX2KB6Isldho=; b=I6WS5n0iFoWnl/
	BfTS1XndVpdvgIQv44Drgue7sFBHx/QUgc2FgjXQci5B2oe03qgHgw6W+gGgZ5FHvzXL0WN2S4aib
	ka/e6DDgfAgr49GskW5AMHtiZp8z4YO6oD0wqymHCG8YNCHZBkql918R+ZeT9obm8BlN3zY6XzEBA
	k++TOwcDVx6aQnAyROt1TvrX4fRvJ0ZY/J4x1UO9on4eL5bGqgf7e4bCmnoQ/UQhTD/+sxVIrQsX4
	6n/Sqh69OcMRW0ycEk9UpycB2/Ed16KtfciiZn01uMAFXjkSqMqlQxh/eExxbjUaU6A8o94AJllW0
	qypbvScYJXglkFtrBiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOnt-0000000GDCz-08Wd;
	Sat, 15 Mar 2025 10:31:41 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOml-0000000GCxb-2Q53
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 10:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:Message-Id:Date:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fhIc9XPrh2CE8j9ZrLLDo3g0ZlybEeC0zVWTmTtBtXM=; b=G1woJYRS5JwsVVfsKNvtHl8Hv2
	/eWfbM1T8RQaXpjfoUzkOzNXILGjeYTCEDuE1DdkVGouDHeMGBtBYuhrCHtct8ZpWMNo89wKO2CZ9
	Gf7IqkwA5ErVp8igNs2K2Dz3DqwMzFNyj7Ghs2W1jdK6n1YJjM7nG/ZDQJich1QEB2nJ7trx/BkBl
	v4U14YAWq+219IeM7hisZOdeuleeAp8JZzjdnuCmpBkYf7RV4xLKQs5J0DrbuL722MUotfiEEHC26
	SgyVY388zHU03nUBKwRKtlNYFVMgM19pDkmwtiGxr4p1P052bKWwA7X7qquh2J1lPUBSgjICx60QW
	W5WgeyWQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttOmX-006p8t-28;
	Sat, 15 Mar 2025 18:30:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 18:30:17 +0800
Date: Sat, 15 Mar 2025 18:30:17 +0800
Message-Id: <cover.1742034499.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v5 PATCH 00/14] crypto: acomp - Add virtual address and folio support
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_033031_624660_56352A18 
X-CRM114-Status: UNSURE (   9.45  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

v5 removes the incompressible warnings in ubifs, removes more dead
code from qat, and replaces crypto_has_comp with crypto_has_acomp
in hibernate and ipcomp.

This patch series adds virtual address and folio support to acomp.
This finally brings it to feature parity with the legacy crypto_comp,
which enables us to convert the existing users to acomp.

The three users are converted according to their characteristics:
ubifs uses folio+linear, hibernate uses linear only while ipcomp
uses SG only.

Only ipcomp is fully asynchronous, ubifs supports asynchronous
but will wait on it and hibernate is synchronous only.

Herbert Xu (14):
  xfrm: ipcomp: Call pskb_may_pull in ipcomp_input
  crypto: scomp - Remove support for some non-trivial SG lists
  crypto: iaa - Remove dst_null support
  crypto: qat - Remove dst_null support
  crypto: acomp - Remove dst_free
  crypto: scomp - Add chaining and virtual address support
  crypto: acomp - Add ACOMP_REQUEST_ALLOC and acomp_request_alloc_extra
  crypto: iaa - Use acomp stack fallback
  crypto: acomp - Add async nondma fallback
  crypto: acomp - Add support for folios
  xfrm: ipcomp: Use crypto_acomp interface
  PM: hibernate: Use crypto_acomp interface
  ubifs: Use crypto_acomp interface
  ubifs: Pass folios to acomp

 crypto/acompress.c                            | 148 ++++--
 crypto/scompress.c                            | 189 ++++---
 drivers/crypto/intel/iaa/iaa_crypto_main.c    | 164 +-----
 drivers/crypto/intel/qat/qat_common/qat_bl.c  | 159 ------
 drivers/crypto/intel/qat/qat_common/qat_bl.h  |   6 -
 .../intel/qat/qat_common/qat_comp_algs.c      |  85 +---
 .../intel/qat/qat_common/qat_comp_req.h       |  10 -
 fs/ubifs/compress.c                           | 208 ++++++--
 fs/ubifs/file.c                               |  74 +--
 fs/ubifs/journal.c                            |  11 +-
 fs/ubifs/ubifs.h                              |  26 +-
 include/crypto/acompress.h                    | 184 ++++++-
 include/crypto/internal/acompress.h           |  26 +-
 include/crypto/internal/scompress.h           |   2 -
 include/linux/crypto.h                        |   1 +
 include/net/ipcomp.h                          |  13 +-
 kernel/power/hibernate.c                      |   5 +-
 kernel/power/swap.c                           |  58 ++-
 net/xfrm/xfrm_algo.c                          |   7 +-
 net/xfrm/xfrm_ipcomp.c                        | 478 +++++++++---------
 20 files changed, 932 insertions(+), 922 deletions(-)

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
