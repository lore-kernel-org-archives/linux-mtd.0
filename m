Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34549C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VQRhj6oj161dvoyPgFFBKWZ6MF1C3kps8F8njm+2xrQ=; b=SdWfddCfqGwId0
	IGvFRSWI0pMMatYCBM5AZnwrXZnPhFU6xdrAuX9cld/flfOohtZI69kHsZRuCL4hTQ44C+0+j3CoE
	UWRf+rykGd5tnbxS17nYcUPMSMwzD+9hPhqXI65BsStt2zCi8IlaJKDm0qQ2fXTpcXuqf0H/dkn6f
	WYVF0TSeiwheOvueHUmpgYIQ/7DXz3xjMvjV7oPtpjqUYvMRMl+ZH2+BFQkN9YCG1278ou5+st6aX
	2XIyISwTkfHqJn5qR58Hxgz8VZ4zdAvEFeb4pQ+K35ZboUQ4LVO7w5JJwWY0SXw3rDdrNndiENR+Z
	yBLYGcR0MR42TILC3EIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRpp-0000000DOx6-2ilV;
	Fri, 07 Mar 2025 07:09:29 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRpn-0000000DOwN-3yM5
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 07:09:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso307548166b.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 23:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741331366; x=1741936166; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcBcclqOktLyLDuTPRZuapiSFs2PPDRarJuoClc9VI8=;
        b=imHpcYSICCL1/C09Lw0dvwTlaAGjtKIiLOfw2PwRSLBIvDF58URSaChCjc+w+nMaZR
         gPYDU2xVEj41U2euNA2vRprtV7fh5qXAyMfQl1qx8HhDCk4Jqa04nS2JY4UcIx+Cpk2l
         Qc6MCKciD8Bx7Lsh+TBFRHBp3UnN7pDnvucpiYt77QLbu1GA5OXuxTza6oKtMKa+d2mg
         /lUJzsZFqbyiXlJQZSIFT8PpgS0/UJ5QM5y4Cr1Tt8hsYuTmZdE/ajIHMHkyWT5XfkG1
         wU4maMe9s6gi4nIJJn2kTdzsRgqeLl7DpqnIC+VPxdsEsRdqoqrvKqqwWcAFIWp8dGuX
         wDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741331366; x=1741936166;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcBcclqOktLyLDuTPRZuapiSFs2PPDRarJuoClc9VI8=;
        b=EeKjq1FQ1vLlXU1mK/esbfr0dmKv5xQamrCdF0yKbGz+34Id3xPgJ4S82ytpW1M5ev
         XV9XXLITViBTVedYkQIB5PFXetQzZYxvS4PCvYJ00A877fesWyXvN6f8lTkuDqEnr52l
         8RT5iOfJ5pIpsiQV1xtQ21yLymHFVNvNuGTP6E1bVfMz1IAh6pNmJN3Ydv5kai73JhAV
         HQI+34arl9zLFX3EvOXVcNxCA9HgoJGdCGJptM7twzQvrAer8ildgVeWf9Pt4+baGRPW
         /OUzur7vVydOI2Rn8S8IHhzeA8GhKlj9r5dA+//gzJvXaCf2FAJevVS7OBzk2htY0f0u
         HkiA==
X-Gm-Message-State: AOJu0YwulCwEe/WT1nCjv/DgxciS4/uCzScPlkhWrV1803S14GAxX+XG
	OpyZoKYnYLkv0u36AWB7hIEDiJBx+Lft3cZP8O2VUQRjZNSOlmTHQU1EUMbrPm4=
X-Gm-Gg: ASbGncsTXYtDXxJ45+5gOQd/MYqxoVT69dtqLNqDa8Lk50bWrIx6IjtZJWIcJP8wWFV
	SjGYqXLN/VOVFnVMD+Ps/NeUYTlmmqXthKCYG6t2k2EMgvBpqmpxZKi2isTAOJrYiWUQK4U71IP
	299UbCOlPk4tQSSLQCNfXIgYFYhXJXwaMKdU0Ty7EH6lMuZQ/e+jACOjbqT78mvu/0lpURorc0G
	ei9lH92KapZxCw3d402FLaLsYFqPoePVsvfiMPcaY2oEslCFC2oEP/yVfSbqTZgmsnM/DxVSwwz
	uP9O+44peeC8m/a/z1/SftjlL03dxSpLEkn02kbD0u/+nb4=
X-Google-Smtp-Source: AGHT+IHCo6ZPdTrEbCYJtcGo9pfcJ7SsSYhpzKnGA3RQ+J45U/uHJyVBQkADwejp6EFhQ0vIQ5q7gw==
X-Received: by 2002:a17:906:4958:b0:ac2:55f2:f939 with SMTP id a640c23a62f3a-ac255f2fd66mr146177766b.6.1741331366131;
        Thu, 06 Mar 2025 23:09:26 -0800 (PST)
Received: from [0.0.0.1] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239735b58sm223243366b.117.2025.03.06.23.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:09:25 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/3] mtd: spi-nor: headers cleanup
Date: Fri, 07 Mar 2025 09:09:04 +0200
Message-Id: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJCbymcC/x3MywqDQAxG4VeRrBtIvSDTV5EuRv2tgTIOCYogv
 nuHLr/FORc5TOH0qi4yHOq6pYLno6JpjekD1rmYaqk7aaRnz8ppM14RZ5jz9EVMe2aEpm8lhA6
 jUKmzYdHzfx7e9/0DENiCt2kAAAA=
X-Change-ID: 20250307-spi-nor-headers-cleanup-e93740995eb0
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=574;
 i=tudor.ambarus@linaro.org; h=from:subject:message-id;
 bh=LTgmhF3yOudZaS4ugAkCxqqCzkuqv1Bqu3SiKsYRf4k=;
 b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnypuj4N1C585VWieVif6aB1d60xEr77nwfCkiU
 hoEi4uTfu6JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZ8qbowAKCRBLVU9HpY0U
 6d9WB/wLDyNAuBzjSrUuy8YbeSy3wPLoXZb87EntEFALxBUvLfVJu4/LdKjKiIr/OB5mnBJp2VM
 fAv5eqq1ukfAjmBXm+HMBm3ZfIiOptaEEBf9HitWDQZ2ZrbAZ1qfldhsgwNzAv6mP0FoJ+dVs32
 as+QwElg/2mNj3/YANxr2XEMRptIio5Dvz0y0948oP7SeFqx5SEAz06rzIR+suxABPafFG703fD
 petzNSllnfVyPbiPzRFXRCn+yur6p+IkNInLtOA6SkyVi+duxYlmFl/CDEYvsw/AoDkMmIo1R5T
 +niW5yqslADFAZqiBHRY1aGIXbmHI1m0PGZDZArpYbEGT4WM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp;
 fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_230928_001211_0E583CEB 
X-CRM114-Status: UNSURE (   5.94  )
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

A bunch of header cleanups, no dependencies.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      mtd: spi-nor: explicitly include <linux/of.h>
      mtd: spi-nor: explicitly include <linux/mod_devicetable.h>
      mtd: spi-nor: drop unused <linux/of_platform.h>

 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 93020292fea71d62dc9749745d8ba1b44268a2fc
change-id: 20250307-spi-nor-headers-cleanup-e93740995eb0

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
