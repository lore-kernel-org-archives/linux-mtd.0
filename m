Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43794C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 17:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1103020811
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 17:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YNAE1cN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1103020811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cok7Mys72shqjOM5+UD5uolq5QJBBQZzR3nuYOczQPQ=; b=YNAE1cN8P/VhC0
	OjmJNEnd3i8LZeVkejkYpA/XlsDg3SDLN6ioazbToe9MF/Uqjttke8UbEl9+k2lKNk4zdqNHtmRM+
	hQwwKbJrkiuWaV2hAv18Ha3olzEqCaG2lV53cvtydMjiKUmanayyQOwQN4tqJnM69LV2wgJo48mWc
	svX/Qy7n8T8QxXcuyxFJi/263dMe2PEIFZ39LDDcY83OTXCzMnj8XKI0byXS88Tprj+b/Paf1Fs/c
	d7qY56ZkevqNPLSqVI4fuhjyrgQIJZ7PalcJ0hc7wQqvjdkVKvH8eDYuja8JM9mYjpfhlgYn3QYPZ
	CdZoPZ1dhtTD9HSKz1BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6ITG-00066I-Ft; Tue, 19 Mar 2019 17:24:14 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6ITC-00065k-Tg
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 17:24:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id AE42E18013DB1;
 Tue, 19 Mar 2019 18:24:06 +0100 (CET)
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Timothy Redaelli (Arch)" <timothy.redaelli@gmail.com>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.0 is released
Openpgp: preference=signencrypt
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
Message-ID: <678ab76b-7707-93fb-1be4-8bb4cafdfcef@sigma-star.at>
Date: Tue, 19 Mar 2019 18:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_102411_255110_BADEABBC 
X-CRM114-Status: GOOD (  16.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

mtd-utils-2.1.0 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.0.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.0.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.0


After quite some time that has passed since the last mtd-utils release, the
new 2.1.0 release brings (as usual) a lot of fixes but also some new features.

More precisely, it includes the long anticipated mkfs.ubifs support for file
level encryption, better mkfs.ubifs tooling for SELinux and an lsblk like
utility for inspecting the MTD/UBI stack on a system. Hence the minor version
bump.

While the mkfs.ubifs encryption support has seen some use already and should
work (TM) for most use cases, I expect that fixes for various untested edge
cases will eventually be merged over the coming months up to the next patch
level release.


Changes from 2.0.2 to 2.1.0:

Features:
 - mkfs.ubifs: Implement support for file system encryption
 - mkfs.ubifs: Implement selinux labelling support
 - ubinize: add support for skipping CRC check of a static volume when opening
 - ubimkvol: add support for skipping CRC check of a static volume when opening
 - Add lsmtd program

Fixes:
 - update various kernel headers
 - Instead of doing preprocessor magic, just output off_t as long long
 - fix verification percent display in flashcp
 - mkfs.ubifs: fix double free
 - mkfs.ubifs: Fix xattr nlink value
 - ubinize: avoid to create two UBI_LAYOUT_VOLUME_ID volume
 - common.h: fix prompt function
 - libmtd: don't print an error message for devices without ecc support
 - io_paral: Fix error handling of update_volume()
 - ubimkvol: Initialize req to zero to make sure no flags are set by default
 - libubi: add volume flags to ubi_mkvol_request
 - mkfs.ubifs: add_xattr is not depending on host XATTR support
 - Revert "Return correct error number in ubi_get_vol_info1" which
   introduced a regression.
 - make sure pkg-config is installed in configure script
 - ubiformat: process command line arguments before handling file arguments

Cleanup:
 - ubiformat: remove no-volume-table option


Raw short log since the 2.0.2 release:


Andrij Abyzov (1):
      mtd-utils: fixes verification percent display in flashcp

Boris Brezillon (1):
      ubi-utils: ubimkvol: Initialize req to zero to make sure no flags are set by default

David Gstir (1):
      mkfs.ubifs: fix default cipher in help output

David Oberhollenzer (24):
      ubiformat: process command line arguments first
      ubiformat: remove no-volume-table option
      mtd-utils: make sure pkg-config is installed in configure script
      Revert "Return correct error number in ubi_get_vol_info1"
      Add lsmtd program
      Add manpage for lsmtd
      Add configure switch to disable compiling/installing lsmtd
      libmtd: don't print an error message for devices without ecc support
      mtd-utils: common.h: fix prompt function
      mkfs.ubifs: Add crypto helper functions
      mkfs.ubifs: Implement UBIFS_FLG_DOUBLE_HASH
      mkfs.ubifs: Move symlink data encryption to helper function
      mkfs.ubifs: Seperate path encryption from symlink encryption helper
      mkfs.ubifs: Cleanup add_dent_node, user path encryption helper
      mkfs.ubifs: Replace constant values with parameters in init_fscrypt_context
      mkfs.ubifs: Make encryption dependend on (not-yet-existant) command line options
      mkfs.ubifs: Get key descriptor from command line and master key from file
      mkfs.ubifs: Specify padding policy via command line
      mkfs.ubifs: Initial support for encryption command lines
      mkfs.ubifs: Remove cipher implementations from public header
      mkfs.ubifs: Move fscrypt definitions and functions out of mkfs.ubifs.c
      mkfs.ubifs: Cleanup over-long lines
      mkfs.ubifs: Check length of master key
      mkfs.ubifs: Accept 0x prefix for key descriptor

Martin Lund (1):
      ubi-tests: io_paral: Fix error handling of update_volume()

Quentin Schulz (4):
      UBI: update ubi-user.h and ubi-media.h
      libubi: add volume flags to ubi_mkvol_request
      ubi-utils: ubimkvol: add support for skipping CRC check of a static volume when opening
      ubi-utils: ubinize: add support for skipping CRC check of a static volume when opening

Richard Weinberger (30):
      Import latest ubifs-media.h
      common: Add round functions
      mkfs.ubifs: Make r5 hash binary string aware
      mkfs.ubifs: Add fscrypto defines
      mkfs.ubifs: Add basic fscrypto functions
      mkfs.ubifs: Implement UBIFS_FLG_ENCRYPTION
      mkfs.ubifs: Implement basic fscrypto context passing
      mkfs.ubifs: Implement fscrypto context store as xattr
      mkfs.ubifs: Store directory name len in the temporary index
      mkfs.ubifs: Implement filename encryption
      mkfs.ubifs: Add dummy setup for crypto
      mkfs.ubifs: Pass source/dest key len to key derive function
      mkfs.ubifs: Add encrypted symlink support
      mkfs.ubifs: Implement file contents encryption
      mkfs.ubifs: Make sure we catch nodes that should or should not have name
      mkfs.ubifs: Free all index entry names
      mkfs.ubifs: Correctly use iv lengths in aes-cts mode
      mkfs.ubifs: Enable Cipher selection
      mkfs.ubifs: Use correct sizes for keys and hash lengths
      mkfs.ubifs: Fixup AES-XTS mode
      mkfs.ubifs: Compute encryption key descriptor automatically
      mkfs.ubifs: Fix key descriptor printing
      mkfs.ubifs: More fscryptctl compatibility
      mkfs.ubifs: Move RAND_poll to crypto.c
      mkfs.ubifs: Enable support for building without crypto
      mkfs.ubifs: Print key descriptor only when generated
      mkfs.ubifs: Use AES-256-XTS as default
      mkfs.ubifs: Fix IV selection
      mkfs.ubifs: Store compr_size in correct endianness.
      mkfs.ubifs: Don't compress by default if filesystem is encrypted

Ritesh Harjani (2):
      mkfs.ubifs: add_xattr is not depending on host XATTR support
      mkfs.ubifs: Implement selinux labelling support in mkfs.ubifs.

Sascha Hauer (1):
      mkfs.ubifs: Fix xattr nlink value

Thorsten Glaser (1):
      mtd-utils: Instead of doing preprocessor magic, just output off_t as long long

Yufen Yu (2):
      mtd-utils: avoid to create two UBI_LAYOUT_VOLUME_ID volume
      mtd-utils: fixes double free in mkfs.ubifs


Regards,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
