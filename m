Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B4FC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6vzVsVVLPnRPH73P3a6rFGKeJkP2ZDkeGxk5K12TvkI=; b=zMyWwArsN/EIO3
	bHcfVYCpD/gVOZExB2m/jyJARtYJzS5VcE8YXbCe9pE2BtcMF57+foGpgGUUdKMwJuB9UtInBZlJm
	K4aaeVf1bgiB4ngJKomA5+QGdtUD+wFeVOV6TMszQzeEpHRgWoVTLjZ4hKu7Ff6sooMcmDK6K+3U6
	au6Oli0pYnZxttLh3m0uE3gXmhpe33bsPgpv5SjXa7iie+e5r2W8Ky0mv9tzOrf2LIL2Qztan+Xs5
	9SdisODX7TRtfmXI26w9R1e65N4y8053csCxOvmvsMdDdSL/yqt1kVf2+2bRCh5P9kGo7uWP+zmEe
	eQjf2sYvYlZZYAwhssnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEond-001WyH-Az; Fri, 22 Jul 2022 09:18:21 +0000
Received: from m12-16.163.com ([220.181.12.16])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEomf-001Vt7-U5
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 09:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=k5Mp8
	51bIF/nWAX5C4b5qJcncsyh3b9n0PP2u9PIEgg=; b=ie2S81iS18e6VgCNkTaON
	qipf3AZ3panpQrFNmVeIEYhksP1/z+iSs6kmENXrN0T3OnXcFAQRAuzkco6axOg7
	Cim9i0Cc+WjzrL0TOtMfqm9upuWkfqP6BwXctjhUOVodzuMIx+iDlhIdPTfX68Yn
	6/1B5yZzMdExKC/9beEry0=
Received: from localhost.localdomain (unknown [123.58.221.99])
	by smtp12 (Coremail) with SMTP id EMCowAAnNU3+atpiWEPbCw--.45S2;
	Fri, 22 Jul 2022 17:16:54 +0800 (CST)
From: williamsukatube@163.com
To: robert.jarzmik@free.fr,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: William Dean <williamsukatube@gmail.com>,
	Hacash Robot <hacashRobot@santino.com>
Subject: [PATCH] mtd: check the return value of devm_ioremap() in docg3_probe()
Date: Fri, 22 Jul 2022 17:16:44 +0800
Message-Id: <20220722091644.2937953-1-williamsukatube@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EMCowAAnNU3+atpiWEPbCw--.45S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWrZF15Cr1fuFyUKry8Zrb_yoWkXFc_u3
	yfZr4xtrWktFyFgF13KF1fAryftrn29FWrWwn3tFZ3CrW7ur47urWDuFn0qrWUZr9Y9ry3
	J3s8CrnF9F1agjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5uOJ5UUUUU==
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xzlozx5dpv3yxdwxuvi6rwjhhfrp/xtbB0AZGg2Esra8OvAAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_021722_837475_176079C7 
X-CRM114-Status: UNSURE (   9.19  )
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

From: William Dean <williamsukatube@gmail.com>

The function devm_ioremap() in docg3_probe() can fail, so
its return value should be checked.

Fixes: 82402aeb8c81e ("mtd: docg3: Use devm_*() functions")
Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: William Dean <williamsukatube@gmail.com>
---
 drivers/mtd/devices/docg3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 5b0ae5ddad74..27c08f22dec8 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1974,9 +1974,14 @@ static int __init docg3_probe(struct platform_device *pdev)
 		dev_err(dev, "No I/O memory resource defined\n");
 		return ret;
 	}
-	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
 
 	ret = -ENOMEM;
+	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
+	if (!base) {
+		dev_err(dev, "devm_ioremap dev failed\n");
+		return ret;
+	}
+
 	cascade = devm_kcalloc(dev, DOC_MAX_NBFLOORS, sizeof(*cascade),
 			       GFP_KERNEL);
 	if (!cascade)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
