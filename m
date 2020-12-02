Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1738C6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:54:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63CC0221F7
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63CC0221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=slfhDo+JBXLNwirTq4riZ/CXupX70HxmYVyQqC98q8o=; b=Ick+BslakJmOuwf2PqFeVvqL2
	r/Ed0Zb78fQat/iz6ScG8iBh+QRAoJO4BfFIXom7+q3T+/42Qc7czBVHXDZ6al1kpu9UnO8WJY+1O
	ME7g7gqa732ewaUyMcvMojKgKwTCak2WUKqDHhEDFga/WTwtTEs8fqYhIx1Z0fDe4HDm05khW8ax2
	JyxkiPyzY5qaRYqYAiBlAWRnrOxdWNV4gWGddYT29orQennEVU6nkhqHEQVdBWE8/AfOV3+kLRlFn
	uK9tKCSLMMtwmAIEm+aIFbKmMyAJiTUgiORi9gIH7YRmt41FLk0pvyfpeMIMJkGfuHSAtr3eX08ZA
	NKLaFL8lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkb0Y-0000IV-0s; Wed, 02 Dec 2020 22:53:58 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkb0V-0000HK-0k
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:53:55 +0000
Received: by mail-pl1-x642.google.com with SMTP id x4so39528pln.8
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=6sMbfK6xSUKcyWfUeGG79f6zv6xb7kATzaDcIn4zO0I=;
 b=LJKvyhCz/emjw+E+7zoN6LwOSoLLsWeCO5XLuP0j/JRTD7q5K1/lU29OT5eTmpHFmD
 0n2TtGUKM1nsWEM1P5fy5DwT9XDEw5UW8zQ9EX7wpm4B4U17LPkrighPUFx5gKBioLCL
 ci/Zf7lodb5ThEg864+XURYdEgLLr0h/kQLwFcV087DvFgfNgBfl5H16thY5UJaUcD4n
 mvCRQoqiSyVsf7LFldGzHqHIya03oR3FOcPFruikczdP2OL2ZQX3TqxI1B0VCuDWN6fD
 m4xoECJ0iSSBGnEI04xJaLZXO/Dk5cbyesHzZOimApj4WRR94H512bETjuN8v8Gn3Ame
 wFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=6sMbfK6xSUKcyWfUeGG79f6zv6xb7kATzaDcIn4zO0I=;
 b=kWWopgeDPhiegsYsV5YZndLbfTEiV4mT5afn/CG8egUYv5XGRZ05mJq0BD9v8x7PVH
 8oZtxB3vOECslIyBnEANSZKrTj6vfqdi9RMAiyQybjeS65oyXJxUzHQfVZ7YPbAdKj6F
 AVnJkmxdIoJxO/76u0CtBV64ydKAIDSkc5ILCXciXWMTGyBBWWDzWdq2vdVa3OCCw7Kg
 LHDCU9TpRkbviA4zpW8nkqTpuMwucdi9W5oq8PM8DmqFViNVihSJnK0GbeERvQ44g5dF
 CSKX6DjmhMar/8jETD/SDwuUTyXA5VW1Sk80fYZuDbMbH+Osi3PCmRiA7WTfWA6TDcc1
 zZ5w==
X-Gm-Message-State: AOAM531ZnXBOQY2I1Xh+odpl1FPgwkLRs0KJNl8M8iXWKVFv/5udzAL3
 LpcgFmf3zevNtGXwbt5jIGFT0g==
X-Google-Smtp-Source: ABdhPJz6ECrgDDZ+XdBZgCMqN1FpiHkNJc84tlPJNn2N0B+y7e+IT9zMAdGJb799KJgWqzkCobJ4Tg==
X-Received: by 2002:a17:902:ee0b:b029:da:20e7:bcfe with SMTP id
 z11-20020a170902ee0bb02900da20e7bcfemr359725plb.13.1606949632663; 
 Wed, 02 Dec 2020 14:53:52 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id x23sm107703pfo.209.2020.12.02.14.53.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:53:52 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <A2F01966-90F0-4DD2-A61C-21414666EF9A@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 6/9] fscrypt: move body of fscrypt_prepare_setattr()
 out-of-line
Date: Wed, 2 Dec 2020 15:53:50 -0700
In-Reply-To: <20201125002336.274045-7-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-7-ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_175355_091164_6C6B6B40 
X-CRM114-Status: GOOD (  21.45  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============5620851452993295671=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5620851452993295671==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_5B6E5F61-8EF9-4DE3-806E-E887B9EB323B";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_5B6E5F61-8EF9-4DE3-806E-E887B9EB323B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Nov 24, 2020, at 5:23 PM, Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> From: Eric Biggers <ebiggers@google.com>
>=20
> In preparation for reducing the visibility of fscrypt_require_key() by
> moving it to fscrypt_private.h, move the call to it from
> fscrypt_prepare_setattr() to an out-of-line function.
>=20
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/crypto/hooks.c       |  8 ++++++++
> include/linux/fscrypt.h | 11 +++++++++--
> 2 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> index 82f351d3113a..1c16dba222d9 100644
> --- a/fs/crypto/hooks.c
> +++ b/fs/crypto/hooks.c
> @@ -120,6 +120,14 @@ int __fscrypt_prepare_readdir(struct inode *dir)
> }
> EXPORT_SYMBOL_GPL(__fscrypt_prepare_readdir);
>=20
> +int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr =
*attr)
> +{
> +	if (attr->ia_valid & ATTR_SIZE)
> +		return fscrypt_require_key(d_inode(dentry));
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
> +
> /**
>  * fscrypt_prepare_setflags() - prepare to change flags with =
FS_IOC_SETFLAGS
>  * @inode: the inode on which flags are being changed
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 8cbb26f55695..b20900bb829f 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -243,6 +243,7 @@ int __fscrypt_prepare_rename(struct inode =
*old_dir, struct dentry *old_dentry,
> int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
> 			     struct fscrypt_name *fname);
> int __fscrypt_prepare_readdir(struct inode *dir);
> +int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr =
*attr);
> int fscrypt_prepare_setflags(struct inode *inode,
> 			     unsigned int oldflags, unsigned int flags);
> int fscrypt_prepare_symlink(struct inode *dir, const char *target,
> @@ -543,6 +544,12 @@ static inline int =
__fscrypt_prepare_readdir(struct inode *dir)
> 	return -EOPNOTSUPP;
> }
>=20
> +static inline int __fscrypt_prepare_setattr(struct dentry *dentry,
> +					    struct iattr *attr)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> static inline int fscrypt_prepare_setflags(struct inode *inode,
> 					   unsigned int oldflags,
> 					   unsigned int flags)
> @@ -840,8 +847,8 @@ static inline int fscrypt_prepare_readdir(struct =
inode *dir)
> static inline int fscrypt_prepare_setattr(struct dentry *dentry,
> 					  struct iattr *attr)
> {
> -	if (attr->ia_valid & ATTR_SIZE)
> -		return fscrypt_require_key(d_inode(dentry));
> +	if (IS_ENCRYPTED(d_inode(dentry)))
> +		return __fscrypt_prepare_setattr(dentry, attr);
> 	return 0;
> }
>=20
> --
> 2.29.2
>=20


Cheers, Andreas






--Apple-Mail=_5B6E5F61-8EF9-4DE3-806E-E887B9EB323B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IGv4ACgkQcqXauRfM
H+BEuhAAm/v75p+tdLX3VyODRb1mULfJBeY25WD5wMaqEAkSuLZUmUfepeSljY0f
ok/rpkOYVBtfzQB4YS30GMjC/HbKUdkmPuvWfHpFsLKO7CPHJMZcr2FQFNYlIaLR
Of6kEFqSpxNNh46FOEq+ufFbNxWj++Tq7agI8b7qtp8AscEdRBydLmf1O92GAJMh
O4hG6LlHAtS8W0zFjXm+QXw7aO5a1fkeG8BzD05VPwVI2EAksxCJl3oRFgLnQ8go
c0+NOiEc31MlE8v0KSBhWvvYNIDvVsrqX/IBcHAU2bAULVLTiF41EFPZhZD1ddgu
I8VN9tedrK4sZ0uTwtamzBwUDTQbWQD6mdzX57NXpgha8zU+cN8OJ5UeVByyDhLX
uD1GnM2x8WvzkWd+EIfgNpXZ1kRKZr6LnefMT3lhSjPrDPDzs/QFjMDqLtakdGPa
+Dl9eGB9Y6HE5CkX2b5KDn94gKbEgXdPIJZ8QzBLPcukwhjpBlwNQrRBrybF0UEC
6IuWi+6dqCPJ1B+z6H7BLVVQ/IgyEfgdFLyFzTQ1PwSCW/8Qna37XF9UFODhYyrH
q9lVoWV/HAvHqdTtC5BJNHFPb7qE5cs4YB1yQ7FWw2PseRAK0+tXNE95uuYQYtt8
h7B1yNxEGzk/mLYYhL1k31/lnFt/9HDe3XOcmTGrzzsEyfyS/Rs=
=vQsk
-----END PGP SIGNATURE-----

--Apple-Mail=_5B6E5F61-8EF9-4DE3-806E-E887B9EB323B--


--===============5620851452993295671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5620851452993295671==--

