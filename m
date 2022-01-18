Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77206C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=taaNYR092J5ZbxgmMV0eafkIKfvtADwS3GdUyAGZcX0=; b=iXgsSDWY3WngT7
	FlxGfUuxIbo1o3BrTyA6WDJ0LvKr8k00h4BtOCTmDBCPXwwaY+E737d0iNaIktzm6UPN5SFDiE3B4
	+KOZXeU1BXxw/G3GZwYQMbdlzWDmcapv6xrDFj6cPakNYU7RbsyXIjKuDwW+DzLCHwnGdVnJQ7tjE
	QEAhwzmKqq9PHLfT+kkZwhWYGGyCZTjBjRG8lnwO1XFcQpCYdsPokAR2HxOyxpmDbRsfBUce3loB6
	691s6O8s7m7Av6HJ5U1FUOYOE7UDP9vNw3ZRsUM6zA+WO6Drq7mLsa4y4zo7bUKz/fGPGfNlkItGI
	s3l+aEnDkZV4s9RntXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9lD2-0010Fh-1q; Tue, 18 Jan 2022 09:55:24 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9lCm-00108T-K6
 for linux-mtd@lists.infradead.org; Tue, 18 Jan 2022 09:55:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id q25so76974163edb.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2022 01:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mceqks5nzf+eeOlYMRRw9uStF9uGFlchw0VEVd71PNE=;
 b=gPYLtv4I3fkdCGWvfnnq5fZwtxkXwUSfcWEIelAqAAoqlMyHtS5+lMkxf4CFTrDKO2
 EEi1eSnV+84JN549IbLO7idLHZ3C3WRiQX4orsnch2n8XVYgGfg0PlY/jXEXVb+W6x3t
 Kl/TGleX6RXP9oV69e3gejA2FUp0UcV2m1dFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mceqks5nzf+eeOlYMRRw9uStF9uGFlchw0VEVd71PNE=;
 b=H1u3Dbx0G2tQPF1vL3v6NxSWjLeVr7v2MTjSGjUo1M5v0MHn7eREdQm/C/8qZ70f6a
 IVfc0tOHJCU/vV9PBZYMHLOvI5+bs9cLhWYrTEPDPSZzradEfEzz1Q7LuYhfL3Q39Q0L
 ep+p7lxF3aMDqpyFSD0YcLs88yJM2m7L2Mai10bXj6EShkjU+JxPhzb7aC7+YozGjqpI
 8zCRHoaCxBGxO6EzCThf85XgQ6UMk8U8+iiSpBoybyM/PWteCv9SXAeIu6TQtzuVT/FD
 Gllxh7EfpM+CLEYTr8AWqMiRRQ5idyBK9qM3T24Saq0q+1aecZnYHN90VxbFD4X/a6Wj
 eY4g==
X-Gm-Message-State: AOAM532Eq6P3tUwTMVpTVxIZCggKDoI0uRm9lk3rzFIVe14DJi0148v6
 L1u2aMIk7fCzqJXHiWaaz/5TGQ==
X-Google-Smtp-Source: ABdhPJzj8gexQMhBbeU9RNli6B1Vexv4bSMZZ3vsSVZ884D8NY7eN6Rp1vUyRj0kGUSh+affuud+jA==
X-Received: by 2002:a05:6402:2712:: with SMTP id
 y18mr10734301edd.26.1642499706803; 
 Tue, 18 Jan 2022 01:55:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id w3sm5173520eji.134.2022.01.18.01.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 01:55:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] Fix and improve gpmi nand on mx28
Date: Tue, 18 Jan 2022 10:54:30 +0100
Message-Id: <20220118095434.35081-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_015508_705933_33DDEEDF 
X-CRM114-Status: GOOD (  11.88  )
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

Starting from [1], the series fixes the timings setting of the gpmi
controller for the mx28 architecture, also adding support for fast
edo mode timings. The whole series has been heavily tested with the
mtd kernel test modules, and with repeated write cycles on nand.

The whole series has been tested and reviewed by Sascha Hauer <s.hauer@pengutronix.de>,
so I removed the RFC prefix and re-submitted it as a regular patch
set by adding the 'Tested-by' and 'Review-by' tags to every single patch.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org


Dario Binacchi (4):
  ARM: dts: imx28: reparent gpmi clock to ref_gpmi
  mtd: rawnand: gpmi: fix controller timings setting
  mtd: rawnand: gpmi: validate controller clock rate
  mtd: rawnand: gpmi: support fast edo timings for mx28

 arch/arm/boot/dts/imx28.dtsi               |  2 ++
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
