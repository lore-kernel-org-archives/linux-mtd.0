Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BF5C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vctFg9rJxaJAfF2AXRPZzc09yzTrt21OUktSx6vhYd4=; b=QU2i72VsNEXgv0
	He1hIRePVlemry1VEL1xaCucXpkPkQ7dlc6OlagTbM0NlH3Ka2Dkmwnv1IaPVN9Uu7QBOAGaSHJLs
	zPYp+D7MNeaRG9tcQI67LeCfa8J5NFVsPp+63MfS+SFPgC6WzAkMLH8s0GzbbjrhU5wnJ15j/Okll
	hT25Q0KFrGAHJR7q+QBd1LhrsCbXoMk++ay5w3XHYLGHrLzqCVD994u/F3LTTd0c9CrvPopqH3jVI
	curMeldokdTp77F80eQrD5Gr7w7rcBxW4DHqOxVOGE+yNnHfJ0SAQhCzAP6MPDN4lz/IncU+fp0zr
	rmeeEPFO0ho9uHJoyvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUATd-009wdD-JQ; Tue, 15 Mar 2022 16:56:53 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUATZ-009wcJ-U7
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 16:56:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id u17so18503259pfk.11
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2022 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YJkWk99bLZw++rSGr2/IK3Rs1XoNvFcnuxKFkD7iXfQ=;
 b=HfWVhu5hvd7qeRccFco3HtFVm5PsbpepnDOYIuIcWqwjwJbBPhUkjW0jJTU9bJsw9s
 n65j2LUPAhuKGNqx8VCNX+hsswJHY4gf25DJnor6UcEqGhYoA5MzoRBB94LJSXYDAIqk
 t0ztzrf9wWcAnzUKsATm0nRUYGBryW2OSolE2h4SwPsT9eNJaVid55ceUQif5RZHQ+iT
 5jEPEdFRZ+n6VEx/ef8nzAaEkLox0b9WR5IKE8eGsGzBlrzx+rVUsgSANk123LtWIcW5
 X9rQ0J8ES8mSdxMNeFcUwoX2eg3BLcaiamF49HL/DrtPtDyJv3NvrsBt7PdyE7Dhv9Ec
 8l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YJkWk99bLZw++rSGr2/IK3Rs1XoNvFcnuxKFkD7iXfQ=;
 b=lx6sFPcTQlsY3yqjMUiXWnTZNkteEPImxIzgj0wL7dt0XkdBqN+n4GCYlMbXbEqOjH
 0nd3N7+68FH+Bs0/eyIGZ6dTfgSvvqCU+wHh+hhqLxw+Vmk+hq4IVyIxdRG82j+9ZyR4
 MtPfjiR2T2PAZpdZgO5C9+8iyIIM7VwVxHLGFGc9Rb8BNvrmX37+A1XT5qOVQI3RmDBq
 jn2FFs/WiD5o3sKUiDZWlMN6qMoq78P6k787I7Iy7jhHsnyywisbTswSPN61AxwwMLnS
 D9okp8Z93cjtwMl/io3FhPvyyEVBTCsLrGNnoR/WkoEi+kyd0wqnKNr2jMgwVYspCGVt
 Mxag==
X-Gm-Message-State: AOAM5316w7V6pN++rR3OBQuvB/75sgJatS5KaxktqB4g/TZ4hAAVaRTg
 PZLxya3yumOCbSiz/WPz4EY=
X-Google-Smtp-Source: ABdhPJxHFbqVOmNHUuxR+neKszGPBNtKnYs0I9jRD3t+e3mY0TR4WuxOLTPugKbYcs1pvwkwR2BWgQ==
X-Received: by 2002:a63:4e4d:0:b0:381:640e:a373 with SMTP id
 o13-20020a634e4d000000b00381640ea373mr3905684pgl.379.1647363407195; 
 Tue, 15 Mar 2022 09:56:47 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:3e36:8008:b94b:774d])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm24835809pfu.120.2022.03.15.09.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:56:46 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 stable@vger.kernel.org
Subject: [PATCH v3 0/3] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Wed, 16 Mar 2022 01:56:04 +0900
Message-Id: <20220315165607.390070-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_095649_994432_0F8E56BD 
X-CRM114-Status: UNSURE (   9.77  )
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

As pointed out by this bug report [1], the buffered write is now broken on
S29GL064N. The reason is that changed the buffered write to use chip_good
instead of chip_ready. One way to solve the issue is to revert the change
partially to use chip_ready for S29GL064N since the way of least surprise.

[1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org

Tokunori Ikegami (3):
  mtd: cfi_cmdset_0002: Add S29GL064N ID definition
  mtd: cfi_cmdset_0002: Move and rename
    chip_check/chip_ready/chip_good_for_write
  mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N

 drivers/mtd/chips/cfi_cmdset_0002.c | 89 +++++++++++++++--------------
 1 file changed, 47 insertions(+), 42 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
