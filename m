Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55793CD3425
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2026 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+geeU92jX1x+0PF4/z+aGFUE2PnklBrqOvkp2DsZDk=; b=NZcFeYz84B9JC1
	TL4pLqoNK82xhrCEcq4q39hUGjQAPlqdmVtY7MA31zU3QH7Uv/OjBspIK9/GYLseBAUPsXNeQLy5L
	xOqSQS0/vEdOMBjt13F9Dg69gNar8C74GtxZT7bdODu+lWomKVq0K1IdXjgmw9Cx2RJlJaNN1v2Xf
	pkXCFqh3LqmTfNQjUYitI94uZERD7934lUqedQGGGyNTzrYN18kyViPvUdyokwqYCXnIxwlXNYMCp
	sA58NxQl2o+0XMt0pUQJKiLW5DOyHRcuYtJQWfxdoXgbCZiZHOD2u3PMS0mt/iKPOgD7DHtmR0amE
	Ay7UgytloGtgowz6lBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIle1-00000006bjT-0Bwt;
	Fri, 01 May 2026 11:02:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIldy-00000006biK-3syY
	for linux-mtd@lists.infradead.org;
	Fri, 01 May 2026 11:02:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso15079845e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 01 May 2026 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777633369; x=1778238169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+uMPXd4v7RJUPJ6ng6R0zk6Hnw9jnnZw4S2klEd/5k=;
        b=BHhrFAsVIbQMFrTXZg0czCkSUdG67Kut+h45iAGToFvSlL3L2u6Qt/8Gi3w8e4ASIT
         IBWd6EAXFFqdoVeXfRBxO+rCCgTdTjf+ldC5h8cekEBUJNooZ9d73bWq9DcpLLn5bjvl
         0iyhMMvn4tJ/Jg6oORBTFzBRsJLdHxR6ol7F+vc8wYQlkllprFCrfsHrVBY21kQTaUi2
         wRPVVQslbyZtw1bJq0ZAHjKcYsX5sdpeYw1CKXW3cmDj0z6jkXSscNzAtfxm/K0/lNqu
         u5izVePrCPPbnsISm6bsCzDnRlXPYPBOgOSclZTdZnchEytBSl5wcPRAejjlzjJtVbdc
         9Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777633369; x=1778238169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+uMPXd4v7RJUPJ6ng6R0zk6Hnw9jnnZw4S2klEd/5k=;
        b=MaQsPDrVb1tazOOOsLIirPXWmP6kn8PSY11mD0GGhklVQPQ6cHTceDNmyJ3/ACshJu
         Dlx1L26oMrjzrzSTqZZLdSqbOrtKmQvipcZwtEDUH/taUtoFI6RkjpQEH3vLHTxYui+7
         FvUPxUcJsdUQAtkOl74jw9kVOz7QMyURS1oDQZwzHBTN4UY2KmcW8GaseTQuZNL7w2he
         j4FISygQLtVwT4DoJM9Z4TK4cuXumNYZdvWSek54iy4nQsH8BFs6DgFVUZZ+l4tBtGgZ
         zpK3wx4DuFG7l4a/T8h8wyr8wZJf5jAbiMrN8CS5EMHUFJNJlmTg6CQJ8I84vj6+oRX2
         AOQA==
X-Gm-Message-State: AOJu0YxGlsicKSpqgWWl2RA8QmH6unNUSWiiIGirse/wCOhwVjB5RLgF
	kREedYCliG7ccSC9OXWIS/nu6AscyG/5VCANzMn5gcK4SvJVpFTrphk=
X-Gm-Gg: AeBDieuG+m4KbrN50da1YWwLFvmIL9IZ0P/HKWAu5DDTbk/6ZEf7hzxTtjzCqW10wKb
	nlxeORCrCvO1TGUB8ben0mxu8A8cpmXgsTr882un8qAoAPEr2ftH34DuQmIRkLab12dHNkdpltw
	khNlhOm5m5CUtxd22QwU5LQXhKXZp21FvfRSGLE7FG5VU7j7p2mUE6tYg/hwii7D6tKaJ85eAo6
	gycnxc3LRJ5Rl2zqfgnLnxSZRr/Ao7AFre1Z6xU/hY+FdWZFjvp+3CiH4EQIvJliWvqWSWjGnCn
	0m3HbvhR8pEla97mQF5VOBsrldtHMe7ZSisr/GQw7VUTEY8UU/DMsXctTum8gczw7tUmrUAw80k
	H2k4FHua8HhK3HZ3p2M6nG8PcKPPNHI/HX4lKrSMaEnkUqwgc8kLMIW8cXXFj8tq6dN4d/uFQP/
	9U1+I=
X-Received: by 2002:a05:600c:4f48:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-48a84465c97mr118813595e9.27.1777633368690;
        Fri, 01 May 2026 04:02:48 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm79491905e9.0.2026.05.01.04.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:02:48 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	syzbot+44664704c1494ad5f7a0@syzkaller.appspotmail.com
Subject: [PATCH 2/3] jffs2: clean up xattr refs in jffs2_del_ino_cache instead of BUG_ON
Date: Fri,  1 May 2026 11:02:45 +0000
Message-ID: <20260501110246.50647-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501110246.50647-1-tristmd@gmail.com>
References: <20260501110246.50647-1-tristmd@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_040250_979383_CE21E928 
X-CRM114-Status: GOOD (  13.15  )
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

From: Tristan Madani <tristan@talencesecurity.com>

jffs2_del_ino_cache() triggers BUG_ON(old->xref) when an inode cache
entry still has xattr references.  This can happen during unmount:
generic_shutdown_super() calls evict_inodes() before put_super(), but
jffs2_evict_inode -> jffs2_do_clear_inode -> jffs2_xattr_delete_inode
only clears xrefs when pino_nlink == 0.  For inodes with nlink > 0
at unmount time, xrefs survive past eviction, and the subsequent
jffs2_del_ino_cache() hits the BUG_ON.

Replace the BUG_ON with a call to jffs2_xattr_free_inode(), which
walks the xref list and frees each entry without writing delete markers
to flash.  This is appropriate during unmount since the flash state
will be reconstructed by the next mount scan anyway.

jffs2_xattr_free_inode() already exists for this purpose and is used
by jffs2_clear_xattr_subsystem() in the put_super path, but that
runs too late -- after jffs2_del_ino_cache has already been called
from evict_inode.

Reported-by: syzbot+44664704c1494ad5f7a0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0
Fixes: aa98d7cf59b5 ("[JFFS2][XATTR] XATTR support on JFFS2 (version 5)")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 fs/jffs2/nodelist.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index b86c78d178c60..9af269b78b241 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -459,7 +459,8 @@ void jffs2_del_ino_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *old)
 	struct jffs2_inode_cache **prev;
 
 #ifdef CONFIG_JFFS2_FS_XATTR
-	BUG_ON(old->xref);
+	if (old->xref)
+		jffs2_xattr_free_inode(c, old);
 #endif
 	dbg_inocache("del %p (ino #%u)\n", old, old->ino);
 	spin_lock(&c->inocache_lock);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
