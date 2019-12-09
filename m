Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEEAC2D0C2
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 06:43:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D19206E0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 06:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="egy+CORP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8fEdZ06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D19206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=q0CAkn3VHIxTbIHuhPVjf6c+BXDGZSVrFjSjbgJJ9PA=; b=egy
	+CORPaDRBQ4AMFM8urc/9f29z8oitUHYBFeRSHVKCnF2xF7+3fBlPGRvK8UfAlqjSE+IW/GN9FpdV
	rLVY4B8OepYU9qudVfCYTfNkA1mOYLFRh0yva69yTiXXoeJfLbnKlo4U0M7IWm1gnlqOZLd5AcShq
	a3II6nOwMz2vAWhMpQwcbMaxL7nxQU200PABgh1V5vvq1kTOJt1DJOQty1ec+TpCseHdn57FcXk7K
	gNr9TwItonhFW911tZssyyx9eQcAuKsvAaYpOSQCYEEeAgJtXT1caStojF4wSt701alrb2Nbowd9l
	ZmBqyWm7gcoswpQbmXHdH61d239cq1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieCkx-0006kD-42; Mon, 09 Dec 2019 06:42:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieCkt-0006jJ-Mr
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 06:42:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id t2so14838194wrr.1
 for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2019 22:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Z/gqeIwlwYbkGvHNph1xnPeB0WmTDYnMy3C6ZnEFL6M=;
 b=F8fEdZ06skVaGbXmvNuOAlUdaVrRsbGbV5scEVIU8NAkzAS0yg92goupztkyGwj7KJ
 2d3l5g5mkPhjsM8MPcWoRA6MEyckiD6ldXPI3qw0tCf+7Oxb/u6Sc4txD43o8FrpiALo
 eiKrFkJgcuvmNM9ESNomvOc2TWuLm3MJibnXWNu7V5Mur7zP7o0ad+IQ+sL7ric3qiNZ
 AtJuBbs+9uiuy7GuIRuyHjMKCK/eMRJx3D8l7vSp0OT+MzbZzxfk+Hdq026AhtVyZR//
 BPRv/AdNPg4O7F24I1RVpgnfKOfcdURAZucCPW+mC2ZhJABx/Z8W/5sXw7Ek/VusCmgx
 cOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Z/gqeIwlwYbkGvHNph1xnPeB0WmTDYnMy3C6ZnEFL6M=;
 b=HhhkCTEHR+Jmzf0f1X0LuTQNDUl6iPxhiYhnoIKhsPyl9mK3fgGvLoAxWo/SpUssDy
 YThIQtJg5GpNypmMaCb4cDft8J+RdTcJ6LSblvCmD77xLTljEqeSRtc+dPP+4nefuHMS
 cSEv3fi4dFC2UDoZrl7TlkPhJP7wymVBolf4LFm5JMUs8gloJbBxE9Q3GcmW+seE3/sQ
 miaAP37+pv51NPpf+LlBe55hgNKSD71GiOQkdyvHnU8/rjGFl+UfgiWxrCZS+7/1ywAc
 foaCQlZM48eqs9xJKeHsgCWIC1AvLZq0GuycAe3uJXlkh+fk/kiMfEFTVEQuDOq1Pm+G
 1HWA==
X-Gm-Message-State: APjAAAVnT2BTGT1s/QPUdRxBuYFMywRG5TOkMDKm1jIhAvVedv0oUdkS
 PZRs2dZW9s0NLUgQvbHoj4U=
X-Google-Smtp-Source: APXvYqyPn/RrXy5ko7WN2H39RabnTEknHHNVKRMODNdg6XvnUOedIKK8sNY9CIVa5wedKOsn9+TCZw==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr173008wrr.74.1575873768489;
 Sun, 08 Dec 2019 22:42:48 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id t13sm12980016wmt.23.2019.12.08.22.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 22:42:47 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: miquel.raynal@bootlin.com, richard@nod.at, frieder.schrempf@kontron.de,
 bbrezillon@kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 0/1] Add new series Micron SPI NAND devices
Date: Mon,  9 Dec 2019 07:42:22 +0100
Message-Id: <20191209064223.10003-1-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_224251_777013_74122C0F 
X-CRM114-Status: UNSURE (   6.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

This patch is for the new series of Micron SPI NAND devices and the
below datasheet links are for the new devices.

M78A:
[1] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_3v_nand_spi.pdf
[2] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_1_8v_nand_spi.pdf

M79A:
[3] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_2gb_1_8v_nand_spi.pdf
[4] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_ddp_4gb_3v_nand_spi.pdf

M70A:
[5] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_3v_nand_spi.pdf
[6] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_1_8v_nand_spi.pdf
[7] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_3v_nand_spi.pdf
[8] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_1_8v_nand_spi.pdf

Shivamurthy Shastri (1):
  mtd: spinand: Add support for new Micron SPI NAND devices

 drivers/mtd/nand/spi/micron.c | 129 +++++++++++++++++++++++++++++++---
 1 file changed, 118 insertions(+), 11 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
