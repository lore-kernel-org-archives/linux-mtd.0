Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1664CD3436
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 03:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=293UyzOt22TVaOHhW6utXbqA0hdjndCqMIUTkQuen9M=; b=jGbrxcg/5ax6Yt
	mquIunFgGVGgl0hoy9k4IuvSrbr7ZzSn0TrjdmeIVn3W8D3oV5BKcIYJsDgAgtj3cY6dGEp7/TbEI
	IbxqHInu62S+0hROpg/vsDz/g9l9hOORd4SfjKVeGqHjramVWHZz7am2JUBXs/w1FeKiZokuXSeKL
	GifyC7K31TdsgKouGD+FIpI2KTpxDchPqDL/0l0xpGeSAZtwj5KOCGa7CvWPk7FoFtjMZJ5Hj5aon
	KPfO6LtvtX5PWj4/YelsLtD7/cZi/g1IgXPoRyue4MlD73AIOytg1IzrmORAvupH9qH/h3eTqIGBx
	0l14rbE3kizUO0dCVWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpKa-00000002ckw-3Y8C;
	Thu, 07 May 2026 03:23:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpKZ-00000002ckB-0eoF
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 03:23:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bab2548e8bso1735675ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 06 May 2026 20:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778124198; x=1778728998; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=75CJdedoHoohO75aM9mgs334GNhMlImFEHlEZ7W1x1o=;
        b=PDC73faRCPncgOZwiX1NP7biHDINahzvz8pNqL9fBRNA3DFiZIqsZ6eV5S5FdV9H4z
         eXBPMOV7lRLnaeBfc/pyAEJARwmCv95k7/5fFzp+CPPyqNg7U8bzmoY2H6ZvJOib5rRk
         SXDO3P0O5E1zn78PA51dD+P9+t7QorjsQmWSSUwhRVfZWhelFMaQJzjPOQ8EGzgWS196
         umMISRnk2JJf+sKRcc5ELmNvJK2okhx7oie6+sANptnhJlp7AF71HtEXxJNjgN5xJXQy
         B8OXbYQ2vuMz9YwLIUiBBqyNG07KT9wC4jYHo0R5IqLRZEf0wnpYDAziipCf1Nm8bWC+
         1Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778124198; x=1778728998;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75CJdedoHoohO75aM9mgs334GNhMlImFEHlEZ7W1x1o=;
        b=kR8ffdFcaAZ0KSq1Rm5os4aHzqsqw2ZqaHFiK2ViOe5Imy0QhJ+M0xWx6Yoxpz60fC
         5RYS5ucEtASQfR0P+WJKsKb3yxVLB20ZV808YdNTcCKN2clEuB3JL6QwY+4FhkQeEG9H
         vljRwa1PZCkIy6bpRaFoHHd9qZotv/4k5KW+LXZDyHLMXSQc+hjgzSNo4leSlPLLbeIC
         thUl3MgMv/5DPx1YoOFcQW4Pd6HlW46YrK2nliRKMx6eBejYRM0YOVYxSjSCOol9EK/K
         5kB0FaBDMjUpFRuEqiO3/s7DA+jWOuLjbXu4W8alxd2jz8fFkPQ0+QZBteXraZNHvJMa
         Bz0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/MD1MxTebPfij6C5jnGuwai9UAAYX7UZadFMcq3spdt8B7KKTg73c4bTKdhFntZ6SltF0Um/hXQoE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP1b9Z8uiqL8Nz0u5lwmLM12jie46veQDnoy6m4h2R5OeMNWxv
	XyMl1t24cHRpK5eR24znaAi4u1Uo78Ohe0MjccEiY27FE3O6zPNQv6sT
X-Gm-Gg: AeBDiesEuFl0C5wyJepErYxVa9XmvNa4Ck2DsyS7mfd2HzP4wsoJ/RPjsYuIbrLL9jk
	4FBMX5Mg4qlEuLm/tjUtZp3klAfSHWMpqTK8pupRebwvllGmwsYODPdEfjlShyTF9qfMiLZxVb8
	8uYE7Iun9J7PatLAdLnmAUc5ed1f0rM4f9GHvNZFJJWk8qYKlDlS8k7Dc8rZAsA0QCoVUc2d/kN
	lHYRmYcsX4fpjRTfTcTgf4te7496pIWQ/iZuMm8Um6wQODfkZWNHasNgIwSEnPJZ+WFUPcf01tp
	P+IsT1w8BgW55S9XN5gKS4QQ9S+bn/xc072jNROqkIw7xISxCKaujGkS8pazQ6WxofrZcw4Pyea
	HwB7KMdj1UgB9U2Wr1kXrmyU7fZk/nRn0ep3PS28Svf9KtAvVWsqsiT5/qopwPFFac2jtQqjCH/
	AEl+wNli0tpHGO3EEBHXzLvc9jck5jxvO1RplJCdeBwg5S7ShLRsTi1NAXAEbY/u+LeXjBnTPR
X-Received: by 2002:a17:902:c40a:b0:2ba:13d8:d503 with SMTP id d9443c01a7336-2ba78b3fcfdmr63761215ad.8.1778124198171;
        Wed, 06 May 2026 20:23:18 -0700 (PDT)
Received: from localhost.localdomain ([123.139.40.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadd2427sm7435005ad.38.2026.05.06.20.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:23:17 -0700 (PDT)
From: "haoyu.lu" <hechushiguitu666@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH 2/2] ubi: build: replace simple_strtoul with kstrtoul in bytes_str_to_int()
Date: Thu,  7 May 2026 03:23:08 +0000
Message-Id: <20260507032308.16485-2-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260507032308.16485-1-hechushiguitu666@gmail.com>
References: <20260507032308.16485-1-hechushiguitu666@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_202319_201547_CA0D16FF 
X-CRM114-Status: GOOD (  12.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Haoyu Lu <hechushiguitu666@gmail.com>

Replace the deprecated simple_strtoul() with kstrtoul() in the
bytes_str_to_int() helper function. Since kstrtoul() rejects trailing
non-numeric characters (such as the G/M/K suffixes), the numeric prefix
is first extracted with strspn() and then parsed separately before
handling the suffix.

This provides proper error handling through the kstrto* family while
preserving the existing suffix semantics for byte count parameters.

Note: the original simple_strtoul() with base=0 accepted hexadecimal
(0x prefix) and octal (0 prefix) formats, while kstrtoul() with base=10
only supports decimal. This is not a practical concern since MTD byte
count parameters are always specified as decimal values in boot
parameters.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
 drivers/mtd/ubi/build.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 03ef195dc25c..7cb6ba4a3840 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1426,16 +1426,27 @@ module_exit(ubi_exit);
  */
 static int bytes_str_to_int(const char *str)
 {
-	char *endp;
 	unsigned long result;
+	unsigned int num_len;
+	char num_buf[32];
 
-	result = simple_strtoul(str, &endp, 0);
-	if (str == endp || result >= INT_MAX) {
+	/* Find the length of the numeric prefix */
+	num_len = strspn(str, "0123456789");
+	if (num_len == 0 || num_len >= sizeof(num_buf)) {
 		pr_err("UBI error: incorrect bytes count: \"%s\"\n", str);
 		return -EINVAL;
 	}
 
-	switch (*endp) {
+	/* Parse the numeric part */
+	memcpy(num_buf, str, num_len);
+	num_buf[num_len] = '\0';
+	if (kstrtoul(num_buf, 10, &result) < 0 || result >= INT_MAX) {
+		pr_err("UBI error: incorrect bytes count: \"%s\"\n", str);
+		return -EINVAL;
+	}
+
+	/* Handle suffix */
+	switch (str[num_len]) {
 	case 'G':
 		result *= 1024;
 		fallthrough;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
