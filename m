Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F5CC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qbpxnop2Boa441cKLD2JcY0yRYz2ENZIi3U1hHNV+wU=; b=0ncWQwzXYs5QW8
	YVf37PbO59SDKRCnwuLdAOKrh/VMBz+F021s4UCDesyqczISBN7k5Vhj9+XACg0lHI7U0pIDDCZwR
	Nd6H62kiVxVYWs9lgwXA6cwmSQ0FYojbhE9uSPeoyKS2zIr+46fq71VUuOy0lraZDuIyft4tDK7Gk
	JGqzQzlTNzoEMi+5zY44UwOzAp38CkVhF+eDzMrXdh6Wdb6XOm1dEQH1KtP3z78FcqjBMcZW2wnWu
	Gd9Z24A+cM8QJg0O/qapY+p3GwNTmL38mi16yCcm28ytx4lhpCVPLxEa9/mekPAQYNn/VNaxbCNE7
	c8BruYczpLCeKmX6RX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvhC-00FYXj-IW; Wed, 23 Feb 2022 17:44:58 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvgx-00FYS1-LY
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 17:44:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 195so20763832pgc.6
 for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2022 09:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bo6oFnHJAbU/j6h7MDnhNKM3GTAQUQeHdOFA1uJIsUk=;
 b=oJYZzP6GFPUp82PEMrpkxE2tpMjjHkYXVbYRnSdJyRdfqmTK7/EQNIaR8w3NIZmHya
 sZ+/6BvzTAs1hlT+RxW8gsRDZHFwuNf+NUp7MamT38U+XeQpUnmZ0Rp8QJ7JiUMbSB7H
 m2vqzA1DSdnjIcea62DI3tEfPfX/RCGDNuhE4H5nLSFyZPRl1SCSZePw7WmJQoLO4J4z
 xaQRgYyVRuEI3+YwXjVHfCCQ5CZy8L/fMU8i0fNfvhFswvYPgwGqAWaniAJjWfiTdgvx
 cW49KB6pZGJbSRy4w0F1lf8DatWYynCabPXB25oNKzl2fiOo9aI5M66wBLlmmRsnk2bY
 BW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bo6oFnHJAbU/j6h7MDnhNKM3GTAQUQeHdOFA1uJIsUk=;
 b=kH+jDzOr1G4XXL4PlvkjbNj5rFKQpHWmGg2g71hqdb5XHvQ91fEIbpw/FYf3FQWKmV
 41CiPNXkcJJ1XU/YXZzInTdghePpfKTde98DAVwMOHIRKKZmo3q41s0GE9hAXh4YRd2B
 xr1g8gXW/E9D93BQGE7Kotyjx21pnfobceOZhkdHy4agCZonUJs6/NEzOlFHGB/MOI9t
 Q6FTb7l9m/8Awi3kddMN0LwiHgkCvTQALuGvafuvRPiB3lmSrVPAPox70LfjJ1zI/oA8
 NHyxgQpHTBHsPfm4Fg2t9yoyv6SNcmAILKpkSO5W6pjNYzITinYoCmfkf+4e6zMF4fy+
 Ki2A==
X-Gm-Message-State: AOAM532/aAE/vUPQebJ+jEjFTZL8p0bIGSTxmn9Ec5qJF7WyH+xZrPY7
 Fi+tBpZgww/u+k3Xg2SrWWE=
X-Google-Smtp-Source: ABdhPJwidJmEBQ9VvU3IKY6i4jO680dMGmsqMd6R3lsYnIOGnmZ99c2ZGxqVEhmgxaqFlAPkCPl3yw==
X-Received: by 2002:a63:1145:0:b0:373:7f7c:4a22 with SMTP id
 5-20020a631145000000b003737f7c4a22mr566726pgr.208.1645638280986; 
 Wed, 23 Feb 2022 09:44:40 -0800 (PST)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id g18sm127422pfc.108.2022.02.23.09.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 09:44:40 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, sashal@kernel.org,
 david regan <dregan@mail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND stable 4.14] mtd: rawnand: brcmnand: Fixed incorrect
 sub-page ECC status
Date: Wed, 23 Feb 2022 09:44:30 -0800
Message-Id: <20220223174431.1083-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223174431.1083-1-f.fainelli@gmail.com>
References: <20220223174431.1083-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_094443_746938_F0F72971 
X-CRM114-Status: GOOD (  17.01  )
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

From: david regan <dregan@mail.com>

commit 36415a7964711822e63695ea67fede63979054d9 upstream

The brcmnand driver contains a bug in which if a page (example 2k byte)
is read from the parallel/ONFI NAND and within that page a subpage (512
byte) has correctable errors which is followed by a subpage with
uncorrectable errors, the page read will return the wrong status of
correctable (as opposed to the actual status of uncorrectable.)

The bug is in function brcmnand_read_by_pio where there is a check for
uncorrectable bits which will be preempted if a previous status for
correctable bits is detected.

The fix is to stop checking for bad bits only if we already have a bad
bits status.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: david regan <dregan@mail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/trinity-478e0c09-9134-40e8-8f8c-31c371225eda-1643237024774@3c-app-mailcom-lxa02
[florian: make patch apply to 4.14, file was renamed]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index c65724d0c725..0138c0c6a4b9 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1637,7 +1637,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 					mtd->oobsize / trans,
 					host->hwcfg.sector_size_1k);
 
-		if (!ret) {
+		if (ret != -EBADMSG) {
 			*err_addr = brcmnand_read_reg(ctrl,
 					BRCMNAND_UNCORR_ADDR) |
 				((u64)(brcmnand_read_reg(ctrl,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
