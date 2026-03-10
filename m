Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB9DFD4F29
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 19:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Om+9I4JG1FkmMKNY92WIfm3GYRJ+n0+5ImPVea70RU=; b=PrJr1wnbNNIJF/
	zaBn4wH9vesGhAfsgxwx3l/FjbhbFtaHSdUSuZqj9Q98giY6Jo1wjDRepaLQ6QzzqJ38pjX0ckywX
	KrPmgWx07QkMNg7rDxaUp6Z6VCORlySGNQTL54KhRlji0Ubi+gVHmr2Qn2N4BkYGKz0XIwSv/rwAO
	Rp4PcFwbd//CZ9/5hRxZYOYK7v6u60Ni8ID5JeW7sBhPsjMQRRN9JwnytbBddXyxwj9bzn3LQ2ypd
	CLCUmO843DlejWBfiqUhRkfFc1MIllOuULFgJoamRL9vUlfNfAMK0L0dv9Mp6DNQ0nJ8qzyMavMPG
	Vc4gajvgzusTl3ERCOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Qn-0000000A92q-0SyO;
	Tue, 10 Mar 2026 19:07:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Qf-0000000A8yL-24hI;
	Tue, 10 Mar 2026 19:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57953403BB;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25ACCC19423;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169660;
	bh=gCNcVUJrbZCTx48PDUwX/v6AbMJIIgCA0UtWdlcRzS8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pX2WUf1p4xIkgApszm33gEz3I8nqKMZ9vY7xIE7T9cfwWAW4q5WjvWMnbWnsBilyO
	 EJwKfMgQMVikqKJq+x+HL30FGCqxiCj07dUPJT9zeZVWXssLhSZlrc9fVTAcKU9bNb
	 w5hIMA31eGE1foUMK/u7wqDC+vHGY9qj8gRZxYMzx7yorcXRaOWmJ6oVXfZZB1i+oY
	 /MXDpS76xg8R0ReulFP4eC9NlzyWE6OO+mVipulAHfWnar/RY1U2eaNXfmOgnXitc1
	 hJnhivwAdJHBSwi9j+Gmw1SEJKFnCQIYetcJDkzyTSkYK7QhlvnaG4DrErtJ/xTsPX
	 y7F0jeH4UY+Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16945FD4F0D;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH 0/3] mtd: rawnand: mxc: set raw chip's to child nand@0
Date: Tue, 10 Mar 2026 15:07:36 -0400
Message-Id: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPhrsGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMT3fSC3Mz4vMS8FN00C3MDM9MUCyOL1DQloPqCotS0zAqwWdGxtbU
 ATw+ipVsAAAA=
X-Change-ID: 20260304-gpmi_nand-f87065d828ef
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Max Krummenacher <max.oss.09@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773169659; l=1291;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gCNcVUJrbZCTx48PDUwX/v6AbMJIIgCA0UtWdlcRzS8=;
 b=JtKAcoccqwCOput4I+Q0xQSZ8wccSMzXvMjV1Hy9NnjhF2ZqA43LLSYFkQeUDYjNFVKtFmLWB
 XIxkoshi519BUYVKc28LvUWBnuScyy/mJY7iVD9SaFK/mWwa2xzFFpz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_120741_557883_ACEBEDA0 
X-CRM114-Status: UNSURE (   8.59  )
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
Reply-To: Frank.Li@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The nand-controller.yaml binding requires a child node (e.g. nand@0) under
the NAND controller. However, the driver currently assigns the controller's
of_node directly to the NAND chip.

Search for the first child node with the "nand" prefix and assign it to
chip->of_node. This filters out properties such as "partition" that may be
placed under the controller node in some older DTS files.

Fall back to using the controller's of_node if no suitable child node is
found to maintain backward compatibility.

This issue went unnoticed because the default behavior works for most NAND
chips.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      mtd: rawnand: gpmi: set chip->of_node to nand@0 child node if present
      mtd: rawnand: mxc: set chip->of_node to nand@0 child node if present
      mtd: rawnand: ifc: set chip->of_node to nand@0 child node if present

 drivers/mtd/nand/raw/fsl_ifc_nand.c        | 10 +++++++++-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 11 ++++++++++-
 drivers/mtd/nand/raw/mxc_nand.c            | 10 +++++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-gpmi_nand-f87065d828ef

Best regards,
--
Frank Li <Frank.Li@nxp.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
