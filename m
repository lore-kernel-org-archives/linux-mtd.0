Return-Path: <SRS0=eEUd=2Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413A2C3276C
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 01:23:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B8A21734
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 01:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qA3QzuLm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eO0H+/B3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B8A21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fe6ALZuNZT7PYcx741ku5o+Wuq8K+G5jRc1xfDq0j10=; b=qA3QzuLm5JnFmO
	DjvOZFViK8Au7nnNZbM7Ogv7u7wviA5eyZVXKhbD75OtuaX6dPuglSJ6x5i4Bwk5+x6GIt6Ph9lhW
	Gv+9iN00f4gh1XoLQmOkLZ2Yi8+lsYzqmYgC/wixNa0roWWqv13L5Ell2LkgJnoNvKKyrLG5irq6c
	qnFonfFDeI9dENtt/uoD0lLXGgLHiKHxBjorYMbbceDG9V5W04hGPpPLnvMm5ywNJdMq+vmTjU6Dk
	DsxNkL6O7At+vubJCmhsYGtBrMtIXBs9kuycPcu4v2ZdK/NbwM0klwPt5G/y7ZHDLGVFtAKOPgSNa
	p7/pr1k5MSRYHvOzrmRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inBfn-00072B-CM; Fri, 03 Jan 2020 01:22:43 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inBfl-000719-2U; Fri, 03 Jan 2020 01:22:42 +0000
Received: by mail-pj1-x1043.google.com with SMTP id d5so3958865pjz.5;
 Thu, 02 Jan 2020 17:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=bU5ftLS707p9emizE3edIYm0K+YhoKgbEoXph++J77w=;
 b=eO0H+/B3YNkJ+haDdGN+fbtIbWIn/p6bpiH1PwpZe9t6uL1eeyp65FzJJdyYY7HhSf
 WaE84+UaWzceahHQgxKS4dWCNHCM4F60SfK3s1hBJumBaVWsdDdwoUT9PnAXb+Jt38fN
 zzBf9HFVU++uSOgJOfZQ6il2XER4J7l6y3GGV8RRgYf05/Md+lnvK9jARlCDS0FVogdt
 AFgR6GMTtHFVUPwPSTGG/dND07TYubmNhV/jeEw7F6hknKMXKUIZnqhAgm0DfxB9um5c
 DYT39amJJcWHMZiMFooMMxg7aPZpFrGF7KyaazDjW1tMBcmD51qG3A9H0P1QiqoZNeeg
 Xuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=bU5ftLS707p9emizE3edIYm0K+YhoKgbEoXph++J77w=;
 b=IgqmxmPbwr9c7MiGdb1tSsNXA45CIQvtu1ouZYAjmLN9y1YpRaiJ59oC3RNQSF6jSP
 9Ru1FeKMI/JhniHnpRCCb/7IKmIRfwIBOt0UzZLLS50VdL5uaG1Usa09JZM9tLS+FTdw
 ZQSLw+4OLxaCPk48CfjF2SLqulFybdSycXr71L5rvOr8rpkx2PvVoMxGQq9I4iYUTT2m
 W6mmkKXp3ynlNoM39XwhM0qwOkv84sgl+WBIHlL/crL4xsh8f9oV01LbNXRcHl6opbrm
 oxn/Z+LiqyFV/Bpv9DgoVi8l75gVyQpmnm+15BvtVUBa5cC3U0DjE7D9KhAgA2hsh2+X
 Q2IQ==
X-Gm-Message-State: APjAAAXG73DggxzmY8ZT21h8teYmzKknyvLCiHuSjk3D2dOFEyqohaCx
 YhhpTpmOyhDL02eAOyUbzV4=
X-Google-Smtp-Source: APXvYqyATFbZFIEDnNWcj+zkkjNdcQQxHVjcQ54l21Dfx1AnlJiuOJM+y/3cLzl1opelaNTSrfJXFQ==
X-Received: by 2002:a17:90a:a88d:: with SMTP id
 h13mr23480887pjq.48.1578014560241; 
 Thu, 02 Jan 2020 17:22:40 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id u23sm65044792pfm.29.2020.01.02.17.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 17:22:39 -0800 (PST)
Date: Thu, 2 Jan 2020 17:22:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: rawnand: atmel: switch to using devm_fwnode_gpiod_get()
Message-ID: <20200103012238.GA3648@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_172241_117071_3994D0C2 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

devm_fwnode_get_index_gpiod_from_child() is going away as the name is
too unwieldy, let's switch to using the new devm_fwnode_gpiod_get().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 8d6be90a6fe8a..849bd5f16492d 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1578,9 +1578,8 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand->numcs = numcs;
 
-	gpio = devm_fwnode_get_index_gpiod_from_child(nc->dev, "det", 0,
-						      &np->fwnode, GPIOD_IN,
-						      "nand-det");
+	gpio = devm_fwnode_gpiod_get(nc->dev, of_fwnode_hanlde(np),
+				     "det", GPIOD_IN, "nand-det");
 	if (IS_ERR(gpio) && PTR_ERR(gpio) != -ENOENT) {
 		dev_err(nc->dev,
 			"Failed to get detect gpio (err = %ld)\n",
@@ -1624,9 +1623,10 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 			nand->cs[i].rb.type = ATMEL_NAND_NATIVE_RB;
 			nand->cs[i].rb.id = val;
 		} else {
-			gpio = devm_fwnode_get_index_gpiod_from_child(nc->dev,
-							"rb", i, &np->fwnode,
-							GPIOD_IN, "nand-rb");
+			gpio = devm_fwnode_gpiod_get_index(nc->dev,
+							   of_fwnode_handle(np),
+							   "rb", i, GPIOD_IN,
+							   "nand-rb");
 			if (IS_ERR(gpio) && PTR_ERR(gpio) != -ENOENT) {
 				dev_err(nc->dev,
 					"Failed to get R/B gpio (err = %ld)\n",
@@ -1640,10 +1640,10 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 			}
 		}
 
-		gpio = devm_fwnode_get_index_gpiod_from_child(nc->dev, "cs",
-							      i, &np->fwnode,
-							      GPIOD_OUT_HIGH,
-							      "nand-cs");
+		gpio = devm_fwnode_gpiod_get_index(nc->dev,
+						   of_fwnode_handle(np),
+						   "cs", i, GPIOD_OUT_HIGH,
+						   "nand-cs");
 		if (IS_ERR(gpio) && PTR_ERR(gpio) != -ENOENT) {
 			dev_err(nc->dev,
 				"Failed to get CS gpio (err = %ld)\n",
-- 
2.24.1.735.g03f4e72817-goog


-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
