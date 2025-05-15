Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF9DC3ABDD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vW5v7a0XrWfqo1mE3l70Cph+qfzdjmmujn3rWuYma0Y=; b=AyWlpOJaHAJeUu
	DeLfrLA2e/BcU7u9Z0Dl6P/jxFYT/Uum1qKro2ztTixvEjK//QK4dGhgO1xg1CpPr1FAdsGU9Ltem
	b9VUVAYhyV7Dpvgk/lZbqHlD0MAJuFbkX+8HOYOBhEZpB+X9yW1205Mh7SrD19PSvg755xyc3xALa
	pN6naBClIF/597kOsmYCG2tmsji6d4Q3KUNiu7cmg2z8dHW5Lu3nnaFvWLLQz/l5+aE6+nwIULMEy
	m+tWJz5+GAKv8LPDP7k5q8M8PWVGRiy1tmgsYDd49RtL7R0dK4srlr2jUdxuCRB3c+12TqsKOX7Mt
	JRFx6inT4c//EzTXiHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyU-0000000HYAX-09xZ;
	Thu, 15 May 2025 08:29:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTub-0000000HWO7-1sZV
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 08:25:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54fcd7186dfso732141e87.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 May 2025 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747297551; x=1747902351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRoL5t6qz9Mb98FX+yK307NHPuwNiM5Re4XC8+E964s=;
        b=hERKSNrqwE2ix1BgYbT9o67E62RLjXlVwgFeftNWbNDdFlLH3kHJLsjdY7A0YYqMUC
         JtsM7Wi6f8f4GsHoyce+B9JSFKbh8a3AjulQm4qpIzumcARqoPuozck+M/Dh6EgZ9yzy
         BGm+DRFg2NH4l0plhARjwpPb2SnPPgfduexOPFnqA8U7ynMKj46UL7bW3S1tq1oLEEgf
         SGP8sfiOW8gDMgpSKSIiN4GR2qkLmZNKpJPTiwPLgQipkW0AOiYK6O67V7P/0K7APSOJ
         IIB5mu6qIlCliV8h7dOei85HWWt/dCx2xPH7JC16GQQAZ8i08miuMDQ5fWT1b3z66eEx
         FJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297551; x=1747902351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRoL5t6qz9Mb98FX+yK307NHPuwNiM5Re4XC8+E964s=;
        b=LD+8loJHkXsPvfl5pEHdkV9K/ya1g+8PpoNbdRNirtX+1BNXTuTsDYIQxhRugmSHht
         8u6tuSTSeRAgTPerYjkx9ej6DChTLd704/2DtLXr4H5gs49VbXUUasaE97vgqgQNNFrK
         ZRIx/rzAC73D6XU7IdCsrQrdYRJQD8OPgkQxJdWiz5idnRDdW6i7X65uRJer7BmAETBF
         8q1lLtdNdU2JFizXB3Tc13aCBfV2dbV97/4PtNsS/mvqyh1IcoHBp8vNj/1aGZe2zBCY
         KPx5wweXB+wDquoo74ZPCiieHhFSy3o3bcV/zmykGE05xMyefIZmLQbe3j0e+74QwYyP
         kHJA==
X-Gm-Message-State: AOJu0YxlFx1CX29wRlys4G0dkI9wwLv8E2WheQsgmXWni4giMU/TgdN/
	vom6i8o5TJuw2zym6o6c1Wjfy0wxquco+oTrjZoUdGr5H5xiMIJLdztNQsr4
X-Gm-Gg: ASbGncsnGRLzYHFVGR93/OheNbNRqIZv3dLlUBoTp2HB2yGrLZdUstjnIQ2YpvkinDw
	8kxlfcr/fVW1HJSodiz2M6qOwZxSYcBr4tED9UzTp71w1qEJfSi4rBjuB/vtjNj7JAhM0qWj3St
	W13GY5n2lq6h3u6FsNOR3mN+L8GxKwu1Fn4L7dBk+Tj6JtAi4m7TntR/F9foZxuXeGKiKULSvnY
	rSos6KFz27hIPRp1sXQtSV6Q97kNgeM/xeGl3Fj5JDwG0zwQ51rwpAnfWB4qoH4Pbm4GeSa5MKd
	KnRVuzYX748NUrhuOX3Z8R940A7ulzzNUNHzqozqPbcME5sGgo20FyO/JfoWAFA5iPVFxUJSwxa
	n9bcBxTG3gKZt7Cuvf+qIQX+AKDL9ofcrKyvw2YMc/x2Q
X-Google-Smtp-Source: AGHT+IH/mmgi70GM3FuTVG9PZWeNTbsyATk+mdzcjwPhSqwKHwdvux/G3bO9wD5opkqvWJAZHxHkeQ==
X-Received: by 2002:a05:6512:448e:b0:545:3dd:aa69 with SMTP id 2adb3069b0e04-550d61ddee6mr2084064e87.36.1747297550466;
        Thu, 15 May 2025 01:25:50 -0700 (PDT)
Received: from localhost.localdomain (static.25.185.216.95.clients.your-server.de. [95.216.185.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cd6esm2535242e87.65.2025.05.15.01.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:25:49 -0700 (PDT)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Anton Moryakov <ant.v.moryakov@gmail.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH] ubifs-utils: common: fix memory leak in devtable.c
Date: Thu, 15 May 2025 11:25:15 +0300
Message-ID: <20250515082515.1666-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.48.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012553_483032_0A2061CD 
X-CRM114-Status: UNSURE (   8.15  )
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

Report of the static analyzer:
Dynamic memory, referenced by 'line', is allocated at devtable.c:356 
by calling function 'getline' and lost at devtable.c:388. 
(line: while (getline(&line, &len, f) != -1) {)

Correct explained:
Now line is freed in any exit scenario via out_close which eliminates this error.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>

---
 ubifs-utils/common/devtable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/common/devtable.c b/ubifs-utils/common/devtable.c
index 7347f09..2e581ff 100644
--- a/ubifs-utils/common/devtable.c
+++ b/ubifs-utils/common/devtable.c
@@ -392,6 +392,7 @@ int parse_devtable(const char *tbl_file)
 
 out_close:
 	fclose(f);
+	free(line);
 	free_devtable_info();
 	return -1;
 }
--
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
