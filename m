Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72E8C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ZIyoNCYAFtYnCNg36aPzIqie1yRvXAAhx9jumV+38g=; b=Oezt3DxeGtNsiI
	6n7+7v3VOHakTa39Q6WhcfBnz+pW4G97sufmR0Gr1ZC0aE3A99K61S10lSe4+gpIPi5lBJ8NcRi8r
	2yI0PBSpjOwZ4pDFitvYZC2J6zyTEapXzVGfV5EPcFqRzVw5yA43awDePW8lHaAdvlykaeo8T+Jhj
	dcdPaedfzg+4vcgk1p2D5sSEeKTtVQu7EGFUK8YlJOF24HiUy872ZVOfwu1V6K6kvBO4FyAx0SBOc
	KmgZyc39tI0hD2kCbBJtBbI6PsmuuWaMyOHkJtL3q1KwC2q3PtHT6XQ7fXVriW5BBlxK+dpG7X+cj
	b9kmC16rrlgBvLsyr8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cZM-00000003QA3-2AeD;
	Fri, 04 Sep 2026 22:39:36 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cZJ-00000003Q8i-1800
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 22:39:35 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6b1b881a8e9so729972eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 15:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788561572; x=1789166372; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YxDY3gpgXUEyHB4LKpf5sbAqmUcywMUpLTIkNPDeQo=;
        b=VW6NkWfiiuaGZtLhDNbyPLUNMp2w23Wtu05dcOstn6uYXMhpCrif9pUPakzZbjv6B5
         Kx2V64ukn2ngP+R3PPFuziNPGKm0vDnvYvdMO2cMsXpPg/1SHSYVP2zzK7ZFMPZv9Mvn
         AB+Onu+gkMgkcoxVsz2pdKjBs8xbDC1lXZ1bhPkekp2Nb7m5nUwitumTWu4hxvHlKmXE
         CCj/RNVX77SMmSgP24r9N23HvCMmqkfKcsd94kQwafSgzyatINwwcyS72E+5Fwztm8xj
         Z99Li2qbOFfI2/bR5wr5zWRGxcSHlf3w5rnHzS+CWw7nTTKaGDTzlYzIkkznp8Vo6dJF
         8AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788561572; x=1789166372;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5YxDY3gpgXUEyHB4LKpf5sbAqmUcywMUpLTIkNPDeQo=;
        b=P+B/BDMHu8fBhpcDHggxo3xBeLmxs47vX2Cy7btu2LkIaN8yog6r/wdmreEzd/q4gS
         yRx0OVxI7/BABS8AF1yeBk9oB6o+uovoaecb7QO4U9pm2GnkD3U33UsrEXJugZ4T01kn
         n9xBoQWIYSCiEs1pgxd26pJ2OC9eZBozmYopYHTbLwfZrVx/gSyHA9fn3nntpLc8zTtP
         FQPt2MC6QPnoa//VoJw4+CRghu+rupDjopmiU9XdE0stAHClGBZzH07SHAs/bBORx1t1
         a/rnrnLKjLuhw8wCvqTopeYs0RMVbpUWPSd7evWresyuDftqioPtxKi525J3n/nfgIFs
         C2Dw==
X-Gm-Message-State: AFuF++lC66mdAWlJs5pR8eB93PuV5KXp1G0BfXTtToCgsUOa95ylx87G
	naCWAjnesM3pEpGZQC0PADmUfAKo2XmkEQt+7hxIRTA6z7Wv55j5BkHG
X-Gm-Gg: AYBFou0C3EEM2lx+S0CzuDCbAu9NUM2PTLxpcSVATN2b0WMnvui4N23tWuZ44vMDWwn
	VXEXHuAgvcB+jud0MrFh5yqWR9fUbTZvjLg/NVZs8Rj96ZuerNhC6TQZosqbQcFxbeH2PhAzQYp
	HMq6z399iRAC416DP4tZDVeRn7tsQrw/3cV8+6lm65tpAWmXLvYo5FNp7NYUmC2u3xwLbcK8fco
	eEz/MuyPfeqitMXfcLZIolMicKpTuYITBLC+6CXuSw+b7v1EuQRIYA7NDIn+yof43t/WYlHcu5W
	susF8AFJwVMRIaJN0yR9nDYP+RXOaGWQ9h7u7QvrHCYvPWpdpTC7XrerXRp4z9X9XOSx3QulQ5/
	ZR2yvMUcIiL8CFJsyhQza9XkowxNHPtoPzK7sL8NGpqH6ZLp7EBtMemg1FKzyIqKf+6OXd77prf
	Zom9ErX5jDXKNcWPh9O2EDmxJa2eKs1zmdIY0XWpvWikvibPL1pjr4QLAUpEL1uEs1qOXY+2tWy
	4dI/B0XEriGeSW9tea4tR+IVRPJb2YHD7OQdCueOI6O7LPRJIWdLvZZwtkmK5CZ7wvCwuGnsKeU
	LF7DgJJFfsEMTfz+5xuXG1GYeEKjmdbOcu7ojrz+1eGp0TldieyD267Rk2eFrjRaWiMezXPMKNu
	Rmhu+k2w4ivaf+L/bufA=
X-Received: by 2002:a05:6820:1c87:b0:6a1:8192:4d89 with SMTP id 006d021491bc7-6b6fe2b1023mr6553755eaf.29.1788561572187;
        Fri, 04 Sep 2026 15:39:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475523da013sm3488655fac.1.2026.09.04.15.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:39:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 16:39:27 -0600
Subject: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page
 size
MIME-Version: 1.0
Message-Id: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAyF4auUrA3EwdrqVcTFdCZqRGOZjKVQe
 nejrh7/5nsLGBdhg2OzQOFJTF7qETYNpFvUK6NkbwgU9nSgHdp7eEr10VlQo2bklNAqjzjFh+R
 YXUDitttS3w8td+DWWPgi8+/ndP63Q3dO9YvDun4AApqGjokAAAA=
X-Change-ID: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_153933_320147_6819ADCE 
X-CRM114-Status: GOOD (  13.84  )
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

When nand-ecc-maximize is set, the driver unconditionally selects a
1024-byte ECC step. A NAND with a 512-byte page consequently produces
zero ECC steps before the available OOB bytes are divided by the step
count.

The older sunxi NAND controllers support 512-byte ECC blocks. Select the
smaller of the page size and the preferred 1024-byte step, using a
512-byte step for a 512-byte page while retaining 1024-byte steps for
larger pages. Unsupported smaller steps and controllers without
512-byte support continue to be rejected by the existing checks.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- fix ECC maximization at its source by selecting a 512-byte step for
  512-byte pages instead of validating the derived step count
- retain 1024-byte steps for larger pages and the existing capability checks
- rebase on the current MTD nand/next branch
- Link to v1: https://patch.msgid.link/20260811060651.227431-1-james.hilliard1@gmail.com
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..de1e6b49f79a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2084,7 +2084,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 		int bytes = mtd->oobsize;
 
-		ecc->size = 1024;
+		ecc->size = min_t(unsigned int, mtd->writesize, 1024);
 		nsectors = mtd->writesize / ecc->size;
 
 		if (!nfc->caps->reg_user_data_len) {

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
