Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4F2C7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZYTgssNshARjr0EwMZQ8XHFHGofO8sEYDSl3PT948s=; b=eX5c2f8K7+8Z2q
	/E2yN8R71hlnrSM7FJYo9L5uwWZf/NbekO5bz3mSA1PVProaNIL4TMahzlV6YYUA3X+UgYSZgj+4q
	7WUEyFt//hej0txTblAVgoTtKIeV8NA4Wp7kdeLUs29Wxlp5Hx1I81nwzp3hClnqggJF07k7pzAX+
	mvgwkWeKNVbEvSkjf5d6QzASo5TLnJUXZXA/IFM7G+3plLccxDuWGSApbffmCOwiWYV+VV/LHHpxm
	Wjldd+7tGstVfGIF+WI0dC1mXoF4OEMLi+Re1fpzCkQYkDEsz/3zc2JcZ6eA2ey/CpJ1kBxZgniK4
	nkrc8+bcK7SSp2WXaNoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IX8-009t8f-1e;
	Thu, 08 Jun 2023 16:30:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IX5-009t6H-1o;
	Thu, 08 Jun 2023 16:30:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-977e7d6945aso153902366b.2;
        Thu, 08 Jun 2023 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241842; x=1688833842;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JK6nUED3jU/yRq5Kxia5FQ+fi4P7t0pEwpfr3iX2Go=;
        b=SSUKz1jK9Qed9t+uRHaFgw0LA0tr/oknZHzTeub9Vqzp/NzBqntpHfr6v3zXDpEKi1
         LPJMzzZxsfB/77Xdxp4oUWCRR7sl7ibeHk2L+VJ6IB+SMfmIGOtaJRulnEL64DPClwzz
         ekLt0OMAizMxolBclwsuX5Tqz+1rs6ADmZaYo9fl0j+kWDuZV18toFs7/39EiAQg1GTl
         qK1ffa4v+rmFOKWgCqYMv4ML3vb4sFmzq+g29+/0HX6q+sJv5pCqnBb1fVqvl6AlpQKD
         N5Kd9sksfVKH1soJJ3x3Sc5n9RGrTH4vNhUlut8W3+rt9aFPrT4PBvKtP2ImF6/CpikE
         +HxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241842; x=1688833842;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JK6nUED3jU/yRq5Kxia5FQ+fi4P7t0pEwpfr3iX2Go=;
        b=fO5cLOcNqREe2AD9pbagPpn5PPguKTiamlCwFwdmKZspFawpmUD8j+5NdbnxbFSuq6
         tZ9J7huuMehu44Hvd68Q30uHyu4TgRCENEuNXUymqM6ovNJHL2pXviJdyPi6iFNerlRH
         atEjXFVAQNFxLD7Q4MPvZKasV+9gIAA3xR6PkOzteHqf4gstEl9i9t9qptwJZ13LkGpO
         tzFRjp8GLCtOx7vfaXZIPg0HknnZXbIDRBFebM9RlS2VI9P9m4bn0DAY117zt/u975Uu
         iDli4tMsSJ7XtrzJHhpkNfacEQ+ocu5j0+EdWjMl2HlAS0r5gnuQ9tRjhlOMziD5k9JP
         k7yQ==
X-Gm-Message-State: AC+VfDyVKbO5cXdVsc3HcDHJUJ1Y/BVj+ATwTKhetbIr/7SPVa1WNBCD
	2IoZX2xAMYvEnsk10GCHYzs=
X-Google-Smtp-Source: ACHHUZ6J3DH1PqULJJPmTRQ1btMyatdURfw3vUzdQur0Ka2JugVYB02NEIPk2c0MUUGZggvS5kS+vw==
X-Received: by 2002:a17:907:da1:b0:958:cc8:bd55 with SMTP id go33-20020a1709070da100b009580cc8bd55mr345832ejc.0.1686241841862;
        Thu, 08 Jun 2023 09:30:41 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0096a742beb68sm24919ejh.201.2023.06.08.09.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:30:41 -0700 (PDT)
Message-ID: <f8a10a00-c3e4-9749-789d-39fba7944646@gmail.com>
Date: Thu, 8 Jun 2023 18:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 3/5] mtd: nand: raw: rockchip-nand-controller: fix nand
 timing default
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
Content-Language: en-US
In-Reply-To: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_093043_611532_8FA7A993 
X-CRM114-Status: GOOD (  12.36  )
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

Somehow not all NAND chips give a valid timing setting with the
nand_get_sdr_timings() function. Don't consider it as an error,
but fall back to the default value in order to continue to use
the driver.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index f56430f6c..e39431cfa 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -429,8 +429,10 @@ static int rk_nfc_setup_interface(struct nand_chip *chip, int target,
 		return 0;

 	timings = nand_get_sdr_timings(conf);
-	if (IS_ERR(timings))
-		return -EOPNOTSUPP;
+	if (IS_ERR(timings)) {
+		rknand->timing = 0x1081;
+		return 0;
+	}

 	if (IS_ERR(nfc->nfc_clk))
 		rate = clk_get_rate(nfc->ahb_clk);
--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
