Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAD0E77173
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2024 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GxedoaMmF1/kWlkVxqIT8BT/9qZF0Lxk7kQAOwGp2Qg=; b=qn+mtbTSknsSHC
	Ut0Uhe1LMMczMc/dOYSIdBXi5KJc+tJiNyh161GmYGqzeFotY124ZMMAbgsBqKdNnUYAnTvnwjHZA
	TyK/wDQtj4+ZnlkfW0Z7WWctBhlbFhXZlc0D2dBVKs26XAj6WyBuezCuFx+BWhFt/Lat7cnKmvyZP
	fBa5FA3MALgJ4nUYiKOrUepdP4x7alRwwgLUtwHF0kE3ixPhFUlStJrcFiX8hUndRcilad983zGjq
	smrWUkP3SLAcxnbUVLh6OaKQLU9R76ovO0H42G7Lf342iOPbqgPWwUqcgA0R2ARpUHEDXM6gW3N8V
	q313rVl6r5S9mErSKRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKD0t-000000052df-2KIo;
	Sun, 08 Dec 2024 08:51:39 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKD0q-000000052d5-36JV
	for linux-mtd@lists.infradead.org;
	Sun, 08 Dec 2024 08:51:38 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6d8e7df7199so20605906d6.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2024 00:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733647895; x=1734252695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVvqWdbxf/H6jRAhod1WVWJ8TNzuw0kAnIVXqhdFydo=;
        b=A+iKnk7xVPevL2QwUc6/uBwPUH1/gPiWFsDCbPozABK/jnxSiLmYxhc5cnsQGF19HS
         QclfScUVxPav8lC9cUDZiU48kDmbF43gXh+rZGYXpdbRZUSGQvNatrRWtV6+hRjo/Efc
         fLraKvAf5LJNFyixOSOKUMUSHhb7sj3ak+HiB0nS3pRGMEy2e1BkDJZ71ZAkLfFAbixM
         rebNZWXVgcqGKhYjLhb+hZUKRHC3VKVupTDRIeoFo6T/QOj/IRtk43id/ZdnOvs3rP/z
         1eTTDUpLOApBLMPG2m0/M+MHlZ2gUlC6LITi10M8IO/K+e3xH6FFPqb0AvX2XhR+INdB
         EkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733647895; x=1734252695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVvqWdbxf/H6jRAhod1WVWJ8TNzuw0kAnIVXqhdFydo=;
        b=q77amFAAYa9K5xXQiqSUVevglJOVSkgWP7Pa48CHBYzdfOYMxJjmSTni2eum+lAw26
         qcCJV1szflNxQUght/pv4Zd5BBrG/ATG2Wp5TUNk4ZtOntjov62L1yy197efst10KDOW
         +AuIjr08X94c2zZLXZLVUfA55UnkxcDRCG5nGy40SccJ48r+xS8maonc8sy3LBk5TLm6
         SllKYXN9Sp0YcmRpNliiM3rzJ4CtoXH6e3OtiNy38enl/cMp3Y2R9JgruyIrUZY8E4/+
         zHOSH/S7cL+rZJQZ4gaa1vJIA51SWJtIEBQMg2IEx3LoZexZVcgcpZg+p+dPziatFlFT
         lHCw==
X-Forwarded-Encrypted: i=1; AJvYcCWc+2ICRW/9gvTjownOxWC1MJFeWYjD6ZJ4hrCEjWkIm7IdVhxTKVOogZUmOQnxZiJ+5ybjVenWVgQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiSxMDHoBWl4K0uWHOp2l4EbOXSFpqGbhnV9Nacz7xetVraguI
	uxbu60SW2otRaeCSgbGkGtA6+L8oeNXBsjlj12wk/WsWCDQHLk9b
X-Gm-Gg: ASbGncuqN3DT2TJAhH2z7JNC9MdTMRWJwx3Y1n26elFFYMYMaEfTlQ/4OfazAAbj+z1
	6L6ZKB84p+hiv59s5kHLjr8xXdCjjQc4URjU9qrvVM84afKWNB8/ifiF+cDU7O5brsuHOOMWCbF
	oVnbK1ODztGGHjrh1Ab4QvLhcGtB1rfYEepz3/AsQAduQaUecknoc8YHNlz7b7HcY5i2mOhwVO5
	D/Os1oCoaKHhVJ8jbNcaci0KmxE9Wzvao52yh25S4cxoltWQtlMw1ObQ/BnaBXVjD635BbeSAiz
	EU6L408QVPE989yDr3u181tIs5r3
X-Google-Smtp-Source: AGHT+IGKXpOFhEG+cldwUV3LOiwRTsB7qVtq7s8BEE3ykr2xumtKNi/IcShLrgQaeTaZypL/IOTtOg==
X-Received: by 2002:ad4:5ae5:0:b0:6d8:a188:369a with SMTP id 6a1803df08f44-6d8e72512camr159088336d6.48.1733647894874;
        Sun, 08 Dec 2024 00:51:34 -0800 (PST)
Received: from localhost.localdomain (d24-150-189-55.home.cgocable.net. [24.150.189.55])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6d8da66db6fsm36966536d6.10.2024.12.08.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 00:51:34 -0800 (PST)
From: Dennis Lam <dennis.lamerice@gmail.com>
To: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: syzkaller-bugs@googlegroups.com,
	syzbot+0988a383ae7c57b99dd9@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Dennis Lam <dennis.lamerice@gmail.com>
Subject: [[PATCH] MTD: fix slab-use-after-free due to dangling pointer in notifier chain]  MTD: fix slab-use-after-free due to dangling pointer in notifier chain
Date: Sun,  8 Dec 2024 03:44:38 -0500
Message-ID: <20241208085121.53415-1-dennis.lamerice@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_005136_870188_B6924D60 
X-CRM114-Status: GOOD (  10.64  )
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

When attaching MTDs, a reboot notifier is added to the blocking
notification chain. However, when detaching a MTD and freeing its
related objects, the notifier is never unregistered from the
notification chain. Thus, when the chain is iterated there is a
possibility of finding the address of the reboot notifier which has
already been freed, resulting in a slab-use-after-free error.

To fix this, I added an unregister notifier function in the ubi_wl_close
function to ensure that the notifier is removed from the chain after the
device has been detached.

Reported-by: syzbot+0988a383ae7c57b99dd9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67409091.050a0220.363a1b.013d.GAE@google.com/T/
Signed-off-by: Dennis Lam <dennis.lamerice@gmail.com>
---
 drivers/mtd/ubi/wl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 4f6f339d8fb8..31a1e5515d98 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1995,6 +1995,7 @@ static void protection_queue_destroy(struct ubi_device *ubi)
 void ubi_wl_close(struct ubi_device *ubi)
 {
 	dbg_wl("close the WL sub-system");
+	unregister_reboot_notifier(&ubi->wl_reboot_notifier);
 	ubi_fastmap_close(ubi);
 	shutdown_work(ubi);
 	protection_queue_destroy(ubi);
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
