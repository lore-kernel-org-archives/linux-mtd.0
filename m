Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B32EB64DC
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vy/4fu3oGb6ucKAxv6Ewq1jfR/RRprZOloI7zBPbBRM=; b=IYrPeRzRJEpY6D
	ntlLyTdiQkMGrwLZeXky9TY+hfGUaR2WML3L+PtJDMC7AGQOCo28m9ZG0C4JpfGfzGJcqP1cd1Kkr
	MxNeRuIkJBDfkE/orO5nBeEBUzuIKySEi+BD6C2IPQ1lAWrRRk5SjOPKjje3Mjpk7SHq1KvkRarvH
	fZXQWva6b7tr8l+EXGqZfB8zuYtnqaQ71rbiFkN0qfqaQPCogGUW3eCtnoaXi77hzCesynn5vH0Fs
	1W/I3MCMfd+BaHu7XzhZLemyzfa4MjwIPDkAHbW1qqAEmjE70609UiHJJhqxR0zHVtw5e2bP48uWJ
	FiDduLhGzvTn9Cg9ujbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKcpE-008Q2V-11;
	Sat, 15 Jul 2023 10:48:32 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKcpA-008PyU-1a
	for linux-mtd@lists.infradead.org;
	Sat, 15 Jul 2023 10:48:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-521662a6c9cso1676952a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 15 Jul 2023 03:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689418105; x=1692010105;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn5C5YBsaSogUUgEp4dzGB5xBo5qBNnix/jnrz9gqkM=;
        b=fDx9RWHqR3WdveXG/OlDdrTexq4fbNMPt2ZBSoL0Xwa6tCqLAuScCyfOnhhX1ac0ts
         ysauNt9TuGVshmSJpp5FWmLJP1S7eZv3nO5o3BkKAlr9SWOY4qDMxuGQTwjL9Ne5lEZ3
         vF2k0HrrOg5DSsIuQFpsnjMzvuJY1zJE1a95jfDi33rLE/Ohan1/JiD1h1Izom+IFNnc
         pvuiC0DnrG/+ow/XT250CZBIS9DlpHVnyCHBKFn2fTETBQPFuWbs4sCGk3feLD/NENCw
         Kh1Ms1RYHTE/kZLsebUXxFSmw9KEad17kJPeKU8q/wG1Xstw1s+uZjp1OXzZA6aTpAWp
         JYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689418105; x=1692010105;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rn5C5YBsaSogUUgEp4dzGB5xBo5qBNnix/jnrz9gqkM=;
        b=fJlI8t3deaJlCJXpw5cddnZjlMfMfWndVOeFRJJTI6SJ1OiG5trYXRG4bQGtBmZr/K
         P2FRE6EjFzIfDy2S4enUIkJ9e6KGAQBV3C5ZAHzNCEYKxDwM2mv5OrRs8cA3WEdfR+to
         GJgzm8ILBBhx41FB/x7RZV4crNXsP0SuaAfr2KEv1fvIFRwdoE8BMKRU3Byc3rsuzpW8
         zNU08paKLVh2W13wB5SfQ7ZAQtOzjy26NcJn8c33EMZ6CPszefvFG9dxps3acfz7cK/B
         xK10etG/b1uu0wEqd83acHKMo2cY42mSOIDHWlTyhVBmvQ/gI+zvsd7S1oPESgHszp/m
         yanA==
X-Gm-Message-State: ABy/qLbb4v4B41V0qZQ6wqMW+bxjf6K3HhTfVFyJAUlNL1NnVTCb4mnh
	7WkhMP3SXnUB7NZcumgVbb4=
X-Google-Smtp-Source: APBJJlFwpbjDxF/L0eWHgxk3zF1ODVea2/iA4Nkl2naDwD6iIjyL37Vd+GItE2wutNZVuketriyBRQ==
X-Received: by 2002:a17:906:6884:b0:988:4dc:e3a3 with SMTP id n4-20020a170906688400b0098804dce3a3mr6496371ejr.31.1689418105356;
        Sat, 15 Jul 2023 03:48:25 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id d20-20020a17090648d400b00993feabdc6asm6642782ejt.157.2023.07.15.03.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 03:48:24 -0700 (PDT)
Message-ID: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
Date: Sat, 15 Jul 2023 12:48:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: mtd: nand-controller: add
 nand-skip-bbtscan and nand-no-bbm-quirk DT options
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_034828_551711_3C1AB47A 
X-CRM114-Status: GOOD (  12.03  )
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

A NAND chip can contain a different data format then the MTD framework
expects in the erase blocks for the Bad Block Table(BBT).
Result is a failed probe, while nothing wrong with the hardware.
Some MTD flags need to be set to gain access again.

Skip the automatic BBT scan with the NAND_SKIP_BBTSCAN option
so that the original content is unchanged during the driver probe.
The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
the nand_erase_nand() function and the flash_erase command.

Add nand-skip-bbtscan and nand-no-bbm-quirk Device Tree options,
so the user has the "freedom of choice" by neutral
access mode to read and write in whatever format is needed.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Previous discussion:
[PATCH v3 3/3] mtd: rawnand: rockchip-nand-controller: add skipbbt option
https://lore.kernel.org/linux-mtd/1618382560.2326931.1689261435022.JavaMail.zimbra@nod.at/
---
 .../devicetree/bindings/mtd/nand-controller.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index f70a32d2d9d4..ca04d06a0377 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -103,6 +103,19 @@ patternProperties:
           the boot ROM or similar restrictions.
         $ref: /schemas/types.yaml#/definitions/flag

+      nand-no-bbm-quirk:
+        description:
+          Some controllers with pipelined ECC engines override the BBM marker with
+          data or ECC bytes, thus making bad block detection through bad block marker
+          impossible. Let's flag those chips so the core knows it shouldn't check the
+          BBM and consider all blocks good.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      nand-skip-bbtscan:
+        description:
+          This option skips the BBT scan during initialization.
+        $ref: /schemas/types.yaml#/definitions/flag
+
       nand-rb:
         description:
           Contains the native Ready/Busy IDs.
--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
