Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0216FC05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 07:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YCdomGOxfrkSvWlbdA9Zp2NRbop0xrW8cX3FlFp6T8=; b=Q6m1k2zMKwLUmG
	aoKxcb4vRUEjFY8zWbkN6DJyWk+THzIU6cqQYBkXExuSQUv4pZZesOmBnzdjR8Yp9am0ohQ/ODlkJ
	HaDTesaxL+6ZSiyHhrQHK2gLa0zXNJRiTmlGM83i68IRvELYNXLpD2EGCh7r99xIJfp6Zo8NSlpaE
	SBiRCsz52sRQMCwboKwQom0Mf/4GjH0fGpmhgs4TtVVgM3zEfsHq/fN84bnXntwz6pJ1y9H3+nrIU
	1iUqLVGZxywaVR1ljrvv6Ri0S4eiEuTsQoziOOH+MoD+EOHIASz+Yz/SFeZIiiRQay8wyYxbucTa1
	exGRAghH99jS1bQX21OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPeRf-00EN3V-F2; Wed, 08 Feb 2023 07:00:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdQ0-00EE6O-GE
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id k13so18179882plg.0
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZNoH5KCj5lZUQajU+gCDj9e7WO6prUbiznUwx8mhzg=;
        b=W7ydn0xbYcD2BXO71Zsr2+5fZDxAlZArqsj7ICoFptsfZLx0nDmcrfw7szcnJ5UAMa
         4rkmMN24Xhr3wnxxeRMTHDRlFRhP9WFYgaWSF/tG9yvmRygMtK/ZqVA7PpYAN+nmqVdV
         5xTBMgk/pYrlFzRwR3fM12a6iyjJes1SkXRPczDtSzm0GmZb/SAPY35E69goud2Hf3sl
         xDTQCzVAcMhsITf3K3GcleG4/6bNOb8z5RUD+ElW9Vz5wosqTPHJX0R7b2NSfk2aOVEQ
         u9lNTw9VefhUGE7PvxI6qaO0fEFp7iVf1YWXwDIVcO7XbQ2GK/+X7MGDNnKlLifmzAux
         Vm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZNoH5KCj5lZUQajU+gCDj9e7WO6prUbiznUwx8mhzg=;
        b=UhrXSwob2N3fakm2yFcXkF1GRpN8ciL2IBwnhoUaH7MHfqE//M08oeS3vkR+PgnSr2
         ItDLW4sU1MQyKdNAVrtRtGr8lpi4Y4516l/CSBdY4XTUQc2grcV3cj4pgrg8ciPW7tnz
         IKpMttzD6A7uQS3hHRtZBmMb3/285+sEDJ0SOJYXPeNwXNYDcb29YntmsPuFUF/cnwWU
         Ik6sCd1bGjYJHIQBlhZwEcXR/ZClVTlDKtF1G7PmQks4FDFsvXoOZYIBZIgL5h6JmVUl
         NUMEyh1mI6ZYBmu1DTkKgk5a4F1TkqIagb6/5Mar50mAiM4XTdwgxfnbn6CSr5MihzN7
         dRAQ==
X-Gm-Message-State: AO0yUKVRRT2e7d6Xp+mnWohp7OXElf+1yL46K42T3c0Z1rd1/5pgOy7I
	VR7TQiWDocQNh98pFOEia5qcV/3G9qE=
X-Google-Smtp-Source: AK7set/u1inJmXUFnhRdeM5THFIo4nEV8nsPMwlD8l15e2ITDOLSWrQZ1FFncK02EqAIj+snbgyKXw==
X-Received: by 2002:a05:6a20:c191:b0:bc:6ffd:c064 with SMTP id bg17-20020a056a20c19100b000bc6ffdc064mr6597264pzb.25.1675835693381;
        Tue, 07 Feb 2023 21:54:53 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:52 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 7/8] mtd: spi-nor: spansion: Set params->addr_mode_nbytes = 4 for multi-die parts
Date: Wed,  8 Feb 2023 14:53:44 +0900
Message-Id: <9006f197a4f0f287efaef77a8ff0935d5d7833fb.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215456_588845_64C7B3C0 
X-CRM114-Status: GOOD (  13.25  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The params->addr_mode_nbytes is set to 3 during BFPT parse in case of
BFPT_DWORD1_ADDRESS_BYTES_3_OR_4. Infineon SEMPER multi-chip devices are
in 3- or 4-byte address mode by factory default, depending on model number.
3-byte address mode is for backward compatibility for some SoCs. Since we
cannot access to registers in 2nd die by 3-byte addressing. We assume post
BootRom programs change the address mode to 4 before hand-off.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 45377566ecbd..33b44074f941 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -303,6 +303,18 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
+	/*
+	 * The factory default of address mode in multi-die parts (>128MB) may
+	 * be 3- or 4-byte, depending on model number. Since register address of
+	 * 2nd die is mappeted to 32-bit address space, we cannot access to
+	 * registers in 2nd die in 3-byte mode. 3-byte mode is for backward
+	 * compatibility as some SoCs use 3-byte address in their BootROM. So
+	 * far we assume post BootROM programs change the address mode to 4
+	 * before handing off, rather than calling set_4byte_addr_mode() here.
+	 */
+	if (nor->params->size > SZ_128M)
+		nor->params->addr_mode_nbytes = 4;
+
 	return 0;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
