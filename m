Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BE5C83F26
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jul 2025 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+RtrYt/TSqRw1Sx6pIdvAXFD8HdTrQIGN1ySWDVlrA0=; b=ETSRXboVdj9ZUt
	LEvsOvnbdztrdcKg3mcnpBQigw2tDNaVKFQfk50yx3VVwuFROoxuIzBM6YBdB4l4r2RMsjQ9FBBYP
	07YBCyxXi/os4WjRIVkCosaYCx4i2KsStkAU3Qs570Sx9+5/1lEHmM3rwYWi6KSnCOuPyXNgxSRLb
	kXvIN3mnU5NhZ2OgnumXVbHCJtjU7oATQ/yFnguEANvlXqqmhLYlSdQzWve8smCFSstlkHnMd828Q
	ZNb+wpjRlU5ZqQjKUf8nNzMEWRMWJZ7dIJ2GRO26mXPC1/anKNtxx7nn2NGDEb62vTUEyobhcyeXk
	rrfVIKIjUVwranCFmupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkcg-0000000Gpgk-1QHP;
	Tue, 29 Jul 2025 13:44:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkce-0000000Gpfn-0Fc1
	for linux-mtd@lists.infradead.org;
	Tue, 29 Jul 2025 13:44:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b7834f2e72so1802778f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2025 06:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753796642; x=1754401442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nFsz2UHtorJJsTYKHr5ZAg3v318PyN1bhW8UxJDcjho=;
        b=HpGgIEUVVqqUKVHEx/HvaYlTxurTCliWcZz9kkg8xm/EsltPpJdEDN1foN3/HXq0TD
         cW4Yf/80YUxvrVyQ4k0Ab+1vHBJ+oXz+2Aq5G2tYNF6PkX0p/yWoZ7229gnLQHq8zePI
         uMNv95yAKMJkezlUUwZLqx1fPJQoSSYfCpi/8rNTxlgYWT7d3DE1/2SioPyMGF4VOs3Y
         NLHNVhc8ibb3b2ViNnb6xgTpDDMEP2qt4+npVwVckPl0k+DB1TMWOELRpyscVuCYkj8Y
         3w6dfA6N1n9PPs1Y21DPWQw5uhf/vNhjwnibo4nmqveltyWq1gzvJI5JVnLy2KkOltmb
         MCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753796642; x=1754401442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFsz2UHtorJJsTYKHr5ZAg3v318PyN1bhW8UxJDcjho=;
        b=CQxZ906VD0JKDQQottUXfPA6gB0yK4mjF1N6OxjSvNXWhcz0mVKmStwq/7hCVjsdgd
         XXVvHauF3GuioGovgsd+dG1yDorKrtETqH2r3C4tjhMrRcchgR4+t8abNXgigPGu1edf
         Qi3iiFXCxgxQA8B/2dPBQunb+4lc2Hef0XGKB9GeaNjxgGAmWGd8v00NMjbUFmZnSgpj
         n/O+Rx3swIfeRcbBlrbQh5X+HkqfM+qFsITh3AjT4XRw6EF1t78H5vCtjV4/8AOIkVww
         3OTa3T41+Uv4qrlou/8moNP0ZQhrI8u775xHuJn4dGDbA3JH7ENIOpDyj9LI6GyhDRV0
         VBBg==
X-Forwarded-Encrypted: i=1; AJvYcCV9BRaMRsz+BE9pGjuD8bGl5FQt4n5rSSqIN8gYvf4Exut4PpNqkjkI37I4MY4SGy2JB0Jpvc5sw0g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyerJ+bgLYhov85S5GDmoQberFDrOhJc4X8mXY2toQ9SnwVAcDv
	4ZgcvOcmoU9Q0k6V+HOkk6Ht/YydLrQButyGp3OlqnMJHcTYMAKNf3TJ
X-Gm-Gg: ASbGncu5NiOWJvhQ9KacmLFa4FBVjIdYITtumlTIQeZptU0/sbCP28xt9PjnYbYdKxV
	k+AO3IrvSuglQzx/eeL6i9/XFg1JOblLG27NUxAetBPRdmVWcs13sSMBoMDeRqUa2XcTcjAn2gB
	PFvnDLThlt/Nsdv8VuqR13bQ6U+wH9ilEW4OWOHs9nug8e/4Esfak/9Uh16xVucgjgjmiEgmo+M
	7rkq9eihFT7jHgbQBzBtccNE+840vs9y97h/ko9eklbMZ0XUhZC+m79I7q7dHvUnu552nElZnq3
	P0yiub5abRyf/jB5eqwrvtM7OT8wMqkO71Bwyr7i2d6l6YFgcl6McBDAIyqSCXmwxzl/EU8NkFA
	/GuEg8U12PbSdrutgN0X5
X-Google-Smtp-Source: AGHT+IGUDDCTZFd6Nu6hjYHDPeBMUaySJz3sutucWDvbnC/FjKn0QB0RI5umqEZ11eOIoZstnOmNgQ==
X-Received: by 2002:a05:6000:2503:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3b77678ec4dmr10246893f8f.56.1753796642230;
        Tue, 29 Jul 2025 06:44:02 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778eb27besm12419531f8f.9.2025.07.29.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 06:44:01 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Artem Sadovnikov <a.sadovnikov@ispras.ru>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] jffs2: Remove space before newline
Date: Tue, 29 Jul 2025 14:43:27 +0100
Message-ID: <20250729134327.1935856-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_064404_094934_F46FCA83 
X-CRM114-Status: GOOD (  11.96  )
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

There are a couple of instances of an extraneous space before a
newline in printk and debug messages. Remove the spaces.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/jffs2/erase.c   | 2 +-
 fs/jffs2/summary.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index fda9f4d6093f..5b7ddec4217c 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -252,7 +252,7 @@ static inline void jffs2_remove_node_refs_from_ino_list(struct jffs2_sb_info *c,
 	D2({
 		int i=0;
 		struct jffs2_raw_node_ref *this;
-		printk(KERN_DEBUG "After remove_node_refs_from_ino_list: \n");
+		printk(KERN_DEBUG "After remove_node_refs_from_ino_list:\n");
 
 		this = ic->nodes;
 
diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index d83372d3e1a0..a0c1e8b2a02f 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -615,7 +615,7 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 
 	if ( je32_to_cpu(summary->cln_mkr) ) {
 
-		dbg_summary("Summary : CLEANMARKER node \n");
+		dbg_summary("Summary : CLEANMARKER node\n");
 
 		ret = jffs2_prealloc_raw_node_refs(c, jeb, 1);
 		if (ret)
-- 
2.50.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
