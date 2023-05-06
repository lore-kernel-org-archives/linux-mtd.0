Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B488C7EE2A
	for <linux-mtd@archiver.kernel.org>; Sat,  6 May 2023 15:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+t0dpTl3odV7leTq5YJMny7XAKdDE+RHg7hFddrE1q0=; b=Oam7EaWlux4E3K
	4cQybqIudzczoYann9f/ZD7oJTY1pMJXFhWN+r2TPmxptebz4NJ480MrTZEQ7jVKdHEpf90Z9zQyk
	vfykbuP4+jZlOjs1JxgX/JMeldgsFK77WXb8pVymp9UE3z/E8xl2hS2MkhXi33i8p1rv5RiLX+8OC
	AnU9X7pretLEJIKOvdVGwqIDBkqM23Q6o9MPGxrd5RBh4GdS/spz+i/fuWWh0M26zNEgTVXiCLMPi
	tr21mqKzZf+V7OgHE0THZRGZ/cor1sKYf58o9jlLFjp1o2vcho7IL/kRr1fS9R5LWXe9imDjgLnIv
	aa8FILgPW5oVNIaeDWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJr6-00DuHb-1W;
	Sat, 06 May 2023 15:29:52 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJr3-00DuFD-0n
	for linux-mtd@lists.infradead.org;
	Sat, 06 May 2023 15:29:50 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ac7c59665bso33551771fa.3
        for <linux-mtd@lists.infradead.org>; Sat, 06 May 2023 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683386985; x=1685978985;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8hWHGuwmr5mvcRO9xWp0sVfGZwfYtl73f18uwHlJMc=;
        b=mNiQ0UDS2BUcvU4LntQeVmsiQUODFkPh8PySaX6ucBq7F5zKYFGH5BIL21VYHsS/Rb
         Ad5fGY92zFbpAHSC72PDkEukkm0w6dfI8dRd1g82wyUJu2Z3Kx7btxOZSpUfpiylCGi+
         RKP2R1pTVir2VeqCumdztRmrt3CV4ui0t6GVMu7B4E6JDFYM7hRR85TjzWdaU154eopl
         BrB4meyYy2XHysDZBB0CMAVgGR9NlI8G9v1faKidLOJqS48ZeD6SEXN2lD8SqHnBITJW
         ddbCKpkw03apGuuPuM3UMWMQ+dX0CCi9WFyL0p/hM+g2uGpTzWAUQAt9MAAMPGKmk2Ja
         CAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386985; x=1685978985;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8hWHGuwmr5mvcRO9xWp0sVfGZwfYtl73f18uwHlJMc=;
        b=AsjskA/smSFJQZTgvlBNU+4gvQuzHEavZOHBZcmFceM743fTW41EShtG4icHGYemwe
         PZAyXQJI8c8MhywGE4BGlQGsNlxcozCuWpaIiECExK9cdYMKcIDcl9YygmD1FiUCyErA
         j83oviuv9qu4Y1zJelgkxLE7VkkRD3B84z6pW+VPEc/ZqmT7uH1SCp9RlUna8yGfSg84
         5XDfzbAfUXUAx51kj0L6S/u1ZziIRMLM51P00JWPYSSnjpNkNMqpsdK+Tt6kPwA24vwa
         dJSqzk1Qe63ZE0cyEjtjx8QA7nydglA0ABxDQZnX9uF5ruQ/L17s8U48rBwe3flD0J67
         Pq2w==
X-Gm-Message-State: AC+VfDyvvypT5jF6/gCvTJqfDAaImndfZvVU/U1RrSwLV27bl8MISLS3
	wzjowtf5/vMJa3gCxU4RkuXKew==
X-Google-Smtp-Source: ACHHUZ6miK2s5Xpjs644BMeWUfktmkUFGbsUk9aP5jX14WBNbOM2Oc42j/yd+sDB4hGnBVdj/8QJVw==
X-Received: by 2002:ac2:5dfb:0:b0:4f1:3ef5:35a6 with SMTP id z27-20020ac25dfb000000b004f13ef535a6mr1250503lfq.8.1683386985531;
        Sat, 06 May 2023 08:29:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v5-20020a197405000000b004eff32d6a21sm680814lfe.121.2023.05.06.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:29:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] Add SEAMA partition types
Date: Sat, 06 May 2023 17:29:43 +0200
Message-Id: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGdyVmQC/0WNQQqDQAxFryJZG5gZ0dZeRVxkNK1ZdCqJiCDe3
 bEbl4//Hn8HYxU2eBU7KK9i8ksZfFnAMFH6MMqYGYILlatdg8b0JZxJF1myaxib4Lx/xLZ91pC
 zSMYYldIwXeHtX+Os/Jbt/9f1x3ECx3j3K38AAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_082949_390708_26B8CB3F 
X-CRM114-Status: UNSURE (   9.18  )
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

This type of firmware partition appear in some devices in
NAND flash, so we need to be able to tag the partitions
with the appropriate type.

The origin of the "SEAttle iMAge" is unknown.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      dt-bindings: mtd: Add SEAMA partition bindings
      ARM: dts: bcm5301x: Add SEAMA compatibles

 .../devicetree/bindings/mtd/partitions/seama.yaml  | 50 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  1 +
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts      |  1 +
 3 files changed, 52 insertions(+)
---
base-commit: caad71e7d226920623d78be2e6283516decdc502
change-id: 20230506-seama-partitions-b620117b9985

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
