Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01B3C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2H7GxW8TS85gRa4kNGPLMth0mSSKgf10XWIme5L4HYo=; b=c2niGGexMsNTbN
	2lB1FZuz2qddwZ/kM/q6gOYmFSNr1irYPpiq0wTCi/DqcuX/s4u3UDJ142sQWdX6LIlHRd9/+Ar1d
	VtqGn053DgPTcxLuosxo9NZkad1PhVrCRdEbTt9ZzPh0JlSE/opTLZ1+ffuFlzhO0A47Psdc8Wg+L
	GkUhcV0+22tJG4snFl3LSroERehCe28/J05Uv2ch/nim0J4Z4WZRb35IczF5rX2QBzi+Uixc+eJsi
	WfLwpA/hinjot5RZzvf7chenbVuqxMxXRWBKO5yMMfZwtn/aOvhhO6Y1323UrddY9FhYn0mksLJD4
	4gph3cTYBo7BbhJyebZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPs-0000000E1iB-08Nw;
	Thu, 11 Jul 2024 13:00:56 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPI-0000000E1Uc-03w8;
	Thu, 11 Jul 2024 13:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=seKtzOj9uRiP4QfqvuWUI6QsYkCyEJ+I0DV13nQFCgk=; b=CJ
	iXHgVje/gzci56xg8Tlv/PKntB2glE671hI+QtgN3MjNM5eAm0hQoZzh+zF8KRS5Tqt27FLBv9PgR
	fJwxz74QeRpil6n7RRUEibz8p7RKl9gWdevgy+mEadmZye1FitGUrr04YkBqdcPv1HnKXesqjqkqO
	XEanIA1bz+aaxIzznyj/FFpk4DtEbQlzAqhYHe5IwKh0rJ6CQp1Xg+fEzLKKLW3LGzwYU6Eac6wu9
	PwCPESsQOWsALREhPP69LH+iABHtJ0xHsMgndN3wDkVreI6QNMukJgZlW6+8VlDAAVLjtFXsfYRCm
	o5SywVUSTLF9a/PwIj8wAlLA2O74zuhQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPE-000BRe-K9; Thu, 11 Jul 2024 15:00:16 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPE-0002wu-1E;
	Thu, 11 Jul 2024 15:00:15 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device id
 re-use
Date: Thu, 11 Jul 2024 15:00:00 +0200
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFDXj2YC/43NwQ6CMAyA4VchO1szOgbDk+9hPEzWwRJhZFOCI
 by7g4vxYjz+bfN1YZGCo8hO2cICTS46P6QQh4w1nR5aAmdSM+RYcIkF9LoJfnAz9DPKu0AuDVg
 3P8cISiHVSGQqU7EEjIHSZscv19Sdiw8fXvuvKd+mf7FTDjkQ5RJJltrexLklnU6Pje/Z5k74s
 UoufloIHKytldFYKiGbL2td1zeDFjtqEQEAAA==
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=5827;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=ZiuuwYPI9SIdUOemJpXAnEn0CfASpllYvoR9KitC3dA=;
 b=X3HBNUEE3LayH463lvpyEqpKkbPLASIiX7AFIG0xVJrLFOnlFiKx0YFum4Zy+/aPb2/GkmlCt
 lZNSi5C3Hp2AI35B0ZBR7TiQS+5LewAuo0IiQH4BBcGog2ytsCFtmG2
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060020_268944_469A85E3 
X-CRM114-Status: GOOD (  21.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Following up to various discussions, this series have now been
modified so that it gets rid of the old deprecated approach
for detecting when to do optional SFDP parsing.

Before these changes, spi-nor flashes were handled in 4 different
ways:

(1) SFDP only [size==0]

(2a) static config only [size!=0 && no_sfdp_flags & SPI_NOR_SKIP_SFDP]

(2b) static config only
       [size!=0 &&
        !(no_sfdp_flags & (SPI_NOR_SKIP_SFDP | 
           SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
           SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ))]

(3) SFDP with fallback to static config
       [size!=0 &&
        !(no_sfdp_flags & SPI_NOR_SKIP_SFDP) &&
        (no_sfdp_flags & SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
           SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ))]

Cases (2a) and (2b) have been handled slightly different, with
manufacturer and flash_info ->default_init() hooks being called in
case (2b) but not in case (2a).

With this series, that is changed to this simpler approach instead:

(1) SFDP only [size==0]

(2) static config only
      [size!=0 && !(no_sfdp_flags & SPI_NOR_TRY_SFDP)]

(3) SFDP with fallback to static config
      [size!=0 && (no_sfdp_flags & SPI_NOR_TRY_SFDP)]

Existing struct flash_info entries are modified, so that all those
that was case (2a) or (2b) are now case (2), and those that were (1)
and (3) are still (1) and (3).

As a consequence, the SPI_NOR_SKIP_SFDP flag is no more, and all
drivers that have been doing optional SFDP is now marked explicitly to
do that using the SPI_NOR_TRY_SFDP.

It is possible that some of these flashes does not really need to try
SFDP parsing, but as I am unable to test such changes, I will have to
leave that up to someone with access to hardware to do that. The
patches for doing that will be trivial, it is only a matter of testing.

As for the name of the flag, I guess that is still up for discussion.
I think SPI_NOR_TRY_SFDP explains pretty well what is the purpose, but
I am not really that attached to it.

As for the change in macronix.c for the mx25l3205d flash_info entry,
I only have access to boards with MX25L3233F flashes, so haven't been
able to test the backwards compatibility with the old MX25L3205D and
MX25L3206E flashes sharing flash ID with MX25L3233F. If anybody has
boards with MX25L3205D and/or MX25L3206E, please help test this patch.
Keep an eye for read performance regression.

It is worth nothing that both MX25L3205D and MX25L3206E are
end-of-life, and is unavailable from Macronix, so any new boards
featuring a Macronix flash with this ID will likely be using
MX25L3233F.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v3:
- Revised patch 1 in preparation for implementation of the new way of
  detecting when to do optiona SFDP, as described above.
- Added patch 3 that aligns the handling of default_init() hooks to be
  the same for case (2a) and case (2b) described above.
- Added patches for all spi-nor flash drivers to apply the
  SPI_NOR_TRY_SFDP flag instead of relying on the "magic flags"
  detection.
- Added patch dropping the deprecated "magic flags" code. This depends
  on the merging of all the patches applying SPI_NOR_TRY_SFDP to
  flash_info entries.
- Added patch dropping the SPI_NOR_SKIP_SFDP flag.
- Link to v2: https://lore.kernel.org/r/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com

Changes in v2:
- Added new flag (SPI_NOR_TRY_SFDP) to spi-nor core to allow trying
  SFDP and fallback to legacy parameters without having to specify
  DUAL/QUAD parameters.
- Rewrite macronix to use SPI_NOR_TRY_SFDP flag.
- Use with the ancient EoL MX25L3205D chip will not get speed
  increase, but stay at 1-bit mode as it is now.
- Link to v1: https://lore.kernel.org/r/20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com

---
Esben Haabendal (15):
      mtd: spi-nor: core: add flag for doing optional SFDP parsing
      mtd: spi-nor: macronix: enable quad/dual speed for mx25l3205d chips
      mtd: spi-nor: Align default_init() handling for SPI_NOR_SKIP_SFDP
      mtd: spi-nor: atmel: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: eon: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: gigadevice: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: issi: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: macronix: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: micron-st: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: spansion: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: sst: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: winbond: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: xmc: Use new SPI_NOR_TRY_SFDP flag
      mtd: spi-nor: Drop deprecated mechanism for optional SFDP parsing
      mtd: spi-nor: spansion: Drop redundant SPI_NOR_SKIP_SFDP flag

 drivers/mtd/spi-nor/atmel.c      |  2 +-
 drivers/mtd/spi-nor/core.c       | 48 ++++++++++++----------------------------
 drivers/mtd/spi-nor/core.h       | 19 +++++++++++++---
 drivers/mtd/spi-nor/eon.c        |  6 ++---
 drivers/mtd/spi-nor/gigadevice.c | 16 +++++++-------
 drivers/mtd/spi-nor/issi.c       | 18 +++++++--------
 drivers/mtd/spi-nor/macronix.c   | 26 +++++++++++-----------
 drivers/mtd/spi-nor/micron-st.c  | 41 +++++++++++++++++-----------------
 drivers/mtd/spi-nor/spansion.c   | 46 +++++++++++++++++++-------------------
 drivers/mtd/spi-nor/sst.c        |  6 ++---
 drivers/mtd/spi-nor/winbond.c    | 32 +++++++++++++--------------
 drivers/mtd/spi-nor/xmc.c        |  4 ++--
 12 files changed, 129 insertions(+), 135 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240524-macronix-mx25l3205d-fixups-882e92eed7d7

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
