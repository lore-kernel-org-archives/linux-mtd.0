Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE2C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8rVOE+2RyTYp1mdDczS2YgoMyn7HoBQUPwj3BA1uHw=; b=CHxauRRUQc+Ofo
	dxGOl+uhr1Bj4kzWVGBp4BMblu0niYHnxS7gQtzOiJJmd/d5dXD6Xtkn77wKMySkafpalfnCKp44E
	o3LJ6ZuTmGsxzYf1t1Zt+c5uukRgteZL7R3ysvxxzGtbzd+s+MZbQwy3UXZaCBom+KY4hYK25Zz1i
	HIw+DS1lKnGtv13WoBlbUx+6w1/fFXI8u9We/U1ZWXaNxJDtHAvktGj5FVLLthrk3Z+ghpu4hiLZO
	tXT7gzi/+SvPYvHvZ+nwV7HJ9J3xbPRA7mcfbVoz7nG6zMHxdrkWdaHwlTWp9MM/i2tBlM2FE1Dfb
	ENbFVXKzPItEZ4LZOi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHj0O-00GpWw-PM; Wed, 09 Feb 2022 09:11:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHj0L-00GpVh-HX
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 09:11:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id k17so1720989plk.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Feb 2022 01:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=eVpoqc5ku0ECGqLG20KOABQ1qLIg5VjUJ8h4q/JGLPk=;
 b=NQCUtdC3FtflF0MYpnJc0K2lKZlsCx5RkQInjicR3PXzfTYQnAknE7U7nDb0TmCoDG
 05SbZzyMRRNQlyRqfvTz0W+tDXPEY9hkEfcS0W4oiiwEgTwMQxGWHFzZ7EK3mPAC4+sO
 2Svad0zdttjLHuG3ZAqtOZd+F4V8soZ8pIVx/clGZgnqimNgyFlQ2Nj7yD3slYjPuqlb
 ofCfV92bPY+Ob2kflokhHzZa/9WGwkvsVpxylsM3n/f5WfJKpgd1B0QrC50AhgBJb/ig
 BiZbEl+qB+DfS2At5aBcc+JSOsPB81rjuNuVudjFLaq7H8/m5RBAAXctCheYEUSA2PRq
 FW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eVpoqc5ku0ECGqLG20KOABQ1qLIg5VjUJ8h4q/JGLPk=;
 b=677X5TT3DaXXk3NJOrZFPAIRwKRpUBLFeYZyNqSM8gBomwhrLtWCdzm/7p9J8bwrdf
 6wsvAFz1WEINDDkdQ741dOhxG/C49NnhvOijS+Lxl/H3hzAkIgD/ig3pzxTlRSFlVugC
 AVEIs1C8aZA5/1MkHvQPXqp2BgFYU1T0NhuUMtmKV5K4WQrupE0iUwNo9QTzhhqmLGwL
 Zf0RTNIOicgp759WvI5mhHJ7cGPq6oCyKri1+TkNm012smMrw4wzI3uS5plwL6rNp/h1
 LZJOZTkMfJP2VxKrxEmQIgCP/QBkv1QXmtkEUiag7xHnLasX/5TPZotEmNzcP5+yMVDR
 pWdQ==
X-Gm-Message-State: AOAM531z54nN9Oq2zq49GOzouxOH4ZFFxzNituyPXBfJPwljDB+nNhBP
 5v+YcGWUAexT60eM9Xrroho=
X-Google-Smtp-Source: ABdhPJyrpziHDHBwD8Xhgb7rh9bN+TnnH4YSlOrT323N1h1sgPS6aZiwjBOmxyE0ZKnoVP0ucylCZw==
X-Received: by 2002:a17:90b:3b8a:: with SMTP id
 pc10mr1478474pjb.18.1644397872150; 
 Wed, 09 Feb 2022 01:11:12 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id v2sm5270643pjt.55.2022.02.09.01.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:11:11 -0800 (PST)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v2 0/4] mtd: spinand: Add continuous read mode support
Date: Wed,  9 Feb 2022 17:10:18 +0800
Message-Id: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_011113_597541_6B458994 
X-CRM114-Status: GOOD (  10.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series add support continuous read mode for SPI NAND.

Changes in v2:
- Modify the naming and add some descriptions
- Create a new function for continuous read
- Check data length to determine whether to enter the mode
- Remove the continuous read exit command and replace to reset command
- Add the performances of continuous read mode

Zhengxun (4):
  mtd: spinand: Add support continuous read mode
  mtd: spinand: Add continuous read state
  mtd: spinand: Add support continuous read operation
  mtd: spinand: macronix: Add continuous read support for MX35LF2GE4AD

 drivers/mtd/nand/spi/core.c     | 116 +++++++++++++++++++++++++++++++-
 drivers/mtd/nand/spi/macronix.c |   2 +-
 include/linux/mtd/spinand.h     |   4 ++
 3 files changed, 120 insertions(+), 2 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
