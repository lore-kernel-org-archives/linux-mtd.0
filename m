Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E993FC64E7B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:52:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B111221F7
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B111221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h3no9OPpder1WCExIRGaOcIKCwn4yZD8R2rPvj1doAg=; b=NsAdE6SV/TEeynxErfW6ca69V
	xiqREo/Ce8WuGx5+lCvrkwGE5bF1dwUZpfwvsiGlehWASaxINIVW98ujl2GSzEc/tJujQnXgvXl3+
	W1UcbaA/0ED1I223elnitLdedcSG/gEfS+Q8gszyIHUkaNr1DKr/Zlri27NhOnsxoDuF//uYxnuoI
	NqRl6YpbnFeooyF6e9jV+Q/RVXq4IofH8FkGe8mNe+Jtg5K6FhdK9ddyN+bCHiit+O0wk0QpPzLV7
	bZ6o2rUAfWL6o4TV+u26dPtJ1qiSuCtj9qD+Lvoi0DF3EhU+oB67Kyaw4DtR104fXcvY+affH2kFh
	MK8KDdPNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkayz-0008KV-GQ; Wed, 02 Dec 2020 22:52:21 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkayw-0008Jo-Rc
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:52:19 +0000
Received: by mail-pj1-x1041.google.com with SMTP id e5so13105pjt.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=lAa6ISm7uCrPT+h5o/8USKpvXIqsWq8U2NOa5556/m8=;
 b=cNWo4yBwRTwBwps8iyf8xmXmepIGTSCNf2LNGSIVMYdxdwlw6oVkX1Kl2NcbO5Zzq6
 Ei+x9gnv/ErCspG8p37WUrwiRoribroM4jK4LiahFy4A7mcu/GsMxVqWIIZsICuSPm3e
 BwN9orCgpdbZfC5izYfsDSTJIhRr/Vxv+YcWfl/tgkDTE/f46tvdOuwTHEVr9yA1CitO
 WAOTYd8siLfnKPDQKSeItxevtwzNjjG4fWfL71JFX6ndHZtrtkNLEq32DrQgAImMa111
 b07Uk4E6XS5n2cJt5a/hP3VgG+u50Rzu0PVSI8pZjbXqpd3gSsE6fYr8zmzpZjjdrXfF
 H0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=lAa6ISm7uCrPT+h5o/8USKpvXIqsWq8U2NOa5556/m8=;
 b=UPeDmA/gKnM/0n2Ik+36AjiQhl5YfHkDeqnbu8Ep/SL54Ln7i/OV2DT+D3NO+o+wbM
 V9xDY0fwJChK9EnAyX88hYVtYA2iSGCoQPwX4UxgrMST5d2sTy9cPY+u4Wirm7kU/YG1
 ageHqGaXjP2pFiI7xkN0oMNyxDx4Q1X/SNlMfT91uMhHuxHxn0jiyrsqoVzDBDfL9ZNo
 HnrAg0zgpc8DlnCw9SiBPlXpIoNrVki74AlQwvsNBEjWqZXjiL7SBeEvL71wae7wMsda
 qVqmwglPudqhARajzG163QQp6zItlHcXudOqwHR3Qe1wJZjrb8/FHJT4jpMj9VQWbYNS
 GA7Q==
X-Gm-Message-State: AOAM53141oM09e9pO9gyXUq5nelmEZ6/UysJgJcGC+HVI2zGowED4hne
 zyi8mbXjgwJLfiP7EhdtXKcaLA==
X-Google-Smtp-Source: ABdhPJxtnCQS2009pSf+S+On0hCx6qSAE8Q3l/QJC0K2JWJb2MdsnrrnPhEAqtLqDMMh7/JX8+0pLQ==
X-Received: by 2002:a17:902:ab98:b029:d8:c5e8:978a with SMTP id
 f24-20020a170902ab98b02900d8c5e8978amr280062plr.56.1606949536254; 
 Wed, 02 Dec 2020 14:52:16 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id k4sm119861pfa.103.2020.12.02.14.52.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:52:15 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <5C84DBE6-E9AE-44D9-8BFC-0683C85F666C@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 5/9] fscrypt: introduce fscrypt_prepare_readdir()
Date: Wed, 2 Dec 2020 15:52:13 -0700
In-Reply-To: <20201125002336.274045-6-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-6-ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_175218_910869_2D0C70FA 
X-CRM114-Status: GOOD (  28.37  )
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
Content-Type: multipart/mixed; boundary="===============8085923304330606966=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8085923304330606966==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_086127B6-A5B9-4644-AEED-CBE64C521D8D";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_086127B6-A5B9-4644-AEED-CBE64C521D8D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Nov 24, 2020, at 5:23 PM, Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> From: Eric Biggers <ebiggers@google.com>
>=20
> The last remaining use of fscrypt_get_encryption_info() from =
filesystems
> is for readdir (->iterate_shared()).  Every other call is now in
> fs/crypto/ as part of some other higher-level operation.
>=20
> We need to add a new argument to fscrypt_get_encryption_info() to
> indicate whether the encryption policy to allowed to be unrecognized =
or
> not.  Doing this is easier if we can work with high-level operations
> rather than direct filesystem use of fscrypt_get_encryption_info().
>=20
> So add a function fscrypt_prepare_readdir() which wraps the call to
> fscrypt_get_encryption_info() for the readdir use case.
>=20
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/crypto/hooks.c       |  6 ++++++
> fs/ext4/dir.c           |  8 +++-----
> fs/ext4/namei.c         |  2 +-
> fs/f2fs/dir.c           |  2 +-
> fs/ubifs/dir.c          |  2 +-
> include/linux/fscrypt.h | 24 ++++++++++++++++++++++++
> 6 files changed, 36 insertions(+), 8 deletions(-)
>=20
> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> index c809a4afa057..82f351d3113a 100644
> --- a/fs/crypto/hooks.c
> +++ b/fs/crypto/hooks.c
> @@ -114,6 +114,12 @@ int __fscrypt_prepare_lookup(struct inode *dir, =
struct dentry *dentry,
> }
> EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
>=20
> +int __fscrypt_prepare_readdir(struct inode *dir)
> +{
> +	return fscrypt_get_encryption_info(dir);
> +}
> +EXPORT_SYMBOL_GPL(__fscrypt_prepare_readdir);
> +
> /**
>  * fscrypt_prepare_setflags() - prepare to change flags with =
FS_IOC_SETFLAGS
>  * @inode: the inode on which flags are being changed
> diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> index 16bfbdd5007c..c6d16353326a 100644
> --- a/fs/ext4/dir.c
> +++ b/fs/ext4/dir.c
> @@ -118,11 +118,9 @@ static int ext4_readdir(struct file *file, struct =
dir_context *ctx)
> 	struct buffer_head *bh =3D NULL;
> 	struct fscrypt_str fstr =3D FSTR_INIT(NULL, 0);
>=20
> -	if (IS_ENCRYPTED(inode)) {
> -		err =3D fscrypt_get_encryption_info(inode);
> -		if (err)
> -			return err;
> -	}
> +	err =3D fscrypt_prepare_readdir(inode);
> +	if (err)
> +		return err;
>=20
> 	if (is_dx_dir(inode)) {
> 		err =3D ext4_dx_readdir(file, ctx);
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 7b31aea3e025..5fa8436cd5fa 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1004,7 +1004,7 @@ static int htree_dirblock_to_tree(struct file =
*dir_file,
> 					   EXT4_DIR_REC_LEN(0));
> 	/* Check if the directory is encrypted */
> 	if (IS_ENCRYPTED(dir)) {
> -		err =3D fscrypt_get_encryption_info(dir);
> +		err =3D fscrypt_prepare_readdir(dir);
> 		if (err < 0) {
> 			brelse(bh);
> 			return err;
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 47bee953fc8d..049500f1e764 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -1022,7 +1022,7 @@ static int f2fs_readdir(struct file *file, =
struct dir_context *ctx)
> 	int err =3D 0;
>=20
> 	if (IS_ENCRYPTED(inode)) {
> -		err =3D fscrypt_get_encryption_info(inode);
> +		err =3D fscrypt_prepare_readdir(inode);
> 		if (err)
> 			goto out;
>=20
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 009fbf844d3e..1f33a5598b93 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -514,7 +514,7 @@ static int ubifs_readdir(struct file *file, struct =
dir_context *ctx)
> 		return 0;
>=20
> 	if (encrypted) {
> -		err =3D fscrypt_get_encryption_info(dir);
> +		err =3D fscrypt_prepare_readdir(dir);
> 		if (err)
> 			return err;
>=20
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 0c9e64969b73..8cbb26f55695 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -242,6 +242,7 @@ int __fscrypt_prepare_rename(struct inode =
*old_dir, struct dentry *old_dentry,
> 			     unsigned int flags);
> int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
> 			     struct fscrypt_name *fname);
> +int __fscrypt_prepare_readdir(struct inode *dir);
> int fscrypt_prepare_setflags(struct inode *inode,
> 			     unsigned int oldflags, unsigned int flags);
> int fscrypt_prepare_symlink(struct inode *dir, const char *target,
> @@ -537,6 +538,11 @@ static inline int __fscrypt_prepare_lookup(struct =
inode *dir,
> 	return -EOPNOTSUPP;
> }
>=20
> +static inline int __fscrypt_prepare_readdir(struct inode *dir)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> static inline int fscrypt_prepare_setflags(struct inode *inode,
> 					   unsigned int oldflags,
> 					   unsigned int flags)
> @@ -795,6 +801,24 @@ static inline int fscrypt_prepare_lookup(struct =
inode *dir,
> 	return 0;
> }
>=20
> +/**
> + * fscrypt_prepare_readdir() - prepare to read a possibly-encrypted =
directory
> + * @dir: the directory inode
> + *
> + * If the directory is encrypted and it doesn't already have its =
encryption key
> + * set up, try to set it up so that the filenames will be listed in =
plaintext
> + * form rather than in no-key form.
> + *
> + * Return: 0 on success; -errno on error.  Note that the encryption =
key being
> + *	   unavailable is not considered an error.
> + */
> +static inline int fscrypt_prepare_readdir(struct inode *dir)
> +{
> +	if (IS_ENCRYPTED(dir))
> +		return __fscrypt_prepare_readdir(dir);
> +	return 0;
> +}
> +
> /**
>  * fscrypt_prepare_setattr() - prepare to change a possibly-encrypted =
inode's
>  *			       attributes
> --
> 2.29.2
>=20


Cheers, Andreas






--Apple-Mail=_086127B6-A5B9-4644-AEED-CBE64C521D8D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IGp0ACgkQcqXauRfM
H+AP6Q/+MHpJH7lRfuvglXXmU4UThuvLs/rAMJKbloZXk/CvPKBUEtAUpscsZEur
9/Z4MUJTzAtVlc3PG391SSc4QqSOu58K5r8ZBtv9GsFZniEtRbRmuJJoAXorKz5Q
BiglWRT0Z2xWl0UdWMui5e8TldO2xAU3S4mznT+lZfiJsbjxM8u7vz4MkfPPNZx5
hKskvYV5YPSPlA1LGkNF89vyNxYXxDelt9lQJSs8tNMrhueXra5ddki6YO7ulwpL
6eaLYmnkPVZt7STEVNG5Aq/ZRkAlav/DIb2f6+9qHULMVMoibulXeyWSvCzshbt6
zGL7e5+MQUE+wb8rFe25Ic92sUZtEZ8JAKdQB6K6ZdZ0PWCNWLSRXDJJJwCi0MQM
XDKgR2ysAjioEpiNydcFDj5KMLEmVI4gu19KN0MpaX0B/kHNn+BG2QfVes25mSCT
XMgccEzyHISrDWtBRuUQoscTRKqUMLspJw++fPgCmT8lXARfV1YvI3C2GqzFd4HT
PRUCoArtHppOu7RgPNT12mTjmmwGF+YJ8WmgXgITWkkVfacHWFYVyf8DKT7JqYXy
VHfJoxwb73Xb/zQV73iPllCKfU0F4sRVNWHb0UeaoLZU7PecqTBzNSsPSpo/C/pL
hAmIUa7+slR997Sc0ng5C3PEhlAY5iLTdoiejVyYtknlAO05puA=
=kCNT
-----END PGP SIGNATURE-----

--Apple-Mail=_086127B6-A5B9-4644-AEED-CBE64C521D8D--


--===============8085923304330606966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8085923304330606966==--

