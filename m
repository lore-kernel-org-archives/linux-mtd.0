Return-Path: <SRS0=i5Q8=2I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EE3C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 13:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C27221582
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 13:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tyNS1HGE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2SA3jxI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C27221582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=v9c9poukRV9lw1JSlYP3Qay4mFEfRKLK3LtTgpORqZc=; b=tyN
	S1HGEze/594Cyqs7N0sVcE64KuWjKBK5W63UA4x1nFXHjAJ3JHvbbIDrBwTf2edKBn0C3l6aXBX2U
	3tdozvJ4CfsMsfeuOkQgl734kfKw/k/Z3qEchMajkt8a7aoYydj/YIM19EFRmzC4ItK+q37HvH+x8
	xDfO/iiYocxSB1TsOYgcUwXAt3GaYUo5VHcl6HOfWL8HEk6CiNBSFbk/Ck+PSXV/nyTONeZnGp1MV
	JVgk9ruZjCHUQuof0UqbrcamP8Os8Yqko9QbhmzQ3VmRFeba0tIBd8pdyKT0gKMqDI2swCjPI0BOi
	lxyOwTWZgIWEHzPzrMPWTjnoAzKBm5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihZaR-00089G-VZ; Wed, 18 Dec 2019 13:41:59 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihZaP-00088v-Ni
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2019 13:41:58 +0000
Received: by mail-pj1-x1043.google.com with SMTP id t101so897752pjb.4
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2019 05:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uV9emrToibtOtd5PwV/QEFcEzg9NL+MgjlxJNDfEwL8=;
 b=s2SA3jxImiV1cJdYXeJ5bMdJNOkWPu00GBypmHd+2bfmFA/bgWsvqXqKcn6CC7OCt4
 bQi3pH7Qd2vOqWCA8SSZGIzNruFEV3mkROQNkskNLD6DsCGnvqu9JVJuX4kBmPNnCLR1
 ZLwzdoXh4dgj2aA0gOe5KTznA6hhDSIazy2F3DmyYDgOrB3S764Q5PQQdrZ5GJb8xh0U
 9wXBXJuo7RYu0luX2hLHqPsjgCXCrPu09hnykK6jQJIK+IWSOxMvvbTe2DnqJbWM2Ev0
 9HJqQh/IzkqO08i8du0rIgbYsI0VR5yDuDeVF7YtqVLsDV6mGrgtuHdX7VoEslbkRUkT
 PESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uV9emrToibtOtd5PwV/QEFcEzg9NL+MgjlxJNDfEwL8=;
 b=XGrpwo0L1fKb+mIU51S/YPnnCT83F0BrkTmbWTw6FeUY5phgaWKZpwhFUJ613KCMQF
 8VPR+/LbTmtLA3263KxlciUN1UX7yA9EJGIdsudxJ37Ka4pv4FF6XIVPAndrl0CMAx1t
 mdVzPlZCemxE8bgDVl0TFN5qwforXWqZmb9cCBRTU04XW4CSvulg9ukOIX7FbsPr34un
 nc7nvmoxXffSG9oQduE2D9aa6qTqKdJ6i8R6jumPIHFtXQZcVo9hz0IVhDzejKG2BdMH
 e5aaRf7wfl0j5YIGjRtg3ZhpKo3LxoxhuZ8yFPz/vFSF1cdA//d01O3K2sCMlD6otfxP
 y3mQ==
X-Gm-Message-State: APjAAAVLL5VlSql2A6tx1EqRHTIMDufrswcgxTJ3917/FJCpq4Eb5m1L
 U+7ZhtVhOVW3RqHGzuut8iI=
X-Google-Smtp-Source: APXvYqylPKSnWPJojqWBvbGZ8mrsyp/IhNnFJFkXhrv8y3TDQkj5gq67R6dz66q7+bg7y4Fk/ImB3g==
X-Received: by 2002:a17:902:a516:: with SMTP id
 s22mr2836320plq.89.1576676517024; 
 Wed, 18 Dec 2019 05:41:57 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
 by smtp.gmail.com with ESMTPSA id j3sm3323868pfi.8.2019.12.18.05.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 05:41:56 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH] mtd: maps: pcmciamtd: fix possible sleep-in-atomic-context
 bugs in pcmciamtd_set_vpp()
Date: Wed, 18 Dec 2019 21:41:46 +0800
Message-Id: <20191218134146.10803-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_054157_798310_27F3E368 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The driver may sleep while holding a spinlock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/pcmcia/pcmcia_resource.c, 312:
	mutex_lock in pcmcia_fixup_vpp
drivers/mtd/maps/pcmciamtd.c, 309: 
	pcmcia_fixup_vpp in pcmciamtd_set_vpp
drivers/mtd/maps/pcmciamtd.c, 306: 
	_raw_spin_lock_irqsave in pcmciamtd_set_vpp

drivers/pcmcia/pcmcia_resource.c, 312:
	mutex_lock in pcmcia_fixup_vpp
drivers/mtd/maps/pcmciamtd.c, 312: 
	pcmcia_fixup_vpp in pcmciamtd_set_vpp
drivers/mtd/maps/pcmciamtd.c, 306: 
	_raw_spin_lock_irqsave in pcmciamtd_set_vp

mutex_lock() may sleep at runtime.

To fix these bugs, pcmcia_fixup_vpp() is called without holding the
spinlock.

These bugs are found by a static analysis tool STCheck written by
myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/mtd/maps/pcmciamtd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 70bb403f69f7..d2cd1708aa49 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -301,17 +301,23 @@ static void pcmciamtd_set_vpp(struct map_info *map, int on)
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	struct pcmcia_device *link = dev->p_dev;
 	unsigned long flags;
+	int fixup_flag = 0;
 
 	pr_debug("dev = %p on = %d vpp = %d\n\n", dev, on, dev->vpp);
 	spin_lock_irqsave(&pcmcia_vpp_lock, flags);
 	if (on) {
 		if (++pcmcia_vpp_refcnt == 1)   /* first nested 'on' */
-			pcmcia_fixup_vpp(link, dev->vpp);
+			fixup_flag = 1;
 	} else {
 		if (--pcmcia_vpp_refcnt == 0)   /* last nested 'off' */
-			pcmcia_fixup_vpp(link, 0);
+			fixup_flag = 2;
 	}
 	spin_unlock_irqrestore(&pcmcia_vpp_lock, flags);
+
+	if (fixup_flag == 1)
+		pcmcia_fixup_vpp(link, dev->vpp);
+	else if (fixup_flag == 2)
+		pcmcia_fixup_vpp(link, 0);
 }
 
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
