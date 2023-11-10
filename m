Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D67C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 01:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XtspedtQiEGgkzXFgzTUa0z83pmJrG5gNn9Y0O8Nheo=; b=WnSSsZNS7ve5q6
	S7nARbFJmfZiYG+fkT5/TGQu/l4rrxx/cf5IDkUV9WaynemjM5O9eGf8AwNWooP7M00pD0Fdz2vE1
	c0SWjDL9IQUhyiZbw0ypDo8sVqTVBVQNw4e/QFJb6vll1xciFVdWjUQ39xUQ4Q1K3YRVDu6jTqxjv
	wB55aKGjyV1//akIqyCr0ac+pvJfKgw1IO54Cq/U5MXPCmy8JD5O4S0L4xZPeTcwfb9U1QLuA9A26
	8SD8jlYFWjzAD9c5MYwzI9Y6LFIxDZ98NhzJrsHApcihIbOB4xQ69rU8Wefp7HAeJFPXg1I1zBQzL
	pht57Hf8qlkiBC9ORbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCd-007ZeS-30;
	Fri, 10 Nov 2023 01:20:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCb-007Ze5-2S
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 01:20:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6bee11456baso1430771b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 17:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699579252; x=1700184052; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG2JXcJdAEbRI21vhSd41KKQfrqgfAKSofaNhUfMR6M=;
        b=A5SalJIM0NvaWWtnhiSlhsoAV597c0O6qshfg05MfPWrlGKXs88kfbKbd/2JGo06YH
         jOI/MYGrmegFQMue7tZKc4/hiZDqU6ufvbx2mOkKyLZA9ayK/IJt/F+fSWZUSCn7vCOk
         qU3sLDwtfXjdVGA9CQ56Q5vyNM7nS+zVr0hBIo/UND6NuHgbRIxJriXO9B4Kc20meRfJ
         o/nQUsFbIjaYwS0zTob/zqawtVF5w/oPsrWl86noCITlEjNt1vGOD1tY9AMb0WH31sGD
         BFa8Pl6L+LZD71O5HBFmDXq3G7E2i+PcxTyZrQ/9XmV3WG4N2siw7HeMLL/f6w7RcqrC
         8pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699579252; x=1700184052;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YG2JXcJdAEbRI21vhSd41KKQfrqgfAKSofaNhUfMR6M=;
        b=pz0N7lwRsbHt7B/GHx1f8OAAOqyafZBcDYJaRmQp+P+iHN4hG4Kt6AgNrdbQRaQnjv
         psyTW9axLoFE/ajGJcQhhjkhcSc6ON8FjidOIH8YWjeZNVHWAci+JZwTI2ygQDjVl0/P
         i3MABhkMVDZb2lqzed3jDM2sHFeh56pJ5RAqj9QR9JLGjiiKx9i9Y8PLCsoIRR+Jk9pt
         OC0LTGFpWYC8XaVoOtnZNCN/ZFVzcIPU8U2mz7AUu9piTCWw5tRLA2ln0y5M95SkXDZ3
         0X//1FJHQgEIK/D9IBfJzLVNZ0WHGWQxgpqZ1QDoIGKX0hWyrptI76vjbokWH2Pq38yH
         R6EQ==
X-Gm-Message-State: AOJu0Yz1+fXT/azIF8jEO2yH9+Yz5gKcAETO3ry+LPPJi/HykYoDv0G1
	swjv2kIhI4KbE7iH8PK8JbDg+xJ3O/g=
X-Google-Smtp-Source: AGHT+IFlJXYcMqZbFv5QXsD9tZ/V5wHK31JmeU33DK8PdzF9XnzXMXQTKXKUFSUGDxI5t77QWt/8Kw==
X-Received: by 2002:a05:6a00:158e:b0:693:4143:5145 with SMTP id u14-20020a056a00158e00b0069341435145mr7626189pfk.31.1699579251758;
        Thu, 09 Nov 2023 17:20:51 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id u17-20020a056a00125100b0069102aa1918sm11253492pfi.48.2023.11.09.17.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:20:51 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v4 0/4] mtd: spinand: Add continuous read mode support
Date: Fri, 10 Nov 2023 09:20:31 +0800
Message-Id: <20231110012035.11313-1-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_172053_801810_DAA9D39E 
X-CRM114-Status: UNSURE (   7.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

v4:
  remove a not related patch

v3:
  add method for chcking controller limitation

v2:
  correct typos
  change error handle when continuous read error

JaimeLiao (4):
  mtd: spinand: Add support continuous read mode
  mtd: spinand: Add continuous read state
  mtd: spinand: Add support continuous read operation
  mtd: spinand: macronix: Add continuous read support for Macronix Flash

 drivers/mtd/nand/spi/core.c     | 135 ++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/macronix.c |  14 ++--
 include/linux/mtd/spinand.h     |   4 +
 3 files changed, 146 insertions(+), 7 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
