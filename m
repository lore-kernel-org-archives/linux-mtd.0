Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500F8C61DD6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b90BPPNonsTG76AiXBwbWszisidbzqYjIZLbDL9IAos=; b=aikINvRN6/l236
	kn5lFCcTM9zFkw4fslrGKeu0egJEqJqyon1WTTfP+ur1qoeNzMAetZOjzxMB1/XsHjobdT0RmXScC
	3SgXazNlqFprIRvwwkdWCWHeMbps6W4QRd7eH1Gfkef+1kWEHz8T9rLjI97iieKFJfJRQvRu0VHVm
	4k91tipb39kqCQpTqV+A9/p3tYpJVkkkPKIwvTReSjefy++pipVJOA5NWzFvz/Hhs/n/IPehO3j2M
	0mO3egSevyhBNJtRBhXtwcYOyy8wudPbs+N2V7uV6ddFue/jonPO0UcgHuwhdja3U8+3A6p3ZeytC
	dhD4VeZaLMOC53+6pwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLN-00000005Mvh-2TzO;
	Fri, 28 Aug 2026 08:53:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLJ-00000005MtR-1sDB
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 08:53:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso6184465e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2026 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907224; x=1788512024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtwEXzyI/WEatI7C9Ufc77ZLEa/MCSb7xNe3YfRc2+E=;
        b=BsG05O/NGLfKNw1Io7TP68S2Jku2dIF1CvZ2VMs3bttJDcvFkKDLMogvf2UeEy6Ldn
         2VnQA96+gz1dX06T8lEb+mBYyBxP6ScVqwetDqNnqIoxho+/lIInD6QW++zvIADYv3tc
         BXG7hodwlWnzLxy59Wn5nGixgYhxz0SusnqP9XTS899ClI2xI17A2b3YjlCxqKQnFJQg
         FH2r8b4mHzbGCV4h6+S3iaAywiWGqAguuaDe6CI3CSQcf/n14meSl+IT7lk/ip9psKkQ
         L+SRtqfj+8lut4mfAoxdqecMXxzpTUYhhER8JU5Vh6wlEWRrFbv/kgFhujS3P8q/9lQN
         90UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907224; x=1788512024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtwEXzyI/WEatI7C9Ufc77ZLEa/MCSb7xNe3YfRc2+E=;
        b=lzTIJ2CgwYQsqREla5glxxyJBWMZQGg/sQiInqaWUNeSll4DZNVUb9m22m5yLq682e
         ZKz4f1Zc5sAr3g7XZvmnKZeSTDB3upgs5J6QmV3WS+TluOnIG8xUMoRD8QtnstYageCo
         trboKjPOOeCWp7iSQI84+1XM++h2VkFu07ChRXLvsMY074uWIUfk66qU2/0Dj3RkQLwH
         5/Sg/Aj/oGE7UAzFOTePQLGtYVLozWI2CDC3gFly7OOn0/ZEb5qcPzHEFW+pvcUFdEls
         G/IbtoDHuoIgj0gdwtPsiw5o7mm6uhhKaLylodGzZbS7892WFFhFx+UeaB4Zngz+OKzz
         wkCA==
X-Forwarded-Encrypted: i=1; AHgh+RrjUeybMVO5bh0lzrYi5lhVpDM2IQ937cyHgvwkedRj2IpordYZX/gV5ERB79FWNJTqm6DSHo1Vb3k=@lists.infradead.org
X-Gm-Message-State: AFuF++k32h1leJUvCjULsF/DdjOnWJ3tEcMG7qSlR3I/+DyM7I9HujjA
	FphkFn6uQYWgczD+y6Isfr7ByUo30smeruaOSopakAMTEen1CGO3n1Bl
X-Gm-Gg: AR+sD11xFGnP3Tvg2oUnIBCZpW9KcyqwKU8zvdoF25aepFFl3kDfBHsqL9HaWa9+A+y
	JrYAKJqhzY668JjRAlEwLTXHSqsaP6Z6tNc+fvUeVLXoEqQsiyN5tbAarfUJC95fb7KKk0Apm5V
	zdTGpDAZeag3qW2Cn+6Lx/PRHKvaVDeTve2P1oKyqG4ZjjsQkG93gsZbgMXnUZrH28iT+fSmawT
	7MW4j0nuUbpwt/OH+5Yk574OyHRrSSJ4mKpQtsfmmNhNyZ1/d9Y50Cu/2FukgntbK8dGVN7lSZy
	wH/l2eXDJW5+6OfWjESoXz+lEPBUg96FNmrpYvagnukKKAZ6zJo6S8xtzgrHXcB9NhMMGNqqfVF
	Y+cbJp/k3NuvaEMcOw/Kkq4f7Qj3uSbSVn8qaApCtMk/N5JYKlcdeKfsLetVK6dX8SjTIqK0AmE
	o47f1EvcxmGwOIZKzcYYgMZSFhBhZH3FeP9HB9ti7x73Ytgvac4ssqj4kjv856s2++O7ByeFreM
	nLG
X-Received: by 2002:a05:600c:4704:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-49b91c2d8femr69750805e9.5.1787907223642;
        Fri, 28 Aug 2026 01:53:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm43155175e9.4.2026.08.28.01.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:43 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Bill Pringlemeir <bpringlemeir@nbsps.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: rawnand: vf610_nfc: rearm the completion before starting a command
Date: Fri, 28 Aug 2026 10:53:40 +0200
Message-ID: <20260828085340.3916239-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085340.3916239-1-mehmet.fide@gmail.com>
References: <20260828085340.3916239-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015345_503388_64DC9FD5 
X-CRM114-Status: GOOD (  13.39  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When a command times out, its interrupt may still arrive later and
complete cmd_done. The next command then sees the completion already
done and vf610_nfc_done() returns before the controller has finished,
so the caller reads the SRAM buffer of an unfinished transfer.

Reinitialize the completion before starting the command, so the wait
can only be satisfied by the interrupt of the command it belongs to.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index f831780d6fff..f88c7b45bcbc 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -291,6 +291,9 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
 
+	/* A late interrupt of a timed-out command may have completed this already */
+	reinit_completion(&nfc->cmd_done);
+
 	/*
 	 * Barrier is needed after this write. This write need
 	 * to be done before reading the next register the first
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
