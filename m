Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4DF606A31A
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Oct 2026 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FVeVxqOH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCX6IGvW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	From:Cc:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=S+v7WG5c/5QCb4AQc9ODFi99558lCiMV6t5ko2motco=; b=FVe
	VxqOHY5RtDHLwom7vmUrjlRHwcv7o/xeAiqSHtwXaj3jMaAFqlVB2gdJYNcnOa7fjr6ughKO74ERm
	t0dnl3CiNITZkt2vuzK42dxOovQfhfefKJbLbFO2j/z5AgZ2nDUjQW/LiTAGozVZQ5ch5m3nD+Av3
	pPRdLaBDrXPAQLh/OJrra1OxTJgI7Dhm3f+sIPXwamTvHQ/xNbDMR0PfZCBBn0BUVpWKy2zE5ds4v
	IVg6DWKWpbcXmxEW+f4OIP1wknQKpDwGZqEwqyDYdv69CIEVkD1ZL5Z/8wlrnVsjPKXxYnFafOwTk
	K73llKHyyj5s+fSO1/RFvC0eRz97mZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSSY-0000000BTLj-3bHY;
	Wed, 21 Oct 2026 09:18:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSSW-0000000BTLW-2dsM
	for linux-mtd@lists.infradead.org;
	Wed, 21 Oct 2026 09:18:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id C572960098;
	Wed, 21 Oct 2026 09:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ED0E21F000C9;
	Wed, 21 Oct 2026 09:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792574287;
	bh=wu9Djh/yIUjCQbaxXkyn0TtKEBZX+8AVVYQ7Psqli0Y=;
	h=Date:Subject:Cc:From:To;
	b=cCX6IGvWBn9uXRqDLqxetWA+eKvluXbPkVtYe19WL2gGI1Sa/cbG/x8rXBHEDoBhb
	 btbbm2CjUyF6AQ1qzyHTXJywSYs5LZsZtxTDvkzUIGmRNCF6LAHu3ClU1XNfPm8Yca
	 y2xJRMiPSMeADkkRN4zF94/iBiF35BdCbeVljSU4YrAmQUqGPTGbclQZ7P1SAw8Atp
	 X3g2GoA4A3XtI7h9BondKtTLmcebvyW3KvEWFKc475kDOe76NxzcKbkDyyqOYOPk5r
	 XCXLWdMgOwKkBoPGjq9Wk8q/y5uC6wJBuNS0eNCbiJ8KhxsTFyMXn5jWnpXu5WiT0J
	 q3TGbl865ogYQ==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 21 Oct 2026 11:18:03 +0200
Message-Id: <DMAEJT5TG2JT.2GAOS6W1U9V4T@kernel.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 7.4
Cc: "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8427451883654189910=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8427451883654189910==
Content-Type: multipart/signed;
 boundary=a6a2239f91fd5b884eda36ac19a598892041765cd35c393d42838897b249;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--a6a2239f91fd5b884eda36ac19a598892041765cd35c393d42838897b249
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/=
for-7.4

for you to fetch changes up to d7040c620d8b22f839af7750860b96e39cc58b7c:

  mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp() (2026-10-1=
6 08:40:48 +0200)

----------------------------------------------------------------
SPI NOR changes for 7.4

Notable changes:

- Support for new Macronix and (lots of) Winbond flash devices
- The addition of the Winbond flashes was accompanied by a big rewrite of t=
he
  status register handling. There were many small helper functions to enabl=
e
  quad I/O mode in many different ways. That's now consolidated in one gene=
ric
  function.
- The SFPD handling was reworked. It used to be only parsed for flashes pre=
sent
  in the in-kernel database which had any of the multi-I/O bit set - or wit=
h the
  addition of generic flash driver for any unknown flashes. This left a gap
  where SFDP wasn't handled and it turns out newer flashes (with SFDP suppo=
rt)
  will reused IDs of just these old flashed. With the rework, SFDP is tried=
 to
  be parsed for any flashes and will amend the information which is already
  present in the in-kernel database.
- SFDP size limit was increased to 16KiB. There are flashes which have some
  larger gaps between tables and thus exceeds the former 4KiB limit.
- Flash fixups are getting more and more common. Due to this, the fixups ar=
e now
  a separate list (per manufacturer) instead of being attached to a specifi=
c
  flash. A new .match() callback makes them more flexible, when one is appl=
ied.
- 1-1-8 and 1-8-8 modes are now supported with larger flashes which needs 4=
byte
  addresses.

----------------------------------------------------------------
Cheng Ming Lin (3):
      mtd: spi-nor: macronix: Document support for additional flash aliases
      mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
      mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D

HyeongJun An (2):
      mtd: spi-nor: sfdp: check the length of the xSPI Profile 1.0 table
      mtd: spi-nor: sfdp: check the length of the SCCR map

Michael Walle (11):
      mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
      mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
      mtd: spi-nor: move cmd_ext_type into spi_nor_flash_parameter
      mtd: spi-nor: move flags into spi_nor_flash_parameter
      mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
      mtd: spi-nor: spansion: s25fs256t: move ARCFN check into .late_init
      mtd: spi-nor: push the rollback mechanism into the sfdp module
      mtd: spi-nor: rework flash parameter initialization
      mtd: spi-nor: xmc: add locking to XM25QH128A
      mtd: spi-nor: sfdp: fix missing kernel-doc
      mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp()

Miquel Raynal (78):
      mtd: spi-nor: Unprepare legacy controllers upon RWW wait interruption
      mtd: spi-nor: Fix spacing in function call
      mtd: spi-nor: Garbage collection during sfdp parsing
      mtd: spi-nor: Init flags before manufacturer late_init() hooks
      mtd: spi-nor: winbond: Move W25Q01NW to its right place
      mtd: spi-nor: winbond: Normalize names
      mtd: spi-nor: winbond: Properly document the chip names
      mtd: spi-nor: winbond: Make the RDCR fixup Winbond wide
      mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad page program capabilit=
y
      mtd: spi-nor: winbond: W25Q32JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad page program capabili=
ty
      mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q64JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q01JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q32JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q64JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q128JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q02JV-M: Fill locking information
      mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill locking information
      mtd: spi-nor: winbond: W25Q512JV-M: New chip
      mtd: spi-nor: winbond: W25Q01JV-M: New chip
      mtd: spi-nor: Rename BFPT_DWORD15_QER_SR2_BIT1_BUGGY
      mtd: spi-nor: Create a structure containing the flash opcodes
      mtd: spi-nor: Refactor Read Status/Write Status support
      mtd: spi-nor: Add support for the new JESD216 rev F QER field
      mtd: spi-nor: Create the concept of fixup table with match function
      mtd: spi-nor: Move the fixup flags into the fixup list
      mtd: spi-nor: Create an indirection on the part name
      mtd: spi-nor: Move the SFDP header structure to a C header
      mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-Q/N parts
      mtd: spi-nor: winbond: Add support for W25Q32RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q64RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q12RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q25RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q51RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q01RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q02RV-Q/N
      mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-M parts
      mtd: spi-nor: winbond: Add support for W25Q32RV-M
      mtd: spi-nor: winbond: Add support for W25Q64RV-M
      mtd: spi-nor: winbond: Add support for W25Q12RV-M
      mtd: spi-nor: winbond: Add support for W25Q25RV-M
      mtd: spi-nor: winbond: Add support for W25Q51RV-M
      mtd: spi-nor: winbond: Add support for W25Q01RV-M
      mtd: spi-nor: winbond: Add support for W25Q02RV-M
      mtd: spi-nor: debugfs: Expose SR opcodes and QE mask
      mtd: spi-nor: Fix quad-enable for flashes with QER bit in SR1
      mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance identification of the ch=
ips
      mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance identification of the ch=
ips
      mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q128JW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q32JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q64JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q128JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking information
      mtd: spi-nor: winbond: W25Q32JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad page program capabilit=
y
      mtd: spi-nor: winbond: W25Q32JW-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JW-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JW-M: Add quad page program capability
      mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-Q/N parts
      mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q64PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q12PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q25PW-Q/N
      mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-M parts
      mtd: spi-nor: winbond: Add support for W25Q33PW-M
      mtd: spi-nor: winbond: Add support for W25Q64PW-M
      mtd: spi-nor: winbond: Add support for W25Q12PW-M
      mtd: spi-nor: winbond: Add support for W25Q25PW-M

Nuno S=C3=A1 (1):
      mtd: spi-nor: sfdp: get the 1-1-8 and 1-8-8 page programs from 4BAIT

Takahiro Kuwano (4):
      mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
      mtd: spi-nor: spansion: Remove s25fs256s0
      mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
      mtd: spi-nor: sfdp: Increase SFDP data size limit to 16 KiB

 Documentation/driver-api/mtd/spi-nor.rst |   2 +-
 drivers/mtd/spi-nor/atmel.c              |  73 ++-
 drivers/mtd/spi-nor/core.c               | 869 ++++++++++++---------------=
----
 drivers/mtd/spi-nor/core.h               | 144 ++---
 drivers/mtd/spi-nor/debugfs.c            |  33 +-
 drivers/mtd/spi-nor/everspin.c           |   7 +-
 drivers/mtd/spi-nor/gigadevice.c         |  15 +-
 drivers/mtd/spi-nor/issi.c               |  29 +-
 drivers/mtd/spi-nor/macronix.c           |  73 ++-
 drivers/mtd/spi-nor/micron-st.c          |  70 ++-
 drivers/mtd/spi-nor/otp.c                |  16 +-
 drivers/mtd/spi-nor/sfdp.c               | 284 +++++++---
 drivers/mtd/spi-nor/sfdp.h               |  23 +-
 drivers/mtd/spi-nor/spansion.c           | 109 ++--
 drivers/mtd/spi-nor/sst.c                |  16 +-
 drivers/mtd/spi-nor/swp.c                | 133 ++---
 drivers/mtd/spi-nor/sysfs.c              |   4 +-
 drivers/mtd/spi-nor/winbond.c            | 320 +++++++++---
 drivers/mtd/spi-nor/xmc.c                |   1 +
 include/linux/mtd/spi-nor.h              |  10 +-
 20 files changed, 1249 insertions(+), 982 deletions(-)

--a6a2239f91fd5b884eda36ac19a598892041765cd35c393d42838897b249
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatiDSxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/izagGA5HvG6z3vDyTgVoAGyJHrswk2FZ81SJ55
B824qkGd9OGYBxFSuKsDAfeEbByrGBY3AX4iB2akCv1F1S0RZdBXR/Nn1mCSQ/XP
IcqjuI5DQTdNdMt9jIWEI+f9bdzYNMkXO4c=
=3TFH
-----END PGP SIGNATURE-----

--a6a2239f91fd5b884eda36ac19a598892041765cd35c393d42838897b249--


--===============8427451883654189910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8427451883654189910==--

