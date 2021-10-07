Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA5FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 13:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438FE611EE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 13:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 438FE611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lug-owl.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vs4Rg3krRgY6RdRSQR2KxtHN9edyme35i3hx3hfNh3g=; b=S5SPQB3LRaK7c4GkBlVMCb27wO
	BGQuja9T2zcAPFWOIo1bkVckLma00fbcNxmaVp2A1ykwObY+FtLxdL32A/0AYgERzkFUOD96OG6QS
	i6PqJIWOKIA7k7gveujQcG+9aNAMNCkSZIBJAQwvMxybCXtE2DHZAf2zfr6BIgDBIcRqY1KlmlDOF
	GUR8cg7PgnpqNM9AWfuveCUnwj1h8P6QvDvZHlvXz8cnCMDH+ZqRynACmR1QjKgBLKPDkn7OH9VBG
	bgbh8Yazu/Mwiy5+8kgMU4VtGe0yYatyavNTz8F6EBhon9bDS0Erb3LVPEQjNKDoWXOT7FL/gAM7b
	hfE9K39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYTqa-00HXBT-DS; Thu, 07 Oct 2021 13:54:08 +0000
Received: from lug-owl.de ([2a03:4000:10:469::])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYTqW-00HXAO-Tx
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 13:54:06 +0000
Received: by lug-owl.de (Postfix, from userid 1001)
 id 861BC41EF5; Thu,  7 Oct 2021 15:54:01 +0200 (CEST)
Date: Thu, 7 Oct 2021 15:54:01 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: PING: [PATCH] Don't overflow when writing a key
Message-ID: <20211007135401.4z3gcunwr2uq7fpx@lug-owl.de>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
 <20211005144936.xnkzugjr3oygauei@lug-owl.de>
 <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
 <1970203009.45154.1633591205445.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
In-Reply-To: <1970203009.45154.1633591205445.JavaMail.zimbra@nod.at>
X-Operating-System: Linux chamaeleon 5.8.0-0.bpo.2-amd64
X-gpg-fingerprint: 250D 3BCF 7127 0D8C A444  A961 1DBD 5E75 8399 E1BB
X-gpg-key: wwwkeys.de.pgp.net
X-Echelon-Enable: howto poison arsenous mail psychological biological nuclear
 warfare test the bombastical terror of flooding the spy
 listeners explosion sex drugs and rock'n'roll
X-TKUeV: howto poison arsenous mail psychological biological nuclear warfare
 test the bombastical terror of flooding the spy listeners explosion sex
 drugs and rock'n'roll
X-message-flag: Please send plain text messages only. Do not send HTML
 emails. Thank you.
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_065405_175686_B480DB2E 
X-CRM114-Status: GOOD (  22.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1880775068858591571=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1880775068858591571==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fjdjd34xadm3d27j"
Content-Disposition: inline


--fjdjd34xadm3d27j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Thu, 2021-10-07 09:20:05 +0200, Richard Weinberger <richard@nod.at> wrot=
e:
> > > On Fri, 2021-10-01 21:28:36 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.=
de> wrote:
> > > > diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
> > > > index 8142d9d6fe5d..40edcca7ba62 100644
> > > > --- a/fs/ubifs/key.h
> > > > +++ b/fs/ubifs/key.h
> > > > @@ -436,7 +436,7 @@ static inline void key_write(const struct ubifs=
_info *c,
> > > > =20
> > > >  	t->j32[0] =3D cpu_to_le32(from->u32[0]);
> > > >  	t->j32[1] =3D cpu_to_le32(from->u32[1]);
> > > > -	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
> > > > +	memset(to + 8, 0, UBIFS_SK_LEN - 8);
> > > >  }
> > > > =20
> > > >  /**

> key_write() takes a ubifs_key as source and writes to a buffer.
> It assumes that the passed ubifs_key is in simple key format (being UBIFS=
_SK_LEN long)
> and it assumes the buffer is UBIFS_MAX_KEY_LEN long.
> So, the destination is *not* a union ubifs_key structure.

Ah. This is something I probably misunderstood. As the destination is
casted to an ubifs_key as well, my expectation was that this function
should not write outside the bounds of such an ubifs_key struct.

> We have three callers of key_write(), all in journal.c
>=20
> 1. ubifs_jnl_write_data
> key_write(c, key, &data->key);
>=20
> data is struct ubifs_data_node where key is of size UBIFS_MAX_KEY_LEN.
>=20
> 2. ubifs_jnl_update
>=20
> Same with struct ubifs_dent_node
>=20
> 3. ubifs_jnl_delete_xattr
>=20
> Same again.
>=20
> All three objects are slab allocated, did you check, is too few memory al=
located?
> In other words, how did you calculate the size of target buffer?

You're right, the code is correct somehow, but was misleading me.

  The supplied buffer (ubifs_data_node.key) is actually
UBIFS_MAX_KEY_LEN bytes long, but used as ubifs_key (which is smaller)
and then the remaining space is zeroed out, thus there's an assumption
about the buffer size.

  I actually found this due to a warning for key.h:439:

[mk all 2021-09-19 16:20:34]   arm-linux-gnueabihf-gcc -Wp,-MMD,fs/ubifs/.j=
ournal.o.d -nostdinc -isystem /var/lib/laminar/run/linux-arm-aspeed_g4_defc=
onfig/8/toolchain/bin/../lib/gcc/arm-linux-gnueabihf/12.0.0/include -I./arc=
h/arm/include -I./arch/arm/include/generated  -I./include -I./arch/arm/incl=
ude/uapi -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/g=
enerated/uapi -include ./include/linux/compiler-version.h -include ./includ=
e/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -m=
little-endian -fmacro-prefix-map=3D./=3D -Wall -Wundef -Werror=3Dstrict-pro=
totypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-=
PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Wno-format-security -std=3Dgnu89 -fno-dwarf2-cfi-asm -fno-o=
mit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=3Daapcs-linux=
 -mfpu=3Dvfp -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D5 -march=
=3Darmv5te -mtune=3Darm9tdmi -msoft-float -Uarm -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=
=3D1024 -fstack-protector-strong -Wimplicit-fallthrough=3D5 -Wno-main -Wno-=
unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer =
-fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dzero -enable-trivial-=
auto-var-init-zero-knowing-it-will-be-removed-from-clang -fno-stack-clash-p=
rotection -g -gdwarf-4 -fno-var-tracking -femit-struct-debug-baseonly -pg -=
Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncati=
on -Wno-zero-length-bounds -Wno-array-bounds -Wno-stringop-overflow -Wno-re=
strict -Wno-maybe-uninitialized -fno-strict-overflow -fno-stack-check -fcon=
serve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -Wno-packed-not-aligned    -DKBUILD_MODFILE=3D'"fs/ubif=
s/ubifs"' -DKBUILD_BASENAME=3D'"journal"' -DKBUILD_MODNAME=3D'"ubifs"' -D__=
KBUILD_MODNAME=3Dkmod_ubifs -c -o fs/ubifs/journal.o fs/ubifs/journal.c
[mk all 2021-09-19 16:20:35] In file included from ./include/linux/string.h=
:262,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/bitmap.h=
:10,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/cpumask.=
h:12,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/smp.h:13,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/lockdep.=
h:14,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/spinlock=
=2Eh:63,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/wait.h:9,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/wait_bit=
=2Eh:8,
[mk all 2021-09-19 16:20:35]                  from ./include/linux/fs.h:6,
[mk all 2021-09-19 16:20:35]                  from fs/ubifs/ubifs.h:16,
[mk all 2021-09-19 16:20:35]                  from fs/ubifs/journal.c:49:
[mk all 2021-09-19 16:20:35] In function 'memset',
[mk all 2021-09-19 16:20:35]     inlined from 'key_write.part.0' at fs/ubif=
s/key.h:439:2:
[mk all 2021-09-19 16:20:35] ./include/linux/fortify-string.h:172:17: error=
: call to '__write_overflow' declared with attribute error: detected write =
beyond size of object passed as 1st parameter
[mk all 2021-09-19 16:20:35]   172 |                 __write_overflow();
[mk all 2021-09-19 16:20:35]       |                 ^~~~~~~~~~~~~~~~~~
[mk all 2021-09-19 16:20:35] make[2]: *** [scripts/Makefile.build:277: fs/u=
bifs/journal.o] Error 1
[mk all 2021-09-19 16:20:35] make[1]: *** [scripts/Makefile.build:540: fs/u=
bifs] Error 2

Maybe supply key_write() the complete target buffer length and
memset() it first, then place the properly formatted key into it?

MfG, JBG

--=20

--fjdjd34xadm3d27j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCYV779gAKCRAdvV51g5nh
u3imAJ9488mp0E5+VoRUMuWvK5GDOTq/eQCeK/yL94JjEHZ8swOf5xsOiT/E7IU=
=bBCY
-----END PGP SIGNATURE-----

--fjdjd34xadm3d27j--


--===============1880775068858591571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1880775068858591571==--

