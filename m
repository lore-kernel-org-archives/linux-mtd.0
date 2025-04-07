Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C43EC3601E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GmYlBCw5JwmlTiQqEIj7dFhUbwSzHtyo7AwkApwDtC8=; b=W0lB1kY2dA5qpy
	WO4OrS8El2VMFR0cRLA/QfbLxL16dRL6wpmxqWe/j2j8llLhz5Wvx63WHb4abWW8TzU6k0LPnE39k
	pqugfp41pHvQ7AR63PjP7zO7sEj3pn20FFVU7ezKEoGdMBkV5E3PkBJQbNuIeoOHMANRt5SeGDwr+
	G64WtI+qla0TvmfoV5mip10EloCLd1/OC362EYzlrdON1Ofb0RsI+y0CLf9c0IKk+JNpXRi/4Gg1J
	+fEP+bEzXLnt9B4uF1V7rK4eCVmuL+1Gd3XFV1TrN3R9FRWxa/CqqBVOnbIuekJXJkvR74lx8OLYh
	6p018Hf0Ncb2tO5/ccng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJo-0000000HJi5-1Fbz;
	Mon, 07 Apr 2025 10:03:04 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJk-0000000HJfW-1ZG4
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 10:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:Message-Id:Date:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sAojcFmicJFZNikvNR7lQ2WVK5MiLV0O5CFRpS64GnU=; b=FRFtJL44n7wdydfMd7HFSsqhgQ
	ALb2YNH49q1F+WjwMZdz/kLWscQTTzJYb1RzwwDcz/tZhR3tjA/964z7AVYFpZrgoplu2oO9FyK4y
	o12CKSkPWPcZxLE66ETdryCrZFWH1HGQJPZTmTbcIKP5K1lPlP776GrkoDr4bxbrlkUigJNa+LV0f
	ItXnC/aIUku06Fa/3cUkOvwzmcqPid7/nb8KMdNAGYm6MKOMRmIlV+10qS6aYEc3fN0z0IMJ1xh3u
	fFGhdOyysVYXwXdd/i/gIwifNmHqVfAbchIGUkwXsKZ0yXCE9iKB5YvvFyHBn1X4afteR2r9P1bAs
	FUxp+wNQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1jJY-00DTH5-2o;
	Mon, 07 Apr 2025 18:02:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 18:02:48 +0800
Date: Mon, 07 Apr 2025 18:02:48 +0800
Message-Id: <cover.1744019630.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 0/7] crypto: acomp - Use optional async calling convention
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_030300_409921_58D08A23 
X-CRM114-Status: UNSURE (   7.91  )
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

This patch series introduces the optional async calling convention
for acomp.  This will be extended to all other Crypto API types that
support async.

With this a stack request is setup initially and will be used as
long as the algorithm can complete synchronously.  If it cannot
then EAGAIN is returned, and the caller may choose to allocate a
dynamic request through the REQUEST_CLONE call and then redo the
call asynchronously.

This series is based on top of

https://lore.kernel.org/linux-crypto/cover.1744018301.git.herbert@gondor.apana.org.au

Herbert Xu (7):
  crypto: api - Add helpers to manage request flags
  crypto: acomp - Use request flag helpers and add acomp_request_flags
  crypto: acomp - Add ACOMP_FBREQ_ON_STACK
  crypto: iaa - Switch to ACOMP_FBREQ_ON_STACK
  crypto: acomp - Add ACOMP_REQUEST_CLONE
  ubifs: Use ACOMP_REQUEST_CLONE
  crypto: acomp - Remove ACOMP_REQUEST_ALLOC

 crypto/acompress.c                         |  37 +--
 drivers/crypto/intel/iaa/iaa_crypto_main.c |   5 +-
 fs/ubifs/compress.c                        | 251 ++++++++++-----------
 include/crypto/acompress.h                 |  48 ++--
 include/crypto/algapi.h                    |   5 +
 include/crypto/internal/acompress.h        |  33 ++-
 include/linux/crypto.h                     |  24 ++
 7 files changed, 227 insertions(+), 176 deletions(-)

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
