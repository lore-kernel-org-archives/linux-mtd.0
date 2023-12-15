Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B109C46CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WrvVmn/ony78thm0EwOmmVvZgU/ORhn5xPk6FFpsoXk=; b=2W6UZ+7kV74f/M
	xQyc8tEeTPxXYwTWGvFX8pH47JBW+d1IcHcMe60E00HFjeb9ZsblapCOT0qwkvggVX5xuUSCCK6L5
	UGGbIFhSdOn5Ykb2ztRH7P80iQ7iq3ZS++VPAd9sz/i1rEG+ImlhgPYfnKPZznaGx5pACgz0Wp2vH
	jjJ28N7O8EhXhP5j7ZcvVdvBcpZI5YkmFWZH/KPuWWDL/n1QedWJKbkdR3fyBrHLiTaf6lgQZbLmI
	wHMHKqu42KNKM/77z6DDfJMlx311Z7yAfpgewqmo86JCT+HRhMD9aCpsMGbAHxsA1smiKfFolz+BB
	GeJCm7BhkDrqrvNUwgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3S7-002Rjk-1E;
	Fri, 15 Dec 2023 08:21:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3S4-002Rgi-1Y
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 08:21:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so4177395e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 00:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702628502; x=1703233302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+lOs4gkYAACppAY2kdvQATd+r6Z9Q2LiHrQpE+mRls=;
        b=YpVsX5NjxGOS39ezY8nW0sixu0CNDzsVjRp4oQK2//KwAHKzxbVuwGHmonmPgDFNfN
         bJ5jqtNMke40WlcUtUgcx/zDHuoV/4iYP7kcsRJaJ53jwnSKjw89OuVt/oj+KoJapudK
         Yct2AQXJFWtImgkBIfSMpITavGdmIbxCHOwGTapmE+L+L0z4hyGktEFY2tOGb03imbMh
         G1Uw/yiCXcQEsAkc+EUBGVtL6lvzF2FuzeTNYdM3m9L1mS8R+aE3sZ17iNhD0nwNyzBO
         M+wSpx2UtJIGqIv6Syc2RYKLoXXW6JcT5/ekSCFDy+Jwf5xt8TW4HlIaGdBjR55kzqsH
         TZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628502; x=1703233302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+lOs4gkYAACppAY2kdvQATd+r6Z9Q2LiHrQpE+mRls=;
        b=kglhsaYbtqWrlVibGDmllTLVAbAZZdSRroqLfz2MDMPfQQZNG1gQGg6AJybCzdPuYR
         BYhFSPtr7fp6r4B092v1U3ieS90Lku+DdPjlARfvvbCtAevwB3jmhlEQq8WyZ5wpY4tm
         vLU7Id3agv+tLecb1WTBymN/MkXOzBzDpAkNZSeYtcpPV/qLEL8r33UbBQIVc+IcmfJ1
         od3FEa9W/uBKQF2wO86eYeCcxUg18kNd895+QovoO3TBGgZp43wvR3xaMuXtm9d+0w6X
         egKNp0zqtESCKvvJj92Crh5766aLPF3sUtWFc2adyd30A7f1WhdqZBWAA1Vt/SaelWQJ
         wE/g==
X-Gm-Message-State: AOJu0YwXksbxVvFJqYsoLOp+KQ7witsJ+manCNdMpk/X/zWN+zQPiEVT
	0B1YRXtdEQD/VblBbAm2Py7a4A==
X-Google-Smtp-Source: AGHT+IFX1tTpRGCSxp+cq7RlCbaxBlH1syZP3YTzhVKkBaJNlqIxXXiNSxv3v+lxbajKjrAm74XoCA==
X-Received: by 2002:a05:600c:1827:b0:40c:2c9e:fc91 with SMTP id n39-20020a05600c182700b0040c2c9efc91mr5764431wmp.103.1702628502300;
        Fri, 15 Dec 2023 00:21:42 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c1d8100b0040b47c69d08sm30365570wms.18.2023.12.15.00.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:21:41 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	jaimeliao@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] mtd: spi-nor: mark the flash name as obsolete
Date: Fri, 15 Dec 2023 10:21:34 +0200
Message-Id: <20231215082138.16063-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=tudor.ambarus@linaro.org; h=from:subject; bh=P8W6Kt4BEVUIRZcat7DedtunBYKq3OpRYhBXNL66gWY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlfAyRLwec4+I7ocGSoj7FDGVlW+e7nQVG1johQ u+xd1JSNDOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZXwMkQAKCRBLVU9HpY0U 6emLB/9znn5PIDd1X3eRIcBPPTpde5tUMRYEZb1m/91Rpts+Sgh9QkS4YdfSJSEeaVB0YZ27hmY lbP9NHCSPsxvuucds2ZCdLthU7AoI/adjPMSsjTEaoZs+O/z9+AY3SQQWb6HVz+Uec6fYzUUiAS mHbxv5kXcAJEDuawEi5zlFe9eV+bZqdQrEWTvF2fQ+fBdg8cS11zbfg+QeLOgIZrdWHazzsvxph ybp+e69cpjXSuq1cHnF4eaLEhs5UDxTdHu9R1nRiD23cOrWwgenc9JAo3gVhhDF9aHBIp2XAsyQ YD+iTKBZt85ijZA6wiLpf6fPBpo5O1+9KBxRqj97eoywGXEK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002144_525556_2528384B 
X-CRM114-Status: UNSURE (   6.21  )
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

The flash name is unreliable as we saw flash ID collisions. Mark the
flash name as obsolete and print the manufacturer and device ID where
name was printed.

JaimeLiao (1):
  mtd: spi-nor: sysfs: hide the flash name if not set

Tudor Ambarus (3):
  mtd: spi-nor: print flash ID instead of name
  mtd: spi-nor: mark the flash name as obsolete
  mtd: spi-nor: drop superfluous debug prints

 .../ABI/testing/sysfs-bus-spi-devices-spi-nor |  3 +++
 drivers/mtd/spi-nor/core.c                    | 22 +++----------------
 drivers/mtd/spi-nor/core.h                    |  2 +-
 drivers/mtd/spi-nor/sysfs.c                   |  2 ++
 4 files changed, 9 insertions(+), 20 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
