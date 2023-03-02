Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B9C7EE32
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HkfXC4PSr+ZI9hR/S+cVE0HXln8BADFRlsQCJpERweM=; b=HGn329q2moNxA9
	chOulO9lD3fPXHYa8iwDzN05WAp3lRgchnDKp7jwJUc58l6oGryke0pBCXX7CV3hipEaTDLB4N2bp
	KHKChSg7UIZaM2UfAjKfGLu9oFqv4Vs1q1gjRxZYsMNyWFDqW92+ZCIYB1IqtyndbuaJn7ZMeGJJg
	WHTbmaaRu21sIejvTLqPn9UAAg08JzM5M+iLtNtICu42VyXI7zZNHiyqC6ulgc7MXqtWarn25OEva
	UxFyaV3vc/x30YmDP3ohV9VujhO/2XUJvCZFqHxLaUNMrLHDTEGKgKiM7jn5qC2vxfOGvs+UknRJf
	XSc9MDeAoJ8RAcfuHdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdTJ-00199h-KG; Thu, 02 Mar 2023 07:35:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdTF-00198M-Q1
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 07:35:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id bo22so4400907pjb.4
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 23:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3SSO0/IlnMwYCcbwBxRHcp8VmWtK9hXGTYgr9zTy1u4=;
        b=kIKAAsFyvUkkYm0HB0NzBs0/lWeGyv29Xpcr9FBpNJnDrAtqryH2QW8uHiSoSTQIwG
         4I2EfyNgdeKLUWt/4Tvl9zCrOCA3psh/fN+o6+PnooCdcei9G3LAMerB2ntCCa8TOvJZ
         MbToWX84iTSW0anG6R2WR8tSf2m+CcuNdwyizJTjG0p0CPcc0EbPcshK19/rbpClcsML
         /IFryivunvbH94Aq2/sp2iTlYTvTrNlRCqNeP8BZsSIVhbx/3C387Mx/brsJmIX/mPoX
         Z2j60q2JyEJi4qNZX9gxS/vdb0AfRaY3GiN4evyDVBnBqNP+oWqDmzCocl01obnXmZhf
         suUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SSO0/IlnMwYCcbwBxRHcp8VmWtK9hXGTYgr9zTy1u4=;
        b=Zk6KbBwEMvNFpx0rPXMqJX7vnllPchsoepPUAnLlmds0FvOa6zGkYaz4OnPVT2YAMX
         o+LbkZ141wPaZ5ojdIk+1pJvtGZyut0iAZN5q4OwZKB+GakaeaIQCp7ak3GFaQ6kg0Xo
         FhKs/zmQgjAffkCIpIWAXKmRHd2Cf0JO3Jk48uyzr5QsYCtV/b3FO/WTnS0tpyNmrSFH
         qKPqd2j6eEnEgYxbXB+ZIVn8BBLQ62RzG8mCNt62w6JIO9iKEa5YMLb+BuS1z7atP70Z
         Lja0+YPs9cte03MaVYEodUOuvgOKFQQNC0XBYGvR1NJKqfD+s0FXWs5qx11jecKe1YfH
         6R6A==
X-Gm-Message-State: AO0yUKVrGbz6fg7GMkdC9u1ECbBFNCOZLraCXpcIWLIkSqWIc99jQFnw
	+VXqm53CaTDfLrb5MfWFRGGBzGqcgC6BUg==
X-Google-Smtp-Source: AK7set+HR92DSBrxar4DV+voZYNFzTSwOerCFLjckQSo2qVx/zrUdMemHbm4pLhD75Hx6O894yZHSQ==
X-Received: by 2002:a05:6a20:440d:b0:cd:aaa:59e6 with SMTP id ce13-20020a056a20440d00b000cd0aaa59e6mr13480800pzb.51.1677742517373;
        Wed, 01 Mar 2023 23:35:17 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v26-20020a62a51a000000b005a8e9e2f1c5sm9085898pfm.187.2023.03.01.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 23:35:16 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 0/2] mtd: spi-nor: spansion: Add support for Infineon S25FS256T
Date: Thu,  2 Mar 2023 16:35:05 +0900
Message-Id: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_233521_907780_DBEA69BE 
X-CRM114-Status: UNSURE (   8.44  )
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

Infineon S25FS256T is 256Mbit Quad SPI NOR flash. This series updates
RD_ANY_REG_OP macro to support dummy cycles and then adds ID and fixups
for S25FS256T.

---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25fs256t
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342b190f0890
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080101ff00000114000100ff84000102500100ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe7ffe2ffffffff0f48eb086bffff
ffffeeffffffffff00ffffff00ff11d810d800ff00ff321cfeff71e9ffe1
ec031c607a757a75f766805c00d65dfff938c0a100000000000000000000
0000ffffffff710600fedcdcffff
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
13ecce2f195c4c71648e90d4a7e4a0df  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
random: crng init done
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 3.200008 seconds, 1.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
3b47256fecc997f606d7e75e6a9b567a8e8037c1  qspi_test
3b47256fecc997f606d7e75e6a9b567a8e8037c1  qspi_read
---

Takahiro Kuwano (2):
  mtd: spi-nor: spansion: Make RD_ANY_REG_OP macro take number of dummy
    bytes
  mtd: spi-nor: spansion: Add support for Infineon S25FS256T

 drivers/mtd/spi-nor/spansion.c | 70 +++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 5 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
