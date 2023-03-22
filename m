Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FADEC761A6
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcxKP530ObvxIjYDo6Ux6ouh8/nf+uXyPyGF2Z/JM5k=; b=muLQdxwMP/sWjB
	xNccvnFx4sukctWnjvqxRhZiIG0uSj99ZLyeMHdYDd/d7y20FFIIU9wBNtqWgfqcLL3rsUZ8GgaMD
	ZeQQtF24NH5Cczqhh37KGK7xuvFQp0IA/n8f0ej1kp/FB+ilG6SpSljWLf7tlc9Rxb8AKoFNl6Cjd
	lVRx3r1dllG65Jw+ybmAuwllact8UxpNgIpEgJHRzsRILe8DvBOXECre/a/3JuOMj5rANHaJQjBCN
	y3/WAmRAU3DCbGVEHbTe14wofN1UqCY2KNdoBLRIZgtfXwyrypHxYrcEJ6bNuy2aqMnHjiQ8soK4B
	CMhNcPLdlav0+upfLB6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9W-00Ett1-0y;
	Wed, 22 Mar 2023 06:40:54 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9O-00Etmx-1L
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:47 +0000
Received: by mail-lf1-x12e.google.com with SMTP id s8so21782466lfr.8
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjibXlExvge37of3uq5kGMqBiMIjX3D2b9DBjXXdAOg=;
        b=UWFPA1O80E8Yvytt01jq2QIZlVrmn7Jcyha10uK9nvBUeZ9OymTt6B8Z9AX3M1FOVk
         FAgiDSO/jaNYlZwykZtkM6h8Br2W+Xz3Upj+p1cJ3G9NUWRYMew1DqmVVcxg5s3xhR6W
         P91VXlrP4QY4cVIZIPaw74N3GzXJs/CWhQEK6vuRWwkKRvwhFYhgMhM2OX/jvg3VuVOM
         73Z/Q0t2qS9GkaccmEy2b5NdVtlgmhAPox9KqyABqgEIl07lkYOdVCdKoQoS9014wOwR
         4MuZ77zV2HQU60wNZPhj+9F35cimJ5cg6Prcql48PgTM4ngXq9dDpTVf1swH+/8w6rq1
         YMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjibXlExvge37of3uq5kGMqBiMIjX3D2b9DBjXXdAOg=;
        b=u05c2aKvnFPX1SlFKZFd4jJhHf/iSq5e8j78CkgRQXJ6jd2RSLrLsqh/uYebHMUs83
         qyVgA2EXp9LExR6UCKA6uEuWLKR0QMjrDkarOHoSwZTWw1+jVQkX6BAVXwhneHKwLW9C
         yYyhds5RxYqXb+TZektIggB1RRLLS51tWtIbYKPF9/pHTi7q323UzM0oemMPxEWn1SfL
         jxR6daN7em858tKqyyEaCFywxhS8pSRk5WGac9YoXru/A5rhxNOHczPslCEKf9rCSHH3
         raUPjIDL+wAscJDXUWJVFs89X66mYQN652lP+9a42gVyn9RWtQLJcHfywZJW+6dg5km1
         V3Dw==
X-Gm-Message-State: AO0yUKURMZZCC9T70QKCtK38OcdZMJGqLv50AknWdtXmeaFmlTECx8kF
	sj5kxAB8w0gwiN3wy83Gn6RqgA==
X-Google-Smtp-Source: AK7set8Qi0viAviwjYHM3w8QtxMrW5ArDewIDKji6YiN0pl8h2sw0lxNoFC7eh4swxgCw7JwHCrZQw==
X-Received: by 2002:ac2:43a4:0:b0:4e8:47cd:b4ba with SMTP id t4-20020ac243a4000000b004e847cdb4bamr1676972lfl.13.1679467244027;
        Tue, 21 Mar 2023 23:40:44 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 09/11] mtd: spi-nor: core: Update flash's current address mode when changing address mode
Date: Wed, 22 Mar 2023 06:40:31 +0000
Message-Id: <20230322064033.2370483-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234046_461292_27017023 
X-CRM114-Status: GOOD (  12.44  )
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

The bug was obswerved while reading code. There are not many users of
addr_mode_nbytes. Anyway, we should update the flash's current address
mode when changing the address mode, fix it. We don't care for now about
the set_4byte_addr_mode(nor, false) from spi_nor_restore(), as it is
used at driver remove and shutdown.

Cc: stable@vger.kernel.org
Fixes: d7931a215063 ("mtd: spi-nor: core: Track flash's internal address mode")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1cf566fed9c6..868414017399 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2769,6 +2769,7 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 
 static int spi_nor_init(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	int err;
 
 	err = spi_nor_octal_dtr_enable(nor, true);
@@ -2810,9 +2811,10 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		err = nor->params->set_4byte_addr_mode(nor, true);
+		err = params->set_4byte_addr_mode(nor, true);
 		if (err && err != -ENOTSUPP)
 			return err;
+		params->addr_mode_nbytes = 4;
 	}
 
 	return 0;
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
