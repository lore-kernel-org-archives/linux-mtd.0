Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E27CC38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:07:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D150320720
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:07:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iOM40pPl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D150320720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OGCdPEkBakBmpLk63TzQWrjJCnhCU168pCQzhlSs7S8=; b=iOM40pPlNZqHcg
	QAfMkFhwaFSpMWRLZa5fDQ3yF4wI68+4DCN1GSgzGNjTvgcwq05Mml4d+zOI4nVkyC6cE2kpMVjFh
	kaEW3GGcldrU3yu6/xq+klOj7A/tXq2nZ3fiYu9DfnAilpycEGSr2s0Wh5RZ+7zckG9i93cmngAug
	uo3kBKBLmXQnPv7UchDz/FaWoGRb0Etj82VtUO90HiLVNrC2C41j4SPooZ8r+NPYO/6c4cWDpkbyB
	U2d2kBmrHM+SKH7q4IoufqOpzzNt+I7RZ08NZyayXkoz2FhcV3SELG/aw2mN28OaMVAsYGWB9OUXT
	Sr598SMDIJhzZuvIcT5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwAU-0003yC-2Y; Fri, 08 May 2020 06:07:30 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwAQ-0003sJ-PL
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 06:07:28 +0000
Received: from gwarestrin.me.apana.org.au ([192.168.0.7]
 helo=gwarestrin.arnor.me.apana.org.au)
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1jWw3Z-00053g-CX; Fri, 08 May 2020 16:00:22 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 08 May 2020 16:07:01 +1000
Date: Fri, 8 May 2020 16:07:01 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 00/20] crypto: introduce crypto_shash_tfm_digest()
Message-ID: <20200508060700.GA24956@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502053122.995648-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_230727_110062_C3D58214 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: thomas.lendacky@amd.com, jesper.nilsson@axis.com,
 linux-bluetooth@vger.kernel.org, k.konieczny@samsung.com,
 r.baldyga@samsung.com, ecryptfs@vger.kernel.org, k.opasiak@samsung.com,
 linux-nfs@vger.kernel.org, krzk@kernel.org, vz@mleia.com, gilad@benyossef.com,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 enric.balletbo@collabora.com, groeck@chromium.org, xuzaibo@huawei.com,
 lars.persson@axis.com, cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Eric Biggers <ebiggers@kernel.org> wrote:
> This series introduces a helper function crypto_shash_tfm_digest() which
> replaces the following common pattern:
> 
>        {
>                SHASH_DESC_ON_STACK(desc, tfm);
>                int err;
> 
>                desc->tfm = tfm;
> 
>                err = crypto_shash_digest(desc, data, len, out);
> 
>                shash_desc_zero(desc);
>        }
> 
> with:
> 
>        err = crypto_shash_tfm_digest(tfm, data, len, out);
> 
> Patch 1 introduces this helper function, and patches 2-20 convert all
> relevant users to use it.
> 
> IMO, it would be easiest to take all these patches through the crypto
> tree.  But taking just the "crypto:" ones and then me trying to get the
> rest merged later via subsystem trees is also an option.
> 
> Eric Biggers (20):
>  crypto: hash - introduce crypto_shash_tfm_digest()
>  crypto: arm64/aes-glue - use crypto_shash_tfm_digest()
>  crypto: essiv - use crypto_shash_tfm_digest()
>  crypto: artpec6 - use crypto_shash_tfm_digest()
>  crypto: ccp - use crypto_shash_tfm_digest()
>  crypto: ccree - use crypto_shash_tfm_digest()
>  crypto: hisilicon/sec2 - use crypto_shash_tfm_digest()
>  crypto: mediatek - use crypto_shash_tfm_digest()
>  crypto: n2 - use crypto_shash_tfm_digest()
>  crypto: omap-sham - use crypto_shash_tfm_digest()
>  crypto: s5p-sss - use crypto_shash_tfm_digest()
>  nfc: s3fwrn5: use crypto_shash_tfm_digest()
>  fscrypt: use crypto_shash_tfm_digest()
>  ecryptfs: use crypto_shash_tfm_digest()
>  nfsd: use crypto_shash_tfm_digest()
>  ubifs: use crypto_shash_tfm_digest()
>  Bluetooth: use crypto_shash_tfm_digest()
>  sctp: use crypto_shash_tfm_digest()
>  KEYS: encrypted: use crypto_shash_tfm_digest()
>  ASoC: cros_ec_codec: use crypto_shash_tfm_digest()
> 
> arch/arm64/crypto/aes-glue.c               |  4 +--
> crypto/essiv.c                             |  4 +--
> crypto/shash.c                             | 16 +++++++++
> drivers/crypto/axis/artpec6_crypto.c       | 10 ++----
> drivers/crypto/ccp/ccp-crypto-sha.c        |  9 ++---
> drivers/crypto/ccree/cc_cipher.c           |  9 ++---
> drivers/crypto/hisilicon/sec2/sec_crypto.c |  5 ++-
> drivers/crypto/mediatek/mtk-sha.c          |  7 ++--
> drivers/crypto/n2_core.c                   |  7 ++--
> drivers/crypto/omap-sham.c                 | 20 +++--------
> drivers/crypto/s5p-sss.c                   | 39 ++++------------------
> drivers/nfc/s3fwrn5/firmware.c             | 10 +-----
> fs/crypto/fname.c                          |  7 +---
> fs/crypto/hkdf.c                           |  6 +---
> fs/ecryptfs/crypto.c                       | 17 +---------
> fs/nfsd/nfs4recover.c                      | 26 ++++-----------
> fs/ubifs/auth.c                            | 20 ++---------
> fs/ubifs/master.c                          |  9 ++---
> fs/ubifs/replay.c                          | 14 ++------
> include/crypto/hash.h                      | 19 +++++++++++
> net/bluetooth/smp.c                        |  6 +---
> net/sctp/auth.c                            | 10 ++----
> net/sctp/sm_make_chunk.c                   | 23 +++++--------
> security/keys/encrypted-keys/encrypted.c   | 18 ++--------
> sound/soc/codecs/cros_ec_codec.c           |  9 +----
> 25 files changed, 95 insertions(+), 229 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
