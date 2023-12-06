Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A96C10F04
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVwwn9BgCqvH+mTxvxwUGBzq+Mnx+juCroKaJw+Gwog=; b=rL5mpi0yyxWZKA
	xDnx7KXwEdAFm/6aYgD/ihgPaw0QIV//5e0TrzhiXPCqNo/C3klWRYzjTfMe72lSL15AcwkR9mTUI
	r+F8CzFvE7aU9Nz0dqHAVZZgNYOrH6d1Q83slDXK7wlsFB91ApCm/WrJSQtCr2yUv0s0kReemjXAH
	/V2FT4xPNpeeoF9c8WNlI2ks2rdRYJAR/cyZOrlfwsVX771zZuX9Yr82EGHKP18IuPOjtjN0VED7I
	s1eaIzj+fKDr3QAcY6tS6qoNCDDJ9B4JhDndQW6ovsBJG+EvqXOT5w4FDfnXn67xPbai2nqakuzKT
	u1I7GTV8g2Tu8YFQpuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoH3-009ZED-38;
	Wed, 06 Dec 2023 09:32:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoH0-009ZB9-0z
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 09:32:55 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54cde11d0f4so3851553a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Dec 2023 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701855168; x=1702459968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilX2682XjnqliowA0bu2DjdfnU2cl4LwaHOv2ey4D5o=;
        b=FhjpYInE8lax4T4A7K4O19IncWSh6yzOz7x8i+b8dv/Not1mlEIaxC/pJd0rSWbSPV
         0ciwX+iatyr0GgUbj3XLBHOYSkjsxX40XrvCfb4zudQi3pAjAaPlkLbZPkjrDJIUP+K9
         Ih9/PKBgN8HI5ac+27vngvTBGA/wKn1eI3q2/YYnOG5hFdJKx7y8OG35bq8LZrWh1lLg
         O1KIfOpIJb/qxQ7zxMWJf3Hn+pF9f+wOaxmEopPdNvF6TQdFZHw0m4aaSFF3kQe2KJNY
         khsg6wPZiXr1RWtAKqcc3Joe17LDtJtrjeGIUMGdBeeW+aBCIvF6jb9CHgAohwBAt62Q
         88hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701855168; x=1702459968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilX2682XjnqliowA0bu2DjdfnU2cl4LwaHOv2ey4D5o=;
        b=RkdpS+xgq74qLfxZ8Jnd/N/wE4Ilq7vj7ALXOG+W2/k9eQHmpztSynuJdhV6Wle4pX
         aHr9whKA0k8SOOuxqR5XfObZroP3hBun9hPAdNfiejMMDzEBp4vZ9A8XmFG1PMkjMcQ/
         DE5M6+mCiGbMia2koantLUyZqB6epJuprkXjIRXvAeKyD0qF0eslKTCE64ioh2WGZ0Zo
         8BRvopV86KtFp7JIV/tupAzt3D4vpBxD5Zkl2mcMTOnYpR4z9dDsUqB4TMMFqaO1MWR5
         uPx9IX1/gkz8ACS395brBXmi7dvDivxb3Jgl6uk9vJ2SKVkz7jXh/akBs/yFA7Nu9NTL
         ikmQ==
X-Gm-Message-State: AOJu0Yz13rgkvfoOXQ7+5przvmrKt1zKmmatVxiEA/MNQ284jbj0YvZ0
	RoIJiuvTMD50lc/9lQFUq1FUQw==
X-Google-Smtp-Source: AGHT+IFsG2uhGJ1ANz+DkxB43OgfFlN7l8cr1mGaasXByK19sCTsVqsuwkGaKsfA1Z0KgtoblixnyA==
X-Received: by 2002:a05:6402:619:b0:54d:1dbf:b7c8 with SMTP id n25-20020a056402061900b0054d1dbfb7c8mr482566edv.26.1701855168618;
        Wed, 06 Dec 2023 01:32:48 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id p8-20020aa7d308000000b0054c63cc0469sm2175723edq.33.2023.12.06.01.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:32:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	fastevam@denx.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	takahiro.kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] mtd: spi-nor: introduce die erase
Date: Wed,  6 Dec 2023 11:32:45 +0200
Message-Id: <170185515581.112933.16347567503579159977.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125123529.55686-1-tudor.ambarus@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=LkTt39nxPJlaweTI13Scw1mV/6iSb8PVkXi0zhPzjZc=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlcD+3wPJT5I623yxO24AHNOTmovSvgb5+fhcIu PL2PdLYRNSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZXA/twAKCRBLVU9HpY0U 6fB6B/9IE0xv4j63+beZo/StLTG1g1PJJfz7i2G80zu6QRryqEU6LO2Okyt/8yc3ykEbcVDZjIE V7ojaY28Pqp7eCkslSoM6WG1XZfh4oBd1aEtCqRTQ/fsSeIPncfOEF8uYUypBzNXB7X6WjyKheO +M7Oy0Zqw3x5cLK48keFPimxp5yPDpkJ+fXzDk9lwGKXWQDnc/mJPQsQyi2gcJS4rtL3S725F6j rOCtiPYGe8nNwautm1DDfOZnSzoI3HAhcxgXbyXWTte0Gc2bDIB5RrKNBPWavnDRlSQn4GwKBLH X5/oXc+jXBQvU9TAOnQhGWvagAPVnuDA++kgaWPxpkLHOLkK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_013254_344912_4B2F88F7 
X-CRM114-Status: UNSURE (   8.49  )
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

On Sat, 25 Nov 2023 14:35:24 +0200, Tudor Ambarus wrote:
> changes in v3:
> - fix code, thanks to Fabio's testing
> - found a n25q00 and tested on my side too
> - fixed micron's die erase support
> 
> Add support for die erase.
> JESD216 mentions die erase, but does not provide an opcode for it.
> Check BFPT dword 11, bits 30:24, "Chip Erase, Typical time", it says:
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/5] mtd: spi-nor: add erase die (chip) capability
      https://git.kernel.org/mtd/c/9641423174d0
[2/5] mtd: spi-nor: spansion: enable die erase for multi die flashes
      https://git.kernel.org/mtd/c/461d0babb544
[3/5] mtd: spi-nor: micron-st: enable die erase for multi die flashes
      https://git.kernel.org/mtd/c/53919a968b43
[4/5] mtd: spi-nor: remove NO_CHIP_ERASE flag
      https://git.kernel.org/mtd/c/06de1257aae7
[5/5] mtd: spi-nor: micron-st: Add support for mt25qu01g
      https://git.kernel.org/mtd/c/c692ba6de1c5

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
