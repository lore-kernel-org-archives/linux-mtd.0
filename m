Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D259C64E7B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:55:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B42B221FD
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B42B221FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IhdQ8+i/PlQRzBrxDHyNHH8+U6VkKTtQ8GGef7m0Q3w=; b=sbvoHyS6XcL/Pa7Y6mdMWFFm3
	XRVP6DpfUa6nLN/5K5ytxp+LvcTBvfIoHQTWoq353Xwjqji2ZTCZkqN9oYJHBiIzelBREl3PhO5Rn
	ZaBMR7J4xeRyQyrDBfyVl+gQEcoQgAtzY51Qs7TTC3rXaDZrSnZBR8QGurT7AEJYhXU+Ku67WN7am
	g16nU71deC4RoFBHnud/SUQay1vuwTz5qB7gG5fsVkNR8W4GS+Z37/qXa4OwqyBEw2+y4C1o4LgQQ
	C9/m6m9RGvon8wwqHePED4A29sTeL6De+Z1YlrOFl2+lMOyEBvHzYyLc1y8US9T8hReaXeyM89uQ6
	reDNtfaJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkb1J-0000Ro-87; Wed, 02 Dec 2020 22:54:45 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkb1G-0000R8-Ql
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:54:43 +0000
Received: by mail-pg1-x543.google.com with SMTP id m9so194017pgb.4
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=n8gRmB/1qFzqG7wddTsdPmwprBqt+MsER1xrW91iNJ0=;
 b=ztmQVFcVMMIf8Z+Utie3UySUBHHHBp1eUtR3cRJCGhd9/C8pdBnTSc2cPOiJwkrBXT
 pzREWBO8OC4AU9zTSsUPJHfiMZHCyGQpmtZsv3HqfnEtxIzA/kTuICw3tbRl5sz+x/d7
 TwaKstUxMuCq6gFB3RL74G6jP/eUod6qm91FI/QNaZUYD3nhmmVJu1JxXUJxBoopDOTf
 z4Qosaua5fPmKQ+YCTDnktGluWKbN+vzCCd1rZz9N4oePmRwmsIG/sYEvhwKkGaemeIP
 DAHTUugz7HrfjV5yUpRUiZJxFBFR+HqF2T7TBMxWbkf3q9KjpyxmcIrfHngIqoD7wwqz
 3CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=n8gRmB/1qFzqG7wddTsdPmwprBqt+MsER1xrW91iNJ0=;
 b=NY5cbAjECql7UJG6b+sb2MtTNj7i8Vng8omxgW71FhVm6oFxCJcEotUmDXl4GqnLUa
 ltSLbJSwkoqviHUK3MQ2y6q0S6h/B8S7d6IsvTQZ4pcScYpGT4T+Aot1hIBt7I81Y0Dm
 B8AXljSXiYEBA6x+NJzPPQG26VT/2OB3fO2xuPiFWANvoNZP/AGiWaA+jAyK3DfpuDrS
 FwsvqE0e0sCKZr4oGKXEF0Bpl47prQowQ+0Bkt1jg5qxNfmTP/LMNVZzKrhRApTYNwfr
 pxOezXCM4jzgJH78Dq/7OgC1sC7XRtpps4eAmm4HN5lTkNA/kDRGsUbNitJT/SJhdbdV
 MMzA==
X-Gm-Message-State: AOAM532JwKBoQAudUz9VTwc0zdFO5sX4/oXG/tLCVaXIuoU7Utu0FqDf
 g9ZfQDjQ9kjGmkG/i9lXbns8WQ==
X-Google-Smtp-Source: ABdhPJyroWX50B50vCBi4SXruvM8BeO/oOit3dvyqmtAmZ75kqPYuqDG6vNNxp/rOzH/+nGwcDJ7mQ==
X-Received: by 2002:a63:2060:: with SMTP id r32mr445169pgm.129.1606949680485; 
 Wed, 02 Dec 2020 14:54:40 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id x23sm107703pfo.209.2020.12.02.14.54.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:54:39 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <F996D2F5-8821-4C8E-B9A7-0017B8F70D6D@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 7/9] fscrypt: move fscrypt_require_key() to
 fscrypt_private.h
Date: Wed, 2 Dec 2020 15:54:38 -0700
In-Reply-To: <20201125002336.274045-8-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-8-ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_175442_948805_0C48CBFF 
X-CRM114-Status: GOOD (  25.65  )
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
Content-Type: multipart/mixed; boundary="===============0511380451317361393=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0511380451317361393==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_53D94ECE-D613-426B-A535-CC8071F61DE4";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_53D94ECE-D613-426B-A535-CC8071F61DE4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 24, 2020, at 5:23 PM, Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> From: Eric Biggers <ebiggers@google.com>
>=20
> fscrypt_require_key() is now only used by files in fs/crypto/.  So
> reduce its visibility to fscrypt_private.h.  This is also a =
prerequsite
> for unexporting fscrypt_get_encryption_info().
>=20
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/crypto/fscrypt_private.h | 26 ++++++++++++++++++++++++++
> include/linux/fscrypt.h     | 26 --------------------------
> 2 files changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
> index a61d4dbf0a0b..16dd55080127 100644
> --- a/fs/crypto/fscrypt_private.h
> +++ b/fs/crypto/fscrypt_private.h
> @@ -571,6 +571,32 @@ int fscrypt_derive_dirhash_key(struct =
fscrypt_info *ci,
> void fscrypt_hash_inode_number(struct fscrypt_info *ci,
> 			       const struct fscrypt_master_key *mk);
>=20
> +/**
> + * fscrypt_require_key() - require an inode's encryption key
> + * @inode: the inode we need the key for
> + *
> + * If the inode is encrypted, set up its encryption key if not =
already done.
> + * Then require that the key be present and return -ENOKEY otherwise.
> + *
> + * No locks are needed, and the key will live as long as the struct =
inode --- so
> + * it won't go away from under you.
> + *
> + * Return: 0 on success, -ENOKEY if the key is missing, or another =
-errno code
> + * if a problem occurred while setting up the encryption key.
> + */
> +static inline int fscrypt_require_key(struct inode *inode)
> +{
> +	if (IS_ENCRYPTED(inode)) {
> +		int err =3D fscrypt_get_encryption_info(inode);
> +
> +		if (err)
> +			return err;
> +		if (!fscrypt_has_encryption_key(inode))
> +			return -ENOKEY;
> +	}
> +	return 0;
> +}
> +
> /* keysetup_v1.c */
>=20
> void fscrypt_put_direct_key(struct fscrypt_direct_key *dk);
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index b20900bb829f..a07610f27926 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -688,32 +688,6 @@ static inline bool =
fscrypt_has_encryption_key(const struct inode *inode)
> 	return fscrypt_get_info(inode) !=3D NULL;
> }
>=20
> -/**
> - * fscrypt_require_key() - require an inode's encryption key
> - * @inode: the inode we need the key for
> - *
> - * If the inode is encrypted, set up its encryption key if not =
already done.
> - * Then require that the key be present and return -ENOKEY otherwise.
> - *
> - * No locks are needed, and the key will live as long as the struct =
inode --- so
> - * it won't go away from under you.
> - *
> - * Return: 0 on success, -ENOKEY if the key is missing, or another =
-errno code
> - * if a problem occurred while setting up the encryption key.
> - */
> -static inline int fscrypt_require_key(struct inode *inode)
> -{
> -	if (IS_ENCRYPTED(inode)) {
> -		int err =3D fscrypt_get_encryption_info(inode);
> -
> -		if (err)
> -			return err;
> -		if (!fscrypt_has_encryption_key(inode))
> -			return -ENOKEY;
> -	}
> -	return 0;
> -}
> -
> /**
>  * fscrypt_prepare_link() - prepare to link an inode into a =
possibly-encrypted
>  *			    directory
> --
> 2.29.2
>=20


Cheers, Andreas






--Apple-Mail=_53D94ECE-D613-426B-A535-CC8071F61DE4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IGy4ACgkQcqXauRfM
H+DQAw//fLJfA+YSOvXOMgSO+VdKYlIGvZ+7i0b/EqobCgX+LimQHN/xWB2LXTxR
jA5ZJs27vliuurESPr0tAsB/UdRe2ToZfgBDZfKA9sH7msuMmbFQPxYFP3tDAb4V
xFyNxz2jn8fWUWr5rsyNKRTESZKOvf+7V0Vxcw4dyXdgP4DBrfiJpSh/WmFV/4IW
Jhnec+7AaWP9Sd83mz6Vwte4JY55jvF5QwHGTq7J/3JiGoFpCAgfIzkTcymQ3bkn
M23wmBvgRaZdPrDItE8F2tz1QsU+Prqk8uZI9uL3U4wVpzM0Si7pQdaS3wRVE5Fs
0Yi87MdoEDFwTtslLi1K5PkREhgA55myWqMocNSX6HTAf3b68yCcd23eauBRAv9F
xvwRB5UztbQmQIGnGwRnAcwmB0dhC6Z9vFJjRTXpckwVrxe3lkICpxKZU/ZmE0yj
Sl4G5WHzY8uCh6TtYIqRPI7ylM4UJqmmnF+pWt8Qqnnmi5KRuwv+lFwCIbkWQ12X
WUzcoL/A5uKqYcitlZBv9xNw95BskeiD+QwOnEM1gUsCinQji5cxGRDZNiP2lnZD
RtcHUerikV40EI7zS8BbjuLbMpiTrlw/HP1KD1L+41RB+zarX7+0V++0dkOtljxz
I/HXYJt5dEmXGaZNiZdO5AmFO3stSNAIvkQwTXKKBi1vpy4PWsk=
=znFQ
-----END PGP SIGNATURE-----

--Apple-Mail=_53D94ECE-D613-426B-A535-CC8071F61DE4--


--===============0511380451317361393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0511380451317361393==--

