Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A42C5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 19:14:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F77221F1
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 19:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szp2PAP3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gscfPmR9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F77221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q/AmR+fvx3w0lgANv7yD7iOcYfo6qMYff4YObYbwwsQ=; b=szp2PAP3aIj+AhxJCAvnc2K+v0
	0XurNOx83WdXBhMNAroqplifS5MG96C4pLJYK6ACLqiTQ98vmeMxhigXrp4ZxokQFnZ7vQ7uCsvY1
	jA1jBmvMDAaW53aCshL6qicWZE+3fpRn4RX5MLRP9E8i6erqGvKLBG3Lcb+osb5uJ+ijzNPR1Re5J
	y454yytpt5u4gRy6ScB/WqumRlggmXSZi6W+P++9WjjOfkEwgblJ64d5DbRH/t34vL1V4kTBZQqty
	VpMpmpsa5nSBdN79OTdWXltryZ6tTkzfe3oiAkY8VojoSeYqcDJX183GTwS4tkQ3eE2yzWlm79yh8
	TU4m5PKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kijC6-00039y-Fm; Fri, 27 Nov 2020 19:14:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kijC1-00037m-My
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 19:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606504445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=/d0gr28L5usZ6CMCStP6D3CMWZKIP6JyYolWhvHhl68=;
 b=gscfPmR9gmexwSsk6l80GRqiLls5lmBfDGi3XqUTqcUngXhu5cMpTKc8PoTr+tdZUuksDY
 qEdIf/0t4fYMowQL/ivl6+iSk3qwBa9T+40/8Rh2Bwz8V1UE5Os5znbn4iOWn5LqrHkt2z
 WiOAeD1yGHv6zBowV/G8yV5ADvR8FpM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-t8zXGRXUNrOadpm6p_kPDQ-1; Fri, 27 Nov 2020 14:14:03 -0500
X-MC-Unique: t8zXGRXUNrOadpm6p_kPDQ-1
Received: by mail-qt1-f197.google.com with SMTP id x62so336038qtd.11
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2020 11:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/d0gr28L5usZ6CMCStP6D3CMWZKIP6JyYolWhvHhl68=;
 b=PU6laovHkJ+invYriaFbvl/6abVK0PavV0zxmtCJM8AcFmsUd1zUp9/goY0x8kRdTt
 1XVDlIyje5BUeQz30JrRTEUVF6UDu4Wc3Xdlk1+jmZlorMHqiIrtj6gXCPUvBh+qtxHw
 9u9tWez0Q5Zk3GPUmWKC+g2YUAilSy7olcWfhDnrJXg+LriefIkiLG+TsLFZ1lxytW64
 CwzR2ja54W+1bB6SJpo228tqBiPGF8qRtKeiP/HK795Yf+evZo82OuXxh3nWGlqFSVwx
 3l+2A/44MGsaWkTgopELwvTrj1AvGxt7QZ/qzPwdkouP8OTA7YJQ60AW0/vdWHVzhoui
 pI+g==
X-Gm-Message-State: AOAM531u1GaMjyM0jUBz4rwtOXpOAH+Q46+mZ2K8IZkblE15Ff3HauOf
 8BhAJDVHo0z1porDE74n/OW8ofhhpttlQIvw3H5U8evAnOpcv/W1Rpwlf95irNMVwj/L2dhUJNi
 geopI7QkbUm2Wiw2tOl75j6heYQ==
X-Received: by 2002:a05:620a:48b:: with SMTP id
 11mr10169624qkr.0.1606504442621; 
 Fri, 27 Nov 2020 11:14:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmHKP07wAts1TRf4OZfzg/0usM+pvzZL055IEPgN96PXnE7spOh+01PIIHtFzGB/nP4UcOWQ==
X-Received: by 2002:a05:620a:48b:: with SMTP id
 11mr10169611qkr.0.1606504442440; 
 Fri, 27 Nov 2020 11:14:02 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id e131sm7210805qkb.101.2020.11.27.11.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:14:01 -0800 (PST)
From: trix@redhat.com
To: dwmw2@infradead.org,
	richard@nod.at,
	gustavoars@kernel.org
Subject: [PATCH] jffs2: remove trailing semicolon in macro definition
Date: Fri, 27 Nov 2020 11:13:57 -0800
Message-Id: <20201127191357.2852751-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_141405_823777_D4309597 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Tom Rix <trix@redhat.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/jffs2/nodelist.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 8ff4d1a1e774..2e98fa277dab 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -349,14 +349,14 @@ static inline struct jffs2_node_frag *frag_last(struct rb_root *root)
 #define frag_parent(frag) rb_entry(rb_parent(&(frag)->rb), struct jffs2_node_frag, rb)
 #define frag_left(frag) rb_entry((frag)->rb.rb_left, struct jffs2_node_frag, rb)
 #define frag_right(frag) rb_entry((frag)->rb.rb_right, struct jffs2_node_frag, rb)
-#define frag_erase(frag, list) rb_erase(&frag->rb, list);
+#define frag_erase(frag, list) rb_erase(&frag->rb, list)
 
 #define tn_next(tn) rb_entry(rb_next(&(tn)->rb), struct jffs2_tmp_dnode_info, rb)
 #define tn_prev(tn) rb_entry(rb_prev(&(tn)->rb), struct jffs2_tmp_dnode_info, rb)
 #define tn_parent(tn) rb_entry(rb_parent(&(tn)->rb), struct jffs2_tmp_dnode_info, rb)
 #define tn_left(tn) rb_entry((tn)->rb.rb_left, struct jffs2_tmp_dnode_info, rb)
 #define tn_right(tn) rb_entry((tn)->rb.rb_right, struct jffs2_tmp_dnode_info, rb)
-#define tn_erase(tn, list) rb_erase(&tn->rb, list);
+#define tn_erase(tn, list) rb_erase(&tn->rb, list)
 #define tn_last(list) rb_entry(rb_last(list), struct jffs2_tmp_dnode_info, rb)
 #define tn_first(list) rb_entry(rb_first(list), struct jffs2_tmp_dnode_info, rb)
 
-- 
2.18.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
