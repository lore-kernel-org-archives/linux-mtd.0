Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7E9C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A1D6103C
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7A1D6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RtMyydHtLYWf9lcgeXleES9d8uhvRJp2pscfy4M65L8=; b=fwKQRG+SU9/VWK
	GG95+5TFOpyv7xuJrqPNczS5ETZQzAQpSAG+t4Vda3MSUzyBKfjRVpflo0q0PDcFjxr00/lsMLPCB
	6BleG5gGfrP8lNzdJcuzC4UtbAa/QrxYRBmuEXqoVY0h+5y4o1Jw/enxOk9yKEyOVB2DHoTPDFZNu
	plWSPe6GqWa3U3Wy+7bLlPfp80fPmmtV1rFLmYfaaQdRmVzkH45khNvDiAwciWFCeBwvjO/o8bW4c
	mkIx36iY7tarSmQOfBDR8ACKWZNdtLegJ1Gdeo1zqknE0eYOvf1dscbtkBLrWzgdPbOn14BjPa3ur
	5vaTwUW04uZy1VuVeJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfgG5-004ZY7-64; Wed, 27 Oct 2021 10:34:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfgG1-004ZWD-Vl
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 10:34:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id d10so3348308wrb.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 03:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=suhKpwwWq8DRUbg6cUq+Xf8wBoWhzVH4F87UvqYAAsA=;
 b=d+bp4mhHCrPuGIsJAGL3iqjN+o+cKlzHqY/+rB8JJQ6OEoshd7znMOk2j3OELF919E
 gAhyb3x/Z5KdMKTJ+kw8T85lbKeBxsqzNFhJpJyUb0xTcg3QV2+sQTAaA13EM8p1xfXR
 cEQXDJdS1HoSw7u6I/wEqdYucFl002uOQC5SGPK29ZLil+DH+0hmgH1hUL2DTxznlptM
 6W5KeStUjpyyhykIHCiRUwCy8lgsKZ6/MAqz/0F8gMnf9aezn9NcuhA4KA946t7f4WRZ
 GO/uklGjZKFhON+QPlFiXJMdK0g16xB4oJM/JMqP+db5n/srwuA8mzCTOV24sD3aWvCn
 AvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=suhKpwwWq8DRUbg6cUq+Xf8wBoWhzVH4F87UvqYAAsA=;
 b=MJpctKConAGcQ+wnEgnn55CyIFIVtBw46StDXDJavJ/rkTdO9IEfZCK0PPqlJ/+M3H
 y9RXQhixTsAO9g4DQwcvcMJuuP/nGIK3WSndu2kUYM9YUtfq1aa/b4cSUWka6hvCC45Z
 eLR29Saa069FS+cMAHsp6KC+LHhSamd9Uw4Chkxop4+AKBIP0wNJbhUSLMvmp8EpESsi
 yEq0ldDjCVC0kxGEno1IgBNl/x367kRihlgSAqsTzRdD7j5wm0lJN8EU5W+J4JPMXzb/
 XQ7ZZS0UOsCOoLU7VXmGNh0SX+PIEhkfWtqtK0YbOtDZRynuBaiBDWtCOSFBf6AMz2ji
 hOqw==
X-Gm-Message-State: AOAM531u6FMgatSNtsek25N2B35ReK50MrqMuBeOu1pGF+Q/4u9KWLWv
 KUq26O5cKNv5HO4KH/Zc140=
X-Google-Smtp-Source: ABdhPJywEnxN/byVU79Z5DRkcYBOay9IyzcC15oTzCWHo11wk9mjnOAvYqJZmX/K4W6f7ayWFNAbPQ==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr27049944wrz.54.1635330847643; 
 Wed, 27 Oct 2021 03:34:07 -0700 (PDT)
Received: from authentaworks.lxd (ip5f5be9ad.dynamic.kabel-deutschland.de.
 [95.91.233.173])
 by smtp.gmail.com with ESMTPSA id j10sm7140198wrx.94.2021.10.27.03.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 03:34:07 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Subject: [PATCH 0/4] enabling Advanced protection and security features
Date: Wed, 27 Oct 2021 10:33:48 +0000
Message-Id: <20211027103352.8879-1-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_033410_081838_BEE0D90E 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Standard protection features in SPI NOR flashes are legacy and offer a
simple way to protect the memory array against accidental or unwanted
modification of its content.

These patches enable the support for advanced sector protection which
protects memory from accidentally corrupting code and data stored, and
it also prevents malicious attacks that could intentionally modify the
code or data stored in the memory.

Micron Flashes offer some of the advanced protection methods using
volatile lock bits, non-volatile lock bits, global freeze bits, and
password.

Shivamurthy Shastri (4):
  mtd: spi-nor: micron-st: add advanced protection and security features
  mtd: spi-nor: add advanced protection and security features support
  mtd: add advanced protection and security ioctls
  mtd: spi-nor: micron-st: add mt25qu128abb and mt25ql128abb

 drivers/mtd/mtdchar.c            | 145 ++++++++++++++++++
 drivers/mtd/spi-nor/Makefile     |   2 +-
 drivers/mtd/spi-nor/advprotsec.c | 209 ++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.c       |   2 +
 drivers/mtd/spi-nor/core.h       |  20 +++
 drivers/mtd/spi-nor/micron-st.c  | 245 +++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h          |  19 +++
 include/uapi/mtd/mtd-abi.h       |  11 ++
 8 files changed, 652 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/spi-nor/advprotsec.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
