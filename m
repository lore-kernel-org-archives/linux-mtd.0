Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8ACC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3107LGrNCpypigb/tAuTLTRgRorDzP7VuVNjDR/wysk=; b=NY7SjtUuqct5I1
	uqXp/us0AgNqWLOOpL3sTSMZ6Gltdo9uUssODl15CtfUAUcDvVBvRM6Jsi/pKVGfn/+mOxPCSarWj
	LDT1CtqoRv6b7TQcOZs+f0Po+UMP5Wl5OaaUh/I0vnNfTMb7oI2piQVyg3PrvB9UXsHGZMRAdWGz/
	Csy//QWiOrDPrBwBs74wZteYD4GlxRUKPWRJZZ4yMzr5O1I26haVmRy1iA9IdilzIJGELd4UN1S9G
	jO/h6BvSJSMNx3aVFPIWcrjLXjv8A06n7gx7LrgjsGsxbHYDkVD7qlU1FMjrCVrrm0IhZluWOG2GV
	ugfOdStklz4pHWENBuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFuY-00B7P9-Ls; Fri, 17 Dec 2021 16:16:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFaG-00B1SL-08
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:55:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id z9so9536738edb.5
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AfgZyMdEJhIrrC8KaYKPJsgOg20Fl0ent8NPVFsoxgs=;
 b=jQJPDfeUneKUEoWKPIw/VV44os2ZKX4YQslFa1zcE2bvla40AAxuuvcZava/OcOLYl
 ebuodp+o32Gk/rxi0DCEFl4gXg4ECbq7IBiMjNR9ACtIkZ6fApGCy1Rp9SNWADlTzJ8C
 npS7fGXItS9q+gBzdRWqsFWMUgygfjDJRoB+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AfgZyMdEJhIrrC8KaYKPJsgOg20Fl0ent8NPVFsoxgs=;
 b=IQlBz0OGym8wfeVG6a7ha4Jt6OsNonXuFqzHGZkB2XoI0tp5eJC7NP2LqRlrK+x5st
 yrEjKMuInqw0RAAljgbvI4FeJEfIMeL+FIMP51QrPM3zaNEw5vJa7CwW5V/7hX3amRxe
 KR6ISd4qG5xCs6T4j4NzR/aUvV19HAMgUGfdN7AUt57VSnr5tHEmRfIgDrkzSU3YFQFt
 4XQ0F9Z/ErgYHFVq20WCujlFHommUyTbCbdr7Em6G+F4THzyH09/0iNI1DJXcM8C8lwK
 3qkltj2ieNI6XQVftI6VHk4XTH3s4YZlHd5jVGmvWj1sRchcV1YK2fx9pLUgh2bL39Gl
 lbSw==
X-Gm-Message-State: AOAM533gR4AykI6nPz4LtT8tKuXUccq/cq3IGJww1MO1lxG/klESLiC4
 oYyMCufrKIzR/OMRba3I0/+p9g==
X-Google-Smtp-Source: ABdhPJwrqR1fUITbPzQl9qu5oFZPzkp0eOH0jA+KuGRGaM/zEYWpckONxW4PWxfDYd99CLnUnT9rsw==
X-Received: by 2002:a17:907:97d4:: with SMTP id
 js20mr3061659ejc.416.1639756545817; 
 Fri, 17 Dec 2021 07:55:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-56-50-241.retail.telecomitalia.it. [79.56.50.241])
 by smtp.gmail.com with ESMTPSA id i6sm772158edx.46.2021.12.17.07.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:55:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/4] Fix and improve gpmi nand on mx28
Date: Fri, 17 Dec 2021 16:55:08 +0100
Message-Id: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075548_840980_C4895C73 
X-CRM114-Status: UNSURE (   9.26  )
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

Starting from [1], the series fixes the timings setting of the gpmi
controller for the mx28 architecture, also adding support for fast
edo mode timings. The whole series has been heavily tested with the
mtd kernel test modules, and with repeated write cycles on nand.

The patches of the series were applied after applying patches [2]
and [3] which at the moment are already in nand-next.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
[2] 73b68455f8ac ("mtd: rawnand: gpmi: Remove explicit default gpmi clock setting for i.MX6")
[3] 7944f8346983 ("mtd: rawnand: gpmi: Add ERR007117 protection for nfc_apply_timings")


Dario Binacchi (3):
  mtd: rawnand: gpmi: support fast edo timings for mx28
  mtd: rawnand: gpmi: fix controller timings setting
  mtd: rawnand: gpmi: validate controller clock rate

Michael Trimarchi (1):
  clk: mxs: imx28: Reparent gpmi clk to ref_gpmi

 drivers/clk/mxs/clk-imx28.c                |  3 +
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 75 +++++++++++++++++-----
 2 files changed, 61 insertions(+), 17 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
