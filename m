Return-Path: <SRS0=Kb5f=GC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87941C433E9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 14:57:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2DA21919
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 14:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D2DA21919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8LwqtTG4pXb8DZ4n9zKVJt2c/Bn2icqarUPJkr9CcI0=; b=abzlFsm1N0ViiV8LdyUWXn0saZ
	ZOs75MtHatKxQ14ler1Z9IxlLZc3ct9OpwUEsUSFqg/K6EBI1H4vzm2GzLhI43MNpq8kdajAnVMjw
	M0/1jVvuqDcXCrDnSrwVQQp9GMhmw6rrBpTsCJ31SBPzAjchchDHybKyQwDjWgIVLUgAIIU9yAzRE
	l7dVl2O5UusC+5eXvvis5sk1MU+bXxrZul5nADiuQ2U4svgm07NeqsFYTUjP57P+0WrXk248lTwuG
	NJ4toyL8oYIC3QK/N5FJlYKNNNtbVm8zqhFBl31ob5v7344YNaZgNPa9Ck/59nmzvpcklTXZRGu0G
	AF4NWIyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuctd-0000Au-Gx; Wed, 30 Dec 2020 14:56:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kucta-0000AI-3M
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2020 14:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609340173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w6RH1LM35oC579jEOnaRKqc5ukFlU7LKex1Uzqpw4kk=;
 b=DsILFxGaTgxGKAESNMOFGmPrxwapR/NT8bZr885iaF7mNL7nmI+P8aj5MuFw6D6qo1pQJ0
 BUV4sv6aFIRBfvxnuVLG9VxV8ZMsRDLkxpbscfTPqNY/txx6lYTQt5sGcrdVmihgZyP2iJ
 8J5wedXs2D1OEKj/Hu89P/CjuSyACFo=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-9wEcUwyXMmyWgMfkUIDV1w-1; Wed, 30 Dec 2020 09:56:11 -0500
X-MC-Unique: 9wEcUwyXMmyWgMfkUIDV1w-1
Received: by mail-oi1-f197.google.com with SMTP id i9so10784927oih.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Dec 2020 06:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w6RH1LM35oC579jEOnaRKqc5ukFlU7LKex1Uzqpw4kk=;
 b=uLu8R4HXwlqrr//oc6agXMMXNbc7UIw6WXAs1wlON4/Xl909cgrDmttHU5jd0ezZxv
 dY8+fFgVa9zoq8Znymi1V915cpfs1KbErgOPvH+tqXG7QhmXzhEuhWrGtX+HNr2ELS75
 lcDgts9NVNArObOvkB4Uwe5Eu8Eugv7zoe3UQZKnJHerc9eVo1oDBnWPEDxjnm0vnO5R
 WGT0QXutFfcpIY8GtdGoCLh9LPuUx9nmPyOz9hHlWndnNbERk9jzSYgXcdIMNTxdhKq8
 KZWAk6qZKccaizWG3Yp+WmgVCwNUBIHkdWEzELi7+V8dy21VPAMqgWKZOC3ilsPsr1Fr
 hPKw==
X-Gm-Message-State: AOAM530fWSLtU9c7f827+QlViJOl11E812ewIJD0a8+kU9Ic53EXG2Uu
 6QHMMeulmd0Zn9ULP6SNDb/YY9Qm09cBPi/VqAQW1lKkFEhmRplMGLIJH1U5MW6kZ415ErPj8v1
 rVVfQ2QldHcIuvXsCYNTwx6I70Q==
X-Received: by 2002:aca:c756:: with SMTP id x83mr5236803oif.62.1609340170236; 
 Wed, 30 Dec 2020 06:56:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzehqKYiVwDnLNT82AhFABnG8o3yzhpO/4tUUnnXBtpA58sMqTwX+mVIh8VsZNRaXuDA1uLcg==
X-Received: by 2002:aca:c756:: with SMTP id x83mr5236795oif.62.1609340170082; 
 Wed, 30 Dec 2020 06:56:10 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id s66sm9182400ooa.37.2020.12.30.06.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 06:56:09 -0800 (PST)
From: trix@redhat.com
To: dwmw2@infradead.org, richard@nod.at, natechancellor@gmail.com,
 ndesaulniers@google.com
Subject: [PATCH] jffs2: fix use after free in jffs2_sum_write_data()
Date: Wed, 30 Dec 2020 06:56:04 -0800
Message-Id: <20201230145604.1586486-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_095614_550182_2270ACEF 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem

fs/jffs2/summary.c:794:31: warning: Use of memory after it is freed
                c->summary->sum_list_head = temp->u.next;
                                            ^~~~~~~~~~~~

In jffs2_sum_write_data(), in a loop summary data is handles a node at
a time.  When it has written out the node it is removed the summary list,
and the node is deleted.  In the corner case when a
JFFS2_FEATURE_RWCOMPAT_COPY is seen, a call is made to
jffs2_sum_disable_collecting().  jffs2_sum_disable_collecting() deletes
the whole list which conflicts with the loop's deleting the list by parts.

To preserve the old behavior of stopping the write midway, bail out of
the loop after disabling summary collection.

Fixes: 6171586a7ae5 ("[JFFS2] Correct handling of JFFS2_FEATURE_RWCOMPAT_COPY nodes.")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/jffs2/summary.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index be7c8a6a5748..4fe64519870f 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -783,6 +783,8 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
 					dbg_summary("Writing unknown RWCOMPAT_COPY node type %x\n",
 						    je16_to_cpu(temp->u.nodetype));
 					jffs2_sum_disable_collecting(c->summary);
+					/* The above call removes the list, nothing more to do */
+					goto bail_rwcompat;
 				} else {
 					BUG();	/* unknown node in summary information */
 				}
@@ -794,6 +796,7 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
 
 		c->summary->sum_num--;
 	}
+ bail_rwcompat:
 
 	jffs2_sum_reset_collected(c->summary);
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
