Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EACC79FB5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 02:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fzKXIUy9jwhs1eE6K4CCx627ja/K8G4DLL1di7j1fA8=; b=iDHKozNLFQVBch
	4NexeCwFKZlmz1AIGjJryq/tDMC2DKzNL3XdIWUBRrFaJbfuP1ICuswWizTbPRMrpsdN625Yo/eho
	uIMsc7DoIy8RHCyL4zwPvvSwlJB1dVwrV3qerkq6RcaBnQYWcw0wxub//SiEAa91SUQpkgBSnWCyZ
	04O73ozvSUEBF0+KrpnD7TM/87MoW/T+9n5GcFrMVWU7zeiE0hzJEjumi3Yvea7reFLqMss4BHSBw
	J/j6c79YQa55AgKRfUP9S68eMdpCyva6Xy7vy/LD6JPqf9peAGsiwtXEfO27Hz0l5CfuEuzxMd9jX
	1rvAKv5dHC4Za5jhpSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x48EM-0000000AgOx-37Ml;
	Wed, 09 Sep 2026 02:40:10 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x48EI-0000000AgOY-1fzL
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 02:40:08 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so4820190e0c.3
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 19:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788921604; x=1789526404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXDwu3Mwz48ANXGf7thjD+yKStogxUEiYKQDYHWWBcY=;
        b=UCa9PrKNmTRPQuil2qAuQR97PSvAP/H082zqlfWzfZ7pJIIshjGZi6cMdhaA3Ff95w
         zRTzEp1zNYyrhE1q4vy9ZKv0GjQNmPJwejbQDomSHE87neocELiff98KJ+j7XAQcNPiI
         UrITMBuUF69kO669TVcbzmYSTTocI3TonD3hendvy1v7iugYfMZ9KRdUOYCIYNHJPfgu
         hMsZ5NuHi+7S+fxVLbhIc19m5UuFIZs4Bh/5PScXgrP9I42TpWjGDBtex0CxuS5uHkOU
         Smoo+5scXBNZcpFdiG+9wp6+vnCuKI8oep+DQ8wvfklGV6n2QBjzN2j9MtRbko9+Iu/j
         OOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788921604; x=1789526404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXDwu3Mwz48ANXGf7thjD+yKStogxUEiYKQDYHWWBcY=;
        b=bzw9PL6OhEWG06GYhhmfWElaz2gVecMQF7jI+mQk5CIWyaL8wb2oYvlM8vNO8QN9mO
         ttX1E4yRxRHZf2Xp1dDwXA1ctGdqdK8dWpY5qyqa5w+sqAWc0tLLYs3WqLL3vUNQYYUa
         U1yQNWAWCHYg5dexL49vlXPhaHIqq+kgCDnfo2bC+jCvMoQOZ+F74+sIYl3TbnjPSnjF
         xKi1KkGZFt2/AJFSbwO3i7aD40sQWlix1Z74mQZZ5XKlvZHiDXYRwoFDFdUsXfgjMwTg
         gun3Ozdt88fM+FWak7pZboIWRbqTLGzFM/AaqWyPhRxPncICE6btT0l3YcLeoBbgEJaX
         OGBA==
X-Forwarded-Encrypted: i=1; AKwUvBwFJHi2OO2w3mD7nAjgREGQ41ENfr5Ot0rtyJI8x/lVZ4G23TitnRuTApLAwW3YQVfAXSJzQ4xf4Uw=@lists.infradead.org
X-Gm-Message-State: AFuF++l+zFWVxOsWMjkjb8pQ8ZRXLRS02nMlYZ+m/TZt3XMslkiKMUyK
	R+ywgv70Va3U8roGkEe7mwx/QygM41cqNiPqlkG2aSHmg7ZvOZbmlARA
X-Gm-Gg: AYBFou211b0vJx5v11rkgT7JNe1N4aL1NW//MewXMUCy/vDVmEWmnWKSuBnwjQb83p+
	W4NvbFUYcTWkmq+gx3N/P3maKH2a3RX8NrQA3gY8g2tiM+ESXhaodLrBWXGBggsqPtflnkTZp8t
	jY4wph31iPpZxKtIu0xL8OtuEotQrMp2KwH4B3hvthUm/vUW+WH+g0ZrrnpnsOXKq/sWQfvnAO2
	f6FqOTzAFLvuQbs4Sjr5lMYojaLsR5Pr/aoQ2pYaFstaZbdYgWx0AH2tuntrWKOApwBeh16rs+h
	4LbnF3/SHYt1Irzv+gbhpZuvg9wSBuqA7VvVfhzAS1XpOfCtYi/9Id0L/jpmd5DYURZ9Qn2qa8B
	PSc5GdmQivhwHU+iyxNjk4L+w6jfbd8tHeso+pA8149TdyuOunJM7rrCWbTna5tF+rEnh34XmSr
	JyPPB5NsFxrepbjPKfPzhufL7hR6huCe+qkenM0gMBtHT9Vrh6mx/PpFcmVimNrsOuX+h+bmHKD
	MW9PMi5Gklne3mW
X-Received: by 2002:a05:6123:4e:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7ed723952mr17242261e0c.3.1788921604597;
        Tue, 08 Sep 2026 19:40:04 -0700 (PDT)
Received: from lucas-inspiron153525.. ([181.81.132.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm11123588e0c.10.2026.09.08.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:40:03 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: dwmw2@infradead.org
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Jeffrey <luquijeffrey@gmail.com>,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Subject: [PATCH] jffs: initialize inocache to NULL when initializing a jffs2_inode_info
Date: Tue,  8 Sep 2026 23:39:55 -0300
Message-ID: <20260909023955.1642244-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_194006_639334_61F8468F 
X-CRM114-Status: UNSURE (   9.19  )
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

When a jffs2_inode_info is allocated via new_inode(), due to memory reuse it
can retain stale values from its previous use.

If the new jffs2_inode_info object allocated retains an old reference to a
freed inocache, the function jffs2_new_inode may crash if either
jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
when calling iput() with the inode it will eventually attempt to free again
the inocache.

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
---
 fs/jffs2/os-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 86ab014a349c..40f17218a276 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 {
 	f->highest_version = 0;
 	f->fragtree = RB_ROOT;
+	f->inocache = NULL;
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
