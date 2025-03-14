Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DF4C35FF1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s8kkoSTqm2DKG4+OL8jiM42CMUtjhBwXGu+4O5yBo74=; b=pDySdR1zFOzi2R
	emFnjiMHwvfbMiPUe6nP0L/ldfTjWiohuulOheh+tP81TSVNX7EmsLODL3K/ABMkAvz26fRxEdhzR
	Ee0ixCTT5IzFJyu1BlSE8O7O38YtU58iBsqSfkJ9Rbl3Rvh8OEMcpdUoMrtKk6s84V5BKcoK5bNcH
	YWGA367jTYeVbK0Fq1zW9dXT7oeQnFEUHvMhJgBri1kFgrZV3qBUV1WkLzmHlohhN5jmEKLLj27Uq
	0tKOihW1a6R3ckmSC0/Qh6esiTIyO6JM6hIgM8VtVjkNBxkL5AkXtjQE2snqw+Y8iqWWG61OWgP9o
	aAv88HAeT7s1c8vj5gxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43k-0000000E8CE-2Xfu;
	Fri, 14 Mar 2025 12:22:40 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43i-0000000E8BR-2SRD
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 12:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:Message-Id:Date:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=abGE60kWy5OfZ2b7kpGtLFLGgmHvoUGWwq+9Pjo5fp0=; b=GO8oSoAX5AGdMfajMdfcr6+AQ5
	PjgnxTyjBMRN7KNGC3MU4RITCRDuGxyw/x6G+b80isWXiaeqO6hbLyEvtPw6ElKGeIN0iXIaPLgTg
	uFbDTL6cehX4zj+KnJxTLqpjP+ZU24ZDni2wwKMhRllBYMpxRO1dDGJG+iQTcoasZxNqGIxXgbErX
	o44H9eDEvSRkilysSUHd2fSxMU7+TmqnID8t5pl3s3cVgcKphh12ZXJQQX/0gwX/8G1MBhf+dLDjr
	5ecdERQs5iNIyARDmA3M5+h0zjzFvqDz420kWoYDerTTwNDk8GX11/100ooBR5WgES+1mo1wxS6nc
	v7begvWA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tt43N-006ZlE-05;
	Fri, 14 Mar 2025 20:22:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Mar 2025 20:22:17 +0800
Date: Fri, 14 Mar 2025 20:22:17 +0800
Message-Id: <cover.1741954523.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v4 PATCH 00/13] crypto: acomp - Add virtual address and folio support
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_052238_622910_100AE7BC 
X-CRM114-Status: UNSURE (   8.66  )
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

v4 adds acomp software fallback path, folio support and converts
existing legacy crypto_comp users.

This patch series adds virtual address and folio support to acomp.
This finally brings it to feature parity with the legacy crypto_comp,
which enables us to convert the existing users to acomp.

The three users are converted according to their characteristics:
ubifs uses folio+linear, hibernate uses linear only while ipcomp
uses SG only.

Only ipcomp is fully asynchronous, ubifs supports asynchronous
but will wait on it and hibernate is synchronous only.

Herbert Xu (13):
  crypto: qat - Remove dst_null support
  crypto: iaa - Remove dst_null support
  crypto: scomp - Remove support for some non-trivial SG lists
  crypto: acomp - Remove dst_free
  crypto: scomp - Add chaining and virtual address support
  crypto: acomp - Add ACOMP_REQUEST_ALLOC and acomp_request_alloc_extra
  crypto: iaa - Use acomp stack fallback
  crypto: acomp - Add async nondma fallback
  crypto: acomp - Add support for folios
  ubifs: Use crypto_acomp interface
  ubifs: Pass folios to acomp
  PM: hibernate: Use crypto_acomp interface
  xfrm: ipcomp: Use crypto_acomp interface

 crypto/acompress.c                            | 148 ++++--
 crypto/scompress.c                            | 189 ++++---
 drivers/crypto/intel/iaa/iaa_crypto_main.c    | 164 +-----
 .../intel/qat/qat_common/qat_comp_algs.c      |  83 ---
 fs/ubifs/compress.c                           | 217 ++++++--
 fs/ubifs/file.c                               |  74 +--
 fs/ubifs/journal.c                            |  11 +-
 fs/ubifs/ubifs.h                              |  26 +-
 include/crypto/acompress.h                    | 184 ++++++-
 include/crypto/internal/acompress.h           |  26 +-
 include/crypto/internal/scompress.h           |   2 -
 include/linux/crypto.h                        |   1 +
 include/net/ipcomp.h                          |  13 +-
 kernel/power/swap.c                           |  58 ++-
 net/xfrm/xfrm_ipcomp.c                        | 477 +++++++++---------
 15 files changed, 932 insertions(+), 741 deletions(-)

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
