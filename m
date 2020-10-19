Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2F9C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 19:18:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D4C2225A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 19:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bvYqBxpt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TbmAVRnY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6D4C2225A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nblFqcCl8d+2ONsU8XY862KD+WMp4yq3+7lYb9chfdw=; b=bvYqBxpt7i2ltRU0+0OMQlZNyK
	8mm70NhU0jprtX42NK6WJRb395Gqh4SW9h1T2+iRUsIUsDN0wDgqI478ffpdfOWiMSwPuAg+VXX6l
	iP6NK3cbd9mwHJAh/SLi2oJwldH0RjJpmsELCg/PJBRUXvP9yFKrDRDvn/axnas6dicraTHiWufXv
	xiiJCb9EvjsBE2EV5/uEd+68PffxgiMGnlN5tMKZAg0z2p13KJtkZLws2kd3VEo/QPJL+s2ldndQm
	6cmhCvqb751hhuhNmQlmVeXN5Oq097yIDbgodD4y+jyGGxBBiI1oJ/F3Xh9AOfSCqsmF157qVuvB4
	aleqEKYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUae9-0005xP-6i; Mon, 19 Oct 2020 19:16:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUae6-0005wz-R3
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2020 19:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603134998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=dzHVJ8vOAW33NYg2J2jFUIdaBUTLIuMa9pZOA05Ophk=;
 b=TbmAVRnYHJEZbZW5zEZx4azHBHGACW1NyfUUH6+/gbeS+r1VWWUOM/UdtzU9oMHuSXngGW
 1wtbLMRCiQkzyOi/Z1HA9OcYjnQx6MpatMVG9UxQFr8DN4S39udrcRc+aEbOAVL6RZghpE
 /4OUgQ5jRqdp6BfkptsnpJrfkcjqy1s=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-ku13eJdKM_OH5vB1VZZC7Q-1; Mon, 19 Oct 2020 15:16:36 -0400
X-MC-Unique: ku13eJdKM_OH5vB1VZZC7Q-1
Received: by mail-qt1-f199.google.com with SMTP id x42so665204qta.13
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2020 12:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dzHVJ8vOAW33NYg2J2jFUIdaBUTLIuMa9pZOA05Ophk=;
 b=bGmwbWxm+3tfC83r62JiC2rBDR+NGtG/ajeqoSO65xFlOgfgnM/zS+TFicpezFc8Sr
 xF6Lm9QOdlzTWOYuFNMZhietx0WhzdOUcInaSqbNIfNeaNAtE/HobHKoMPS34z0x1YSr
 7Hlz0dspvqnmsVCUWFgr1SLSrrKrGyPG6aOZoOMO4iA2AXxKerySsiVuP5zZTxBmMLJ4
 5f8c4xbpZtlhtqxbKKIxNe2QMeN4iHgwrTMu0nGTdKdeQoIm36th6LL67tyWSp/E79dD
 7JL+XnPm9cA8D3JTKzqF0Uqpqq+EU7ZbK3SzmjS5X9cyTL7aJ2dPIga46O3tv2Ege7Dn
 0sVg==
X-Gm-Message-State: AOAM533HdFCrS9qS+TSdGXvpizQEk9e7iieitADZVqXPXMXaQhfzwpJz
 ABfzbQ+EZR2o7yhXORoKSCo3Pjlg8XIFeMR+WiFnWLt5MC+cyBs4b7WVdcFL0IOBoB1Yr4QzpxF
 nUESVl9TQoc+p/gUZdxclOJNDmg==
X-Received: by 2002:a37:b983:: with SMTP id j125mr1175862qkf.266.1603134995876; 
 Mon, 19 Oct 2020 12:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCn0wNscJOCMqRhXgA/ucHjLYH16vNEbKqklylUaRcAdCsvZmBlyUP8Nee0uq7BdcWquvi7A==
X-Received: by 2002:a37:b983:: with SMTP id j125mr1175847qkf.266.1603134995681; 
 Mon, 19 Oct 2020 12:16:35 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id g3sm401626qki.84.2020.10.19.12.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 12:16:35 -0700 (PDT)
From: trix@redhat.com
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH] mtd: remove unneeded break
Date: Mon, 19 Oct 2020 12:16:31 -0700
Message-Id: <20201019191631.9604-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_151638_946583_599A0D99 
X-CRM114-Status: GOOD (  10.25  )
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

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mtd/mtdchar.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index b40f46a43fc6..323035d4f2d0 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -881,7 +881,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&offs, argp, sizeof(loff_t)))
 			return -EFAULT;
 		return mtd_block_isbad(mtd, offs);
-		break;
 	}
 
 	case MEMSETBADBLOCK:
@@ -891,7 +890,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&offs, argp, sizeof(loff_t)))
 			return -EFAULT;
 		return mtd_block_markbad(mtd, offs);
-		break;
 	}
 
 	case OTPSELECT:
-- 
2.18.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
