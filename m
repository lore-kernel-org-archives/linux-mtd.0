Return-Path: <SRS0=8K5C=DL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC72C4363C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 04:04:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5C2206DB
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 04:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eZaKLle+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp+Of4EY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5C2206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zk5HzHFRuHXNG6ocukYfBhYEzzfk7aCnMhNEyZb38WY=; b=eZaKLle+9fBG9XzjnRxeqJY92w
	/poOmMksVCINWEBZDDUZGKjNWQUDhP0u1IyicGSTPesOI3oDB36zZFqMzbOJxDWSPsXE7SKnr9xy3
	CP+3IM5vD5NvRxKM5sPGbpYBjq5O5okcaX67kdAYR9QCcmDfUHN0t3kgMa+r8simRpeyrHpY6Hc5t
	gFeoeFrKsyII42W3YTAmaXZM2mRDidGO/xhscor2iF/0jgqduokpF7rsZuxgdgClvJ+nlhshYtAtb
	AEmsGvpjolOQ5HPwBEEYxOGokQjRuxqjWyQ3TXXpgtSvP1oNp+6DXbXfzZyxFNpSxzSrrqvDTByJR
	Zn6FdEKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOvEm-00055B-Is; Sun, 04 Oct 2020 04:03:04 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOvEj-00054D-AQ
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 04:03:02 +0000
Received: by mail-vs1-xe42.google.com with SMTP id f8so136642vsl.3
 for <linux-mtd@lists.infradead.org>; Sat, 03 Oct 2020 21:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfQ+i+BxpbFQx3pen9QNH4hEFsBqsYjP8pLH9bs7mUw=;
 b=Bp+Of4EY8R7dq7agpxR3FH4RsGGGxOLR03sus0ezi4ewM034U1nkstuEpOVj0UVGK7
 6hxitcMpw5mM+Yfm8QmRVvQ2ih44rqmY7tM0a6O5kH6rq+4O1ht4+zHbFtpLfeX4qIeA
 z5vZtQkroTAmaYAlJrWPNNCQuQR73BWwS7ffYvVO56oo/BuBFW9sjwynLoi1Bnt9C8/c
 M3Eb1noqWQ62M6d528zW9GFdYwqdc6mqIJV7ckGNpVZiBzkHM6Wbh7v1xN8bN67c192N
 3ds6niFo6VLc2jzfdQIqD+25jngBKhwtdPKRacTKVKcJyxWfX3Di23WJERmL75EPPTFQ
 togA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfQ+i+BxpbFQx3pen9QNH4hEFsBqsYjP8pLH9bs7mUw=;
 b=PZh3p0uv2+lO2WMQoPD3hzliv27jQI+elxeRWCwhMYU949f9zNN2Qg2lMPW4tfeK9l
 ldpikPbdFkbqaXU1HYozLoDgupSaORsxpjZ766KCg/eDtl2lrAXBQ6HJbWchvyFZiVRL
 8urQ99ius9xhYBpZCa4jloGR9NrNs5JunX7NagFhdYU8TmjRMHE8gPQDReQhDM8bq2Kc
 R2Y/xVvapcxqtrBk1Ow38UZaZ7f17vezx7PaSvlP2hefmkamtt+0Rj6nBUbKnaa+UJZu
 J9D7oDLTobrnPLc/oqcWQZ6kljvSHtDqXGVxMwpkJldX3rBZ61MBs5I6eM8EGbPyOj5T
 IX5w==
X-Gm-Message-State: AOAM531NRvl5ekPkwL4ut87fCRtjmCTjfzagtoGfnCHwgQ4v8Lg3o0j7
 hmw5wJ2BfcGvimFjnLZMkEXs7SJc77N52OC4i/Y=
X-Google-Smtp-Source: ABdhPJzHEcb0FuV1DCvKntiRgzf3Bf7lfi0p9EM/K5/fze9qprL346jRWeiUX+qn8g9puKzep7Jqag==
X-Received: by 2002:a62:3001:0:b029:142:2501:39e3 with SMTP id
 w1-20020a6230010000b0290142250139e3mr8528343pfw.50.1601757201024; 
 Sat, 03 Oct 2020 13:33:21 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id v22sm5339736pff.159.2020.10.03.13.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 13:33:20 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: dwmw2@infradead.org, richard@nod.at, viro@zeniv.linux.org.uk,
 sandeen@sandeen.net, dhowells@redhat.com
Subject: [Linux-kernel-mentees] [PATCH] fs: jffs2: super: Fix null pointer
 dereference in jffs2_parse_param()
Date: Sun,  4 Oct 2020 02:03:10 +0530
Message-Id: <20201003203310.494524-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_000301_453114_2C863578 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: anmol.karan123@gmail.com,
 syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

mtd is getting NULL dereferenced in jffs2_parse_param(), while checking condition
for pool size when, case: opt is Opt_rp_size hits.

- fs/jffs2/super.c
The bug seems to get triggered in this line:

if (opt > c->mtd->size)
	return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
				      c->mtd->size / 1024);


Fix this by adding a NULL check for 'c->mtd' device and return invalf(); which wraps 
errorf() and returns -EINVAL for convenience, which allows userspace to collect them 
directly.

Reported-and-tested-by: syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?extid=9765367bb86a19d38732 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 fs/jffs2/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 05d7878dfad1..f4ce67ac8486 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -203,6 +203,10 @@ static int jffs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		if (result.uint_32 > UINT_MAX / 1024)
 			return invalf(fc, "jffs2: rp_size unrepresentable");
 		opt = result.uint_32 * 1024;
+
+		if (!c->mtd)
+			return invalf(fc, "jffs2: mtd device is NULL");
+
 		if (opt > c->mtd->size)
 			return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
 				      c->mtd->size / 1024);
-- 
2.28.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
