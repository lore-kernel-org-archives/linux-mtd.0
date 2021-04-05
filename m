Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE5EC433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 15:30:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD0636127A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 15:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD0636127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S+7FXPj1vuY7QgA2oRkCo9tEiRVo6Y6AAATmrcmxtKQ=; b=T+suzZGZo0BD+WphJuJZKzRwVO
	s1ezfDHiw5Pm3655hZXaOqfbFwggNgMYsAzkR3Ac5byeJirJs9hKcN7OlAtiUSxnUszy9WPCcSF/Q
	uAX56UbFoXI/L88VE9Xx5j2FdaEYZR2EE0y4/VoA008Bf9BoLyFyyGIAun07rbLFWAg7+lvKofmtO
	iYJM0cX1+7KeRoF4fjkYk+a6z4OXvq/Sa2I4B5Ho/vowpH0fWY9NXh3RpoV1isbIkPHQCR59LzDTV
	9nbc4U4Hyb0vuxChq6mN0BVkGbQXX4UpE9t2c4AxqRtuP90jdtVp9zy8yhgr4vZIz2uF/pXytpYL3
	xcXhTmsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTRAg-00HUi1-67; Mon, 05 Apr 2021 15:29:46 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTRAd-00HUhg-2F
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 15:29:44 +0000
Received: by mail-il1-x12a.google.com with SMTP id r17so2679576ilt.0
 for <linux-mtd@lists.infradead.org>; Mon, 05 Apr 2021 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jd9OzSMlCehKGcZL/iMnRfIpVLKcWrqMxSKE53yLOE4=;
 b=L9zmJategCEBK4GCaOWGftMb7KWEY/q2Fs1KzBmVyL2SsShx5IEXvQPGJbGXhfz+vZ
 /VlhcaWT08ru5UVMda+luKoVPRqwVY3Os5rC0TFM8Aoa5ISR28zF7mkkuXnulFo29ADD
 FlMTJNQieLH3Y6oLcdMJzxQorr0BeOOf14A3v28Pbo4RFqzYf3FE7vki+6jy6WUF0iPy
 F62NS6RUqWNhvEqk+n6aRorCK0Bra9M+eEB6qtUAne58iwSTE+1Zy2BuVC+1GgajE2ig
 j2I+5jfqeSNoT3x052esbHNU4cPVB/fHSm5gp1FeMpqbXxbWg5m9+tmRlxNGJPqlf1ow
 oGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jd9OzSMlCehKGcZL/iMnRfIpVLKcWrqMxSKE53yLOE4=;
 b=lVz4tJs6ZutnUB+2DbrY4WosT9eEO4xmCymoMTfmZ1mpAqJ5c9WRtekwkgpGJkKXuh
 eBajsrAWk+F0tCGeH0U1VXA9gPSvet1orofKE906YlEWXifeHrwXcpheU2RLjmKjwsCM
 bL3KnR61bBEzT00MvHtiOlVvvlpYMq+822GoAkIfRxRrUlIPXyIkHxhweuY3r3SniDrF
 iHbslSi/LpvYNqMVVkUWVWYldTzK6W3Be1sGBtCfS9URO0bCkbXGdVKi/oZzYs6HnE3i
 +R12Me01ChHgwTiti56gjhgEWxL4M+R6xrQzJ3FDYZF1JKoIuEH5Ssqz59uWSC3KKXWv
 S4iQ==
X-Gm-Message-State: AOAM532ENSbjqbOINwTH+xkQUHn5oeA4YmZ6rWpPMamVqRnqAhXd1bVK
 lmXJDYp6TJzI1U8JmDuYYA==
X-Google-Smtp-Source: ABdhPJw9+lT1tYJ3D+2NkeZPzKRwHID7z8tB0e8FQMpLiGQS7ytRRhla+ZF6wRnHxFhks7F6Whz+RA==
X-Received: by 2002:a92:d70c:: with SMTP id m12mr20768410iln.216.1617636581325; 
 Mon, 05 Apr 2021 08:29:41 -0700 (PDT)
Received: from mallard.lan (a95-94-147-174.cpe.netcabo.pt. [95.94.147.174])
 by smtp.gmail.com with ESMTPSA id l1sm10930554ilv.34.2021.04.05.08.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 08:29:40 -0700 (PDT)
From: Rui Salvaterra <rsalvaterra@gmail.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rui Salvaterra <rsalvaterra@gmail.com>
Subject: [PATCH] ubifs: default to zstd compression
Date: Mon,  5 Apr 2021 16:29:35 +0100
Message-Id: <20210405152935.148129-1-rsalvaterra@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_162943_208891_56F41FFF 
X-CRM114-Status: UNSURE (   9.37  )
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

Compared to lzo and zlib, zstd is the best all-around performer, both in terms
of speed and compression ratio. Set it as the default, if available.

Signed-off-by: Rui Salvaterra <rsalvaterra@gmail.com>
---
 fs/ubifs/sb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index c160f718c288..e7693b94e5b5 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -53,6 +53,9 @@
 
 static int get_default_compressor(struct ubifs_info *c)
 {
+	if (ubifs_compr_present(c, UBIFS_COMPR_ZSTD))
+		return UBIFS_COMPR_ZSTD;
+
 	if (ubifs_compr_present(c, UBIFS_COMPR_LZO))
 		return UBIFS_COMPR_LZO;
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
