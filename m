Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD990C6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:48:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339B1221F7
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 339B1221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iu+WwtRICJsR2NsKbfMEWWIEwn0jtWNg5HN3OoCS9MQ=; b=WyzQs31HFoohOwNCFiHDJOB1i
	TKmO5Rt86ZTnOVHcmezcqOGunBEdWjJfJfktrzyaZJLA5ClqFa0IlYk2SNzPmSexCbiqqdAnRNk/k
	Qhnb5udRWu8LCHg21owBge2TF0gpxTTAVScdoUoQGEbM7qgsDCtT14vvxpRNpzx4Za36FuBjhpgyV
	9DzUeERylqkzoh6rKYnnChOO6KV6FfCN5XI7xucq9zWHCXLrE4yb397kyyypBgSKa/ABp7WiA/Hh0
	9at0Q2Q/ByWYnMM+WHnBzRHaVbnZO/ajHNN2FHAaIdVnELRtMFn8/k7ff9lQPLUsYVTAIJusDNNab
	s5QPo++fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkauW-0007o6-7j; Wed, 02 Dec 2020 22:47:44 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkauS-0007nT-B3
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:47:42 +0000
Received: by mail-pl1-x644.google.com with SMTP id u2so27309pls.10
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=vORerP6L/9bHX6qRWOpedpBg2yoOaAJwQR4f5QrHgzY=;
 b=1el56WgEpgq3xnPh001U6Fkgb2fbjprgnUOqeilkzqGyUXAAkaBxUaXWePyY00Hqyq
 +vy6sTBDn0OzfoamQRLnUbFgHe055OMX4yn2qFsp6NPgPnQKmKNWtD6WZs8jsFSZzIkK
 8mg9ctITY6lQ+wDsiNuVAN2U1TJ5PResPI0QfWtQpV+osGga2mqiz34swVj6m6ONAMJc
 ReobA3tSRwTfKDV/JP8JI3mz4yjPru78Jeu9oKx8sOQovRSndHq/GBdLnPDj2gZNdVPI
 KUY51AAG380tdNGDQoGmnFT2dYayb8PMnrwH+191OsAxr4Jahk1Wvb5ShUp2CpGY05md
 vSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=vORerP6L/9bHX6qRWOpedpBg2yoOaAJwQR4f5QrHgzY=;
 b=GtMI5I56S46z9k0q6W/ZLyaCYlmoC7rFI3vY+2CJK1VcV9bvhJmXHI9UtbRYUiIXpr
 mpzUxUErzom4bixDCNnamlSSEAdGipsATmo5cD7kvrXkcj1KFbV2nR7ZHsO4k50SsalG
 UeknkTUsLuudczLGeWB1RqHuzalQdzAaZk/0VVoSJfkvF7ndnXniKGbXCs3/fho0Xl3k
 caHjSoRoxQkZRt80PqRLk1WENir1/+iQFHfZwjIdiWTc12rRVzftFrysE7axq0uoc4NU
 jaKutmBjGLQFwgzUCr2tv7vKeledLUhOCz/GwPMlmoqz52ijT8F5UKj9hh1dv9xP9tpQ
 xYXQ==
X-Gm-Message-State: AOAM532HUDqzOC8wkbTX83Z+/oU3U7GDFqYZwV4lFPnik8RNTyza1hbD
 bC8BFRgEtoJouNYIDGA1Z7ASeg==
X-Google-Smtp-Source: ABdhPJzvtcEpSpJOY7N/htLhQegQLezTxksVZDb1dI8FPDBzUhlQkPa2qBrzVfdvz/AYe95rpcpgJA==
X-Received: by 2002:a17:902:8c8a:b029:d6:d1e7:e78e with SMTP id
 t10-20020a1709028c8ab02900d6d1e7e78emr247976plo.39.1606949257113; 
 Wed, 02 Dec 2020 14:47:37 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id s17sm91991pge.37.2020.12.02.14.47.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:47:36 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <D73BD1C1-90F2-4B80-9B1D-0FA1560BB4AC@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 1/9] ext4: remove ext4_dir_open()
Date: Wed, 2 Dec 2020 15:47:34 -0700
In-Reply-To: <20201125002336.274045-2-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-2-ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_174740_442199_498FB912 
X-CRM114-Status: GOOD (  18.48  )
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
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============9003762526601135140=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9003762526601135140==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_01B6A6AB-07E6-44B3-840B-68217F3B3E58";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_01B6A6AB-07E6-44B3-840B-68217F3B3E58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Nov 24, 2020, at 5:23 PM, Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> From: Eric Biggers <ebiggers@google.com>
>=20
> Since encrypted directories can be opened without their encryption key
> being available, and each readdir tries to set up the key, trying to =
set
> up the key in ->open() too isn't really useful.
>=20
> Just remove it so that directories don't need an ->open() method
> anymore, and so that we eliminate a use of =
fscrypt_get_encryption_info()
> (which I'd like to stop exporting to filesystems).
>=20
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/ext4/dir.c | 8 --------
> 1 file changed, 8 deletions(-)
>=20
> diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> index ca50c90adc4c..16bfbdd5007c 100644
> --- a/fs/ext4/dir.c
> +++ b/fs/ext4/dir.c
> @@ -616,13 +616,6 @@ static int ext4_dx_readdir(struct file *file, =
struct dir_context *ctx)
> 	return 0;
> }
>=20
> -static int ext4_dir_open(struct inode * inode, struct file * filp)
> -{
> -	if (IS_ENCRYPTED(inode))
> -		return fscrypt_get_encryption_info(inode) ? -EACCES : 0;
> -	return 0;
> -}
> -
> static int ext4_release_dir(struct inode *inode, struct file *filp)
> {
> 	if (filp->private_data)
> @@ -664,7 +657,6 @@ const struct file_operations ext4_dir_operations =3D=
 {
> 	.compat_ioctl	=3D ext4_compat_ioctl,
> #endif
> 	.fsync		=3D ext4_sync_file,
> -	.open		=3D ext4_dir_open,
> 	.release	=3D ext4_release_dir,
> };
>=20
> --
> 2.29.2
>=20


Cheers, Andreas






--Apple-Mail=_01B6A6AB-07E6-44B3-840B-68217F3B3E58
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IGYYACgkQcqXauRfM
H+C5uA//dj+kl3QNfH3INI0cUezlI1fsFhtgaBhqU0VNBLme8P4JBKO0H5eEo2U1
Y4jxLrMogg0cHNDBOnktxcbRxez2fM3PkmtOYDE3CiGbtI1EcEzv8iyVI3U+doBC
C+YFk5u651LYq82qy8ABQTSglxqQZp0cUJct1WWyBRmtia5jPrlcK8lBnsO0wVyA
Q5PbLHcRntIRbx6f+OlTbScOQQXkzgJ2qsx55OOooCGfAOydg4NnfaRwcarr7xNN
RDD1McW6dmuSv4zDDnN5HecGb+C8T31+4HxsJz9yh8e2LRFyn9QcVGJljdBb+GJZ
FKEpeC1bgsgC955LuijiS7KtKHZCrzh/rfOeZDjD8Im7tpX/k5PP4i1TDEpDtZ2y
rQ13XvtIXfLVg/lscoIfP0IhiI+bhrM2CVff4av9WsK5LfoSLO+oQLXQ7Y++a1ZG
QveizaFGtrocBZAqf/WulCKgbm2WF9aOOw+Y8k2MItZzx0nfVSlnftGCuJ7/MAyl
zn/MikLGNo1I+5pCtvxMAucowDtVHQi3d2q6Eu/PGSrlqsrnIj3w5D9WbPKz4lEA
MIKk3h4RKPerTakBdwx/CWqqSX0OCFc/KIZSgPMOy+8S+ukORniUIHyVWXemRrA1
2X63GGsYOdJJPGjYJJ6BeuHAqCBO4qVg0zK6HayeeiRSu9Xb2Bc=
=Osx2
-----END PGP SIGNATURE-----

--Apple-Mail=_01B6A6AB-07E6-44B3-840B-68217F3B3E58--


--===============9003762526601135140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9003762526601135140==--

