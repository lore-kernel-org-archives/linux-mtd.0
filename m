Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AA9C433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF2A20773
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z1OnrMp/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF2A20773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=W9XNriLfvdaizIrvy4G7BUK05fT4BDbnJAomMFP+kRw=; b=z1O
	nrMp/lYoVzTkCK5Q6j522/9tXXX6V6oTvM+8rN8QCyKPR5lj0dCnki1YBotQaRbUqV+0+QwcBNckR
	daTV6E+W47bknoAm0WbnXZhzojJvuASR+ZzZAdrvh0cDUSrdfAIj2lnMKn4NIZe/161oYy/Tt9KL+
	M+c70NGN+nhNr1z4wsvLBCEhTqWdew53rZwyMmDsqF1qV8MboNKs9zKFFe8gLloSnv3EullTcCrcx
	/BXn1We10DFpBasjFO/9I21xMa2Fzu/9UFxLo+AlKnAJe0h+dGDo+/1nhhdo+k3QZd0Qu09NfinUg
	5Izgw3I7xgcTx/XqzOdUGz2lDhtDbUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juuso-0000NA-9n; Mon, 13 Jul 2020 09:36:22 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juusk-0000H8-FO
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2020 09:36:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 3597E18191044;
 Mon, 13 Jul 2020 11:36:15 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id owvtSX9kKnEC; Mon, 13 Jul 2020 11:36:13 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9oh_0sYrXDog; Mon, 13 Jul 2020 11:36:12 +0200 (CEST)
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?UTF-8?Q?Llu=c3=ads_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.2 is released
Autocrypt: addr=david.oberhollenzer@sigma-star.at; prefer-encrypt=mutual;
 keydata=
 mQENBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d/nSCZ+FG
 FX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N8aL7YNF7VfjTRntB
 tKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6/N7b/cFH9+fx8kwi4pNFuJwr
 BkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258jnN65jBO7ElqU2CCuGRPg6uryAHV3RVCB
 9j9AE3HLacQReFtt5ylyydSQbaK4K9asnd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEB
 AAG0N0RhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rh
 ci5hdD6JATcEEwEIACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXc
 PHQaAtFuEAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
 5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQbxkP1YWzo
 Vwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU/o3dT23NDeQ20jXg
 quJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+hPK/Dmdsqgns+Z+SrQcOvRa3
 GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8XqwOnfVmZdCW3qGKmLbn6qMEdLkBDQRW
 cn9GAQgAvugF8cFjv2Zs4BBb44SnxGawBySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr
 +TRnXIzcb5xI8SxitBDU5MLvwsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGP
 ak8JmjMMtOoOBh4meOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUa
 h7wajcojYSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
 FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawARAQABiQEf
 BBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt3ao3Abpu2fqYfwbI
 yPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEjviKMpfI7ppTUBuGKrpgc5xsi
 UpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8rBKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fm
 qoVHaw8PhLAtez+B7HS7Hv7iJPDtX85kFYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR
 7In6ift5SNySojCOfAV0iKZb8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDT
 qyUpot0oG03vtSG4LIRCdxI=
Organization: sigma star gmbh
Message-ID: <d0dd301f-d03d-a406-eea1-e39be99369d0@sigma-star.at>
Date: Mon, 13 Jul 2020 11:36:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_053618_773588_E1C5C7FB 
X-CRM114-Status: GOOD (  12.45  )
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
Content-Type: multipart/mixed; boundary="===============8603860545997889566=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8603860545997889566==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bnaj9Y9LEzwZegESkTElXtH8EKD8bZVqb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bnaj9Y9LEzwZegESkTElXtH8EKD8bZVqb
Content-Type: multipart/mixed; boundary="Ly2re8K2seWlws9YfUfZ7tLTPL6zPP0pJ"

--Ly2re8K2seWlws9YfUfZ7tLTPL6zPP0pJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

mtd-utils-2.1.2 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.2.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.2.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.2


Alternatively also mirrored here:

Tarball:               https://infraroot.at/pub/mtd/mtd-utils-2.1.2.tar.b=
z2
Tarball gpg signature: https://infraroot.at/pub/mtd/mtd-utils-2.1.2.tar.b=
z2.asc
Signed git tag:        https://git.infraroot.at/mtd-utils.git v2.1.2


After a while of inactivity, I decided to release the current backlog of
fixes as mtd-utils version 2.1.2.

As already said, the changes since 2.1.1 are primarily bug fixes, address=
ing
compiler warnings and issues reported by diagnostic tools, but also build=

failures for some configurations.

Besides the bug fixes, this version also finally pulls in the ubihealthd =
and
mkfs.ubifs authentication patches.


Changes from 2.1.1 to 2.1.2:

Features:
      flashcp: Add option -A/--erase-all
      mtd-utils: add optional offset parameter to flash_otp_dump
      ubi-utils: Implement a ubihealthd
      mkfs.ubifs: Add authentication support

Fixes:
      ubifs-media: Update to Linux-5.3-rc3
      mtd-utils: Fix return value of ubiformat
      ubiupdatevol: Prevent null pointer dereference
      libubigen: remove unnecessary include
      libubi: remove private kernel header from includes
      mkfs.ubifs: fscrypt: bail from encrypt_block if gen_essiv_salt fail=
s
      mkfs.ubifs: abort add_directory if readdir fails
      mkfs.ubifs: close file descriptor in add_file error path
      mkfs.ubifs: don't leak copied command line arguments
      mkfs.ubifs: free derived fscrypt context in add_directory error pat=
hs
      mkfs.ubifs: don't leak hastable iterators
      mkfs.ubifs: don't leak temporary buffers
      mkfs.ubifs: propperly cleanup in ALL interpret_table_entry error pa=
ths
      mkfs.jffs2: don't leak temporary buffer if readlink fails
      libmtd: don't leak temporary buffers
      ftl_check: don't leak temporary buffers
      ftl_format: don't leak temporary buffers
      ubiformat: don't leak file descriptors
      nanddump: don't leak copied command line arguments
      mtd_debug: cleanup error handling in flash_to_file
      jittertest: fix error check for open system call
      fs-tests: don't leak temporary buffers
      mtd-utils: Fix printf format specifiers with the wrong type
      mtd-utils: Fix potential negative arguments passed to close(2)
      mtd-utils: Fix various TOCTOU issues
      mtd-utils: Fix some simple cases of uninitialized value reads
      mtd-utils: Fix wrong argument to sizeof in nanddump
      mtd-utils: Fix "are we really at EOF" test logic in libubi read_dat=
a
      mtd-utils: Fix potentially unterminated strings
      mtd-utils: Add checks to code that copies strings into fixed sized =
buffers
      mkfs.ubifs: fix broken build if fscrtyp is disabled



Raw short log since the 2.1.1 release:

Alexander Dahl (2):
      ubihealthd: Add missing sentinel in options array
      ubihealthd: Add option -h/--help

Andrij Abyzov (1):
      flashcp: Add option -A/--erase-all

Barry Grussling (1):
      mtd-utils: Fix return value of ubiformat

Bastian Germann (3):
      ubiupdatevol: Prevent null pointer dereference
      libubigen: remove unnecessary include
      libubi: remove private kernel header from includes

David Oberhollenzer (28):
      Add the mkfs.ubifs sign.h header to the list of sources
      Add ubihealthd to gitignore file
      mkfs.ubifs: fscrypt: bail from encrypt_block if gen_essiv_salt fail=
s
      mkfs.ubifs: abort add_directory if readdir fails
      mkfs.ubifs: close file descriptor in add_file error path
      mkfs.ubifs: don't leak copied command line arguments
      mkfs.ubifs: free derived fscrypt context in add_directory error pat=
hs
      mkfs.ubifs: don't leak hastable iterators
      mkfs.ubifs: don't leak temporary buffers
      mkfs.ubifs: propperly cleanup in ALL interpret_table_entry error pa=
ths
      mkfs.jffs2: don't leak temporary buffer if readlink fails
      libmtd: don't leak temporary buffers
      ftl_check: don't leak temporary buffers
      ftl_format: don't leak temporary buffers
      ubiformat: don't leak file descriptors
      nanddump: don't leak copied command line arguments
      mtd_debug: cleanup error handling in flash_to_file
      jittertest: fix error check for open system call
      fs-tests: don't leak temporary buffers
      mtd-utils: Fix printf format specifiers with the wrong type
      mtd-utils: Fix potential negative arguments passed to close(2)
      mtd-utils: Fix various TOCTOU issues
      mtd-utils: Fix some simple cases of uninitialized value reads
      mtd-utils: Fix wrong argument to sizeof in nanddump
      mtd-utils: Fix "are we really at EOF" test logic in libubi read_dat=
a
      mtd-utils: Fix potentially unterminated strings
      mtd-utils: Add checks to code that copies strings into fixed sized =
buffers
      mkfs.ubifs: fix broken build if fscrtyp is disabled

Marek Vasut (1):
      ubihealthd: Build only if sys/random.h is present

Michael Walle (1):
      mtd-utils: add optional offset parameter to flash_otp_dump

Richard Weinberger (1):
      ubi-utils: Implement a ubihealthd

Sascha Hauer (2):
      ubifs-media: Update to Linux-5.3-rc3
      mkfs.ubifs: Add authentication support


Regards,

David


--Ly2re8K2seWlws9YfUfZ7tLTPL6zPP0pJ--

--bnaj9Y9LEzwZegESkTElXtH8EKD8bZVqb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAl8MKwsACgkQvOXcPHQa
AtGOPAf/RHYKmk2yTL7HXzrwmQj8hsZJV6s28DROScOsmaW9PgTPOgUBqLNKDk4T
FNDj8VqLzhhkMdKT4AhFb0ZpvSCmV9OgXtSPoUUXsOaIroeWhajGKLp9SgNyNLHT
afBug4UzSbAKDONOirpXM6bXB4CF4HbNKMe0/MYMl+j/YXiD97Gh4KjgMIgNssLH
fsilQYkw6KB9G4xB3VTadHlUshVpn3jzqNL3BfjI/Qt0b5un+4z0O8XhMd72YRMP
r/Abh7yAPSbTiPPWi2JOHPfrx8yYxqbvCsA8ODjoqGOfkRybdwpM2Op69xeFmX/N
pAsCtRo8QxbVElfeSjqv5waOw11fqQ==
=WYxK
-----END PGP SIGNATURE-----

--bnaj9Y9LEzwZegESkTElXtH8EKD8bZVqb--


--===============8603860545997889566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8603860545997889566==--

