Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E97D49C8E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+DZivBBKHOdJ13DT/OpullKL9p4xld4OkxX8x6rmXGo=; b=fiYauqyI6AnCX4
	6bzj4DYsSFcFoSO+x4fjtaI5UjW7SkhqMJXEPnqhS5dPbbpkah9UqKk/kj1V8AeD5gIh6Mo1gO8oy
	a6v3era1uBqe3+hZuku58e1wZ9bCjuFBGBJDxnCgJ0AjhP0TO1zbdu/T9y+6ogEGM25m1BlKYVtfS
	GJ2ySBWQP6+faJQTOUrAm8xvB5WF11VasyHWYQNKWSafXLq3NpqwArdxFLHQ0dHhTtSLGqTdA8VcD
	tiJtkFrg8/Rr2yaI5LhdthRr6yF3qbP8Zf0hzlXq/eBojU1Ruyk4afaD+op7JPxbmECoSYQrGUTdL
	SYIAdaSBMvWEanp9GDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkl6-00000001GPe-1Xs2;
	Fri, 30 Jan 2026 09:25:44 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkl2-00000001GNy-0g6m
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 09:25:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-81e93c5961cso1601428b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jan 2026 01:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769765139; x=1770369939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7IBEedv1zS5/EpN7pP7g8ZrgefVbXdao4myPQBpAVBQ=;
        b=j4G9tT7urfLBrg29ZdclV3usOpJ+od12ag+BI/CRlYgabmFWaayYm4lK/ni1nv+cBA
         9c8iKlW8WJLUgtQGNGGuRn3OzCASdn7BLag0Tj2OGlPjls0DTpPSlVFdd1iIubX2xFBI
         q6CwVLVYdMaVi94BkyUsEkuCJFYqo0LYNuci1FzpRdwZoPpgQCXQxKPzgT4QaiibXf2R
         DhTaAbrTvXoHYKuTi7wrw+betuaqWZ87ydeHtTUma/ru8/sPYhiAFiCZyZdw+H9OLgHr
         PoF6C+jYJJRzVGaminUzTo6RcY+slxTw0yO/CvGxVQtU+wIa7VRKjOLAXu61rfSlCx/c
         kE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765139; x=1770369939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IBEedv1zS5/EpN7pP7g8ZrgefVbXdao4myPQBpAVBQ=;
        b=feXeSDuwlkqygde+ySnQBuv2GhbH3JxKeUOIQGuaWXcs0KcS4uVkwSCW3ybQvm4pfk
         QpGvu2HbJjO8yv3gYpc6YSe9cC7+ge35gCbQYQXx+lwyLJ12acBtJ4kKML3jft9Lav3/
         24zlcPpSeUpSdRDZMVJLrsccGTRQOVtwxuRera0vhkYX8x3sQJQav6cGwylWlyeGxjxA
         OMihl8jG8PvECpzCWbZR5d8MSyPCXO3ODBT8v4Vu2ogBqRZW+45nzogAVlQe+fqfckKZ
         NQgO4Moq0OMKfRN+hFF5GXAYY+47BZ8b0zIumdej5Wo4yIhbMEY2yJIBz9K48xIuUGS1
         4r8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8ag10RejzfBRK6GvL0NXlCs7CRl6BzYilaBVw0sLn7RTcmpsabF/Uu5JI7anpeQxhonAYhC109n8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7vJcg6BomndGowq2OvEbQZx4sIRN79c1+ehrUdNc+mfnhr8WD
	i9rvpsZqCAlukdumx/YAx20aNessLbLgbWoTGkhdAWw5tprJ9kpS0mZT
X-Gm-Gg: AZuq6aLFO251sBUtLsNVBU1vAhaavGsDzrLmmoqOldHlGW+dNt403hxFmgyhRPNfKM3
	gcQJxzdavPSSJzsvwfTBDm99v+wx2yqu6cW8l1pA/uB9URNHsd5zbaaO0+rDEd35X0QXL1qxIPR
	9pCHuXEcTuxIo+jfxdRjd0gA2lLq+awTMQchh5UUH2xZYRLqsqbD/2ZofVvkVqZ3FO7At/nBpLs
	ZU0seNA0ycF6fsxbpSpANAo6skIXMMEOsM6w34pACwYL2zsaLp5pSz5LmiLZAOdOuuKLFPCYN6n
	Ut6Z6+RfMsgQvSPRQdzpXrz4wGS5GsrQeRRuQE8ST+OcLBzNpBWMmlC1efxBIdXQR8JfPrGWyGm
	t4IS6zYLs1fRzXSeGzx2TzXcKakRIQEkJMVR78fjDXsgDRRH5pgAsn47V6gznQKk4SDjTzGwfn+
	iD6cIeCvOucL7EI85hqj5pzRCWvtomWoH2tw7YfymeIr7F
X-Received: by 2002:a05:6a00:240e:b0:81f:9c15:30e5 with SMTP id d2e1a72fcca58-823ab76ed2amr2127012b3a.51.1769765139089;
        Fri, 30 Jan 2026 01:25:39 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfd7a2sm7480237b3a.39.2026.01.30.01.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 01:25:38 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 1AB014136071;
	Fri, 30 Jan 2026 17:25:36 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 0/2] mtd: spi-nand: Add support for randomizer feature
Date: Fri, 30 Jan 2026 17:23:47 +0800
Message-Id: <20260130092349.621034-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_012540_224259_BB38429A 
X-CRM114-Status: UNSURE (   9.47  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch series introduces randomizer support for SPI NAND devices.

Patch 1 adds the hook and initialization logic to the core framework.
Patch 2 implements the randomizer setting specifically for Macronix
chips (MX35LF/UF series) and allows control via device tree.

v3:
* Revert the device tree property to the vendor-specific
  "mxic,randomizer-enable" to strictly follow vendor-specific bindings.

* Update the 'set_randomizer' callback signature to accept a boolean
  'enable' argument, allowing the feature to be explicitly enabled or
  disabled.

* Switch the implementation to use the standard SET_FEATURE command
  to modify the Configuration Register (0x10), replacing the previous
  special program command method.

v2:
* Create a global NAND DT property

Cheng Ming Lin (2):
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Enable randomizer support

 drivers/mtd/nand/spi/core.c     | 21 +++++++++++++++
 drivers/mtd/nand/spi/macronix.c | 47 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     |  9 +++++++
 3 files changed, 67 insertions(+), 10 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
