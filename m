Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2520D5A6CC
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 02:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KrKmjV5BuH/h2c2AiSR+S3zBftpBKhInf9BW2sUaCT8=; b=BOQbZJ7Vr4mcJg
	MKOhxfhMzqyVIdAt2ttuZt9rD1nUSVFmgK2awnV2FDM0fqyPM7UY0azwspqGCXOqf8mE3VDnba3qh
	dZU1mC2WJlJRDLGcFDwxot5aC7wfEI5VOAZWdeUflaSKoc4wJ+NBcn6/haGL6m9FVxKigrsYuGAq5
	qhT0xBSCrRnV2o2j9R3wxeqGHFz+CgOVpTbh3zvjihSdLd4sOYhZlI6sxLgBJMmjQbQA4A37kxH78
	Ws02mP02JoBq7Nwk7JBYoiJsM7RjUyMaMX78qst2yQoAO6QbFIncHMuzWsNNu4gJYlPryuZfkDybO
	zvxppb1leRTwLnEE+Ibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFlUD-00000009Uhw-2lQy;
	Tue, 26 Nov 2024 02:39:33 +0000
Received: from mail-qt1-x864.google.com ([2607:f8b0:4864:20::864])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFlUA-00000009UhA-2E6E
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 02:39:32 +0000
Received: by mail-qt1-x864.google.com with SMTP id d75a77b69052e-466a799da4dso346981cf.3
        for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 18:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1732588769; x=1733193569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kpLPflpD9e8Ydlco2Zh2a8FjV3s0t7Hy2jkS9iRg9c=;
        b=GTsY8+RAEt7bWFR+kfDQoRSyRIlK/Y7QvSS/CuZX4PIU12a2/Sjh1AKvoSGXMIl+Ld
         LbjBT3Y6VviKC8Etk3IkxPlkQR8GmS4BvvGUGF9fNd/Lqqqy40CMX+pvtNO5Rl4NKZSm
         1tAHYua/7D2ncmK9VaAc0PdxhP/7TrpFjVHdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732588769; x=1733193569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kpLPflpD9e8Ydlco2Zh2a8FjV3s0t7Hy2jkS9iRg9c=;
        b=oBZjAxWIV/OslQ3JsUKBtMt1MOyivy1upC/9+Hr++TOL5DpS+sIljmK7H7KFNeg6sR
         hQDXjJX16e9eAdMckeChgtzrj1V5fF+PJ7pzPO5aLuHKwyKO3G9CrLXWyo7qtK7PmYa8
         TJ0nIcGDN34oGpjt+pVTiB44hgyBYkNU/IIgd3Yl/yPq1eh5dQFN1zcWLVAE7iNw4enB
         WPpIm6vFOpuTaCm+t0ryMVK/JzQVBD90vHsWACKaQVbPpQCrq+5yrUAN69ekvoQWls1O
         toO3jsLLCPg9UAemCCG5ShIWwfMFT8IwtCT7XC5xc1N6ux9wOiTMBIhxFzRBIka7NYSf
         JRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb4buCtgpz7I99SbhhpzFixhZRlGPYRWWUPC5duYWa1gI8ysXpzpk33Fqd2B9QoA66+QImZ03Ky24=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTIuQjX5GT28KzQq0lrTpyEn/Nsn6WOgmGvoT2QAy+8ccOWN2b
	rxFjXufDpwvxUqJdxoXYLCmuR6/J0sJYA4km0qMVAADqEXlTPf8IGtsTXMw6+JJJTciNFW3hhGn
	kA6EX130OIDPfceFkedE4vFn0GOgBQg==
X-Gm-Gg: ASbGncs1enDHoMlz6Yjhvwn1gX6OON1AVHr9cVo8jzzIBEPyWgHBMWiCXH1udllF/RL
	nVG1bwmEzvLPi/HPE2aF6/vyaRIuwaASerl9b8P3KNzqmEPVacCpS+e/39lOvGrH57IoFJaClI/
	R2x+FkcB3Eu7f/vqHOMdPHZwD1erIoXrHsmN9Lj9k1dlG4n1phiWn5Qr1YjauG5eVz8yGJXqrf/
	4miOlMuSebky1UKwnAJSPO1JkWZVy2/Q9Rr2GUa40LygHh6aMTgtxgmGlaJ7+gJksjcf/qwPj0u
	aICYnNNKBNoRoOVM/zsi3R+E
X-Google-Smtp-Source: AGHT+IHFSuYCkpnxUV4L2YQoxI/iA9eRDt+t80mIucX4PwO3MTQQZGr/9+1eupbNSwgmITlQMMyi4zAtUu5q
X-Received: by 2002:a05:6214:29eb:b0:6cb:6006:c98b with SMTP id 6a1803df08f44-6d85579b536mr13944196d6.5.1732588768749;
        Mon, 25 Nov 2024 18:39:28 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6d451acf626sm4599396d6.42.2024.11.25.18.39.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2024 18:39:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: david regan <dregan@broadcom.com>
To: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	William Zhang <william.zhang@broadcom.com>,
	dregan@mail.com,
	dregan@broadcom.com
Subject: [PATCH] mtd: rawnand: brcmnand: fix status read of brcmnand_waitfunc
Date: Mon, 25 Nov 2024 18:39:16 -0800
Message-Id: <20241126023916.197635-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_183930_664668_D5964884 
X-CRM114-Status: GOOD (  12.26  )
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

This change fixes an issue where an error return value may be mistakenly
used as NAND status.

Fixes: f504551b7f15 ("mtd: rawnand: Propagate error and simplify ternary operators for brcmstb_nand_wait_for_completion()")
Signed-off-by: david regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 482c6f093f99..701aa19328ad 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1893,6 +1893,11 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 		brcmnand_send_cmd(host, CMD_PROGRAM_PAGE);
 		status = brcmnand_waitfunc(chip);
 
+		if (status < 0) {
+			ret = status;
+			goto out;
+		}
+
 		if (status & NAND_STATUS_FAIL) {
 			dev_info(ctrl->dev, "program failed at %llx\n",
 				(unsigned long long)addr);
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
