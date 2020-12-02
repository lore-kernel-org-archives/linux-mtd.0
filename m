Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1484EC6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:53:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91024221F7
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91024221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vd4Pu3N/GUWUlkdAi0K7mxNCNz5q2+m36Z9NoOkCwjU=; b=046S8RCr2tt17yioqqL0gL8ch
	7VO9It/LUCpcIYmPKh0O3bgkqgkhvGWFgg6XusKdoUZ3D3wym5K5+5A+krEIVgSTqlaC2xHxiPO47
	Fr5jenzEsXlCb4EEIl1h+6TxmXfzUOhtNXVa2iVq0qKlsxmP+qFr31pF/cvm+RuAERWI93AhLrYtm
	NxYFuVB4ZbuMfhtOm4tvSULrTE4Ejz+YITGWBYYHhT01Z22c7knZlMI8qL9V51yqTF0K/8qGL/xBO
	nsplifZhr05804i2VYnj1n0FLH6WOKjXQfNBdrwF5ecP5AiYmh79r15sj8buHwWw8XkKhq4ltu2op
	D0mnOFenQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkazM-0008QG-SZ; Wed, 02 Dec 2020 22:52:44 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkazJ-0008PE-Je
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:52:42 +0000
Received: by mail-pl1-x641.google.com with SMTP id s2so35957plr.9
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=OmUP2MPcenXFfmwZ7lA2aT/KxEZB62H8R34vZjhjmNI=;
 b=nw+pbUJsDE2VGEhZebCyVBzZz9salofRyj4jtbw9NAhJa/FW41OT396ayeu5T5yNVW
 ggBcULktVieAz/K5iTAmfBrfPR+6AMDnIu7qM27gV/cpqqGPi9rFsR+I/eHm49ki9F1b
 kgYIygygOk56hoE+TjmqHVyViHTT6gs8ENlYEX8Qg1101IWRAFq8iEZnQadRjOLv+8Ki
 3zIOUCNId03yHgbFiLsTiLXWdjwWrcU0LyqbxWjNA53QdQSXRHJTS1mL3O6xoHR3VHKz
 WuKmkKikbNUct6yPWXRNohQhtbcN1LFYc9cn4K9CFvJM6Mx0vbUXfOK0YyHipdTA4p8K
 vlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=OmUP2MPcenXFfmwZ7lA2aT/KxEZB62H8R34vZjhjmNI=;
 b=RzK4U2O2NXYEMG1G0wjSVXPxC28otczHfZeK5A2fIwmJm51XEpUT110cBvOksZ4C9/
 LJw11XjTlnDOy1TFXC2sMgnayZgw184X5HGg1CdTmRtEvNanqsMQlOJBnSJDKbvLI4v5
 VCBtjwFZmIHczSU0lUgcnRXa5o4WD+49Eknm3giVdfYXwFxo+5DLTu44mh46OqbaAh0c
 9EO0RXMx1TUUUMGxAy5ut05F9tiG3ST5eXjEs1rxqom1Srkmc4KyesILAVqEp4xvaCaG
 e+akLKFStB4DC9Rly/IKi1bOTeX3ZLzI4xIlC5/FRnx2sebplKaoEi5lLstyfCs6tgOp
 AHfw==
X-Gm-Message-State: AOAM531IkEwDspC+w9pzaGlqyTtid/1LU+VDgSKWsjDolrT/6+YwsNJA
 Mk5ZC4GA3W/T+WdjWHdCdc3U4VKtQKenvA6w
X-Google-Smtp-Source: ABdhPJy2sFJxHWGZ5G6i7qp1heXgxdv9zTwWgR9Q3+y8MTeiOA+nkHTIWvtORcYby+4Y7NSqrLY9mQ==
X-Received: by 2002:a17:902:8209:b029:d6:d2c9:1db5 with SMTP id
 x9-20020a1709028209b02900d6d2c91db5mr281911pln.54.1606949559241; 
 Wed, 02 Dec 2020 14:52:39 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id k4sm119861pfa.103.2020.12.02.14.52.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:52:38 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <61983A66-FC9F-413D-B712-1F30E9BDFCBC@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 5/9] fscrypt: introduce fscrypt_prepare_readdir()
Date: Wed, 2 Dec 2020 15:52:37 -0700
In-Reply-To: <20201125002336.274045-6-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-6-ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_175241_663038_8103FC30 
X-CRM114-Status: GOOD (  28.46  )
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
Content-Type: multipart/mixed; boundary="===============7780268055045045365=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7780268055045045365==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_E798FBC2-B426-42EC-9AAE-51D67E6BE4E1";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_E798FBC2-B426-42EC-9AAE-51D67E6BE4E1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 24, 2020, at 5:23 PM, Eric Biggers <ebiggers@kernel.org> wrote:
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

(typo) *is* allowed

> not.  Doing this is easier if we can work with high-level operations
> rather than direct filesystem use of fscrypt_get_encryption_info().
>=20
> So add a function fscrypt_prepare_readdir() which wraps the call to
> fscrypt_get_encryption_info() for the readdir use case.
>=20
> Signed-off-by: Eric Biggers <ebiggers@google.com>
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






--Apple-Mail=_E798FBC2-B426-42EC-9AAE-51D67E6BE4E1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IGrUACgkQcqXauRfM
H+DTQhAAuYlAZUnmGq1PBm62te5T4PH0Rz7ZV8pizJPaidGHUb8wgNx+XEEQ3RKJ
zkP12wPe5i/2CQuuGyJAihuGQDBEocJhz8xAnCTVSJtp9i5cLzgOoP7FlMlIzeXC
5//PQE+eQIXfqaAcsYFbMSlogupdVOUxNiA5Vsit4zVAbaWqZH/1E4CQl/4xIS3L
wV20KyhzylH1nxbYoNYC+AFEhbp+/rHLGlu6ZlrkLPs6EtsPHSJMywdyj7rS9wty
iAE82ZGdDRKhf+s4hxCiMVKNtsJ0Qq+psHLzUpLo3Nn/F40mdSo2lt0KDS7dhONB
Z3KmukXq8D8/4bmb5P6+yVtF6wRwsZrQ+PwCdjT6Z9Y48fZxpZin0KqKgoDGBlkT
zTSZBDDxys5KGEQ91lJA0EJrl20F3RJckwUHeaiNNYpUS2JMzDipVZHSFpJzqsk6
9MdyETVc0RbGCMIavUyAuxMxHg9zEccqZNZgGo6OCfsQ7t4Z4zFsVLjbzARonldl
hmczfzZw5xb7qh2Fte7Wl2wk0ltyuhB9mPhbMiotfdwkq9ZQoaCD4NtSXb9DCJvc
qunKdVZD+ig/geI5ZgTBsPW3YC5olrItqRJzXbGM6guW5WXZIjcd3lJK7+ixG6xI
xBBRk59t5uh34lt8OoOECGOmD4IyFGHpEoRxn9eT3aB7pDsDcQQ=
=6a0V
-----END PGP SIGNATURE-----

--Apple-Mail=_E798FBC2-B426-42EC-9AAE-51D67E6BE4E1--


--===============7780268055045045365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7780268055045045365==--

