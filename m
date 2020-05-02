Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0170C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 05:33:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFB32071E
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 05:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VGUKgI2p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuFRJQF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFB32071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RjvcAZ05kneKKyzz57+tLh/3QeoZjfzEZ6uUEiasdRU=; b=VGUKgI2phXakXt
	m3GkOeuZNM0DjUaw6S5Sgaftu2I88Tr5S6yfCV98QjzzuxpZWgLEUr/LAcqV+0SCSc5ux8axSMIOH
	oCQH4aNnAZGsQ/cps/Vm/CaqcEme+DKQzPyUbb854cWDjSl/QfhUVQyj06uk2SbcWXpC8KORhwjdU
	Kz+bEz3ACCRrGmlBcOwUOC7zNT1AZG1bgwMvUo+wSRPJFt4lKygVxM/YqPhFiFxWLPL8zA+4a5xB0
	hDg5Gt5crsWUpwkyKKUVlQ9n0/+YVVTrItFYLR4TlTl5whq73Gg6bV0P6/TgnfqMXtx4chLEFjN5Q
	CQbjrkInh+B1XAgMDf+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUkmJ-0004RP-Mq; Sat, 02 May 2020 05:33:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUkmG-0004P7-TA
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 05:33:30 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0D5D208DB;
 Sat,  2 May 2020 05:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588397607;
 bh=MYhkXQ8M6ehjcKnUAHPgBXgoMFSmViXmlsVaKB/2/iE=;
 h=From:To:Cc:Subject:Date:From;
 b=EuFRJQF7AGrZKvzyKctf8/XBXbFdmS7XU+HXEDsVj1Uiclh02NaQ+LErt1Tlyg7nq
 wxqZntoSP2TMAzTR92QeFiKii2Pyrj26p5GQzuQv4F3MuyWA7XqVLcGGdg36Y16fux
 LWOXU+/+qXQZC3nDixS7relR/AF8g3aPbd7kM2D8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 00/20] crypto: introduce crypto_shash_tfm_digest()
Date: Fri,  1 May 2020 22:31:02 -0700
Message-Id: <20200502053122.995648-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_223328_980870_23D1367B 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-bluetooth@vger.kernel.org,
 Kamil Konieczny <k.konieczny@samsung.com>,
 Robert Baldyga <r.baldyga@samsung.com>, ecryptfs@vger.kernel.org,
 Krzysztof Opasiak <k.opasiak@samsung.com>, linux-nfs@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, linux-sctp@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Zaibo Xu <xuzaibo@huawei.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series introduces a helper function crypto_shash_tfm_digest() which
replaces the following common pattern:

	{
		SHASH_DESC_ON_STACK(desc, tfm);
		int err;

		desc->tfm = tfm;

		err = crypto_shash_digest(desc, data, len, out);

		shash_desc_zero(desc);
	}

with:

	err = crypto_shash_tfm_digest(tfm, data, len, out);

Patch 1 introduces this helper function, and patches 2-20 convert all
relevant users to use it.

IMO, it would be easiest to take all these patches through the crypto
tree.  But taking just the "crypto:" ones and then me trying to get the
rest merged later via subsystem trees is also an option.

Eric Biggers (20):
  crypto: hash - introduce crypto_shash_tfm_digest()
  crypto: arm64/aes-glue - use crypto_shash_tfm_digest()
  crypto: essiv - use crypto_shash_tfm_digest()
  crypto: artpec6 - use crypto_shash_tfm_digest()
  crypto: ccp - use crypto_shash_tfm_digest()
  crypto: ccree - use crypto_shash_tfm_digest()
  crypto: hisilicon/sec2 - use crypto_shash_tfm_digest()
  crypto: mediatek - use crypto_shash_tfm_digest()
  crypto: n2 - use crypto_shash_tfm_digest()
  crypto: omap-sham - use crypto_shash_tfm_digest()
  crypto: s5p-sss - use crypto_shash_tfm_digest()
  nfc: s3fwrn5: use crypto_shash_tfm_digest()
  fscrypt: use crypto_shash_tfm_digest()
  ecryptfs: use crypto_shash_tfm_digest()
  nfsd: use crypto_shash_tfm_digest()
  ubifs: use crypto_shash_tfm_digest()
  Bluetooth: use crypto_shash_tfm_digest()
  sctp: use crypto_shash_tfm_digest()
  KEYS: encrypted: use crypto_shash_tfm_digest()
  ASoC: cros_ec_codec: use crypto_shash_tfm_digest()

 arch/arm64/crypto/aes-glue.c               |  4 +--
 crypto/essiv.c                             |  4 +--
 crypto/shash.c                             | 16 +++++++++
 drivers/crypto/axis/artpec6_crypto.c       | 10 ++----
 drivers/crypto/ccp/ccp-crypto-sha.c        |  9 ++---
 drivers/crypto/ccree/cc_cipher.c           |  9 ++---
 drivers/crypto/hisilicon/sec2/sec_crypto.c |  5 ++-
 drivers/crypto/mediatek/mtk-sha.c          |  7 ++--
 drivers/crypto/n2_core.c                   |  7 ++--
 drivers/crypto/omap-sham.c                 | 20 +++--------
 drivers/crypto/s5p-sss.c                   | 39 ++++------------------
 drivers/nfc/s3fwrn5/firmware.c             | 10 +-----
 fs/crypto/fname.c                          |  7 +---
 fs/crypto/hkdf.c                           |  6 +---
 fs/ecryptfs/crypto.c                       | 17 +---------
 fs/nfsd/nfs4recover.c                      | 26 ++++-----------
 fs/ubifs/auth.c                            | 20 ++---------
 fs/ubifs/master.c                          |  9 ++---
 fs/ubifs/replay.c                          | 14 ++------
 include/crypto/hash.h                      | 19 +++++++++++
 net/bluetooth/smp.c                        |  6 +---
 net/sctp/auth.c                            | 10 ++----
 net/sctp/sm_make_chunk.c                   | 23 +++++--------
 security/keys/encrypted-keys/encrypted.c   | 18 ++--------
 sound/soc/codecs/cros_ec_codec.c           |  9 +----
 25 files changed, 95 insertions(+), 229 deletions(-)

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
