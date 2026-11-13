Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF215606B22E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s5RhMN+M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WBAl48QQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOs5E1qx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f4f6r9VhNYuIRmTLKB7cGmQJy5bA1LYdkqg3Y+8B5ME=; b=s5RhMN+MNIZeDiw0Bx18Ox+ImD
	2lQLiwKrHlH3bkCCA4XfmGT5PgLkOnpVAXVU9kKT5EJZ79eusvY8fvZMrVUbvqeTrbHKQO67cGWBP
	1eevA8Ii0yQruMoJ0Ilb/h3o3TZrlkNWd5sQNCslrxTO3B4Ky2dqWvoYZ7x1Fb8ZIhXcgrT+EsHkX
	+CsTUU0m0hy1EDldnIxUbupheljfIYVOPjJf7Pox1FP1FXf/Oklr7kbtJ8exn5R/6QQJUl5ZdtRR/
	XoOV8Z8olAblERt1BOUU5/0MSJzWpCzE6IOOY7dfTOc3lYiH7l8CRDF0T4yeb5T91dpPG3s6AIDJz
	frzMyuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvos-0000000DrtZ-033E;
	Fri, 13 Nov 2026 18:16:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoT-0000000DrD0-2Ejn
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=; b=WBAl48QQEMGwnn7GdjxAVWp3re
	LgJwf+nBb/FU1TjgnR0OZfzCoSYRg3nV4Xgl/qFr4zrm1ymkz1XegUngbww7dSi1wftjcu+ayduV8
	JsUYLiR8Ucc0CwiYcUl/OV2KQGTmAhLSS6gNSEP2dCrG6qn3wykmaIRWywvOmPnIFbnxLYPNgkXdZ
	2WXH0P0PLaaoH+CoAcxnEo8hJYQ5loq+a4hN0D1VOP8oSlMpstbEuf6LQEHe2cOFEx213C3V7GE1H
	K2nvVv+IpXVUVC09wL0YIqb3yn1kZ2KNaALryF9u9n7Vqd1cnmXJsMW9MzhnhoGfhU5nw1s/e4l3h
	kczWYzdg==;
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoQ-0000000BdjX-38qX
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:48 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-86288992de5so1577018a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593744; x=1795198544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=EOs5E1qxP42BsNdx0/Qg5FviD7HEMTKLHcZlyKhOx9kZYDuWhHr2/DmicWahO7BZeO
         CCWuB2I4jFx4Px0k+LpUuCHw+PjoRPvflPEs5lhET9sPkZyoS0eWi5LAZJ3Cgc4Ye9vM
         fPDcmjknGmujoLhkmlFQjgBoHBzAx2eLFV6U3qYcx4GeVn34aBeOLg1FprpgApuAg+0r
         5bTrn0ij+UvofzzvIiyRXBTlOWnebIhZ1bhokbRZOHZ7QOAmiA3j4SlQVeQWaxUSOpCY
         lSy++wdnBYpCG2GtTPRm1PbSbQiVl892OSmXaqdq84HFZw8Ffs56AV7kvlwran8qa+PX
         yEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593744; x=1795198544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=YCzv6WoOLIc6H1wyaV+N+91QPPFVDoDxviRn9wGbSRjF9TF9f4dorSbsqdApR0hAVv
         yVglOIQFM5R/5b2EjGtCFAKafohRWW6q+e/6aLCBKjNz3fYBADrWFgAVSU2XI8lxvf0y
         /ufg7yZoLSP7kdfm068jW6r4OYw3WkZok+PthwXg0BLoMQddDRDPmEWjG23qlsxpscgL
         Uoj7dRIJMQJ4MgnvomVNAHFOnOgilZLE4dGsnT2ix/TO1Cx0xEg0PMDBqerBdfzAr7nw
         Dh8KslYC1eOgT2TeH6Ry+yLFOREtiVfz1w1BA4QcLiuOZBI8Yhwnv8vUg9jWFAsSd0fP
         i1Pg==
X-Gm-Message-State: APuU4Z8XPL75jGXY3CbCJijTEBL+AVGdLFGIpz8lizLv3y6nPpT0PZx3
	xln5gwi11kdJYH1vNZYyETBHcbVrhf5g/v1OMEm+bj6ZnIKamqBazMLO
X-Gm-Gg: AYBFou06QMJGZB7qyoBQpcU/Dh9fkbF0j5/P0V+0c/ND+1eXJKfTa+LOUAjtxDIa/7Z
	1ccqDuNHnNUrcXIL6QYG/23Jbw5dUSywGDyE6lFyGSGEHL1cquZThzEUj2kRjyi8wqAPjcyt20V
	H1uHsd7q6s5/DvAqheHC3kVmHCx8y34QRWhxg9gEIlZLm+2Cs3n+MrHkF16BLrisZq4Tv8VrPLw
	hsK+3Si8mBYhrIdNHIpgHekNUlq/AMudIbfgrXGZW1EJuccME19vhjovQ2Ns8g2aj6H7h6mIQkZ
	z9zWteLFfaawzYDACLmDnbSNaLRqNIK++Z3wnlRyElMdbepEvUiCGMp+JVHQgLnRQBISDYx48a4
	T9BS7hS3h+H6h7ZFXAtXu0krFFuMjEqj07r/em2Gv6hqj5wgD+QOXOSAqrgHBMYr/sAsm/dPwjK
	fMK4LufSWqqh/tv9IZSCtXPwYqAG/WUE37Xxp8BrcFejyJ8gqKhpX4SIgMPSHcgYidnjfuaPQXN
	KFnPeWraoWg0tbPszmH3eArBbNV6qQUIUHXXb6lYsxZ4gIeQF9VfAfNDzproQ9rP0mMzQYmpYJi
	tl8K70zjiOvbYevWg146L0YB6LoFU43uy5GcCD3WFJc2l/wHsfOu4Xg7TW+SpbJ2RMO542cNIFd
	u9joFffNZXVkScL2tRJHoqfjQ7mpGvG4CUR+8gi+QxdvoZaSxE1QU7IUy0An381tpLIfyn2ClER
	7OJxyh2+OjyGyM7r4jE7GDDyW2NMJahDthnmRmt9oHF2UAworuohk=
X-Received: by 2002:a05:6830:2406:b0:85e:e777:5f7a with SMTP id 46e09a7af769-861527a2626mr4421920a34.28.1794593744051;
        Fri, 13 Nov 2026 10:15:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:41 -0700
Subject: [PATCH v4 25/58] mtd: rawnand: hisi504: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-25-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181546_749487_09DBB0DC 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: 0.1 (/)
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the host through its embedded legacy controller.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index ccc21d21c3e0..a9e6ed2d4c4b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -740,9 +740,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, host);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +793,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +817,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
