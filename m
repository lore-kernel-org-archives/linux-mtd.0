Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F831C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 03:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5dZ79aS+WhZtS9rMidmGCSg9i842YUQENOJz4zyvds=; b=JDb1ZggdBR9QOA
	1WEWC8Ly1upKwGPKRqtfE6JoTv5EAKVLU9vqXOfkctTvkuUgqG9jpU0lQo/3uVFvvLWyurywzP4Ee
	18cG15YQz37cHwt7DPJQ0v2FOgqRM/VLvoOM5RWK2EYWNZDHawpv4aBNwIIP+6f+/jOQlczbKa8/+
	bbRmDuxDe/kkepHvVpJbY3NOAB4Es/98iCXRavUwTcD7cerxhP/mxkEZTX+YlZl9tnd0lUhcGB8r6
	qjwTJ1reDoPhEtRELQjMe7oshTWUTxopXpCHfSTOGKFjciPTiPjO0mSyZF8MNIlblYKN6XIiRJgx5
	oosZANllZMscrHQhb33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMLje-007qF2-4p; Tue, 22 Feb 2022 03:21:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMLjJ-007q9y-UM
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 03:20:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id m11so10888696pls.5
 for <linux-mtd@lists.infradead.org>; Mon, 21 Feb 2022 19:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=It4RGSp99XFUqiUGEzXdClglbEaTDz0QTVwNHQyEiwQ=;
 b=cx1GruLCUFuWF7dtq9M4B+SERi38A8PQacjrwesId9ucpYxtjotiSzO4viRRv/JP9Q
 WcliL46uWLjYbOHMp+awY+Zu8CwIsXbs08iczmte1LLIbhx/rVIs1xBNfQxd3zHMp1kf
 ruTlt0V03qjcNf/gOL+XRYE2XWl46F1iNfxUKqyAukgmj/CISyiaBYCjIQCU0g+EYOAJ
 eJVVn0n2/RggnLnJwa+xxclZuueEhw1NOuEtAEaQhrDtVeviQE1ej7iYbTFlruvdnffi
 2jIH7zDmfdnfguTInXU/gQpev9UgrtfQ9yim4Bfk3Ef3hVZ/OthgdtsiAdW5hvUfMgN3
 A9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=It4RGSp99XFUqiUGEzXdClglbEaTDz0QTVwNHQyEiwQ=;
 b=XzwdU0SxMv4XIoSWICW5SNnifoiMyaeY640eVVZ+CBW4kA7znHZqjPLuevrNEMkrvX
 wW307GJtR3wnMkRWMzisiDG6SNDTGGVM2+TdnSlxF8xSUfz8qTQh1vb2/sqhjfEyfsCi
 DwUlXEUu937QybIKrL2yv2y7XhcVllenjzyrHCsOagU9SHYXDE0j47nINKudsO4pYb1h
 d2CS6a/MTCHc+h/ffq+Lal91xU107n3hIuNJDPXeegOhqXCW7hBqjByZ1CFTtVXq0rvk
 lioIEB2ZAK0qGU2HxpmGmkm2b/UhzmyQRTX1pSO4AiA1U4cGvajxfSVl5R+1iktROKWc
 mTtw==
X-Gm-Message-State: AOAM533UW/4JXhXoFihIDPD8fFAsl192P3f0NacqPJBuqs1kSFdFE7e/
 ExCRDbtGkZthGxElLDfe+ta4istg7dA=
X-Google-Smtp-Source: ABdhPJyoHG04LqVY1IevXNqwDu7zqZjBOqBAtL3B6R+NdFZG6EVXz/I5pqamqF9ZVV7eGCHSnCWYtg==
X-Received: by 2002:a17:90b:3a85:b0:1b9:e751:2335 with SMTP id
 om5-20020a17090b3a8500b001b9e7512335mr2020652pjb.43.1645500044463; 
 Mon, 21 Feb 2022 19:20:44 -0800 (PST)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id x12sm19068111pgp.25.2022.02.21.19.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 19:20:43 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: david regan <dregan@mail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH stable 4.9] mtd: rawnand: brcmnand: Fixed incorrect sub-page
 ECC status
Date: Mon, 21 Feb 2022 19:20:24 -0800
Message-Id: <20220222032024.10220-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222032024.10220-1-f.fainelli@gmail.com>
References: <20220222032024.10220-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_192046_002900_E26423BA 
X-CRM114-Status: GOOD (  17.30  )
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
index 40fdc9d267b9..1c8e95cf29d2 100644
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
