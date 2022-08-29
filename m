Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC4FECAAD4
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Aug 2022 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/biXQHYKerz1lKvIW0G/RHZ6JS8ABsqkCb/zzp+yb8=; b=OqQxsXr3ShRPJo
	znNlKEgyoqT7ZhmbBzE4znvaN9tPN/OeBoOzRtKU5Zd3wLMlqRqFA8VjGeWIasruIoYYoOr2AFHr+
	LB8WRW13ybzsmipzZAXyfLDg49o5pcJhalafEoUogpmJegdeyRVuH0XINKHiuBwy3mFgIrNcyXnPU
	io6ZiKuag95rzLrkej+AUgqO7O6TDCPUYGRFwYjEOhPM4FPHOihNaFZnL1mvTlzWimUBckzeeegyR
	fGL1s0NDNuLjn1gb+g2npDrYvRhGTI5ozfXEyGZAO7ZmXsa4q2DFjbfKKJfIRBcMa8Mo4vkOuuds6
	/ENEbaenBC8yBwYtnUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZ98-005dEM-Bb; Mon, 29 Aug 2022 07:25:22 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZ94-005dCF-JW
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2022 07:25:20 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 72so7351486pfx.9
        for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2022 00:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=00AOZMeWR0pvooGWkaSgMyQOFcaRNTXTND7Ro/H1kLY=;
        b=P5iUWGfkbriafKnT3X58pPv3EsF9/PR4GIeOv1QmuN4FhSZSxlfZXn91zDYSdec4zZ
         fx0Ao82LyiZ6Xicvfnu7DZPvvpe5yahEjexp1nnKwXSqvUDsorKgF5H93Xyc2BsYiptd
         V+V9CCumtP/8KaFBx4QvQ74u2FJP4+ML7xE8XvaW9YIfbQRIeRDZEQd06+tokqu1ofmn
         qcr8zTZxf1CLucou5EK1uvoQrysOvsLaTH0rphAdcSkx60q/LHA9m9yJrHF1TvK0DbSl
         qIQTdA1gWs0X1jIS4suVkmPV/PQsJRoFHzFn/3ugBcqqX6IrwdJK15rRUnOKx4mh5Yzj
         6h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=00AOZMeWR0pvooGWkaSgMyQOFcaRNTXTND7Ro/H1kLY=;
        b=W7TaDn3boaUF3ZzOWgtzaqYEMbOQ0ncwU64cGhe270l3RsfdRhE+Tr0Pl6xbdZ/SQW
         SyImdv4IpaLoNueEP6ATjVjTgiIThH9Pihus9KmoKbqpGOUrzvGvFheAgj4Dji7Zc81f
         TpxfuvmsfYYExIq/0o9fZ/qEcU9JOmHo1LyDxrphj615rpi6fMBQJd+aXAJ5DSUKS/y1
         oAf2l52eTT7uJ6JNNnLP8iQrJ9DfAuGJPRKRZUYbgvgs5IS7TFBsY2JwmwFgs0GDr91t
         ZIqTa21ywHV3h9oYfke0AAml7IgfSitq9s9BjP8eNQSqDuezSPLO5a5XvYQfUxd/6/z/
         ehaw==
X-Gm-Message-State: ACgBeo09cAHG5Tkd2Cqi70L92EGQ3szZwL0EPJ8wybBTuy5CB7N4ZRDp
	fNaAO1Ts/5v6i21JV8XZRdPZ36GZqwU=
X-Google-Smtp-Source: AA6agR5b2dGz0Mawdp1A1AZd3ltKNV+8/nHaL45bZ9QbaOBEcyk/9YtWJXxgo35crSamV2/rW0m0Bg==
X-Received: by 2002:a63:914a:0:b0:42b:4eaf:7c75 with SMTP id l71-20020a63914a000000b0042b4eaf7c75mr12835489pge.306.1661757914899;
        Mon, 29 Aug 2022 00:25:14 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id cp17-20020a170902e79100b0016d9b101413sm6628953plb.200.2022.08.29.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 00:25:14 -0700 (PDT)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v2 0/1] mtd: rawnand: Cache read sequential
Date: Mon, 29 Aug 2022 15:24:51 +0800
Message-Id: <20220829072452.15342-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_002518_763742_2B2BD8CC 
X-CRM114-Status: UNSURE (   7.53  )
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

v2:
	1. correct the 3rd parameter for nand_exec_continue_read_page_op function.
	2. adding mtd_info struction for judge operation in nand_exec_continue_read_page_op function.
	3. adding performance result in commit log

JaimeLiao (1):
  mtd: rawnand: Cache read sequential

 drivers/mtd/nand/raw/nand_base.c    | 96 +++++++++++++++++++++++++++--
 drivers/mtd/nand/raw/nand_timings.c | 12 ++++
 include/linux/mtd/rawnand.h         |  7 +++
 3 files changed, 110 insertions(+), 5 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
