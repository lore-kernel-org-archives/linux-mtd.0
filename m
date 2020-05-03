Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEEFC28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 16:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D782073E
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 16:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PiH3oTQJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8qtkFP3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D782073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNIq1TJCjgfIycXWSYGPB5h7jPtj46BDPtqnXuRl3oQ=; b=PiH3oTQJMneH3o
	Z1Y/wKc2hVzYX1CVIcZUwA/NIMaWOvME42igmrPceqJCeG1xdqgbIfExatx0vbiijEyvDhdS8i542
	PhKUwLKivTJFGAY8xbTwG5WRbst8CIh2/8LX06H9mwiQOGXmvpok0wb7VWRRP/kMZmHiNibbhtMY1
	12KHtYLjoXUL076feeeoEw12ROE9Xw/N9ixg1bN3Id/hDQWf5SvH1/Bd4qXPeBGBvEDArIHOY9a1h
	d7HHH2YxmfwYC5IXoSw2Nlz2OKrRfcETr4znAq6JSR4rZepKK3zNJ7QLqJBhulruvzWMa4lPz9Lpw
	bR8++orbzHTPZiRMTwJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVHFN-0001w7-En; Sun, 03 May 2020 16:13:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVHFD-0001uR-MX
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 16:13:40 +0000
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D52021655
 for <linux-mtd@lists.infradead.org>; Sun,  3 May 2020 16:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588522410;
 bh=e6r2Z72h7hrcZe1FEJD+LSdrn+Cl58pNFQIvjPxoo2M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V8qtkFP37pelp3XQoW9bGwWGkgu5Kz3XzIxErbVnu3G8HsLuAndHmhHo1NBShv4m7
 nNsogNOBrvbfT8TDxtrJsGXnjbwN+E7njDwepvGDR6/ufPefsD4zY6srKh6ETByRvQ
 OMeM2HbrCm8B3m6HChhV5YmVghbNF7XaiwDaH6G4=
Received: by mail-io1-f43.google.com with SMTP id y26so9837403ioj.2
 for <linux-mtd@lists.infradead.org>; Sun, 03 May 2020 09:13:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuYKmEB+tgDF8+tNu8lDBOKENSRQgcboGkIvx+UMyH5u+0p7dYKt
 p4WZLH8eEZwn65pCrki2qxWKvWlUH4Ay8yNCqE4=
X-Google-Smtp-Source: APiQypLhY9++881yFhc1aV+hz5b6ucbeJlKQ6tWViPFt3Ctm6mc2jiEci1yn1OxgzY22xIRCzNrubZForogPxDE10r0=
X-Received: by 2002:a6b:5904:: with SMTP id n4mr12406558iob.142.1588522409725; 
 Sun, 03 May 2020 09:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200502053122.995648-1-ebiggers@kernel.org>
In-Reply-To: <20200502053122.995648-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 3 May 2020 18:13:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG9Cubj9zO4paGd94cAvG1h21Z0X3CmyNr-orD7WC1=vw@mail.gmail.com>
Message-ID: <CAMj1kXG9Cubj9zO4paGd94cAvG1h21Z0X3CmyNr-orD7WC1=vw@mail.gmail.com>
Subject: Re: [PATCH 00/20] crypto: introduce crypto_shash_tfm_digest()
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_091339_402791_8ACC7723 
X-CRM114-Status: GOOD (  15.38  )
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
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Zaibo Xu <xuzaibo@huawei.com>,
 Lars Persson <lars.persson@axis.com>, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2 May 2020 at 07:33, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series introduces a helper function crypto_shash_tfm_digest() which
> replaces the following common pattern:
>
>         {
>                 SHASH_DESC_ON_STACK(desc, tfm);
>                 int err;
>
>                 desc->tfm = tfm;
>
>                 err = crypto_shash_digest(desc, data, len, out);
>
>                 shash_desc_zero(desc);
>         }
>
> with:
>
>         err = crypto_shash_tfm_digest(tfm, data, len, out);
>
> Patch 1 introduces this helper function, and patches 2-20 convert all
> relevant users to use it.
>
> IMO, it would be easiest to take all these patches through the crypto
> tree.  But taking just the "crypto:" ones and then me trying to get the
> rest merged later via subsystem trees is also an option.
>
> Eric Biggers (20):
>   crypto: hash - introduce crypto_shash_tfm_digest()
>   crypto: arm64/aes-glue - use crypto_shash_tfm_digest()
>   crypto: essiv - use crypto_shash_tfm_digest()
>   crypto: artpec6 - use crypto_shash_tfm_digest()
>   crypto: ccp - use crypto_shash_tfm_digest()
>   crypto: ccree - use crypto_shash_tfm_digest()
>   crypto: hisilicon/sec2 - use crypto_shash_tfm_digest()
>   crypto: mediatek - use crypto_shash_tfm_digest()
>   crypto: n2 - use crypto_shash_tfm_digest()
>   crypto: omap-sham - use crypto_shash_tfm_digest()
>   crypto: s5p-sss - use crypto_shash_tfm_digest()
>   nfc: s3fwrn5: use crypto_shash_tfm_digest()
>   fscrypt: use crypto_shash_tfm_digest()
>   ecryptfs: use crypto_shash_tfm_digest()
>   nfsd: use crypto_shash_tfm_digest()
>   ubifs: use crypto_shash_tfm_digest()
>   Bluetooth: use crypto_shash_tfm_digest()
>   sctp: use crypto_shash_tfm_digest()
>   KEYS: encrypted: use crypto_shash_tfm_digest()
>   ASoC: cros_ec_codec: use crypto_shash_tfm_digest()
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>


>  arch/arm64/crypto/aes-glue.c               |  4 +--
>  crypto/essiv.c                             |  4 +--
>  crypto/shash.c                             | 16 +++++++++
>  drivers/crypto/axis/artpec6_crypto.c       | 10 ++----
>  drivers/crypto/ccp/ccp-crypto-sha.c        |  9 ++---
>  drivers/crypto/ccree/cc_cipher.c           |  9 ++---
>  drivers/crypto/hisilicon/sec2/sec_crypto.c |  5 ++-
>  drivers/crypto/mediatek/mtk-sha.c          |  7 ++--
>  drivers/crypto/n2_core.c                   |  7 ++--
>  drivers/crypto/omap-sham.c                 | 20 +++--------
>  drivers/crypto/s5p-sss.c                   | 39 ++++------------------
>  drivers/nfc/s3fwrn5/firmware.c             | 10 +-----
>  fs/crypto/fname.c                          |  7 +---
>  fs/crypto/hkdf.c                           |  6 +---
>  fs/ecryptfs/crypto.c                       | 17 +---------
>  fs/nfsd/nfs4recover.c                      | 26 ++++-----------
>  fs/ubifs/auth.c                            | 20 ++---------
>  fs/ubifs/master.c                          |  9 ++---
>  fs/ubifs/replay.c                          | 14 ++------
>  include/crypto/hash.h                      | 19 +++++++++++
>  net/bluetooth/smp.c                        |  6 +---
>  net/sctp/auth.c                            | 10 ++----
>  net/sctp/sm_make_chunk.c                   | 23 +++++--------
>  security/keys/encrypted-keys/encrypted.c   | 18 ++--------
>  sound/soc/codecs/cros_ec_codec.c           |  9 +----
>  25 files changed, 95 insertions(+), 229 deletions(-)
>
> --
> 2.26.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
