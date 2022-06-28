Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C7C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4jlFtrSub75QnB3y8My30zPdMX/fCjp2Hg60Q6b616A=; b=3JXqE1NIgzJh5N
	Uo5xV3s7FyRPFy8xdIxv4jjcbvZYSPcwofJKyXlOSJgzCy/BJkChbat2IDKZEl5jit/GmkEUJmGlf
	gdV5sK2oppXcZPgMaYJS5sjPPu3BkB7KGAzJYQO6ee7Sq6U3s/yMWwdPH7U5Wf8Vp1U6XzhHm94LK
	Gx5DB1bV6dXhfLQRmlazKHjr0V5uAFGDS8om2h3KyeFLmPSotz/B9JEAkNF1p+PNyvxtPAf/MQ/CX
	yOGYabunVMtI3uFFTco4xJuiBTb5Poq24nEKqDIDEMgZVBOPQ5RIXQfPAwq2Txq6xfcgeDt6SnUfa
	1YMRhpqusEFG9mXESEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OA-005v4a-2l; Tue, 28 Jun 2022 11:28:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69O7-005v2f-DP
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id cw10so25131434ejb.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=inDOpdCUQzR/8S+9fAaTVfT632HEMGCp6YCOVifU2kw=;
        b=jc4hFd9jdYGeJvFHrv+UO/R44jwrsXG/F4bCuk6p2pdqGMD6t0HviouLBwPhg4MqLz
         tkTnQeX0ybNvr8ftVO/yDIlPi320Lz2+Oy/2JewLRneLeI5ww/p7Iu2lIPmEsPFCya7S
         qKT0JQ1Y3XOXW4iel31odz9r8fkulW0fz0kHPKHgXCpESS8nVOjs9YdYgGyJMeXVj0Qf
         fDL4/JNAaDLk5KKQ1ia3lF27yjQqAhR/wBxFZOChWksQ2L16R4SZ5j9033XVExEPt0ni
         HATqEwo6Z/Mc5JsxDJnNOFOUDoHhhWIX3OWG/k3bw9K2fA3H8lb22Jw3ST3iESjyjPZN
         onvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=inDOpdCUQzR/8S+9fAaTVfT632HEMGCp6YCOVifU2kw=;
        b=756juz59pNP5wDau2UGajINCiCFwylb+YEStkdW2m3YIj9mdxA0fzIb1LQ9sk5pz0f
         r7+Adno7gEPKwVP4A5iS3OcvEiABD0doNUD9Ex7MEQ0WEgGR9cHxsVjmGEjJeQUpbzPT
         icdw28yo6WcKYEwFHuo2fZRJcSmppAaU9zcsv/76IP2Nd0ajqRzLC9Vu7JTbpsS6mQx4
         bdPpNKQMUIWQQrm1yyFqL+HMlXo9SkIh2An3hstkx1G5Ext8giCS/ABBfVlr8Z6yY17L
         AOONJHKEqKvcUPAlEL+z40kqv9YVRJmeb765xnCBnKHu7O8MZOYUzJEDivXjedFWPCT0
         QJmw==
X-Gm-Message-State: AJIora+r1WyLaS8whyf/A1AJNqMwc1qx6FwDLFdVx+mLJ20Nqg8DIb6A
	FUnLLw4Ggl225OmXqJa7ol+vR25h95M=
X-Google-Smtp-Source: AGRyM1ur91VeMBh2tzN91CwCPguBdLKKSYQdo3d8X5J02oGrVOU4qUlP2KJPKAAD/IaJT61hEvc3kA==
X-Received: by 2002:a17:907:94ce:b0:726:449e:73cc with SMTP id dn14-20020a17090794ce00b00726449e73ccmr16313870ejc.270.1656415686765;
        Tue, 28 Jun 2022 04:28:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:06 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 0/8] intel-nand-controller: Fixes, cleanups and questions
Date: Tue, 28 Jun 2022 13:27:23 +0200
Message-Id: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042811_514442_2D889440 
X-CRM114-Status: GOOD (  22.30  )
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

Hello,

I am trying to replace the xway_nand driver (which is still using the
legacy NAND API) with the intel-nand-controller driver. The Intel LGM
IP (for which intel-nand-controller was implemented) uses a newer
version of the EBU NAND and HSNAND IP found in Lantiq XWAY SoCs. The
most notable change is the addition of HSNAND Intel LGM SoCs (it's not
clear to me if/which Lantiq SoCs also have this DMA engine).

While testing my changes on a Lantiq xRX200 SoC I came across some
issues with the intel-nand-controller driver. The problems I found are:
1) Mismatch between dt-bindings and driver implementation (compatible
   string, patch #1 and patch #4) and hardware capabilities (number of
   CS lines, patch #1).
2) The driver reads the CS (chip select) line from the NAND controller's
   reg property. In the dt-bindings example this is 0xe0f00000. I don't
   understand how this can even work on Intel SoCs. My understanding is
   that it must be read from the NAND chip (child node).
3) A few smaller code cleanups to make the driver easier to understand
   (patches #5 to #8)
4) I tried to understand the timing parameter calculation code but found
   that it probably doesn't work on the Intel LGM SoCs either. The
   dt-bindings example use clock ID 125 which is LGM_GCLK_EBU. So far
   this is fine because EBU is the actual IP block for the NAND
   interface. However, drivers/clk/x86/clk-lgm.c defines this clock as
   a gate without a parent, so it's rate (as read by Linux) is always 0.
   The intel-nand-controller driver then tries to calculate:
     rate = clk_get_rate(ctrl->clk) / HZ_PER_MHZ
   (rate will be 0 because clk_get_rate() returns 0) and then:
     DIV_ROUND_UP(USEC_PER_SEC, rate)
   (this then tries to divide by zero)

Before this series is applied it would be great to have these questions
answered:
- My understanding is that the chip select line (reg property of the
  NAND controller's child node) refers to the chip select line of the
  controller. Let's say we have a controller with two CS lines. A NAND
  flash chip (which a single chip select line) is connected to the
  second CS line of the controller. Is my understanding correct that
  the NAND chip device-tree node should get reg = <1> in this case?
- Who from Maxlinear (who took over Intel's AnyWAN division, which
  previously worked on the drivers for the Intel LGM SoCs) can send a
  patch to correct the LGM_GCLK_EBU clock rate in
  drivers/clk/x86/clk-lgm.c? Or is LGM dead and the various drivers
  should be removed instead?
- Who from Maxlinear can provide insights into which clock is connected
  to the EBU NAND controller on Lantiq XWAY (Danube, xRX100, xRX200,
  xRX300) SoCs as well as newer GRX350/GRX550 SoCs so that I can make
  the intel-nand-controller work without hardcoded timing settings on
  the XWAY SoCs?

Due to the severity of issues 2) and 4) above I am targeting linux-next
with this series. In my opinion there's no point in backporting these
fixes to a driver which has been broken since it was upstreamed.


Best regards,
Martin


Martin Blumenstingl (8):
  dt-bindings: mtd: intel: lgm-nand: Fix compatible string
  dt-bindings: mtd: intel: lgm-nand: Fix maximum chip select value
  mtd: rawnand: intel: Read the chip-select line from the correct OF
    node
  mtd: rawnand: intel: Remove undocumented compatible string
  mtd: rawnand: intel: Don't re-define NAND_DATA_IFACE_CHECK_ONLY
  mtd: rawnand: intel: Remove unused nand_pa member from ebu_nand_cs
  mtd: rawnand: intel: Remove unused clk_rate member from struct
    ebu_nand
  mtd: rawnand: intel: Use devm_platform_ioremap_resource_byname()

 .../bindings/mtd/intel,lgm-nand.yaml          |  8 +++---
 drivers/mtd/nand/raw/intel-nand-controller.c  | 28 +++++++++----------
 2 files changed, 17 insertions(+), 19 deletions(-)

-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
