Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E63C6FD1D
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 00:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qn1qkztzSOmSrQCq8NbBOJS9w/wtUzaupDMlGiEfFGI=; b=jxrmgDROSws1OT
	lZkOJJ6a+XRRyBgCbY9Fyfg3egl4BqX0uFrQSXYl2bzqbMKzHd5bL2o1uAGPdeIRyFSUGg9hrKEAk
	5c8wGFXHz5WeWBZpo/Ldv+M64IlK39iyQz0TNUGfV4pqMNxwEqIj9OuuB7H2KQWyJ58MGsXHsm+c/
	EaQrmXmyiaxHaRrUFICyRdqjlfwmScgToNMSna0cnlglGxXymPlYM+Uc3z1OpXgH8tGWrpkMiFDbH
	DQD+M5aSRIk2X03tNx9UTdgwrAmHOa67Pnc8ELmpuVJNY3sm1Q1818E7KQb5Ar0vV4obDhndouKTn
	3R7vWNq6hJBeIzA0C8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgwrE-00Ch83-1V;
	Tue, 28 Mar 2023 00:06:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgwr9-00Ch7f-2E
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 00:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679961986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oVSllWMtZWdtDUnZueS3ZITI6/5YaR00xl6fOWFPgxw=;
	b=dDGL2Yxz19zpFkFAh1DJXJPGDFo2kZmBEASUTqdHfbAxIh90hViJmVN22hCrG3HFG8eZ32
	hA7/vPlHmTXx88Wq7TpDlC4NK9GBJfG+NEtwsy3oTME281QMLYdxE0EfPkJ2666M6YOk9m
	aDi/r2tpDQhzUOr6hRNugcEmdrpkHYs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-q8e2hwBtOl2UWRgXKg3m9A-1; Mon, 27 Mar 2023 20:06:24 -0400
X-MC-Unique: q8e2hwBtOl2UWRgXKg3m9A-1
Received: by mail-qk1-f197.google.com with SMTP id c186-20020a379ac3000000b007484744a472so4532870qke.22
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 17:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679961984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVSllWMtZWdtDUnZueS3ZITI6/5YaR00xl6fOWFPgxw=;
        b=ms/7uQJKJTzCuG1Y9vNhoI9D/HtkX8cPtliNR7zQcjQnay4RbyboqTe/dT52jILst2
         qaUlZQFsBGYdYQwMRZ+2TkKyo9i/KTD1vohS/PnVDDu+XjnSxoj42fj/xKSRorgHPtWu
         Jx25w6p3NVJ91Pro9gAB+cXsfnTBherURIe2PjV23+TorZnN5ggJeEmJF0ttD55+GsfV
         3+pQgf1h3vuFE7Es8jh7kaKQXnInh8I0AzVYszD8aShhkTsRQ1n8PXaBmhqqznqeqX68
         C8ZkwpsmIPwOJMOGNJa69AsVFaLSDcI1kBv8bsgsSR9TT2SlheVT0LdeiuQ/HHXR9c/c
         YyTQ==
X-Gm-Message-State: AAQBX9d/NBjcPL6Zdq6Q6nfPf2rfflLsot4KaVk/pAYs6wUZKcvfKVzc
	UDCYdbWcFrUfQRjF5kHDDrxA3D9G+2xWOMGSOUEmb2XRg7OjurV1DhzB8oLUNX5DXXGPcM0SpKu
	aUU8+Ow5PElEpo/W23Mn0qgJX0Q==
X-Received: by 2002:a05:6214:27cc:b0:5af:3a13:201f with SMTP id ge12-20020a05621427cc00b005af3a13201fmr20749284qvb.37.1679961984165;
        Mon, 27 Mar 2023 17:06:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350bosbW29PT8iFMSLN0sbn5umQV3b5UqmtN5qZQaOtgas+0CV3b7wBzisKLHjUrsN/FUDALfvg==
X-Received: by 2002:a05:6214:27cc:b0:5af:3a13:201f with SMTP id ge12-20020a05621427cc00b005af3a13201fmr20749256qvb.37.1679961983880;
        Mon, 27 Mar 2023 17:06:23 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id q21-20020ac87355000000b003e387a2fbdfsm7130695qtp.0.2023.03.27.17.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 17:06:23 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mtd: lpddr_cmds: remove unused words variable
Date: Mon, 27 Mar 2023 20:06:20 -0400
Message-Id: <20230328000620.1778033-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_170631_825325_980F0644 
X-CRM114-Status: GOOD (  11.37  )
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

clang with W=1 reports
drivers/mtd/lpddr/lpddr_cmds.c:409:31: error: variable
  'words' set but not used [-Werror,-Wunused-but-set-variable]
        int ret, wbufsize, word_gap, words;
                                     ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mtd/lpddr/lpddr_cmds.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index ee063baed136..3c3939bc2dad 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -406,7 +406,7 @@ static int do_write_buffer(struct map_info *map, struct flchip *chip,
 {
 	struct lpddr_private *lpddr = map->fldrv_priv;
 	map_word datum;
-	int ret, wbufsize, word_gap, words;
+	int ret, wbufsize, word_gap;
 	const struct kvec *vec;
 	unsigned long vec_seek;
 	unsigned long prog_buf_ofs;
@@ -421,10 +421,7 @@ static int do_write_buffer(struct map_info *map, struct flchip *chip,
 	}
 	/* Figure out the number of words to write */
 	word_gap = (-adr & (map_bankwidth(map)-1));
-	words = (len - word_gap + map_bankwidth(map) - 1) / map_bankwidth(map);
-	if (!word_gap) {
-		words--;
-	} else {
+	if (word_gap) {
 		word_gap = map_bankwidth(map) - word_gap;
 		adr -= word_gap;
 		datum = map_word_ff(map);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
