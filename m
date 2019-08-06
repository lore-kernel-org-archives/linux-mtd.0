Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494CAC433FF
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 20:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 179452070D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 20:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDGr8UFY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Jcbiz/rl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 179452070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+oxiRt5hzWgs9PrIvbjSdZZtHft2b/t7LODhnPxSng=; b=PDGr8UFYYoTX6q
	I0/bdWvwhMK3lkh9InbqCsiSai9ji0JAlnRABuaJ9pLwGC6dW79LApCtvkhEVIrylx3O1TfIR26P5
	uwOtgms+pOxX5F4ZkCd5INE+kaWpywRGxx/fFhgjC9AIIsr3nF+IwPtcm2p/jCEER6omHPCyXX5Sp
	YCN/yRlvfpleIJvOadptXTAan+urKzvsRVF31q0dKSoFvS5DimI+IkcF4Z6u6Wkg7JHodR3u4I4f7
	hwSqrjegi5c3RpQG0pUQCTYrB5JGZ7/XeOXg7taEMUFkt/x6o+37S1Q4sbOflu0ajkOCDK7UrA+4i
	SWb/OjuDv7LauZYlWdqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv6JD-00036Q-5O; Tue, 06 Aug 2019 20:43:51 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv6J9-00034u-8A
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 20:43:48 +0000
Received: by mail-lf1-x143.google.com with SMTP id 62so57407571lfa.8
 for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2019 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VR5feK3MwIDa28M66pr8cZaax0HRBgUIy/YXtAlUVAg=;
 b=Jcbiz/rlCveea1uGbs0To2AG2Fqr3qcVJByaj30biSJ6IGaZQU269n7UhHiJIq60zt
 F6m/iDUTKUaAxcfbj3aNcS1UVKWh0iBATpSeFcB2HZZd4zuUH74H+0AsiAw/3vHblfhG
 rGmoqX4hHVQvNh1Mo2WC3G6d946cIGSfRxOUfOJyomX+NAcaChMCm9wTSq80UpIDDyVy
 Wsy0W1UJUtub0zWt+iqZy9h9oHmBFsihiepiuxbUw6MWvMUQg0sLWv0bFV1e+nhfBD57
 VYDaUrEm2FkddHey3B0zSP911OVgsWvOlf8N8vWL7OUIPVuLGhouTH4qcL5ZHCc7EUMj
 /u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VR5feK3MwIDa28M66pr8cZaax0HRBgUIy/YXtAlUVAg=;
 b=X7zw0BW9sK8Jb3dhaMlJ9drzQFcMmprQoeg+CE68eSUxO+AE0dGKbuG/Or9L43w9Iq
 Wde1JFAB8d/Yl1ohsFSqjy9JJgoYG9ALrKRalI8qEkomwYce9PfS085IdurTHwsB4F7R
 wpsXOpLHwdYzrjtj1VJm1BhlajgZraa2QniN5+jdtwy6liQktvfsxEHC6vO6pSdl+9D6
 GHiwpZWXBxet5DTcS43yrVuqHbb6Ug9vxMFfkCzuvhXOEd8xRwSzFq/KyftIImNmuAhm
 07aumAawbXF/QSL9V5wxJ7c4/B+ijP0bx6dEISDYYTWSh9cW898l08T576RxSAJKEsB4
 4PqQ==
X-Gm-Message-State: APjAAAXuB4aP7pOuC6L1AMdY2hMVHMvdV+WartQACE+BuWrhnS4ZVlIV
 BOC+OahH2akI/+iv3Oazu2gkmQa9+ws3ao8j7qjC8A==
X-Google-Smtp-Source: APXvYqzWZs8IRpgox1WFTKnJpGnBDG26DorCdtZJQD2tgXVD7zBJA6DxGWkpIBTAdKDEhuxqp2JLjofjJIxta57O938=
X-Received: by 2002:a19:6f4b:: with SMTP id n11mr3649844lfk.163.1565124219457; 
 Tue, 06 Aug 2019 13:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-13-ebiggers@kernel.org>
In-Reply-To: <20190805162521.90882-13-ebiggers@kernel.org>
From: Paul Crowley <paulcrowley@google.com>
Date: Tue, 6 Aug 2019 13:43:27 -0700
Message-ID: <CA+_SqcBkR_8Z9EUTpK-dEW4PN+9P5OgJnqYDHtOhG+P1LjotPA@mail.gmail.com>
Subject: Re: [PATCH v8 12/20] fscrypt: add an HKDF-SHA512 implementation
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_134347_293496_EB385A27 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Aug 2019 at 09:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Add an implementation of HKDF (RFC 5869) to fscrypt, for the purpose of
> deriving additional key material from the fscrypt master keys for v2
> encryption policies.  HKDF is a key derivation function built on top of
> HMAC.  We choose SHA-512 for the underlying unkeyed hash, and use an
> "hmac(sha512)" transform allocated from the crypto API.
>
> We'll be using this to replace the AES-ECB based KDF currently used to
> derive the per-file encryption keys.  While the AES-ECB based KDF is
> believed to meet the original security requirements, it is nonstandard
> and has problems that don't exist in modern KDFs such as HKDF:
>
> 1. It's reversible.  Given a derived key and nonce, an attacker can
>    easily compute the master key.  This is okay if the master key and
>    derived keys are equally hard to compromise, but now we'd like to be
>    more robust against threats such as a derived key being compromised
>    through a timing attack, or a derived key for an in-use file being
>    compromised after the master key has already been removed.
>
> 2. It doesn't evenly distribute the entropy from the master key; each 16
>    input bytes only affects the corresponding 16 output bytes.
>
> 3. It isn't easily extensible to deriving other values or keys, such as
>    a public hash for securely identifying the key, or per-mode keys.
>    Per-mode keys will be immediately useful for Adiantum encryption, for
>    which fscrypt currently uses the master key directly, introducing
>    unnecessary usage constraints.  Per-mode keys will also be useful for
>    hardware inline encryption, which is currently being worked on.
>
> HKDF solves all the above problems.
>
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, feel free to add:

Reviewed-by: Paul Crowley <paulcrowley@google.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
