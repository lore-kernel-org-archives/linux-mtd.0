Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F41C54E5D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uHUMczR59dn6nkHK8dYZJ8W+C0p0YWDLbq+YYnINyig=; b=zd7Mcyz2oysq3/
	DpBdz0o+LnoyBFdvTrfh7kbUY6jESM49yfZtJ4358UZsp1/hmEXyukLF+HGvzY3nkMtXdfrY4BnFw
	T10VpdD3MYxXHJfSxh2XRkB1T3UfGiZDb/0mBOGxgF/JtdzMAhqVmQLjiCiTMrgN6DXAPXtPT4e8E
	ixeOCEI5Gj41kKHtDpwTgCmUdPZJjXmPuogxwEWn25W0CpCHNJPACULAIlSp16h8n9Oji2wGI52qm
	eXlOjLJIdGBkCPWYFs7bFpv5s4BXrasRKBsZbIVBqbRt9U0SJ/mljnb1c8rRZ23BhPE/jdQF002JR
	3BTtltSBmvKDCzRvY1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVsX-0000000C6qe-1TO1;
	Tue, 19 Mar 2024 09:35:29 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVsT-0000000C6pU-0MWz;
	Tue, 19 Mar 2024 09:35:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so3125594a12.3;
        Tue, 19 Mar 2024 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840921; x=1711445721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=32AXx27SSzTCLszDWarNun8O1zcaf1jj0VawsZbBOHE=;
        b=Sk/Axg73nc+0G/R8+t+KlNkUPnw4gzlB4ozafC5UzeSJ4lcZVxlmDNexFYIoVp6Waz
         rp9hU44lcJVAcVqyeXqePpKDVGp2Vf7jHNvm9kZmKYy9MdAI8G91pnUl2FPWesQWhghX
         CW+GUCNaJxR2HV0fI6sTvp4w3xYz16pCpEy/hL4DroJHlSkasFLhcyRc8bezu8XNO6EB
         ytXoArtd24uh8ZSzh2aYFhtwSkkgp/0am8RkY757R4epVb9UxoCaaZq59480Od2jLFws
         QElUCXlwvjTDzMmKL5oRV2J0ti508W0GpB1JuaIyryUKXVKz5ejo4mgj5HJgJ37LyX/1
         bsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840921; x=1711445721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32AXx27SSzTCLszDWarNun8O1zcaf1jj0VawsZbBOHE=;
        b=eA2PLYSoEe1TsFtPcZuVCPpwY0/GO0hB3C0drAIIuHnAM6IgFZohYIp5Me7CvqfXo5
         lIJCNBRSfTqgg9jdo5opAV44cl3kRT5EEACCg7AhjkdGT8wpxgp+hp3gzxrLPy4CvMvF
         sLErisj5Z/NTL2vJhYiHzbLPpjqifPtLdaqf2a+RlttW/psDdAwFLNmlFKj3/Ejst/Ty
         ztA2itC5ExGDKVQSyXm7fIYYqvr14IRZHomj/u6QMAYssmsR9KpcLmn4WSuHV7uH+Jlm
         Kb9KNMQ9/FVzjTdkmE0z0d+kAYOe/f3NX3lBqVoI5ayyLp3y4xcy12z8b6HdoP44ceuk
         eoRA==
X-Forwarded-Encrypted: i=1; AJvYcCUvA9fm2zW4SAHrPOjMGNdHdqHVmHCbJc22oJrOMk55wv+tfKqG7TqCowHhrFKbQk/7qYuLByQ6cr2R7lg8uv+QYtEZN0YU8fdf6mG5dtkNIAxY/0IZwWMkhUQ5Vm2TtZGP2SXF6CgWn1liH93FKmNsFkUu
X-Gm-Message-State: AOJu0YxIYS/E8z42+Xd+vy/gi3x3b1vdeN1phH/7hmLg5+D/CDokgSAc
	KNla91zvtSQ7X2UAJM2782n2t+V13igOL99llgdN/h9hiM79NJoH
X-Google-Smtp-Source: AGHT+IHDM7HsAh3M015ITHV9MavYe4suAIxVy7uxIJgbuM/TKnaJlg+0UVSfSczJwcMqkUErwsaA9g==
X-Received: by 2002:a05:6a20:d49b:b0:1a3:55d2:1489 with SMTP id im27-20020a056a20d49b00b001a355d21489mr2341521pzb.7.1710840921367;
        Tue, 19 Mar 2024 02:35:21 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:21 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	manojkiran.eda@gmail.com,
	jk@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/4] Add eSPI device driver (flash channel)
Date: Tue, 19 Mar 2024 15:04:01 +0530
Message-Id: <20240319093405.39833-1-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_023525_258747_191CDD2F 
X-CRM114-Status: GOOD (  12.91  )
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

Hello everyone,

I'm presenting a revised version of the eSPI device driver patch series found at
the following link:

https://lore.kernel.org/openbmc/20220516005412.4844-1-chiawei_wang@aspeedtech.com/

This update addresses the issues identified during the review process.

While the previous patch series attempted to incorporate support for all four
different channels of eSPI using the ioctl interface , this new series focuses
on upstreaming the flash channel (using the mtd interface) initially, ensuring
that all review comments are duly addressed, before progressing further.

Diff between PACTH v1-v2:
1. The commit is split into multiple commits as per the review comments.
2. Explicity renamed the driver to indicate that it only support master attached
flash storage (mafs).
3. Added new kconfig options to enable/disable eSPI mafs support.


Results:

Successfully conducted a flash update via eSPI.




Manojkiran Eda (4):
  Add eSPI device driver (flash channel)
  mtd: Replace module_init with subsys_initcall
  ARM: dts: aspeed: Add eSPI node
  dt-bindings: aspeed: Add eSPI controller

 .../bindings/soc/aspeed/aspeed,espi.yaml      |  94 ++++
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |  19 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  20 +
 drivers/mtd/mtdcore.c                         |   2 +-
 drivers/soc/aspeed/Kconfig                    |  38 ++
 drivers/soc/aspeed/Makefile                   |   2 +
 drivers/soc/aspeed/aspeed-espi-ctrl.c         | 197 ++++++++
 drivers/soc/aspeed/aspeed-espi-ctrl.h         | 169 +++++++
 drivers/soc/aspeed/aspeed-espi-flash-mafs.c   | 467 ++++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-flash.h        |  71 +++
 10 files changed, 1078 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash-mafs.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.h

-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
