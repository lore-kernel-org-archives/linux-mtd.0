Return-Path: <SRS0=qq/S=5G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B86C4332E
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 06:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B3F20753
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 06:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IGujsfay";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLbxc/xy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B3F20753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+Zdef8WkLXu2ozBhpz1ukunP5w5w4spzArpmC0bJwWI=; b=IGu
	jsfayLGdRidCQllzlUIUJFgpGoY8JLylC/JPe2OE6L3kXOigk7Lolbj1z0mg/qYOt4Tei7UPnVxtN
	X1S1AzPjNiDeItSq9vsIxMVtddg3tRzqtIkLAtyo35FnDaQFTq2xlTymgQ3OvfacoHlZjVcRMgBXK
	P2aTZyLB7Raf8pTSSC/Cy4pjUM/13PdIqFKWz7+Dg7mIPX2uGm6bH6vhctExj7jnW+jDHuLorIsoW
	VsB1XtcaAwll5vB3mXmLtJhHcc0PPwhjuo51kDQ7e1CPsLEx4Kr7QrTkmeB+KDiIgbAxuXHHVN7Pf
	iQjLmkOlM4uyy988rACb3shlFRwwpFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFXq7-0006qy-Ud; Sat, 21 Mar 2020 06:42:35 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFXq5-0006qS-Jh; Sat, 21 Mar 2020 06:42:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id h6so9991006wrs.6;
 Fri, 20 Mar 2020 23:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6jwYi+4smvXpVmrJrlCNrUCQ6TbLycTN4aAVHLYtEcY=;
 b=qLbxc/xyJkaMd31ImtrVXGmY8aoSdkbThQE6UnMCnH7JaMVwcP4cYHI8+c7QPkkvYO
 zPjpG6Vg+gwbiRi3kvYGCHE8s6aTgILjcx74heIq7gHhAu6Ji/71vD+USpqEPHOrhBVB
 2X+S/YOiYfCmore9+jCcd0yhfl7VlNhpVMsuOGBDaZV/GtyJTlbyDe5zC9imvitplxaJ
 YRCNRXXKhnyD6Wa4Pt+p67YknAmbAOih+TyIhyMNbWe0W4bseHXmGNNzfBgVOUE58cKW
 tZjJdJ1eKq0QGABwVMGbeVqJ0P0TtQ1uXGkTqsopkMTUuWED6CZL9WV3u10dJE7W4W6V
 ZWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6jwYi+4smvXpVmrJrlCNrUCQ6TbLycTN4aAVHLYtEcY=;
 b=Ow5wwwWUsN0lFhQB2J96QEcBmXw6gZFoKrHr4kYEIct2rb9B/WZsljsx/NS8SsCvGb
 SlsS3E3Dz0+c2AgjgbcroyH9WQ+F+RKnDCMUgDr0QWOgvTs2Kh4RjwlulHFNQ+lmdEBl
 LT8Bfhml2riR1JulTMgc7Z93FmXbZgjQbNRdbwOtcYMs7q+NnTiCxwhbP3U8HZzrwJht
 nRBHUsxmbNbKHuXkPHj57kv4vwHKl22wbj7/CEa0WuSNwRhJ76ZtXNnG5K/VS6dkyODQ
 +nbRJujin6WGP/tF+TD9boczM9xwBu1dKO3T1aGoE+MwDBzCz4FsRSEQRhy6rr55Ey6m
 PVAg==
X-Gm-Message-State: ANhLgQ3HzpIF3OZDX+OK8WRngxyQz4lTaO3CvugzmqfgUpmqBP2gNSwh
 Pbje7J6u0sFrjl8pn0OwO1I=
X-Google-Smtp-Source: ADFU+vuR82I6jdQEXvp8/i3BFcsKQ5kIC/3RfxJfhRkmcC28/6Y1EcInIoAYgazpWuhDC8DKZ9sGfA==
X-Received: by 2002:a05:6000:d1:: with SMTP id
 q17mr15985822wrx.409.1584772948918; 
 Fri, 20 Mar 2020 23:42:28 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d49:b100:ccc3:14ec:86ef:bd24])
 by smtp.gmail.com with ESMTPSA id k126sm11356619wme.4.2020.03.20.23.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 23:42:28 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] MAINTAINERS: update entry after SPI NOR controller move
Date: Sat, 21 Mar 2020 07:42:17 +0100
Message-Id: <20200321064217.6179-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_234233_674336_F144B1A7 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mtd@lists.infradead.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code
split") moved all SPI NOR controller drivers to a controllers/
sub-directory. However, the moved nxp-spifi.c file was referenced in the
ARM/LPC18XX ARCHITECTURE entry in MAINTAINERS.

Hence, since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: drivers/mtd/spi-nor/nxp-spifi.c

Update the file entry in MAINTAINERS to its new location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200320
Boris, Tudor, please pick this trivial patch. Not urgent.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50e8b900c0ae..3822efce14bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1948,7 +1948,7 @@ F:	Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
 F:	arch/arm/boot/dts/lpc43*
 F:	drivers/i2c/busses/i2c-lpc2k.c
 F:	drivers/memory/pl172.c
-F:	drivers/mtd/spi-nor/nxp-spifi.c
+F:	drivers/mtd/spi-nor/controllers/nxp-spifi.c
 F:	drivers/rtc/rtc-lpc24xx.c
 N:	lpc18xx
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
