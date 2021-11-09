Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE3FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:19:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2AF611AF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C2AF611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hImn+DXGxnGWHLGkUnu2crTfScJ3RafImWOcvbdSIuk=; b=Jag2stYwWoNqYA
	1TwPNZew2r8+5L7IcANV0dkE4HII122GJeR6kzdArd/3cf5fT7tbXR/Va60ARw0lExfOMkOiqb+pb
	N5P1l/G2c5i9oNz/64IEiiSH6p+wZwyUoWevJmOKk6PTJJocfYyVhdymdgEI9RQfMr8JHqrg+a+w2
	clXttqg31eo8/0yPq0dWQmOA2yD3dy5Nsz6JeWHlDwgOu1HlBI7DCwRKUMZlTGSLddAvgPnrxibvl
	Zvq0KP2exDwKlCUsH1h1AX6PVhmdmqpa8VXTZXPmIriXx3cgh/vQA2n0xM5MCqAXA5dQDg5/BLME7
	XLgJqfpV1ZCSSXfNVK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMLW-000xad-P4; Tue, 09 Nov 2021 08:19:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMKf-000xNX-HJ
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 08:18:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w29so19933681wra.12
 for <linux-mtd@lists.infradead.org>; Tue, 09 Nov 2021 00:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cfln5vAwk2QX8ubWwPgT9DGyoRwTf2Aw96icF5byAH8=;
 b=ZADEgV5dLgq4walolSISH8oS/G5mq99mwx2o6Gnxj1pxlVMjAsnOjzvWXhHDOD8nlY
 GhqzZNF8/I5zMzsFV8webpFyEh99wqc4N3Hg+JugNeAmiUPwBz4ceozDE/OMwd1U7ajw
 w2BBwiJhNZf//jKDyAGp+iimtl3VNS0CXAoj7MJ1Z7TFHEfIlQEEWcGRt4xBhOQlM45j
 pzdmZ4MTUk1qJcBAiqE5HlD9nT1Qap3XuippxZXwzyQnS253rd2rnWNiRnDJ1lF8lBBe
 XYFrbLAH/7SBCzcbrntYMYiYj2UkiX6bgMrd6cH3NZMlbjlWw9JV4gFuICyTuSyOZVxq
 pvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cfln5vAwk2QX8ubWwPgT9DGyoRwTf2Aw96icF5byAH8=;
 b=5n/xFYQhx7F5pq00UvkrMR+ID09MvIBxZoNWDhT3Ye9p7FmuybuWFmonXLyGrnhmrz
 XihLuqCkkHJAoQhgB0PSZVookoxFbNS2LgzkaQ4JkpVmtKOLE3ky0kAhHK1G0pa8AyOX
 TDdxR6HQBmdNuJ1rGnL9nOiPONi9dNe54UBfGESfNIo4VJm9iEafI1AMHzHmQw+6y7cN
 ba4HSF5WjmQEY9bh/ieuINONZlhfSS8PT+xJb+JXapDKy4+XaUJZZkfus1DM07r6Gzs0
 ZDvByh/OrfJ6hP4Dgf0zdrMTtYsn+D4ta+vcoDRxqRtXoj6IFANsRjtebXJzdqa+AyYF
 Xbpg==
X-Gm-Message-State: AOAM531I8UpicFQklwo1FfSdu7ZzqREd7rLOfrHQs4KBWyATAIBFzlyw
 8LvwhhC2+kpGCPHpPT0U41gg7GCsNL33a8WK
X-Google-Smtp-Source: ABdhPJxDW0mqsCWZD9vbVD9A5b/kejvW3AWJl4aeUMk84ADsTHeySHJD9ujTqnvga8+zuuAlXk8qRg==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr7200123wrc.204.1636445896028; 
 Tue, 09 Nov 2021 00:18:16 -0800 (PST)
Received: from thor.lan ([213.205.241.131])
 by smtp.gmail.com with ESMTPSA id n184sm1714028wme.2.2021.11.09.00.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:18:15 -0800 (PST)
From: Frederic Germain <frederic.germain@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Frederic Germain <frederic.germain@gmail.com>
Subject: [PATCH 4/4] find_raw_inode returns latest version with data of inode
Date: Tue,  9 Nov 2021 08:17:51 +0000
Message-Id: <20211109081751.480718-5-frederic.germain@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109081751.480718-1-frederic.germain@gmail.com>
References: <20211109081751.480718-1-frederic.germain@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_001817_637768_2B7D3336 
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

Signed-off-by: Frederic Germain <frederic.germain@gmail.com>
---
 jffsX-utils/jffs2reader.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/jffsX-utils/jffs2reader.c b/jffsX-utils/jffs2reader.c
index 2aa2137..c0c61cf 100644
--- a/jffsX-utils/jffs2reader.c
+++ b/jffsX-utils/jffs2reader.c
@@ -484,18 +484,19 @@ static struct jffs2_raw_inode *find_raw_inode(char *o, size_t size,
 
 		if (n < e && je16_to_cpu(n->u.magic) == JFFS2_MAGIC_BITMASK) {
 			if (je16_to_cpu(n->u.nodetype) == JFFS2_NODETYPE_INODE &&
-				je32_to_cpu(n->i.ino) == ino && (v = je32_to_cpu(n->i.version)) > vcur) {
+				je32_to_cpu(n->i.ino) == ino && (v = je32_to_cpu(n->i.version)) > vcur && je32_to_cpu(n->i.csize)) {
 				/* XXX crc check */
 
-				if (vmaxt < v)
+				if (vmaxt < v) {
 					vmaxt = v;
-				if (vmint > v) {
-					vmint = v;
 					mp = n;
 				}
+					if (vmint > v) {
+					vmint = v;
+				}
 
-				if (v == (vcur + 1))
-					return (&(n->i));
+//				if (v == (vcur + 1))
+//					return (&(n->i));
 			}
 
 			ADD_BYTES(n, ((je32_to_cpu(n->u.totlen) + 3) & ~3));
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
