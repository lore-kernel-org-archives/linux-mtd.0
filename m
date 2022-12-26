Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED1FC3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 04:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0TYvGot3/L6cE40qmegJQn/Wx5OzAD3roxXDql3RTrE=; b=37LtJRrEj3ChNz
	g88uc3lg9DR2jlU0VHphX48EtwC0/WcFDdAjA/SoezWJU4Y/Hgy+EhQWeE+USbIQNLlAaYRXBKEdd
	XIZdpnDWIvD9T7lMqqeinL3guOsT72U1RLRxmBwtHwUWCn6lrtA3y7H5MqKCKbxGu1vgzNhb7i1KI
	zXFLBN32rfJSR6LP+JaOIQnJsC5+4IiC7Vvb7k/DaojBA+Ufkr3pXDdGB9EyUtjyDNbRbpp6OIXBh
	7nN537TbCd/b4wSK9vsshuP5Ae2RE2VHAK6w0jVnhFK9vqF4vgJwAboHlmif8iFb9w6I+jsiFRbGa
	/zEI5QpxsyHAejVo8BXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ehA-001W1v-Dd; Mon, 26 Dec 2022 04:02:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9eh5-001W09-Bf
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 04:02:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id g16so149679plq.12
        for <linux-mtd@lists.infradead.org>; Sun, 25 Dec 2022 20:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jwifbPgSeaciANUFGztuHJlrOAc70Ajslo/w4lSMis=;
        b=cYJcWJ1i5CCs+ynyiQKo4aGZ7UlKwXEjVkoTEmVGcRJZYOc/v4bzxdD3fvMpSB14Jx
         zfN1WzOVjyH5Ii4B7/6ZPucLGDP4AUmyFxaWYQ7x8aCk02jzRRsgmvdmM02fWfIkHcke
         Ia+FX9bTVebA0Ru+XWGC+Plgjtb+hwyYjagTiX7n1HodbOxCPRqrY/Y4UNLJDmtfdWmL
         3M9y/eYLtpad9Ji6CxcBUFyxeTLJroUnyEBU+hLNbpkr23i7x/Z4upPQOq/lQShSd+Nc
         yeAlQVjT21JGJbosPsKmdmoUAT6Kr034E+7I+vCQtcLi4sDFibleT+UWdKjU5/uceKLj
         ZCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jwifbPgSeaciANUFGztuHJlrOAc70Ajslo/w4lSMis=;
        b=k5utD9rEnODFVeyH27GJyffSLTvIm/1kr9Vb0337kK3g2mLJ9nHvO44RSK4yP/fGK7
         yIr03cLHPlcwqX613Ek0t0agq3Np7bkZhKNOM7ONEIBBLbo072vMkG/NokU9lpNkxGvl
         gCnCJyl9P7fvuvSLKpsDrv5u4tBZRnkQO54Fv2Aw5VfUirEXtGPaj380aE1kCb1phS8/
         TrrTX84Le7UT73fGUsXSojpiW7FoCVDOe23ltFOiOnEg1t8is4hI5AOIE4HyIaIbjx2m
         CeE5BTQ0nsJH4e17K83CNSnGm0G0H74GmvQWQDSabYRXJg7S+nMGpHH1jUOXeUHg+OM2
         RhGw==
X-Gm-Message-State: AFqh2kq0+VSSJCRP5W4PkvzALPCFDKcDHmLtQ/gpH0S+G3VctTPhLzNc
	Xl2CbkDdMeugoUr5iz0jX2IFDo4znxU=
X-Google-Smtp-Source: AMrXdXtfTaCU+fwKDjfy91gRNuqLm6XJORlTEElQfgw/ah17GoMA49WzYZbVn+x0heTyYPGVaWtW5Q==
X-Received: by 2002:a17:902:8647:b0:192:549b:97c3 with SMTP id y7-20020a170902864700b00192549b97c3mr15972910plt.42.1672027349663;
        Sun, 25 Dec 2022 20:02:29 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b001708c4ebbaesm2641401plk.309.2022.12.25.20.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:02:29 -0800 (PST)
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
Subject: [PATCH v2 0/3] mtd: spi-nor: sfdp: Introduce SFDP_DWORD() macro
Date: Mon, 26 Dec 2022 13:01:57 +0900
Message-Id: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_200231_452025_960F37A9 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Existing BFPT_DWORD() converts 1-based indexing to 0-based indexing for
C arrays, and is used in BFPT parse. This is applicable to other parameter
tables than BFPT.

Based on a suggestion in:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20220912051317.2369-1-Takahiro.Kuwano@infineon.com/

Confirmed all parameter tables described in JESD216F.02 use the same
(1-based) indexing.

Tested with S25HS01GT and S28HS01GT.

---
Changes in v2:
  - Add cc: stable to 1/3 patch
  - Add Suggested-by: tag to 2/3 and 3/3 patches
  - Update commit description in 2/3 patch

Takahiro Kuwano (3):
  mtd: spi-nor: sfdp: Fix index value for SCCR dwords
  mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to SFDP_DWORD()
  mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for optional parameter
    tables

 drivers/mtd/spi-nor/issi.c     |  2 +-
 drivers/mtd/spi-nor/macronix.c |  2 +-
 drivers/mtd/spi-nor/sfdp.c     | 72 ++++++++++++++++++----------------
 drivers/mtd/spi-nor/sfdp.h     |  9 ++---
 4 files changed, 44 insertions(+), 41 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
