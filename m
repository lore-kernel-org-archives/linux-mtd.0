Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E349C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 19:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18F061A58
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 19:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A18F061A58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lug-owl.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CxHptlNpD916Qt7pXicvnhtBbEYIx/A8vUxIT1h4zEA=; b=qOo
	bO0POrhZ64qG9zWISSdSZFqcl5ibObOZ0lbSk/vthlrFHIq3h0RZz6PHPPtl3W86MkAAXm0ERbcnJ
	4l7FCbX8jfKLLO1EKG8sp5pMCKmJU1hSfhdR+UawjTDZMZoxhQVmujjiLj45/vUcBiB8Jqsg3VWQc
	7OZRPCTGjHsfqPMpRvh9AzjD8pSVAdeDMbSGDx3g7wuj73oMHg0aQ1rOoDaHDe1A0rR+D6IuqY55c
	P5WFr/hReeASfgIxWcRQjRoZl7nxVN9VDOUqqIsnycT+psJ8VAzYjN+YKo+m0L9ATYCxtS+y5O5mQ
	I5HqbN4ma6Kyr9MQSvvL7pH75/bCh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWOLi-001BxS-Pk; Fri, 01 Oct 2021 19:37:38 +0000
Received: from lug-owl.de ([188.68.32.151])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWOLf-001Bvv-6C
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 19:37:37 +0000
Received: by lug-owl.de (Postfix, from userid 1001)
 id C717B41F14; Fri,  1 Oct 2021 21:28:36 +0200 (CEST)
Date: Fri, 1 Oct 2021 21:28:36 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] Don't overflow when writing a key
Message-ID: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
MIME-Version: 1.0
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
X-CRM114-CacheID: sfid-20211001_123735_429354_0FAB1FE5 
X-CRM114-Status: GOOD (  12.16  )
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
Content-Type: multipart/mixed; boundary="===============5994287996961746963=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5994287996961746963==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="advgub7t5x43jmkd"
Content-Disposition: inline


--advgub7t5x43jmkd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm mass-building the GNU Toolchain, Linux, NetBSD and others and got
a warning with recent GCC versions when building Linux's
ARM-based aspeed_g4_defconfig:

[mk all 2021-10-01 14:10:14]   arm-linux-gnueabihf-gcc -Wp,-MMD,fs/ubifs/.j=
ournal.o.d -nostdinc -isystem /var/lib/laminar/run/linux-arm-aspeed_g4_defc=
onfig/9/toolchain/bin/../lib/gcc/arm-linux-gnueabihf/12.0.0/include -I./arc=
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
[mk all 2021-10-01 14:10:15] In file included from ./include/linux/string.h=
:262,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/bitmap.h=
:10,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/cpumask.=
h:12,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/smp.h:13,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/lockdep.=
h:14,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/spinlock=
=2Eh:63,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/wait.h:9,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/wait_bit=
=2Eh:8,
[mk all 2021-10-01 14:10:15]                  from ./include/linux/fs.h:6,
[mk all 2021-10-01 14:10:15]                  from fs/ubifs/ubifs.h:16,
[mk all 2021-10-01 14:10:15]                  from fs/ubifs/journal.c:49:
[mk all 2021-10-01 14:10:15] In function 'memset',
[mk all 2021-10-01 14:10:15]     inlined from 'key_write.part.0' at fs/ubif=
s/key.h:439:2:
[mk all 2021-10-01 14:10:15] ./include/linux/fortify-string.h:172:17: error=
: call to '__write_overflow' declared with attribute error: detected write =
beyond size of object passed as 1st parameter
[mk all 2021-10-01 14:10:15]   172 |                 __write_overflow();
[mk all 2021-10-01 14:10:15]       |                 ^~~~~~~~~~~~~~~~~~
[mk all 2021-10-01 14:10:15] make[2]: *** [scripts/Makefile.build:277: fs/u=
bifs/journal.o] Error 1
[mk all 2021-10-01 14:10:15] make[1]: *** [scripts/Makefile.build:540: fs/u=
bifs] Error 2
[mk all 2021-10-01 14:10:15] make: *** [Makefile:1868: fs] Error 2


This seems to be correct as the struct is declared using
UBIFS_SK_LEN (=3D 8), but used to use UBIFS_MAX_KEY_LEN (=3D 16), which
would overflow by 8 bytes.

Here's a suggested patch that is NOT tested as I don't have the UBIFS
in use (knowingly) anywhere:

diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index 8142d9d6fe5d..40edcca7ba62 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -436,7 +436,7 @@ static inline void key_write(const struct ubifs_info *c,
=20
 	t->j32[0] =3D cpu_to_le32(from->u32[0]);
 	t->j32[1] =3D cpu_to_le32(from->u32[1]);
-	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
+	memset(to + 8, 0, UBIFS_SK_LEN - 8);
 }
=20
 /**



Please keep me in Cc: as I'm not subscribed.

Thanks,
  Jan-Benedict

--=20

--advgub7t5x43jmkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCYVdhXwAKCRAdvV51g5nh
u5t4AJ9gC2S2r+h8l96ka1WxICRSW4jSfQCfelm8gn8XC9hEqEl1Zfz8KHpdV0c=
=DnEv
-----END PGP SIGNATURE-----

--advgub7t5x43jmkd--


--===============5994287996961746963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5994287996961746963==--

