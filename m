Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ED5C6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:56:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC17221FD
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AC17221FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8GwPvSx/JpQ9HIsspkQ+IiawYoN18nBM4plOAOSFrv8=; b=zJrsBqkxsF5Wcg+m1fO0NFKuM
	bxHOTn/Ix2dtz13aoGkc9zaNpIjSRtMlFqpQI88PcK00do7FhMhhlLCMMesa89221jw2F++Dp5Ddl
	hz4ebMZgnpl77iTTNyxXoMUR7vH+vPKjmXBsFKUl/equVLezfiRvBSb7VWUK8nfU9elCiu5JuUlz8
	MF2d06qXSllUE54Td9+gpiQGpzZ2GsmsVGJWAuUaCFL+Mc7kqVbln/mrA7QkL8HIGvzIgpAepqU97
	WCOIiF+kihGSt6chy2MZMwRVOMZhxrvpwbsRPK5mi2cCXagEHiq4uUxqoYE02dlqsYW8YPq4MXJe7
	QHF/vRIQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkb27-0000dO-U5; Wed, 02 Dec 2020 22:55:36 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkb23-0000bQ-A3
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:55:32 +0000
Received: by mail-pg1-x544.google.com with SMTP id w4so163971pgg.13
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=L1XwcgAgK+XPh06m1JOhanYVC+SJck5f59jqFhEbGDI=;
 b=OwL6XjWUFECYdRQ/BDLTIJAKSgvOzBIuCYy8go0ZXtgmYtIS6brmm3R75wKrH/EzdW
 csYX6sHsrX/dQo5LpEUFXjpu2EW1GEYnRTgcxcM3Q80zvBIXhSTyN7ndhrFSNEaaaeTq
 rDvv2G/W8JVcmQNzgNEXr/NFhBclSpQs4pZ8otFmuWHqA4gGLzvCAsj9/JxSmB1kXQqT
 XwI8qVE6oZSHU1Jw9a0tGd59fXSMlRg1RTFFOL5q5ulXyj95INVDi6t4YT6vd1ckEdm7
 IrvCuRd4lAmV3QBrpL03jA2ZaTRbONd9YRBguJoX+VmrZ0VHG7tr/amdrwGGvBN6qDk6
 a4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=L1XwcgAgK+XPh06m1JOhanYVC+SJck5f59jqFhEbGDI=;
 b=dZHeKQrij8aQkYZZyagngvp12DGTC2dWnC3eDmnF68pw/E+iHJSLteYfkdVZ/WTD8q
 3FcIICTejWNeOBDi3/q8aq6+9Cp4rx5WAK05UOhEk/rc9dVmo63r01l9l7BsCrIAzpnr
 pkf6rwK6CNPBrzvfrYrC7gVi4xUHdzH8FjtwN+0o1DDK6kZCtUk80fqssQ7tOkuMn9DU
 QzRg/iUe6HW5wZE4P9uSIcckwBKSwPJlRJYwO+DpSlzkOT0eFwpPJMWoTDO9+o1cG5my
 4LIE+lAjQRY5JjrF6tjP7aTn0YhuhIjuIcMwwfAZKBFzHgZLVmmuhDzzX/gPSJrqCA+V
 hpLw==
X-Gm-Message-State: AOAM530RnS6JqSNMiSF644aNZAlvRMMmiat99WwHzkFVgvE5Mkj6xmvL
 ZYAewWBp6nu0pedME4UmOdKkMQ==
X-Google-Smtp-Source: ABdhPJwK/zFevwSSRtCDcQVZpXqyUJSqXvW1jH45dooiPbjfLKwrs2ybCyTmfz3+OkLtgYzUUvQXwQ==
X-Received: by 2002:a63:7208:: with SMTP id n8mr444147pgc.99.1606949729114;
 Wed, 02 Dec 2020 14:55:29 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id x23sm107703pfo.209.2020.12.02.14.55.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:55:28 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <B0FCE075-6DBB-4F1E-BBAB-762112445AB7@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 8/9] fscrypt: unexport fscrypt_get_encryption_info()
Date: Wed, 2 Dec 2020 15:55:26 -0700
In-Reply-To: <20201125002336.274045-9-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-9-ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_175531_574378_6FC63A00 
X-CRM114-Status: GOOD (  21.66  )
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
Content-Type: multipart/mixed; boundary="===============1503591470844336544=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1503591470844336544==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_C98ABB42-779F-468B-82F9-A32B713E39D7";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_C98ABB42-779F-468B-82F9-A32B713E39D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 24, 2020, at 5:23 PM, Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> From: Eric Biggers <ebiggers@google.com>
>=20
> Now that fscrypt_get_encryption_info() is only called from files in
> fs/crypto/ (due to all key setup now being handled by higher-level
> helper functions instead of directly by filesystems), unexport it and
> move its declaration to fscrypt_private.h.
>=20
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/crypto/fscrypt_private.h | 2 ++
> fs/crypto/keysetup.c        | 1 -
> include/linux/fscrypt.h     | 7 +------
> 3 files changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
> index 16dd55080127..c1c302656c34 100644
> --- a/fs/crypto/fscrypt_private.h
> +++ b/fs/crypto/fscrypt_private.h
> @@ -571,6 +571,8 @@ int fscrypt_derive_dirhash_key(struct fscrypt_info =
*ci,
> void fscrypt_hash_inode_number(struct fscrypt_info *ci,
> 			       const struct fscrypt_master_key *mk);
>=20
> +int fscrypt_get_encryption_info(struct inode *inode);
> +
> /**
>  * fscrypt_require_key() - require an inode's encryption key
>  * @inode: the inode we need the key for
> diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
> index 50675b42d5b7..6339b3069a40 100644
> --- a/fs/crypto/keysetup.c
> +++ b/fs/crypto/keysetup.c
> @@ -589,7 +589,6 @@ int fscrypt_get_encryption_info(struct inode =
*inode)
> 		res =3D 0;
> 	return res;
> }
> -EXPORT_SYMBOL(fscrypt_get_encryption_info);
>=20
> /**
>  * fscrypt_prepare_new_inode() - prepare to create a new inode in a =
directory
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index a07610f27926..4b163f5e58e9 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -75,7 +75,7 @@ struct fscrypt_operations {
> static inline struct fscrypt_info *fscrypt_get_info(const struct inode =
*inode)
> {
> 	/*
> -	 * Pairs with the cmpxchg_release() in =
fscrypt_get_encryption_info().
> +	 * Pairs with the cmpxchg_release() in =
fscrypt_setup_encryption_info().
> 	 * I.e., another task may publish ->i_crypt_info concurrently, =
executing
> 	 * a RELEASE barrier.  We need to use smp_load_acquire() here to =
safely
> 	 * ACQUIRE the memory the other task published.
> @@ -200,7 +200,6 @@ int fscrypt_ioctl_remove_key_all_users(struct file =
*filp, void __user *arg);
> int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
>=20
> /* keysetup.c */
> -int fscrypt_get_encryption_info(struct inode *inode);
> int fscrypt_prepare_new_inode(struct inode *dir, struct inode *inode,
> 			      bool *encrypt_ret);
> void fscrypt_put_encryption_info(struct inode *inode);
> @@ -408,10 +407,6 @@ static inline int =
fscrypt_ioctl_get_key_status(struct file *filp,
> }
>=20
> /* keysetup.c */
> -static inline int fscrypt_get_encryption_info(struct inode *inode)
> -{
> -	return -EOPNOTSUPP;
> -}
>=20
> static inline int fscrypt_prepare_new_inode(struct inode *dir,
> 					    struct inode *inode,
> --
> 2.29.2
>=20


Cheers, Andreas






--Apple-Mail=_C98ABB42-779F-468B-82F9-A32B713E39D7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IG18ACgkQcqXauRfM
H+Bb3Q/+N5KoLVZ0SdPOGc9zFf30gVxx9174tO5hYC8bEXeibRo93gRWaBks6jTz
bKADVjbP+PsYOkOVkiVEjxDYaVecrOLCZM4i0HYbSkBC2TF+FMf+8t6Off/ADUdv
zCDcRRget6d6/xvWQmnX/neBSax+mJ9NThwmwtP52BiYgH7Ufw9DU3y1s7cYUcqw
lxkKunK0y5g+Pv0AeN1BP4tVSj4JD4zBoIuWYaJaj5jXMtRVS0Z9hjayM/jEozhp
VeQzo1KlHTtzlX2RUT8V3f+MxEKtwm7yb21eKGRi8chOl8lG9rpayZ/h2BKm2TD2
uG/Eb0tP/22P0f++v31nUb+GlE3VcuSZUEdckw6tR/11Jc3vpKB2dzG28qgweiX5
Acf7xvneXY8hJIQqoRjdPxU0chyQ1XbYL1o3fV6Pu7OeMchPRgei+nocseE5LQBv
3WuxcX31YtNMI3piijqyr9RFaKp2jFzuPK9pY7RAvdk/h9SRTxhevMhb22vn8EkB
vWz6D9TiIVyA6Solq0VCd0IYKZh66+kQ1eLxOmbBclENmzjqDahynk5jWi3g8Mhz
whCP62Vo7aCE+kpnNL7V4ZNvQ5/a5ylPvvNbppQ+q6xFbeXT3uAtl9DaIXMZHj7q
aOqCgMNW1I5SjXCtvpHPBjGQaJdAr3EbztK+02kQXvfohio7PKY=
=boNE
-----END PGP SIGNATURE-----

--Apple-Mail=_C98ABB42-779F-468B-82F9-A32B713E39D7--


--===============1503591470844336544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1503591470844336544==--

