Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F1BE64A93
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dCVeurPRROAkHDPbka7dKTjF6ctcx/u1Z/J+CdWy74E=; b=TmqkbvKSHk8jws
	vKiTwLNx2lF09W0joEj2iEgtDEkVsElOXU80v8y80Do5nxexqXZLGw3JD+zxLDfMrHz9X5enTLTWX
	d+4lH1rY1HiEb4+EfWypz3W6V2T+ioDXIcCSSSlSK8uv0M4BdfeIPtIuVtnfwrbVhNP7FXLw2shAX
	zdJn+zXtVLdGpRGSB03E+GpbEmjOokoTyAfy8oyVReqgMfvHj/uAI3035t7+UUAmRyvynHDtCwUXL
	r+r72AXuIhMUIIcDweqWwDblv9RclXUDFl/SvWZnFF5Se3R/dUfu6mla0B4B0UILmZ7yLGioeOGKI
	nwNyHrN1suepqEagbkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISxG-00000009c4z-0BC2;
	Tue, 03 Dec 2024 13:28:42 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISxD-00000009c4T-3DM7
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 13:28:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53dde5262fdso6393245e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2024 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733232517; x=1733837317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WEhJeGrR4zH+VqsNipiZOV/XXGYun9ptomJ7fYfs7sY=;
        b=AGZ9wPc7CykRX7MXBUtrKHxat7jgqdFBBTckIPLCVvEh8kU5GilbWwnucObNuM3s+M
         8jKrn0jCwWTVxGZ9IqOvevfY1g+8IhpecNwDt+it8suBdWkPtZBwlZvJrTtJuAGa1ub2
         owp1tmi9pK2OrwBRJxhUCMMcfZ81AHbAYFUJoNxc0LyK5SxoIfxuLjhlQA1DDlP+7LwM
         8bjIogVLBApS2CpK2FgV6dHm1b5lTDl2CDr/t1y/4r/8JMv9bVmwfbW/vc5kiDayiOYo
         fnbWA7Hj+xr998zHEYh4SoCnJ7EuBODceMnPFw1Qf496iFPNrYtYt7/F5uY4jpSzZPkZ
         YlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733232517; x=1733837317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEhJeGrR4zH+VqsNipiZOV/XXGYun9ptomJ7fYfs7sY=;
        b=FnHMwnTjwAereQ0UCthPRMt4T0GhrQeXsyikx4xbPmSmX8TzolSUWIy3x/ZRXECWJY
         ryReaN09CNlgPr8uPlAk4gp0YAtmU4bZ6qPdovbVXzvwxe2qK6tSJkYXpQ/dgjajRMuY
         OXm8r1AEEslT7xorgVEuGgZt+07latm5Hfh8CkOCtPPTTwTnMuB/x2rVWhCRrpkvoKnN
         6XjgJybnzpEJjwwPRJsjmF4Pi1rAWSmbdQOb9mHXQijEyYMu7Ck9G9QSVmgHenRO/fDf
         F0S4ViI/YVvZUHR8w/6sI9dgCyVDmPUB35m3Z/XbDADYsOvVDXjQR2o5qUoMfFpF5LkC
         fkJA==
X-Gm-Message-State: AOJu0YxN6Nqw9/rkslDaYmcujpDPs4dnp36m5gBQy/+PgvSpL6esMuF7
	Fji4u13D3HtPX5gOfCna5jyFVUP/iK4PSGHM82DoAlUvvUIvT0uWAgz+zg==
X-Gm-Gg: ASbGncvsll7s0mxuDL6Z+WlWhSoI2kNozl0R0/LUGcL02OVte4SkxSx3ZxsBa++08+E
	ZyWuqmgr6DqFdx/M4RQI2x7T3++bqbvRzaJo76HlRb3G58WpUhws0aJmTb0c42Pl8VvKcQcO3Tj
	bYGiWratk+ZXXdK//2E/i4iyMUtun2emCXas5H/b3zbSnWrwvQjKw5qdVwS/D5w1at48qQYlvpW
	Ep+esDZIaPcjnaa80UgIFbqFaiIuqJLRvR3CiqhO8/X0TLw7EZAMYfQSWXgQaKP4yQW/2+RUhxL
	O5qFrEeiVn/2/WVU/RZHUZiKxTlCJJxa
X-Google-Smtp-Source: AGHT+IEhfwnx6AE2Axb6/4G/G6lyWkom+yQTy2ljTaYHcvUFJ9xMvARS9fCJI/dYM8kdUYuXtH6pSQ==
X-Received: by 2002:a05:6512:33cd:b0:53d:d236:6f7f with SMTP id 2adb3069b0e04-53e129cddd9mr1703570e87.12.1733232516662;
        Tue, 03 Dec 2024 05:28:36 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a07d8sm1852277e87.275.2024.12.03.05.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:28:36 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] FIX: NO_CAST.INTEGER_OVERFLOW in nandflipbits.c
Date: Tue,  3 Dec 2024 16:28:32 +0300
Message-Id: <20241203132832.123512-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_052839_803842_81A9A1CD 
X-CRM114-Status: GOOD (  11.01  )
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
The value of an arithmetic expression 'bit_to_flip->block * mtd.eb_size + blkoffs' is a subject to overflow because its operands are not cast to a larger data type before performing arith$

Corrections explained:
Prevent arithmetic overflow in OOB read operation
Resolved an issue where the calculation of the offset in the OOB read operation could overflow due to operands not being cast to a larger data type. Specifically, the multiplication of bi$

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 nand-utils/nandflipbits.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nand-utils/nandflipbits.c b/nand-utils/nandflipbits.c
index 7066408..ef663c6 100644
--- a/nand-utils/nandflipbits.c
+++ b/nand-utils/nandflipbits.c
@@ -251,7 +251,7 @@ int main(int argc, char **argv)
 			bufoffs += mtd.min_io_size;
 
 			ret = mtd_read_oob(mtd_desc, &mtd, fd,
-					   bit_to_flip->block * mtd.eb_size +
+					   (uint64_t)bit_to_flip->block * (uint64_t)mtd.eb_size +
 					   blkoffs,
 					   mtd.oob_size, buffer + bufoffs);
 			if (ret) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
