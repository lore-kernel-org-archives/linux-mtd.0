Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC0BC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1VjfvCO8ZPkTWHLZnxu4uLMp+TEDHjOi4PQ690YBuI=; b=vFsz3UzFbPA5Uq
	6Prr9Vclr9GVVYH7WycQtZ33yRqxDoLt1Lo39qCHGbI2ZvrGnYNcMF/Xlyn3aAQhuG0HDpSY6Y1e/
	P27/HLURQQcvLq+Yyk+uR8c5T0WoyrDSYxIIIrySqD75a4PhJXzYHyzArD/H3XdT1qNFNOZYisQgM
	zCF2CDvJvXeh6qS8dG9W5ayagwLTNMMko6kkx5lGqTib7iloH3xhkwgm9mhYC1Kz4e0PRRBPTgAlZ
	7FT2/OrDTpEVuO0MtCUK4UUok56rVMeVgzkqLgiLhRwx4RAN9MkPa9J6cO/uU99TonoXQnVHI3XfF
	MrNX/dzt1ESNFM5P1OiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQ3d-00000004mZI-19q2;
	Tue, 18 Mar 2025 06:04:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQ3Z-00000004mYi-3AMj
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 06:04:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43690d4605dso19930605e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742277844; x=1742882644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g+Tb8k187ah12xwHjcwaeqOrObo+UBL2qoUGuE4BoY=;
        b=eyVEe1K+SKyWzX/2h7fAW8ABmDrIvktCEKAeuX07gqun1JqXOJaw54/IJ7Hluif9vD
         l3XEkAZ+pIpyeK7fwB99eRE7fZoGZXqFJ2RK99pBg1vPvbjP59untn3l9chLjBJiRNlr
         pxFdBN5HWF8RixsL7Pe0Lo61xWd54Rg1vNQXRz9xpvnmOr6tJ7XEHnnLwwaiLHw60MkS
         jv0pOvsT4DerWakh+voepjYR395F2NnpP36l3DMJL8hozk5LYfS6eSTCatMHt/y5+/KS
         VmdSlpQhvxpDDHVq3WXHsWslCTFscRnBzdk5c9rj/CdgvT9xWEVXGNqy1sZcgx0qSpNb
         N61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742277844; x=1742882644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1g+Tb8k187ah12xwHjcwaeqOrObo+UBL2qoUGuE4BoY=;
        b=P0yNkZLMbBc5PZ468to8unRAd79ribsLevAlItExGLyREbU20owAUJ+IHDj96nICPT
         gpxXbW28a91fq7mrYwy4wr+qiAKjvdJnBZisYA36EEVBWNx+nqbsY8j4lU+JmuWeg4Qi
         4OlkTxtNMagLqqXlAZUni7j2/hYjFkVbq3/3CXgQgCXsqFii6lPTnd2+G3PY5KUExnuj
         vJkpQwGpytzxCC1ukeoZgi4Rmti1zudliyS6KzL0ueiKKLpQ/6hPcmGeaU5plLUi+SXG
         OTV92orCWmW02pfOClEmesSVH+loAjZ02eZFBV3X11BP816aUV/rwaIE/OKlU00cIzQg
         fHjA==
X-Gm-Message-State: AOJu0Yx0GS8gwnl9oGKjF+OcZTdeAkPH04qGvrShYNILb2THcDUkFvfJ
	EDNwwXOcyhcW0ISTkHOd1ecinfpQcXbioSE3vxLWjxVoSX+GKYRCZgtpTT8jShQ=
X-Gm-Gg: ASbGnctzBvbywXg1QH0onDEe+5LhOPbfI24vY1Mh4yR04q2+4ENwUFuP+/tya9sFDLI
	104eUOmCq3Z7Qik/ukXySk77qxft1dlc5nVHFxwehHUNgZ9fXXoJGbk5/mYzRoDpy3rJkUtffgZ
	zf6BC2rC1d7+yRqQQuPppvC4P0fXfm+XTjrZH2oheU3HcMUmWc/FvHoLdzhe/XapVmS5KGtDsMU
	gljYZL0Ly4/dANkCZUj3yR99aBtvL/WCmjLx2+vyQ1B/iKGgtj9Usa8Oi5q92N2/OcyNuoJce3m
	KjBWoOqznPgV7x10adVPeCehKuuJ4gfghT8SIUQev6PNrswGcQ==
X-Google-Smtp-Source: AGHT+IFbyTkPinde7wLwd/W58jzF64zIuyDfczPKLei8Yh8MaGxhX+owDIhdDBV/gPygD7ceQtHm6A==
X-Received: by 2002:a05:600c:3d0d:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43d3b9ce0b5mr7045515e9.19.1742277844004;
        Mon, 17 Mar 2025 23:04:04 -0700 (PDT)
Received: from 1.. ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe524ccsm125273685e9.0.2025.03.17.23.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:04:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: (subset)Re: [PATCH 0/3] mtd: spi-nor: headers cleanup
Date: Tue, 18 Mar 2025 08:04:00 +0200
Message-Id: <174227766032.7108.15802730859556045790.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=413; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=HlLLQLsByKXcavvJyx6pbP9SOdDO77wVIVQKDq1JG6k=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBn2QzOhZNmhrPPIrcdkjB3ZDzjBThH0aBV4xdXY /hb0QvuR1GJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZ9kMzgAKCRBLVU9HpY0U 6WZPB/oCcTa3wPdNyytdQNwshMnMrDCzbeAOAtm7PB8EISA2agkRxXnNwY4qU+7vXE5NtZh4BXm fsKRFoD62qYVgru50oUR0q9Zm1IWNH1kreBT4ZAgucTcPRADoXSqGUTklp/zBz8uaVcibBchBtE 3Tdm5JW8yKTV9p5lUOQ/fcbE9K/gad2JFjDzu/RrxiLEhS0emU6AIMjIDRuM64S01QkWmmHnV84 +/H6+k9Ykm9bL9QGpx+moQMWfSvAhIwZE6rmtPBjAIi/66s52YWTIA4ReyhGhPrEHYOU3/0NToD zOb98mQG99W9vFWA+kpnrURNjB/rZsgUP20zAphSAOAd3R/4
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_230405_797852_B26B822D 
X-CRM114-Status: UNSURE (   6.34  )
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


On Fri, 07 Mar 2025 09:09:04 +0200, Tudor Ambarus wrote:
> A bunch of header cleanups, no dependencies.
> 
> 

Subset applied, thanks!

[1/3] mtd: spi-nor: explicitly include <linux/of.h>
      https://git.kernel.org/mtd/c/fafa240a1798
[3/3] mtd: spi-nor: drop unused <linux/of_platform.h>
      https://git.kernel.org/mtd/c/eec373688d91

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
