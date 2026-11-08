Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EAA606EE96
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MBdgnIwa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KgZWJfua
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0Igiyzg0xEcZsUaZ8n5HIz8YyzGrA/0gU90M3m0BUzk=; b=MBdgnIwauSiaQb3ibcckJ+s9lb
	2YJ8aJikvyP/q/nIyz++faHe6U6jtcxOnmvWux/folyXMQ9dE7VIUyen4RCDFG2SxFCEGpeORMnUg
	UFGtPETIn3vDNWrmR/3NKQaSgthoptBn7tquycAYgp2isUXBBjysQlfOOgzSLZaJlRP3hB9b3YEco
	v5tWgfDkvNT9s2CcvgeJDTGXixTbGRRjbmKRqJBtYlEKSuWq1XCE410DgkRQpz1ziZcqTwbcfDXKR
	QJ+DrTUwlTN6ohLvpDGMo1p/RWhF5Pre8adIxqQBXGhx5aKoAoP9EG6CoYN1WcRr2jXOUM8am547y
	DcENWWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBYO-0000000GqCx-0bUz;
	Sun, 08 Nov 2026 22:40:00 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBYK-0000000Gq6i-3qtO
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:39:59 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-714d57774d8so188448eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177596; x=1794782396; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8yjlxqiZsnHs1InT2MGi8hOJCH6xDuUcZ/rw+mTA3g=;
        b=KgZWJfuavUQZKtFyVVzDWMHdDNmGyuNpnlEBAVYlIMl/Goa4NO65FaTK1CyySoldlq
         c4HDMxSWl3baU095V2TktY6gr9i7boDD9OATXCWXnrghWnnS1S/xUTcQ+ZlKN7v9xdke
         hnzaieWvIqCcPTuv7i6f6vdq2Hw+zvUY60thHHKbUoASpnfeb06bYk+BAa0ucKE0TzO+
         uAa30jOY4iIub5p9rh7fGAJ6oHPTAnH7dnms9SttUFpwIGWHEpW6DVk6xPFNs/dNYmi7
         eB68EgQP1KLr3+oYuGuHA5ztmCOJDAZjUJkCinFfMhJ+3OUE9uElIKbXhtEH9I0vO9cm
         to7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177596; x=1794782396;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B8yjlxqiZsnHs1InT2MGi8hOJCH6xDuUcZ/rw+mTA3g=;
        b=aUNcMXGrBFQ03Mwa2bJx2g1ouWGTa+JwtdcswbbnY5UYknbJfbU+HAYN4ovZuHj3Yi
         kMeMZbzAcuneYFKKfFsjY8GjyAj6kHXQvBr/MaqZNhA/cK0LCYrKCUS8r4y+3CtiXunj
         ZSvlSx/N0lHxDRyxnTwJkdBJ5aH8R9EYcsX3pKxRM+oDPnEAjxckBwmOKgyjW+X5bj8R
         2hV7zeE3uzpjofqo9/f3493UptOw43WHnb1Hr9a1+dWpCAc4TxmxPGEtfLN/W3vhADzH
         +MoUKiKQXjk54qjpV1EDvMWB3/XP45EBv1ip+cYSzVQlt48Ki4Ylm4LUphFHNaw7rTbU
         Er0A==
X-Gm-Message-State: APuU4Z8+0+daRloEfI2OUWdu29R6VA0CpFGmwegY8BDBewKoBUKSun2G
	DIrEYB/1gYPWflyYB12xqST2uiHuPbYnKbbyDfzXxFJTBUYA1z6Zvcvx
X-Gm-Gg: AYBFou3UHn3jhRknN9lPHqe6EJOjT9R4BXD9/BKO8xq2u229wW2c1W/yQW0hM4HgtV8
	lVJnx6jW/DuKw5/sHqrgemEKUNyICLEJ1/1VxpxFfnruZralXc7bXfHO+Jn3B8qvYeWcfF3HB+u
	lEgmrmvZYGufb+VeEYBbn6nLQbrAAR1wOzWQP3h4fqXucGwCO09A/DR5GKYowzv5EaXHH3qMo7J
	jDzC1NMk2msA4IEZnn3UIwbpOg54S4WULh/fHhRTxg/6HYVKRF/4M0iRR+GQVOpQvueO9At/7vs
	ap2+MiYglykP/dfcvWaUgdQ82XJWs5D3yFromgeJHbvUDzz97DWvzRjkSfTeLvJFwz+/Dmh+4jU
	C4N4W6nARXy6HCaO01biYqq0ZrMKG+XW0cTT3bQ7MyxsqdnmZ1uQZTm2xL11ksF+RyVj0pUeKho
	03xOQkz9U5wSQppg0UU87aAMI6fSEnzF0HCgnDsrzh+qhgfC6fXJan6Bra5A39l8Fb+GWj7Vv39
	e/vQq2jrvZ44gZ1mKyEWMWc0V8ig/Tdj6TSmgnbm0RiL070eGz/B2/a/KS3H085Q+rj9An6UnXO
	Y2vocs9BNjv7ASvkN4/CoGO0XBm3Heo8098QgIAQwYrdHDAuM5qLB42IwfDYU1LOiGjW7SuioPY
	5KnfX+2eaeKsLmmuAWVE8m3MsxV76E8CW5XmhqOjlmKGqvrJPcOBwHJHWWYqe93wqkalilpWhc2
	crd3BbBFPkPUUF1t1doSqHZVrnobV45xyKbbUUiXqIlGeI/ZqLlTgR
X-Received: by 2002:a05:6820:811:b0:716:f300:648e with SMTP id 006d021491bc7-7170f1be2bemr1233736eaf.5.1794177595688;
        Sun, 08 Nov 2026 14:39:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8cbcb9sm2087214eaf.6.2026.11.08.14.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:39:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:39:52 -0700
Subject: [PATCH] mtd: rawnand: nandsim: reject unrepresentable page counts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-nandsim-page-count-v1-v1-1-63e961cc1dcf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywqDMBBFf0Vm3cHERbD9ldJFHmOdQkZJogjiv
 zdpl+dy7jkhU2LK8OhOSLRz5kUq6FsHfrbyJuRQGQY1GK3ViHlzkQuKlZA54mqr4pdNCu4a7za
 M2qjJeeOhJtZEEx+//PP15/r/kC+t2QxnM6FLVvzcplhC39K90FHgur4GIcqpoAAAAA==
X-Change-ID: 20261108-submit-nandsim-page-count-v1-9ad8160fbc6c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_143956_988636_AC9B7A49 
X-CRM114-Status: GOOD (  12.75  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The simulator stores its total page count in an unsigned int and uses
signed int indices to initialize and free the page array. A device size
accepted by overridesize can exceed both limits even when the eraseblock
count is representable. In particular, a power-of-two page count above
UINT_MAX truncates to zero and reaches a zero-sized allocation.

Reject page counts above INT_MAX before allocating wear counters or page
storage. This preserves the full page count and keeps the page-array
indices representable, while reporting invalid geometry as -EINVAL.

Fixes: 6eda7a55f786 ("[MTD] [NAND] nandsim: allow for 64-bit size")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204066@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..802493e01ed9 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -13,6 +13,7 @@
 #define pr_fmt(fmt)  "[nandsim]" fmt
 
 #include <linux/init.h>
+#include <linux/limits.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -2361,6 +2362,12 @@ static int __init ns_init_module(void)
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
 	}
 
+	if (div_u64(nsmtd->size, nsmtd->writesize) > INT_MAX) {
+		NS_ERR("too many pages for the simulator\n");
+		ret = -EINVAL;
+		goto cleanup_nand;
+	}
+
 	ret = ns_setup_wear_reporting(nsmtd);
 	if (ret)
 		goto cleanup_nand;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-nandsim-page-count-v1-9ad8160fbc6c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
