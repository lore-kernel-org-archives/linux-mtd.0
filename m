Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D98EDF17D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M8JAOwwV3Not7qwyZc416MSxsYM58aap6wiP9efViRs=; b=sLVXx1J6sNp5gg
	/t+YKilvbZBF6wOSCQSdGPd0hP/5Ul2tPOVGl7WXOkq9SgINe7GTDcI9QSmwPFmxbmzNVZdY9vDBR
	j+gzz4xxLpAvtP6kZMDHstFZxkQe5shL++bHfcDP9qz+bjCPIb3nwOA5HG80TQ1hwh+TkYYg5NdZB
	RvtukpA9p215ithOAPfJTDx84sNuk4G/XSOyTu5fty55pbdgjsNC+/SHVzxEHj4htgxiC4ZJ+9/1A
	c5zihj00b/gC/AgEun19Z19jSjtMhUBdTHdQN//fcF6sks6UONWm+M4XZd70Z19PTNaKhQ6QaWlWK
	ho9AJlG4Mo9rqeFOTBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwZA-00000003hyE-1pbK;
	Fri, 13 Feb 2026 17:02:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwZ3-00000003hx6-192o
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 17:02:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48375f1defeso6061045e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Feb 2026 09:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771002162; x=1771606962; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rG4oPbS8gPn/sjfnnhJ5zgROaI3cGQKDdu5g6OQ2Ops=;
        b=his76OGQV/a21D/+6cbMmIc4pZ1BIa7zzFnds/e1/kKClldyCOd52pilEvs2VQk5NJ
         4o1ZNGV1E5KR1JjbbK8Vgr4j70sQ7Af0SL8s88q7bDWETT4ghDBBI/BI6mLNrnonfzti
         F/b5i+iPiSSYOUzxX5jROikh+JB8Pq0KIqWq2y3Y2oqFB5lAVR1Y4PlXp58jZp4dfeS6
         g8XTvK4rqgYxp+YsOSpQzbmWHS2jsJ3d8fjZ48+nY9w/9PdWDjjokAbY3IA4dEAtnLEn
         QdNo5MI8NcN1F99mz1zYCsyCvAElyp4TkY7QN+Hr2ef5owHADoC7RDD0MpPONjKwhmS2
         u0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002162; x=1771606962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG4oPbS8gPn/sjfnnhJ5zgROaI3cGQKDdu5g6OQ2Ops=;
        b=rS+CY7cCTwInNY+2MO6Ri9moLM0wBPy/hYh7cGd996MSAoM4RUPJAvYe0FxJ22YdER
         Zz35XMq48ebjK/Gr/tMIFmMKvUVKCIWSfrHu22N3JEJW0WNz3O/wJJ0MutPBipnL1NoM
         10ZsY+3wfZfYBCe5DLKNiJ/HAl3PxcRDrc+02q3DgET2iLMuHzJgcQSxq0iO4AtqYIwo
         y/yBtKV/QzatJZcHzz7boBVNlBMHZj2eYXrlDIjaZ461IwlkQTCxPfSf2Tah/8Pv+bZB
         LM3D2DkL3o2o6KzBt0MG3v52724FuOBPmohKdpr1+2pRpZZMBG7hlVqZZwTz6RAfXf6i
         CO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWolXsmfiyo9ikqDS/0WrmdmV6mdOJFOFVfR4Qz5vrhuvk+GfWyQ5fToYaT3TExvkp+rAB8ZL9phCY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8c0j8KHsxGnwy8KLykidmeVvjHp0xWeXxm4VZuzIapG4pY8FG
	aJh/JUAWjJc86epmdjtYjleamhiZMJHmbT4rKFoHD4LwLOE5JTuFdFHZbNEDGM1zLYc=
X-Gm-Gg: AZuq6aLVSbVVnCVMusx1ufkIrFfO5r1g5Z2B+hFe4yc4zG3tRnLUmLeKRIcD/tFkjwu
	BLzTtlTYtMhirc851CSkJduSQfypJClPI8ft36DMLOdILVOwjyqpB54brcn34JrHPyQ4qG8L+Lx
	VDz6EZac/RX9nmOGFPZovu0NRfPSCQu+mkmxWzYQ8Zvfq5ssMI9XepmQWzBWQ0YPekAHPevjPdA
	IQVvo67xvodDkONdfQ6lx9LTXZUWDC/0VIhwkOQ7U7Mok/cY77Ziv0hGdEICyAwk3rAfiNe5MHU
	SS8o9kvM6GTcro/Co6elflYn6AM8rOshDBwgXbh7G22wLaV6QhTKADLbxx2EeBAjjCi8j/zP6yX
	9uVWzdKyQiw0yAXvItL8Pn2O/CBQrxKXWehw+vZDJjNsd222QtTybOtNq6yUhnh/cL+OuvjNBiK
	6iQMNYhAePGppv7Fq6v/GvTAak7gGpvfiMtkeBgWkq5KF2Nkn08aSesJo6wECk+TRZKO81Xnx3a
	3KAoVs=
X-Received: by 2002:a05:600c:4fc8:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-48373a1b6aamr41921815e9.14.1771002162211;
        Fri, 13 Feb 2026 09:02:42 -0800 (PST)
Received: from ta2.c.googlers.com (140.204.78.34.bc.googleusercontent.com. [34.78.204.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a41fd5sm20333245e9.27.2026.02.13.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:02:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] MAINTAINERS: SPI NOR: maintainer and reviewer updates
Date: Fri, 13 Feb 2026 17:02:32 +0000
Message-Id: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAChZj2kC/x3MwQ6CMAwA0F8hPdtkLoLirxgPZXTawzbS4mJC+
 HcWju/yNjBWYYNnt4FyFZOSG66XDsKX8odR5mbwzg/OuxGVU6mMK6WJ9GcYtSS0RTAXxQf19xh
 u/UhDgFYsylH+Z/967/sBWy7fbm4AAAA=
X-Change-ID: 20260209-remove-tambarus-from-spi-nor-8a57fc459a6c
To: pratyush@kernel.org, mwalle@kernel.org
Cc: takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771002160; l=1254;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=XXJlr04K3bdB8d5Hq4QNrY8M+f6i/d08oqumkz/93vE=;
 b=gqnuZHWcHh960qmSfg5kj4ItH/qUyNx46q2TuZLva00rESoEUPsFO4r2NUooA6QWY4wNSdED9
 XmquIyIpIxaBkeB2u/McZk8iRJbAMf/LPmyIBQ5bhIJedxHRzcPPnHd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_090245_379606_87EB66B9 
X-CRM114-Status: UNSURE (   9.11  )
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

Hi all,

This series updates the MAINTAINERS file for the SPI NOR subsystem.

First, I am stepping down as a maintainer for the subsystem. My current
priorities have shifted, and I want to ensure the subsystem is managed
by those who can dedicate the necessary time to it. It has been a
pleasure working with the community, and I am confident leaving the
tree in the capable hands of Pratyush and Michael.

Second, to assist with the review load, I am proposing the addition of
Takahiro Kuwano as a designated Reviewer. Kuwano-san has been a
consistent and reliable contributor to the subsystem. His deep
technical understanding and active participation make him an excellent
choice to help facilitate patch processing moving forward.

Thanks for the collaboration.

ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (2):
      MAINTAINERS: remove Tudor Ambarus as SPI NOR maintainer
      MAINTAINERS: add Takahiro Kuwano as SPI NOR reviewer

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
base-commit: ed26bd40df11ee438d623adc9c6cc2a7bf9c5dd3
change-id: 20260209-remove-tambarus-from-spi-nor-8a57fc459a6c

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
