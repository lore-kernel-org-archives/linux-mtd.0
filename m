Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48445CCA464
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sCzSGhadAhDzI5Jq2CXXhmiBcLIqH0quB47ebte2wJc=; b=g5b+gtnXOMxmax
	YyBn4zEJACjoGyXIHtdTGSPsvSz3LhZSI9brP8pcye5LGc3493UlyiHW85i9Ve8oK8QkLp/I7YN5/
	M7qgU91RSg5G8mW8ZLG7S5ZKx40ZuZv95uJc618Z62AmE5s8OB0ULwaobnVYG0Sr+fVrrxzZ+Y7Ke
	HPWSQmIBAQnVoMY3lyufadUeIpcnCrUL5Ag5jBLsNBF+6JWvbZcwf6e5JQx3EW4mLi7tEmJqEs/Ww
	JaRN9c7KI3XS/v6NgkDpwVLsVvjQNTec1gj5w1NCJksroTIwOtJaL5BFjvoOpd70OBjHEptlye+P1
	TMdDX2nxIkrCa3N1kfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCK-00000002cHD-0ucm;
	Fri, 16 Oct 2026 10:30:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCH-00000002cFl-3EFX
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 10:29:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D03384E41248;
	Fri, 16 Oct 2026 10:29:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AD276075D;
	Fri, 16 Oct 2026 10:29:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BAE510328BE6;
	Fri, 16 Oct 2026 12:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792146592; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=AnONk402nSGH39bSlb7WuXw5UGd8Kv5D12l+z58J9pE=;
	b=OcMHITjUB8VCMoR1QyeRahsOpar2RSGvrYL3SG51c3aDKhjF+9tWxtMw0g+Cx1p2ygnyoY
	fBY4M9gOc5OrsC54TtUe0wZxs2ipTKJShDNs6jUdLEv0tWFpkacWRTTvOvAcahhcaxAUtY
	KjyI6Oebe9aY1AvZpYblnquVP2b8jRpndMDvjMc75N/Ena3S2dwljkHMDUj02pXdRd3jbb
	Zj3LVytxitBdFIX3YK7ldDgR77vGiihjhHvU25nkhWmtpDL4Wj5K1hgrUHb8zP771A+hnm
	6y036Rx5Imw4cg4kfFTpRg/l2Ykg6bVdPgM/AZjbHsoTygD20c7U7HvLN+A1NA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 0/7] spi: Add support for panic mem writes
Date: Fri, 16 Oct 2026 12:29:10 +0200
Message-ID: <20261016102917.171095-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_032957_945668_9E4A50F5 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Hi,

Here is the v4 of my patchset that updates the MTD spi-nor code as well
as the spi-mem code, to add support for panic mem writes to a memory
partition configured as pstore.

This revision adds a workaround in mtd/spi-nor to avoid a call to
kmalloc(), and fixes a kernel doc mismatch.

Changelog:

 - [2/7]:
        - Also update kernel doc for new 'timeout_ms' parameter

 - [3/7]:
        - kmalloc() is not safe in panic context; reuse boucebuf instead

 - Patch [1/7] and 4->7 unchanged since v3.

Cheers,
-Paul

Tanmay Jagdale (7):
  spi: spi-mem: Add support for panic mem writes
  mtd: spi-nor: Wait for NOR ready with poll_timeout_us()
  mtd: spi-nor: Add support for panic writes
  spi: cadence-xspi: Clear "SDMA ready" IRQ flag after polling
  spi: cadence-xspi: Add irq-less support
  spi: cadence-xspi: Add support for panic writes
  spi: dt-bindings: cadence: Make XSPI's IRQ line optional

 .../devicetree/bindings/spi/cdns,xspi.yaml    |   1 -
 drivers/mtd/spi-nor/core.c                    | 128 ++++++++++++++----
 drivers/spi/spi-cadence-xspi.c                | 114 +++++++++-------
 drivers/spi/spi-mem.c                         |  42 +++++-
 include/linux/spi/spi-mem.h                   |   5 +
 5 files changed, 209 insertions(+), 81 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
