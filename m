Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AECC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6F260F93
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E6F260F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgx1QGgiSQc9AbxY/ruTnr5si91YYpngH38A9Rb0AOA=; b=ALr5rHAY9fGe1o
	yxOUADIUIlwxiJQFRacDsaPL07GxISsullSaLhNJaukm9YIvTodvy9hj99gSd5x3DaZ0PcnTNgqgg
	2TzpF9bGNEWRIPgnHuv1g5dGPO6k7/r7As96MuIbU8I8IDr2Jzt31OxeQDskfa7I2q73q0pSDgx7i
	0gcbrdSEahjr1K8TkW1r4PDyZ7NUxJQLHbENXHlBE/pwH0sudyZhve/55FvH8IL4Ai0ZD6pFb/Ila
	ovrI1fcsQWnLUkMN7oE/NVWJCVMOdQGs+egfI82wx7lIShcJtksL7XkFeRQKVosf1ibbiluAkg6TL
	YfkWq6X5M1Zp15RcbojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJN7-001mX7-TJ; Mon, 20 Sep 2021 13:30:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJLg-001lwI-GB
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 13:28:46 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 31246402D3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632144523;
 bh=xU11jaLpUDnoKTVDhNl4Nnz5+4KkmeAKnf0UgxOYDK0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=qpLyJV7Y0LSL5eudECtLW4MNYCGwrihUPQDBdZzGXMPK2cbE93Jm3mC4Uriu9v8zp
 INKVkl29hARV0ZbmF8mdPrSRX35SHhxt543t1ooj9E60WCz3JT/Px94ZJwOztq3CkV
 v9hXY1sKcSSU22fPqQby64XhDnzWPHxRs+qBmdgCnovM9hHP0RB61HxxAypBwIs9yY
 Ud0tKFGS52FjKm4c/s8v3dekKCPFSPdS0dzFdRmGUdiaUQpxCUF7uUsMhnqiVG8URf
 AFI93K+nyfPE8VcuuaAXE1DT4xc0UEYhet/ZG/M6kY+4EROwPZCrgZa9Cq/+N8rnpe
 Q79kPZ1j5q24w==
Received: by mail-wr1-f69.google.com with SMTP id
 v1-20020adfc401000000b0015e11f71e65so6094517wrf.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 06:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xU11jaLpUDnoKTVDhNl4Nnz5+4KkmeAKnf0UgxOYDK0=;
 b=itKh2wmdxZUuk3btPwEhooV/SgD+EXOGwev1KhF+XVw4Ni4Tf9KWceKlHI9cdeIJ1W
 62ASsEfGOXNzBDMGF8pU45mXtKhbWMoQHewz5Ye2MqWAv0mAzM1SF7RUUFJh9jqbWeew
 gJNN71Pilz5/LJGelA8/+dnPbvSHwrq/5Cx3hgnmIzyIQl7PeqKIZxyyb+askpmp6+8X
 SEpkU81YMDZLtDx4oqNDYqyE4+ECzrhdhkp+q1fRXKr+mAZeIe1NPNqLSP8P4+w0BeSb
 YyfW8EqLzbTHVshTP2AvzYFDlPeRUystmKXAMWzfT8VHQpMRAMUYBBlHPWcMyMUvrOKX
 KRuw==
X-Gm-Message-State: AOAM532SgZSG6XbTkkCxXL7w5VerWVSj5MkOIXjVPArKjm9/uHsWFfdD
 uSMBQNOlVgqnvVpj2Jdf2K9kYjaFm1OWI8Ksxtht2ywJDtLZmRqJNRSTpYd8dG9mxRUuSCQFoDV
 ZlFTttzH5xmo+Y2/riL4TYVLmKn0SlgZjdcMZKzzD4Lk=
X-Received: by 2002:a5d:6750:: with SMTP id l16mr28083261wrw.174.1632144522869; 
 Mon, 20 Sep 2021 06:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+pvMcumgoT0ttERKgbkMAho4kf5IhwJqGeJAFaoWilhZCuHSEktQza8Pbu9In5bxiX7pNmg==
X-Received: by 2002:a5d:6750:: with SMTP id l16mr28083236wrw.174.1632144522688; 
 Mon, 20 Sep 2021 06:28:42 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g1sm45429wmk.2.2021.09.20.06.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:28:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/5] riscv: dts: microchip: use vendor compatible for
 Cadence SD4HC
Date: Mon, 20 Sep 2021 15:28:30 +0200
Message-Id: <20210920132830.152802-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
References: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_062844_735248_D7C9C4B6 
X-CRM114-Status: GOOD (  13.22  )
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

Licensed IP blocks should have their own vendor compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 55d86b078c53..7948c4249de5 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -263,7 +263,7 @@ serial3: serial@20104000 {
 		};
 
 		mmc: mmc@20008000 {
-			compatible = "cdns,sd4hc";
+			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
