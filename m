Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024F5C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGFYILX1zVBshGga9zBvWF73/La8BR8iSjudkuShOSo=; b=dj77ORj6QRzYf3
	CqQo5YqHJSrYC6l76NZYYu8desa1XjBO5O4LikTNz8GJ2bFclUHw5wRHbzwyG1n8LrE8laZ7Ncxd+
	af4d9wYo9NBpaGKvFETgdbs5cYkFo3I0HrElO8c99g2OsPPthG3RYwsvMmO8MSfBgRH2pCqmSj1Fm
	UCf4Mx/ET0Md2AVsLp75ePY8X3EN5xrVYKy+H2tOh8EoF2mpwZkBQXvdVERPcwzJaLfPZ1sdynxDt
	kZzFzbl3URGw8zuEw//c70mpdvzsj/sSUsARv/A2jYWOkl0tVFJxsBo0hGA2tWOh3bYqbvKEoLm63
	IR2G4fFl5q6dySK8W3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAFC-006RKA-2g;
	Fri, 31 Mar 2023 08:36:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAE4-006QL1-2k
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e18so21584384wra.9
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfco65EqQfHZJxTK1kxWA78ZamfCWUWZKPHL0Bp1xH4=;
        b=SqOTTD4EeiNGBszaNOzDLqviTo9jI0ZhAKSeRT3l5LeAaBvHoV1VbnUiNYxQjrF5S5
         UUujdXiQCveG/Iy+PsAnxgkKeorfMhJAmQ2J1mYgkX8eg020zgf6nL/f/EExNZqkpRUx
         XcdDXQ5bnCtHLOcSYFcdnuXeE9b+QxZG2/mH1nfNDIA7j4YtTmk1Al3zY4k3rR5puTQU
         l2NatRLdUPmY31rjFWxbQkcwmbAI5FXvErZOPP+aB0G/SM/9J1u6rMIIFKuvCVysu2q3
         VMSa4Jt860AaDpWD2pjM4fb8tv0/a2sxwe3l0seQy7PhpYace6EYCoZskI6VrPmid9Ji
         W8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfco65EqQfHZJxTK1kxWA78ZamfCWUWZKPHL0Bp1xH4=;
        b=pn35N0Uf4GpD0DK8DHge+yFv6u4DfKOSXLVxrPtSjK1Bf7BkrABJlTa3FV7OyM8fqF
         q715ahXNPOQFstcj0mp6ehyr/LoSdK0ddiuox5ltc6GbMlkxUmbRMNMU/kOQE6Ig5Kda
         CNzGvsuA1Jr+ww4tKtHG/YNzkWhlLLxzDmbXpbr5UJtpMHxJhj2WmFp/E38xR6jIbC4C
         0RaktLn3+6xXpdzCUFWv7C2xcK380RN1AOiJx12FWatr+oBWkfSGHfcepVkDRGLIAuXD
         2rZC7gu4Zp11+XsGMXidA2nKkacuorXv3TUkM17LkVythwvKmJAEGOB2ZzOwjoHPi+YH
         FG7w==
X-Gm-Message-State: AAQBX9cEgEvsmqyF2kwk2duHZZZqySHNew2cObmfw+ECskxvm81GU0az
	JvlnShGk7BIzV7D17WFhREMvbg==
X-Google-Smtp-Source: AKy350YfLJVXZRDyUNg84s43q40a428Zli09J7iKvodwvFp3SatohdxhFRTG46DXiPWYNxkqIkfYZA==
X-Received: by 2002:adf:f348:0:b0:2d7:9206:488d with SMTP id e8-20020adff348000000b002d79206488dmr20315336wrp.36.1680251712356;
        Fri, 31 Mar 2023 01:35:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:58 +0200
Subject: [PATCH RFC 20/20] MAINTAINERS: remove OXNAS entry
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-20-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_013512_901620_9037DB2D 
X-CRM114-Status: GOOD (  10.33  )
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove MAINTAINERS
entry for OXNAS files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 MAINTAINERS | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d5bc223f305..c9a29d839ea2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2551,16 +2551,6 @@ S:	Maintained
 W:	http://www.digriz.org.uk/ts78xx/kernel
 F:	arch/arm/mach-orion5x/ts78xx-*
 
-ARM/OXNAS platform support
-M:	Neil Armstrong <neil.armstrong@linaro.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-oxnas@groups.io (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm/boot/dts/ox8*.dts*
-F:	arch/arm/mach-oxnas/
-F:	drivers/power/reset/oxnas-restart.c
-N:	oxnas
-
 ARM/QUALCOMM SUPPORT
 M:	Andy Gross <agross@kernel.org>
 M:	Bjorn Andersson <andersson@kernel.org>

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
