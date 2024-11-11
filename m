Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A12D2E9DE
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pyeqlbgu2dZaGAjUJAcjOVDTnt6saPYPUAgoQtZPdg4=; b=1v+appRZjtm4li
	v2xTWKZR6rBNkdbbtrSsouIBy3lFzxRzEdvMNVh8ahjcKMAr9+00ihUXq05FgSmpOCXfxvnekoq6l
	ekLYZe02dIdLLu5kk1xgr/GpRrBx49cGELdtVvPtm9v+1EzLFFk0BOI5fuk9z832tPIZV039KvMaF
	Jkm+NJrja9RFwwYS+sO+96B4dQNDYN2z1BgsLROnzUSS4vITdbHCzV3Cv9zJwsyGIOXs72y4x6Td/
	6ypB9SpskPx9gzrO96SrkxPZYb3ROh+VoMHmLLuNNt3XYRhGJcgVQMbIryoRlDm3+jSbSyL6/FRpX
	+p8lozBqJRyYVPUFJvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASjf-0000000HUEh-2lDH;
	Mon, 11 Nov 2024 11:37:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASiN-0000000HTzs-2RyE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 11:36:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso4219117f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 03:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731324974; x=1731929774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wY9o5kHC59ldDXNBq3Gky4O4TZiiwUsXswCh79e4DM=;
        b=txx3iM/+ghhrQZ5Efh7dJHTTwhsvXxuDyvheCIxxGaJx+H09C+1UusTimceq+pkknn
         huSqNgFBocUoA+ZEEbEycCTEfHjulp/SEbCprKDvLlLtAjn0Ci5UUN0NGnkhtWwBmA9N
         D/zrY0/XPTJ5yhC8Aq46H1WBJdVrZWz3Bpsdpwleh9qQot9Ig+vfOrkaYkrgPIi6N5Wh
         NXyWno0m0NnkA0HLCZmoRwUKHs4uDRjyIa1xCAfoo/3H5lyOXVYNzVwsZiPLg8EYnofr
         JS775YHdDIcWN5O55TQlTVpzOnhN4a1dr2+JLnyYgObhcBGwQkFRcjAynK5mLTF0z7mx
         T6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731324974; x=1731929774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wY9o5kHC59ldDXNBq3Gky4O4TZiiwUsXswCh79e4DM=;
        b=npQt5pIFQ6cXxAZ8RtqFG4dc38NiJY/edIWO/HvvEdqrCs29gfVwDaYSLGZhWaov3T
         jKwKaiLVfryRKQu+HBT2JxqVdzUWk9JL1mQS+OtrcXlTWIflb11X/6hWbAwmfGQZOx2F
         8oIAiV7vdHpQees4TTOi5brgFkVqMR4Fc8Er6k92ZHoxnh586dHjqYYsvGtSjiSq3JTy
         ZoBktqMxRveNrVzcyWvOJoBjjo08FQFNR4A6oi2ebSDl5JT3Wv+FPPWsXKohfk1ej13e
         Hd/lp9wvHovVGwSErY/jX/FMRXW69yb8L/qBTI8y91FE4Xh7zNsV3H0ybrmfeYch5HML
         vXVA==
X-Forwarded-Encrypted: i=1; AJvYcCUgZAxrxGjkqDJLOlXdhPyQGefwBrP/ainYL09K/qsnLZH2+QUNtUXNTbe+TFfWiLkcTbGGIIiBtRI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcVMA4rP8IOEaAiGNB3aDP1WMwk5IUdgBkgp5UxA2SfHXanBYJ
	rQgf00qeEnjY2KywFFJ/38UsGldSgYnwymE6g6+eqV6Wa6arVrEdWZJInzqZFvY=
X-Google-Smtp-Source: AGHT+IE6tAy74N9OIqvP/VA3FCkS1J3pomW4FVro8EP9Ga3hGZTeODklr9RFOwmWgEQtDqjmYHSElw==
X-Received: by 2002:a05:6000:1fa1:b0:37d:3e6d:6a00 with SMTP id ffacd0b85a97d-381f1884805mr12220915f8f.47.1731324973682;
        Mon, 11 Nov 2024 03:36:13 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5d1bsm176266785e9.40.2024.11.11.03.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:36:13 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: alvinzhou.tw@gmail.com
Cc: mwalle@kernel.org,
	pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: macronix: use nor->addr_nbytes
Date: Mon, 11 Nov 2024 13:36:09 +0200
Message-Id: <20241111113609.12093-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=tudor.ambarus@linaro.org; h=from:subject; bh=WaefXHlt4BBEBmkcWMW9vgf9mUVaS1KSQwwwmgHZFzI=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMewpec4heVFALHnX0lAGLh/i7niDqwQauXdeh CJ12ZKIEamJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHsKQAKCRBLVU9HpY0U 6XlqCADDgS4/IL3FP1bzV3Ut85jXx8BzXL9Nj8YBiY5W2a2WK8tomymJKTO6alevUzYUeaCMwre GnOgMjtYS1abMKIZpmohDeNy1GRikfpYWB4LVOzd9DMhYjj2w6afL4q7fFJeLV3J0Y6lZ+GAyKR X3c4XNxwYidZZ6+Q+stI6vN+WDiZzNsJktU3xI4r8VE4yPLmfEGiTqiBcwib6qc45ErwkY+ljwF /JjrH1pyWf6x8hGlTSZrHVB/R0R7joxkm1f0sJjmyD0ws1Tc4r1z3ktelH3e0nMlmxjVxHtd9d2 vFp3yufLxF8F35H7C3gxgst6aE107VVuKWu3Lw/eJ+nCJOUi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_033615_662260_866B2312 
X-CRM114-Status: GOOD (  10.30  )
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

Use the nor->addr_nbytes set by the core, we shouldn't use
magic numbers or states that are not tracked by the core.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Alvin claimed he tested this patch at:
https://lore.kernel.org/linux-mtd/CAPhrvRQrugRQgQcdHBdwid3_sUkCm0mZL9zhz1=TYzXg4qUTfw@mail.gmail.com/
Though a Tested-by tag would be nice. Thanks!

 drivers/mtd/spi-nor/macronix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 830da21eea08..57a40fa70c6a 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -230,7 +230,8 @@ static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
 		return ret;
 
 	/* Read flash ID to make sure the switch was successful. */
-	ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
+	ret = spi_nor_read_id(nor, nor->addr_nbytes, 4, buf,
+			      SNOR_PROTO_8_8_8_DTR);
 	if (ret) {
 		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
 		return ret;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
