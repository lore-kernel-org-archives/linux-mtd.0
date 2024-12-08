Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAA5E77173
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2024 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wNe4mgGZTbtBqjbSzm+IdfUI+esils3B4NkjANVagiw=; b=3kHBPAIOclEh0P
	LMEtpr9nJlZuLRjA6vJfdOKoFHoZj5E+0N7WryDOaMNMxBm0hOWpTu0Wpf84xGs/n7X9K0tslLVCf
	buSJWcmRqOxKeWkG/alr5pZtLfdnUqTMvVBcUtuTTw/O84sjCTx4MrpGE47an/mo0cazjE9J5MIuA
	3BHeUq3qkz0JfQ4fr2HdNMYdYyKBfZzACZy7dVIYf7VkIRLqc3h5yAnHBRCmUv4fwwzCUeXd+rGHc
	/nuV2HvLG8ouQXZzeycxVC378quDq04onZt9GqA/ZR7BHZXd44gmHfJA+3Lml1PdBvfF74N8VmMX2
	AQ5UhOLwDJojZqGuSlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKLTL-00000005eub-2X8g;
	Sun, 08 Dec 2024 17:53:35 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKLTI-00000005euG-0wdd
	for linux-mtd@lists.infradead.org;
	Sun, 08 Dec 2024 17:53:33 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6d902aea641so4872916d6.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2024 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733680410; x=1734285210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mogfde4HD2tesO+IHIV06pNlbHgCI2p0y0QxJlMrRW4=;
        b=TLfEoIJYSSdgAVdJ8j+4DcKx0BXGlq2u3jT9kuPGTqCmF1zmwrXiqwsZPmIZKY63Ez
         wv3drtFnSHG6a5RBH8Sxs0nO5JTZn+dsyVTuBDCu8uH10On+3iL1IZlsDUgTGScbysqY
         +E0zKjJBUJCFFGgFBdYDAzRex2Ny5VzJwkdZPg4sQ1Sby8gDbT8O/+zfr6JZaXqURMQC
         BfRAg4025NV+78Q+s6y/MX2TI3BqLCV7hdjGrValmi66mKnn2ub5Za722AHN90RmPdU2
         rVm59u6twK7zSuBDoOx2JdIFKkA5/5ZU4cCrTobEbHJEplD+ztN8rVd3U4SR+wGaOH4N
         drWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733680410; x=1734285210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mogfde4HD2tesO+IHIV06pNlbHgCI2p0y0QxJlMrRW4=;
        b=QXCjWEUTQ67/VFMCkPPvMr+g22u0d2tMjrh0fYw7wBNdX/6er3h9HgyLu+yg8jXttr
         vAJGOZfCRoyV7NbBENWZoPxccvrs6ZfyqvxUgdEy3gnXp7WkB3jPc6CqogafBmfOZFeG
         +HR//s311CYBFlhOggpbyo7q1GhOF2J8ZdY+7D4Z4IVhNPE8HFUim5ldcQA55uXwf9rm
         bmycMbuVK/BktrEK4TyI+uNVrkXiEY768dmdWHeipq7SQjUFny3GwLQJRoAZh7pPC0M+
         JSSA0JnysFf9QwztgVLL8B3hWbeMQiJTPXktB9RBUfSRK72po6YtA6FVXCMDcLh1JCes
         L3hA==
X-Forwarded-Encrypted: i=1; AJvYcCWAPp2LAI9LaP48ry98a2cEbnhaxdyXM8jDqyuubOkuSCy1oU/qwHJM8gA/Qlb2dCDDexu3AQFjDT8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd0AYKwnLGhQBYC3ddZSLLj2puvOYBafZwoa9x73/qSxrxpjOr
	aNd1VKqq4R8Azc2+VuFyxMUvQ6mwgiF9e0/Sk86YAV9ttU+6h750
X-Gm-Gg: ASbGncs8JP5c8zabEQqSYhFpwOXkuQ/rSCr7PehMnGIA1uhuzcoieDD8IJ+uAK4b5WB
	KPbXjx2/42+wLlv/kQlHPJx12NSVtNGifl2JKim1V3k7r6p6uJ8qczmNIT5JsZgLWAbeLOT5rFb
	dI2y4LAP0jILFt05RLmT56bcEkrI0IUF2eRip/PbxH+6+t66hiQX5U3yd+ZtC962nVvyW8zG3tg
	Bd33n2IwdzMlzJPu3QIU8OhRUj81oiw9LsV7vpHoQhrdTNinAluV16sNXlTzW5yftYANZyVrlHz
	tAJejBiYCHCGljgb/WgVJv5pYFmM
X-Google-Smtp-Source: AGHT+IEuV++ppUuVlAS1PRse28GLtcZHBJtSvyEBx9LecOF2uDS0wPVg7p19uYzVfSC0hVh2qfS/oA==
X-Received: by 2002:a05:6214:20a8:b0:6d8:a188:369f with SMTP id 6a1803df08f44-6d8e7114890mr158277376d6.14.1733680410600;
        Sun, 08 Dec 2024 09:53:30 -0800 (PST)
Received: from localhost.localdomain (d24-150-189-55.home.cgocable.net. [24.150.189.55])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6d8dabfb438sm40539386d6.106.2024.12.08.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 09:53:28 -0800 (PST)
From: Dennis Lam <dennis.lamerice@gmail.com>
To: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	syzbot+0988a383ae7c57b99dd9@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Dennis Lam <dennis.lamerice@gmail.com>
Subject: [PATCH] MTD: fix slab-use-after-free due to dangling pointer in notifier chain
Date: Sun,  8 Dec 2024 12:52:12 -0500
Message-ID: <20241208175211.9406-2-dennis.lamerice@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_095332_284622_0E303413 
X-CRM114-Status: UNSURE (   9.85  )
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

When attaching MTDs, a reboot notifier is added to the blocking
notification chain. However, when detaching a MTD and freeing its
related objects, the notifier is never unregistered from the
notification chain and is freed during the detaching process. This
results in the slab-use-after-free.

To fix this, I added an unregister notifier function in the ubi_wl_close
function to ensure that the notifier is removed from the chain after the
device has been detached.

Signed-off-by: Dennis Lam <dennis.lamerice@gmail.com>
Reported-by: syzbot+0988a383ae7c57b99dd9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67409091.050a0220.363a1b.013d.GAE@google.com/T/
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
