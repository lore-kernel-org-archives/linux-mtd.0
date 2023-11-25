Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5565BC61DF4
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dfWHczSHZb2M5caU3vSFyENJ5UswpKRYfy5dM/Vj22M=; b=RYFh8juTMNY5SZ
	Hlgz8IMWf7e03rXsp7GCyzlimN+g8O8HI9VNZo//4VHWo++O+DPI7/7DqJ3dx78Zz2XpI4632c00n
	MEoay1gSLlSNGuV0ovFIQkLPfSpWBmklqK/KtNytdzEZ3k5QAaQUaIcmHXqmuHgnYP/JSoor3aZqI
	jLMs0Dq5xUJAV6Q1biQLhTDfDuJhtwJF2kqatdPOAotVhpJUKGLca6sxRzD8xiEvHtQQfK9++uCap
	zYXHzVnvl02kA2gWKHA/f5ice+qFrN/3FX/vgYCuZv8QofuC7kPisdmEGjbKUsC2mPSu3RmPxMDWJ
	4Vs0vUF5giCZkxwyTZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rsx-009Edy-2q;
	Sat, 25 Nov 2023 12:35:47 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rsu-009EdE-3D
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 12:35:46 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c88750e7d1so33299291fa.3
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 04:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700915740; x=1701520540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IenxDwVtrvJhjRe1CZt0FogzHl3GObYK8Ov3yOrH4vM=;
        b=iQTOiShb/rHaqD8XkHMpGuDDjo5fUWl447xDqKyvNH9+GwRAt2xujZS5XfVK4GIpsd
         3VUZB8MlUPFOo2BkaNzi009chsfcttqLdeB2YiVaYRXNnWWPYlkn7mfm7zlOijq51/YN
         qYfIogMUOZ5Ld31TZXF1C9jy6cch6XX81X8b3q7VwUBk64xFjU8wyPZaqzb2JQ7ALTPy
         k6GHY9OBz4LA4zb1RH1/m8dqCThX8JjooFcSr8Ti5vMzv2WuBFHR8VnJ+EvJB3ZN94Y7
         6trhnJ7ZnK71Ou6RXiQNQo2+T7xEnpp2OkDUvnpFC7rF/hpqJGyYUC5efGCLVJHKWjbb
         tE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700915740; x=1701520540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IenxDwVtrvJhjRe1CZt0FogzHl3GObYK8Ov3yOrH4vM=;
        b=hAmei2WY7FC4mkx/19XGUi0y3ctSsC7ibKHPX/Rc72J5lDyyyjx438QgsF7D1fpJo3
         DdtCSS6HikKymbbo7BZGJ/iy5VY8LK9uv+D79T5SPjgjyAcEHN6SLIvkB63sx14+FvAj
         DM9Qx276n8+8zsxMDYT5B3iyvwUSLNBmWtqQUdE8JGFDEa52r4kztcgyMpHD6sMOSjbL
         67ol6eL/aPfurkrQLmXwun03YzTPpriuoYVkXezUJX0kFDsyXzMfRUTdtHt9uj6hzI+K
         xgoeMjdwTkFJN1YMm2xlrUOon62W1hMoDRdIZVez6eCph8n88IygsY9Ym4gicPSovlC3
         GdeQ==
X-Gm-Message-State: AOJu0YxUktOo2MkZ+F44/Hp5ZThfTBFTaJGptmOg03zW8/ypzeghFqw/
	9ZhzjkYPmP8BC/twLj+6EhLDtw==
X-Google-Smtp-Source: AGHT+IHbDRK3mkmTMaNGNwc6n42l97rc56mrZFVJ2Zgg+VQJPnfN2soJxQEXezDgnPIOdB0rG9mDcg==
X-Received: by 2002:a2e:994b:0:b0:2c8:7421:f0b4 with SMTP id r11-20020a2e994b000000b002c87421f0b4mr4334225ljj.27.1700915740482;
        Sat, 25 Nov 2023 04:35:40 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b009f28db2b702sm3390163ejb.209.2023.11.25.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 04:35:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	fastevam@denx.de
Cc: linux-mtd@lists.infradead.org,
	takahiro.kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/5] mtd: spi-nor: introduce die erase
Date: Sat, 25 Nov 2023 14:35:24 +0200
Message-Id: <20231125123529.55686-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993; i=tudor.ambarus@linaro.org; h=from:subject; bh=ET4nej2fkYuJJH06/u65/dyHT3qeYqBPblhk2M6LCWI=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYeoQsHuuLgw++eZrR2gX5lRXMpqhMPjGC7Axs 3i2O3dC7DyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWHqEAAKCRBLVU9HpY0U 6b10B/9kyec2DqmHLyLcwnNX34fGbimfAQ4jI5UXnDPE/nJg9rxb1rcFQn9OicZcLu+Ti+Ps4H7 kOVjCp9aN48lmDbFgysb71OH1VZb482V8LBOalMJ1wgWL8uI+o4xhd1iL6yF93QEIsEdc7KYyKD K+6A4x6DilnL2afQqE3vaW76C+gvgXrAHnBmV25bV65tVZ0a5u/6tUsDMKRpxUO+HypG3Y6rp2h JGXx/8mY8M+BDcJi3j280BIDLN9C40cUstjP7dhku1QqiP0FPRxjlPI3HMjgtdfl6B8zdfR68iR 6w2xhY7lh+UezCV69t0HbURKKmPmIIM8S/tiB0kSCFAJZlFH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_043545_065244_2EF65D7B 
X-CRM114-Status: GOOD (  13.15  )
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

changes in v3:
- fix code, thanks to Fabio's testing
- found a n25q00 and tested on my side too
- fixed micron's die erase support

Add support for die erase.
JESD216 mentions die erase, but does not provide an opcode for it.
Check BFPT dword 11, bits 30:24, "Chip Erase, Typical time", it says:

"Typical time to erase one chip (die). User must poll device busy to
determine if the operation has completed. For a device consisting of
multiple dies, that are individually accessed, the time is for each die
to which a chip erase command is applied."

So when a flash consists of a single die, this is the erase time for the
full chip (die) erase, and when it consists of multiple dies, it's the
die erase time. Chip and die are the same thing.

For what concerns the Micron flashes, unfortunately Micron does not
provide a 4-byte opcode equivalent for the die erase. The SFDP 4BAIT
table fails to consider the die erase too, the standard can be improved.
Thus we're forced to enter in the 4 byte address mode in order to benefit
of the die erase. This comes with some changes into the core.
    
Tested on n25q00. This flash defines the 4BAIT SFDP table, thus it will
use the 4BAIT opcodes for reads, page programs or erases, with the
exception that it will use the die erase command in the 4 byte address
mode. 

Fabio Estevam (1):
  mtd: spi-nor: micron-st: Add support for mt25qu01g

Tudor Ambarus (4):
  mtd: spi-nor: add erase die (chip) capability
  mtd: spi-nor: spansion: enable die erase for multi die flashes
  mtd: spi-nor: micron-st: enable die erase for multi die flashes
  mtd: spi-nor: remove NO_CHIP_ERASE flag

 drivers/mtd/spi-nor/core.c      | 143 ++++++++++++++++++++------------
 drivers/mtd/spi-nor/core.h      |  16 ++--
 drivers/mtd/spi-nor/debugfs.c   |   2 +-
 drivers/mtd/spi-nor/micron-st.c |  59 ++++++++++++-
 drivers/mtd/spi-nor/spansion.c  |   4 +-
 5 files changed, 158 insertions(+), 66 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
