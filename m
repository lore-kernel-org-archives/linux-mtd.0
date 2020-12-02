Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B86C6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:26:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC8220758
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC8220758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dCFUSB5thckb8mMIN1+K2L2VjO5gN86DtGUcfvJ3MYc=; b=KSCBa/l3MM1OHIg/DF4GXvph4
	f1ly0n5IE5C/Kjvjl/iKcsDainvZtZhH5l18bLaGG12vO9OFlqOgGQ75seT/l5Jpr5Hem2wKNfZT8
	Ztuq598hy8LKUOZ2bl4G5RZuS0MxyCi+YmHeyebkZow6TPPM9vUyon4cy1+0fDphpzW5eM+3C80C6
	AFpJUsV2eSzzIw7j4iYbKENkehP3HFqMm7bOKY9vOY/DVs7SbhGQvN/uJruxl6FR2Nn5dgVFR2Aq2
	WWm7rf1mSt9YJcaMKTsElEVl34DtheZm6D2oaVtYQu8mqrLE91ylnYx50bA3kdL3AsDIlK6QzGkiF
	pue0IlEbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkaZA-0005Rq-AB; Wed, 02 Dec 2020 22:25:40 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkaZ5-0005RM-G2
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:25:38 +0000
Received: by mail-pj1-x1042.google.com with SMTP id f14so1404246pju.4
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=5utOZVf3veGfMRoQbf2Yx/BFy8qrmXGBXUjzJ8dKZ44=;
 b=0GCKxWP2V5HaarOWgPvAdnTXx2FRqhPN6H35kJgFG3cmfCi3Mddc/k9uZy+S4h4RDb
 GWBTdRXy44u1W/nWYPm+u+lkq4wJf2L4nVB5o2OjsEbewfP8nzxKvEhWSMVrSC0kOvgb
 0HxT5OC7CC6zKJfKgWvYI06cW2z5Phvfgnj5CcLaKtsgSIa1sQGX6oJp4DGArUZMhAdu
 vLg3EdS/BuQWOoz3IKjtHpV7T2vxkNo9dDNFEmcIc0gvSZDIqsDmYo+F6yJL1uo54bch
 xJ5Q+grshGBi7lOzhF4S2LMjssIrN+Y9pZ7B1MvPnIRMtvy489e4qHIuK8pAywGAbEvV
 YIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=5utOZVf3veGfMRoQbf2Yx/BFy8qrmXGBXUjzJ8dKZ44=;
 b=Ia4+lTfcg7Mqimj7+0SMQ76n5gwMD94A+Tnz7vAVtJ6dEjfKyvkzUaR94zqvJ6miyU
 kYn0ZCRwX02W0iYM2fEOMn8X+SJp89mcKKaUK3eTuHheCgqSLJGgTJ8EtcKvwNj06hdc
 bdU2o14tuh5M1ZXLHYK6WMAKYKpBFmb8OJXA47yEXAMw2mwl8j2sPRwjvZGUb0QatpMd
 0u6KDzCo64bCycdTUQS63vzvmge/nErYObyDqDF1xa5eYpvCpGYJUw5+bn40NOBYoCji
 siP0Gm1ySG7mi/loV4QS+frnZUR4ZuSpqE1zeqW9s+2bkxqi5YHXzJg5dtbHfMetCHM4
 lNwQ==
X-Gm-Message-State: AOAM531lci2KW7WODbiNfPkyYVSCmwLPLwl+RIhDol1wQJRUTcoMk7Xu
 KKIQX7M7N4M9axDNj0KKXyYxKg==
X-Google-Smtp-Source: ABdhPJw2pnDywanmCG7P6trWRpLjwJHWFEhzfNkYWRCskdYELm+ojAXsHpq14/R1YtqT0yrv9Dcmgw==
X-Received: by 2002:a17:902:8691:b029:d7:e0f9:b1b with SMTP id
 g17-20020a1709028691b02900d7e0f90b1bmr271552plo.37.1606947929537; 
 Wed, 02 Dec 2020 14:25:29 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id h4sm70851pgp.8.2020.12.02.14.25.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:25:28 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <047AD2C4-4E34-4325-B2B6-02E240ED50DD@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 0/9] Allow deleting files with unsupported encryption
 policy
Date: Wed, 2 Dec 2020 15:25:25 -0700
In-Reply-To: <X8gCKTx96rXUMh0i@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <X8gCKTx96rXUMh0i@gmail.com>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_172535_659991_C4911BB2 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Type: multipart/mixed; boundary="===============7742997576479367454=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7742997576479367454==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_68D5BA99-AE77-4AE7-932A-159B4173426B";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_68D5BA99-AE77-4AE7-932A-159B4173426B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Dec 2, 2020, at 2:07 PM, Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> On Tue, Nov 24, 2020 at 04:23:27PM -0800, Eric Biggers wrote:
>> Currently it's impossible to delete files that use an unsupported
>> encryption policy, as the kernel will just return an error when
>> performing any operation on the top-level encrypted directory, even =
just
>> a path lookup into the directory or opening the directory for =
readdir.
>>=20
>> It's desirable to return errors for most operations on files that use =
an
>> unsupported encryption policy, but the current behavior is too =
strict.
>> We need to allow enough to delete files, so that people can't be =
stuck
>> with undeletable files when downgrading kernel versions.  That =
includes
>> allowing directories to be listed and allowing dentries to be looked =
up.
>>=20
>> This series fixes this (on ext4, f2fs, and ubifs) by treating an
>> unsupported encryption policy in the same way as "key unavailable" in
>> the cases that are required for a recursive delete to work.
>>=20
>> The actual fix is in patch 9, so see that for more details.
>>=20
>> Patches 1-8 are cleanups that prepare for the actual fix by removing
>> direct use of fscrypt_get_encryption_info() by filesystems.
>>=20
>> This patchset applies to branch "master" (commit 4a4b8721f1a5) of
>> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.
>>=20
>> Eric Biggers (9):
>>  ext4: remove ext4_dir_open()
>>  f2fs: remove f2fs_dir_open()
>>  ubifs: remove ubifs_dir_open()
>>  ext4: don't call fscrypt_get_encryption_info() from dx_show_leaf()
>>  fscrypt: introduce fscrypt_prepare_readdir()
>>  fscrypt: move body of fscrypt_prepare_setattr() out-of-line
>>  fscrypt: move fscrypt_require_key() to fscrypt_private.h
>>  fscrypt: unexport fscrypt_get_encryption_info()
>>  fscrypt: allow deleting files with unsupported encryption policy
>>=20
>> fs/crypto/fname.c           |  8 +++-
>> fs/crypto/fscrypt_private.h | 28 ++++++++++++++
>> fs/crypto/hooks.c           | 16 +++++++-
>> fs/crypto/keysetup.c        | 20 ++++++++--
>> fs/crypto/policy.c          | 22 +++++++----
>> fs/ext4/dir.c               | 16 ++------
>> fs/ext4/namei.c             | 10 +----
>> fs/f2fs/dir.c               | 10 +----
>> fs/ubifs/dir.c              | 11 +-----
>> include/linux/fscrypt.h     | 75 =
+++++++++++++++++++------------------
>> 10 files changed, 126 insertions(+), 90 deletions(-)
>>=20
>>=20
>> base-commit: 4a4b8721f1a5e4b01e45b3153c68d5a1014b25de
>=20
> Any more comments on this patch series?

I think the general idea makes sense.  I'll review the ext4 patches in =
the series.


Cheers, Andreas






--Apple-Mail=_68D5BA99-AE77-4AE7-932A-159B4173426B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IFFUACgkQcqXauRfM
H+CrkBAAmi+u5EOfLwZ4a5VQwxEzgad3GDbuBgmWS1SBHEetbx+9IRVZ6usAo4Ce
8AN1KeZFZcVbPD2Qjo3mAULr8MzuJEOP6qKsMUKT/0zN1LAmd4J8oMnfk0aJBKl0
SXKoKNuHi7CXHIiimj1zqZa8ToaEm30zlmSwRYRy/AbBnT2PIluKaDehsiSJoq1a
r5KXAI3WlsnOVzmp32PVeHnvAVLsb9hCSwZYZDNmawT0GR+0dupyMinz5fx0XP/N
QPY32OjFavTd2ON1Q0+f07nbKnbXn1gIWOVI8/z80EoXYuyIgJvAqUjou3O7LFBS
6FpDmoMNx+cJBBfGlJkC/PeuqapF9SICwuP+d0Sc0bkn+R2rxsFSSjJUbVrxf/k7
qW0Urs/amJS6fjuZIZntzfaHAD+x782+dqAyBH4d5Z4pGiFaSBo8cdHbLcX627Uf
8THXBZzkpCOUGypQUPT2+zjA6VMxLJV5HwddG86p0GwLEi3o/YCm3R8xrbLelq4G
SMJLpcicYnD7UbcukGJHVZvchSClprDbIlBjgP9ArcLzQ4FYJ7OS6TU5EL8NkoE3
7FVtrDvS9ypXmqWx6n+X7sVfGCV0NRjBacINaYmwlv9ZCs5DUXS8w4HSXse/kc4m
JINcTZoFZHSG2H0vfRnxnC6oUXE54gAalfjOOZobMLEOHR8Fw3I=
=ZB7J
-----END PGP SIGNATURE-----

--Apple-Mail=_68D5BA99-AE77-4AE7-932A-159B4173426B--


--===============7742997576479367454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7742997576479367454==--

