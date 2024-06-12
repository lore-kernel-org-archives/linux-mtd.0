Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E72DC27C53
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2024 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov88wFjFDZXaf4LcwmSODJBg1uSP0++VqasBAB0oIDk=; b=ohNqxxVWmwGr4K
	R2X6eHqkG6SeBuEoH35CRLzQ4JgIasUepU8n7B/oBYDgyKzfSLCItEF5Npgp7fv+T+ybVAAtH1UxG
	dX0Uld8nvRCvofR2B6NsSu/4k+rfUXz/Sz8h85DOfjbG2Xj/+fu3l3evzxMp8B+OjtxtW3DgM/5ll
	VwxbjLbLpgPJtAdLf2ArWCGSN1Z7esIqnErGwmvG1gKmf23XZijP3XfgK2AhdYynlYgD5y8EVSSAP
	3tdaPJflGHB2ro9KSgabAdrIm0jZXkEPKp3flvgArfdWrC4T/uL/cLOpOEGSd6vvyyryhUQcgeN75
	ic44Zx3bcsEGngiABLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJJH-0000000Bhgg-1Y7I;
	Wed, 12 Jun 2024 08:26:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJJF-0000000BhdZ-1I3y
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jun 2024 08:26:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-35f1c209893so4069939f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2024 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718180779; x=1718785579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD/AnD8jYjxQt+A8JZVZ4x+a3sskE6EWblVU1rCcOAs=;
        b=ZNIum4RBZPtY8CJ4eLb0XU79/YTUzeCKzCur3igIULz2R6djQaRwWmRjZooRQEZSJ6
         TSeIHzf32hxAfmMAKwxqeSLxwDaz5luNAiAvw82ThsO6eTzuQxeypvW3T+CAvzxIUCZI
         +evRRySKVmsDo6vCFC/d3BfQJRHHvmcYMw91AA3WN0TINvZkIjfRweZpKDAGFX11gSoK
         NYBsz8/D5yvDxP6gVyI7mqUL7ODc/rSabIvySAtnRc17VPgM4gGepwJyzBSCuseE73wH
         jst9WU+cv5tnmo4huUdEcJs9imDTqkxdzM6U9W7OUiR/vq/O4CoMaMoUEF/Srb2ajDNO
         JT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718180779; x=1718785579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RD/AnD8jYjxQt+A8JZVZ4x+a3sskE6EWblVU1rCcOAs=;
        b=ll0t2+/USlqa6ydEIMw9QhcbtgUwQ/iPK3XATYPIGAeyrERZke2J87DoRdQw947710
         AA+3OosQeyAWDu8yQ94sVxV8BKpbUMkWnM4UJiiUujPr0nsTjMPGUWax0nCPCPQLzMXg
         GphLNPFVJ0KNVI+0mQuGY91wDSqwR4sOTBZtXhXiEN0rgs+AMGn9Kc7kOAog58/nToRr
         15KN3AxyAyy2EgJ2XyX7qJzRyg6+i7tviqXV9UBGL6s7IWCFVHuMCkpcck9tmQewXsHr
         vmqLraiNGuaB6NoyZYX+Ov+ZV9fWJceyuzEUut1NkjCskonp3v9wD/XGltB6dJchGUyJ
         Xmuw==
X-Forwarded-Encrypted: i=1; AJvYcCU6I4RkYOCsa0Kqq0Yh+nMMB5dCtmCMyJVde/MSfA5gK23A1n0cZ9aQDIC4I5wqQ8FGHLxVWkdz+6lNS5MDWoXtDFzgyIsr8B2Poh0yOQ==
X-Gm-Message-State: AOJu0YyzpE7/F98AVDlf5wXAzA+CxfEYiCmFAz8oxVjb7Spn00MoB/Ww
	oZPKIhTW1i181t+uM/9yAxc9VQTk7J3rMluLfjDW9rgkHqhUX4bU5R0WVIrP81E=
X-Google-Smtp-Source: AGHT+IErb8RFlvw6xH91ueUYnFs5XI7s0QBkhIDzPd1VcUWd7DB8bzcwthOaKdk+oT+Uq6R345A4uA==
X-Received: by 2002:adf:e6c2:0:b0:35f:225e:400f with SMTP id ffacd0b85a97d-35fe1c0a063mr870657f8f.30.1718180779272;
        Wed, 12 Jun 2024 01:26:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2d756539sm3702255f8f.90.2024.06.12.01.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:26:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Esben Haabendal <esben@geanix.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v3 1/3] memory: fsl_ifc: Make FSL_IFC config visible and selectable
Date: Wed, 12 Jun 2024 10:26:14 +0200
Message-ID: <171818062457.17232.8716946182820856760.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240530-fsl-ifc-config-v3-1-1fd2c3d233dd@geanix.com>
References: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com> <20240530-fsl-ifc-config-v3-1-1fd2c3d233dd@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_012621_375514_E199F4AF 
X-CRM114-Status: GOOD (  11.74  )
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


On Thu, 30 May 2024 16:46:36 +0200, Esben Haabendal wrote:
> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
> driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option to
> be selectable for platforms using fsl_ifc with NOR flash.
> 
> 

Applied first patch only, because:
1. I did not get acks for the defconfigs,
2. I do not consider stable defconfig as a hard-bisectability requirment, thus
it can break within one release as long as next is not affected.

The last statement is kind of not true, because next is now affected, so,
Esben, I think you should resend the defconfigs to respective platform
maintainers. To recall: arm64 goes via your SoC subarch/platform maintainers,
not arm64 maintainers.

Applied, thanks!

[1/3] memory: fsl_ifc: Make FSL_IFC config visible and selectable
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9ba0cae3cac07c21c583f9ff194f74043f90d29c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
