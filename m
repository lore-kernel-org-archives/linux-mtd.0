Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F41C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EDU9AGYvgfSeHBF3M5wcBCIrZn8TNG8rr7q3SZ277Jg=; b=KIfn3mwP8gLNbJ
	bSgpss9qY+oCPT2x1LlIFYWWlRUbvLFbgBwcIvlhByuX3LcBa+D0L8A7E+Ak/QL+TwLjRnj/x06vy
	tQwoQ56kyIk0pcsNdleaUBiNb23sVTZk1uUr5CyvcWq3Pa17l5si3Mbxh32niDAZ3vK6o28H0a5O5
	pepIFbNEwys4npqotFt/pnMX0vY0C5IFzNBO+SnT+iCyF9rlXQ0mfA5h4bMDIVvqhLhdZiGvfaM1H
	3hM6UwLcXO7TYmDHsRX97WSLpzyKDMEy+W/qSsI7STY0dL2UEbeWSinuD/nxJNTgd9f7Vil1gLI0k
	/V5x7S+Wt5RjEZlUlLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVzQ-00Det8-KX; Wed, 16 Mar 2022 15:55:08 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVzN-00Dere-Uo
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 15:55:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id t22so2185375plo.0
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2022 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0/CrJ94TqaNXmyTFPfjBpxHH39VvVuJcaB748yr+PE4=;
 b=PU9Ue48X8/hZy9/1+cZ0ROnUN8cmI/3hLwf9JxIKTS2E0FGlK/mU6X7Si0yxyWChvz
 EqPKno21P6FIfQrmc3DEsNLa7EUqp9eTs41m1UubwX1/8BvjObth8dg2APr6xRFVPkOv
 4M/6y4lCdEZFG1P1MAFn/C4D4bdijYgY0PQI62zhXLiX/TodC1zd1WXeuZG6vPpdM+Dk
 2bq6y25hQrSirhcJFI8A2ARDa/UlGdpfzVRcOT25ZJYVcEDCqA76GuAp1uoBPjj8oYG8
 dM2rMZnTo7UHrx+j3cLfviJ46pw35lIvl1cPifSvW1QkGt/W69AxYh54uVfNEC0CW6/V
 U8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0/CrJ94TqaNXmyTFPfjBpxHH39VvVuJcaB748yr+PE4=;
 b=ZLrjyc40fTYe/KgsINyQRj2Y4+B3zK4y6EThEeDbvN8n5vlgC9FxNhsUdUppqczI8s
 ON53wxfQZ38uQznFmdrCWVypkwK5PplCbvlI7CJxE4AoS+OgY8s5KpwaAl450V1aqDMR
 5TmUcllP9nksIM+IZef3jW9uhAcm+75d0utAhwFwG77Ed+pt1cacMROOBQUx6ASxHbhP
 AshOY/ffwtH//dyqhrIjNm8XeikPNVMLmr1Y37NxtFWnhZEM6P4tCG/+kiLZ41GtoAhY
 /FU1PXhvxYuGh29zwrx0sJNVBP4dT8cg6fMhqxVDjt7JMaglbKplw8of9RPNBmYYQJVE
 LIGQ==
X-Gm-Message-State: AOAM532XPNXzNWYC3MNByobcmZ/7WauTcFEfhSvNCe5MtWYG0tC7KXB/
 fB2kd+S+CQpU1lwnvJrPJAI=
X-Google-Smtp-Source: ABdhPJzWo9ycpAb0FxfucGSEx3TuQGbM2XFExqWWirujFURthZj7AfTEgawOve1rKjgioqVmyl//Ng==
X-Received: by 2002:a17:90a:ab08:b0:1b9:c59:82c3 with SMTP id
 m8-20020a17090aab0800b001b90c5982c3mr10802071pjq.95.1647446103800; 
 Wed, 16 Mar 2022 08:55:03 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:9500:ad27:b03f:5499])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm3427852pfj.128.2022.03.16.08.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:55:03 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, stable@vger.kernel.org
Subject: [PATCH v4 0/3] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Thu, 17 Mar 2022 00:54:52 +0900
Message-Id: <20220316155455.162362-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_085506_026793_707BE0E5 
X-CRM114-Status: UNSURE (   7.28  )
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

As pointed out by this bug report [1], buffered writes are now broken on
S29GL064N. This issue comes from a rework which switched from using chip_good()
to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
returned by chip_good(). One way to solve the issue is to revert the change
partially to use chip_ready for S29GL064N.

[1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: stable@vger.kernel.org

Tokunori Ikegami (3):
  mtd: cfi_cmdset_0002: Move and rename
    chip_check/chip_ready/chip_good_for_write
  mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
  mtd: cfi_cmdset_0002: Add S29GL064N ID definition

 drivers/mtd/chips/cfi_cmdset_0002.c | 93 +++++++++++++++--------------
 1 file changed, 49 insertions(+), 44 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
