Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA969C77B61
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Apr 2023 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnO0H31mRXEaxZGTwRkeS4ShACDsyWWx3XAgs00DJ+g=; b=trIi2Ti32DdVzk
	TWuKF93xBgmdaoW8fbXdwRYtslgP3OVi+XAhKsQSksOM8+YWpnC/w9YQ4YKVK1abnKbOH4nIK4MK3
	hDImIvqqkCDjVVEWhBZ+h0WwV8OKUb6jfDnAR/qTwL+YJqDrrAyKitVpURHAjWQRYXuNYzb1yX+Eo
	Gmd4FJyM4TKVMYB8ZVIOyaDbhBb6EpQimd2pQAq6oMmIaBEpFC5NWBMuOsIfBXvKFPqIZow8clIeE
	kk+NWQhKGqSAkW/VfE70fp+gPKb1vWMnkqIal/pdkbiqyZb7bFxcSXTmWIrujaYMzG10BJqvAgNNC
	24ns4dbuo4xVCg0WT+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl2Hb-00BpiC-2t;
	Sat, 08 Apr 2023 06:42:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl2HX-00BphN-0V
	for linux-mtd@lists.infradead.org;
	Sat, 08 Apr 2023 06:42:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id e2so380027wrc.10
        for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2023 23:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680936156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO4lTAJ+r6rYSY7aBPTgFXojkUd0HTpIQju56oP+SMY=;
        b=GsmpByu6dGoctK/jQGXgdU/se1/ZgH6CvmZyiruBoVrGQRs1kmFm/dlyruR+2WuIyj
         cU2NIZmJH2jcoO7/eM0f7/PFpIg7J8o5zM6f5maYzp+V4PeYO4rZ2Awd776X/ZAUXN+K
         uLMiQ7khDvHYfOCfBOafPkxKcd48uq8QLs2x3a1V+cJSQmvv8bsNoAFyLDk14SGLDw4X
         HgCJM5OKbu+fwSVN8t/OKqbKwxE2Sr93+EqecNHN2cVpVUo5iv8goiX5SvcuHddC1neq
         jT/MPoR4YREZ3sRm/tHbBpe1KW5Uzd+ckYJfbSz6kiBZ1f2TDR+oJcxzUYlQIix2fWxD
         U8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680936156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lO4lTAJ+r6rYSY7aBPTgFXojkUd0HTpIQju56oP+SMY=;
        b=UE407oLLK/D4mVhXP0AmcI0DD8GIFbPAI7zRu23EPWG9kNV13p5ItBVCFcUh3xYmhS
         l1cJ1JbksoPoVFzMRvDttH4e6yefAgLv77hmvqIrgb7BdumevW0Kx3i7o15Enmw9su9F
         /H8E84QiWuVn6cEeeUAdcoPzOF5SfjuoSX9noKam9k+8tbDtqKmTmZ/kmziiUp7c4iW/
         /OiWqnuCzfa7bVm86HVUP08bZNyySkVDCiDh9mo3GfjRYiM2T3zugABwg3B2UAIhs1E6
         qKADi0uRP/y6BkFlhHCbyoraFRunfxLYKpKgvCYwAIO1Ggn6F9wbYWcO4XBGvrf3iA0x
         1LDQ==
X-Gm-Message-State: AAQBX9el56Yj6ysKI7uGkI+QhAfGBZx/g4QIJt7Lz7qtDNOdD0Q9IhIO
	p41aLqt1DHjVl2VEsWfPKkLrLJI8d7vRhlS3NLg=
X-Google-Smtp-Source: AKy350bJfqHkXSOeW8P8hU2iNOIJs1JyS2Vl3fxKCwQjVOTvkx6WqSjPg1c9/4MOqh9lDqzvTkslog==
X-Received: by 2002:adf:fd81:0:b0:2ef:1088:1100 with SMTP id d1-20020adffd81000000b002ef10881100mr557613wrr.52.1680936155723;
        Fri, 07 Apr 2023 23:42:35 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d66cd000000b002c707785da4sm6113045wrw.107.2023.04.07.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 23:42:34 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 0/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon SEMPER flash
Date: Sat,  8 Apr 2023 09:42:29 +0300
Message-Id: <168093614108.51189.18186049343123725945.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=Iv8u+9L0Oo7TCw+rCY+1xEknAzM64BJR8itn10hKJSI=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkMQzUF6g0SkPXeNIhVKGAeDbZoonTYGoGyQyZn boOG9JOlluJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZDEM1AAKCRBLVU9HpY0U 6RnaB/oC6HhLT5s9K+50MWaBXVlGBegxFEi58ORnsXJiA6kjSYXGivarbPrbS9xPfOLbdIP6uE5 9JLw3UV4QIJoVW73XTqepbGxK9seMQXCAsgAACW7nozhDaPXSV0G32vTMJSaSHmkPD9i/H0O+Kp JkRAM5oS7JwpZ64/GGhl2Ovqq9wwMMF8v6lSBzcdUgCVRgwp3ivHmF56u4jSHQPGQDOQ+Q4gCIC N+vB6KaBs2Tu+XNFosSFgKc3b7lGnHnM2EoOSjEG5/91WCiHG5bKdlPWQYM8S6e9JBQaRgq605t 1nXEecm2aVD/mBwg6eFWIDiZnejHyExdrJVdZ+uUSz4iiL8V
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_234239_349708_5488C838 
X-CRM114-Status: UNSURE (   8.80  )
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

On Thu, 06 Apr 2023 15:17:43 +0900, tkuw584924@gmail.com wrote:
> Infineon(Cypress) SEMPER NOR flash family has on-die ECC and its program
> granularity is 16-byte ECC data unit size. JFFS2 supports write buffer
> mode for ECC'd NOR flash. To activate it, MTD_BIT_WRITEABLE needs to be
> unset in mtd->flags. In this series, a new SNOR_F_ECC flag is introduced
> and fixups for SEMPER flash pats set it.
> 
> Changes in v3
>   - Split to three patches
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s28hx SEMPER flash
      https://git.kernel.org/mtd/c/9fd0945fe6fa
[2/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s25hx SEMPER flash
      https://git.kernel.org/mtd/c/4199c1719e24
[3/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for S25FS256T
      https://git.kernel.org/mtd/c/a9180c298d35

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
