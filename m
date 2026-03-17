Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCA2FB5E96
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 00:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ng2Xn7XWbXx+qnXjAifkZb/s2ibSk7wTvx3lFDH484U=; b=pNreVGTX/bbq7G
	s/+xSMhHR20hws+mkLSiI+MN7Bi7MZ5iFmLAVH3KLaxVpBj46jv/wV03LuUG4Q3vRBda4WRiORO/g
	qTkyDFsn/CoEQz0SoyqmJUfe3wIjmUZvSDayDs0XYKhxh0tVCUkTuJgfPTsumPo3ojkXvbjmWuRQZ
	OoFyJtZ/mqI7Zu1lGDz616G5RbFFwmJmqEp7WyM45fDnq9RPsjqIuAqV0+ZpvrzsLz3Cr3NqJ6xOH
	YicEz8mtMNBjq6RbStdZF1WLZjnLmd3/Pugm9yeptdwdFV6E6Foi6ELtSKk9DdTNhmd+gR1BPbqG7
	AKy3EoY7vIQ8ntHtx9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IPL-000000058ov-2Ndh;
	Tue, 17 Mar 2026 00:35:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IPH-000000058oA-2rYW
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 00:35:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b0603ee486so7049935ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 17:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707735; x=1774312535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihNxuzFnqD3lU8U2xoTtISl+XIoUEBJX1HoNmtM1174=;
        b=jl/TbyTZI4xWjZPcy/vqwXK1O/NPhqD67TF7SJ5Q7+ouAw3Ko4oBpzFC8IffdiWfik
         QLhjW0SAV3nz8c0nFDXShvLiQcJ1l5I2m9C2FbLY9tqLqSA0aIYlc6nahxzSe1wwW8sP
         zX9MbOOEwmOdfnht4tHB83iDtTUeey5EYxaqWPfp65NUsHITiPQBRVTwmFeLOcq6i4BE
         zTNVa2/RK/XA/G9BQgTIyMN2fCCxCuotNc1L/quqDcpnoNQDe3+z5jtvH+ynD9TQv3zT
         22oopyTXFekmX+kjwOq14JMYaRyhsWdWtdQoGj7y1zvy4PoMjxG/AfW2Ynx+6vpKcGvf
         BQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707735; x=1774312535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihNxuzFnqD3lU8U2xoTtISl+XIoUEBJX1HoNmtM1174=;
        b=MPm+RIgogNvh68PQ/AyFdlktgwxNipcxxXEkE1bpVItFm7w+Geg1j6Or1BpVqmBl5U
         EB5HTsBnjZYRoddpAtEDT3zZ7L2TrUlaKBnEDTSIx5oFiWw8ekvzyURGZguHi4uouBo2
         rx8TFjlBpEvUeAMYIC8iViyCpoEbIhVFFz+JaFmeqPcwe4DGjz0wuuFXhyX+JliTp75D
         63AgeryeS5FkC40BCAWiKk+9CpSO4nMSrD9VSXuYnuRSRIzZMA50q+HLZ78AkSAKVqSn
         SO7/sgeD/MywtCKnwhFo8Ftpspcc1PK+9m0q3kmgXzebg13XUDuDUb/P4PXGe6qj8q0U
         mp1w==
X-Forwarded-Encrypted: i=1; AJvYcCVyExKGe9Til5XFR05MzCsP/Z44YuHaZb3tlUxNMb/mJ1SvAodwprMH9ZauptKCsSljzLYNwUNgAUU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxuy43+ioQrk52V7V2tWQdraOZWrPQG6BOMp5rvNQkHtcWXDFs
	s9/GlszkWBlVp8liCx+7nUR+s1mKlCJnYSG+MK+fxBEhYnLafyc4MXcoORx1hi+V
X-Gm-Gg: ATEYQzwNpHPDknZIW7tJBtEBqxhXghDpjOVTRfjsqcsSCTErd7Cd6aX7/cG3+so/0ol
	rMYy3GvDO8wKkM1jIgT4d6AL83TB8LV6vlHEPRPcgTxvUkyGPwA8ZVAkX/cScPDP4WmEgbE6BZF
	mEoTwkpTHUyvwvMjEs+UJcIr9q1TAB6tkGbTs/qdDgWgl4F8zypqTm/iRaTApGJLD/ltzHEDv0p
	mvYKEiBgw2sEk8i/yB5G1iwXDogPi+YbX5XaPBgJr9s70o0kQrgee/hKnCjPWbM009caEwhtekC
	w1y7Ivg1GxLZFFqcGCjOq9nOd3C9V55Lzw+jX7DIgIu8+B1pkOjDciZPMqKRXtbFRo8DqfnIqwW
	oC44ozP4AUoklmpSpMi1jBZgD5P62pqgNgvFZWmPwKtU22POzUKT2ZwjqzxBHWxbThs+vu2+yv8
	mPuY6n7pLo6ChLNrw8WgNVL5NCRUnTpsRqgdjpB/khTT6o33+ybj2SNNs=
X-Received: by 2002:a17:902:f712:b0:2b0:61d9:77ac with SMTP id d9443c01a7336-2b061d979bfmr23039895ad.18.1773707734870;
        Mon, 16 Mar 2026 17:35:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b04ccf9bf1sm70102605ad.24.2026.03.16.17.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:35:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: cmdlinepart: use a flexible array member
Date: Mon, 16 Mar 2026 17:35:17 -0700
Message-ID: <20260317003517.72196-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173535_727049_F0C3D39F 
X-CRM114-Status: GOOD (  10.15  )
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

This is already allocated properly. It's just using an extra pointer.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/parsers/cmdlinepart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/parsers/cmdlinepart.c b/drivers/mtd/parsers/cmdlinepart.c
index 60ab61493ffd..e79edf9931de 100644
--- a/drivers/mtd/parsers/cmdlinepart.c
+++ b/drivers/mtd/parsers/cmdlinepart.c
@@ -50,9 +50,9 @@
 
 struct cmdline_mtd_partition {
 	struct cmdline_mtd_partition *next;
-	char *mtd_id;
 	int num_parts;
 	struct mtd_partition *parts;
+	char mtd_id[];
 };
 
 /* mtdpart_setup() parses into here */
@@ -289,7 +289,6 @@ static int mtdpart_setup_real(char *s)
 		/* enter results */
 		this_mtd->parts = parts;
 		this_mtd->num_parts = num_parts;
-		this_mtd->mtd_id = (char*)(this_mtd + 1);
 		strscpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
 
 		/* link into chain */
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
