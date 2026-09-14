Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CABBC88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJF9ul8c4gzC3zHFIgXO16bDYELFtx5U4yn08aV6yqg=; b=JX5TVWRznK8uPU
	Dx7+ovAhbW92Yzbs2HDBPxBMQm/i3plakbdXxr433iWH9GKiP7d96L3orO01mygwkb0GV9BY9HIvU
	CG2OCwzrogIcTnYQ+0LgXPWFyGmHct0ovabu8HiK24DZbcPmPXGW+woV+cunRftS18P77Wyqj3qW1
	ZFiKZGYhDnzjjSPTwQZa/+pRsf9RSJcUnRyb3MvsQ3JOihANH5XsXj2CPwEiNhmUptMAYdzFOODez
	VG5uJAWfTsb5MfCPwCkj8LLTclDXOEJIVXSA9mz1x3qMexij8i51CXBQlgLTRx6YI7dHUV1wiecU7
	9ZIcjJCz31LcG3xFtPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxO-00000002DE8-1rUv;
	Mon, 14 Sep 2026 03:02:10 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx5-00000002Cjf-4B6J
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:54 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a39a42dso677311b6e.0
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354910; x=1789959710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Vu96ig3We0iOCK8J2+85vMgJAogV/f6oiwyPglE+4XRMNT/6MOkL5qCHdiFnxyI6Xo
         yaeYf/NOa085M+RFgcY8tEf0wJaeKhP1OGulYw/SPWYAMWIieaB1sG9cDinRX9Xr1y9y
         /o+KaTljQ0/Zv27cqnySQaTArKWHlfMsfJT0zB+GTXzpxyMbO00XpD/S2YKM4JjtOwym
         STgpOPnhgXWVS2qckNGHdZzqegsYugg//c51ChFe7ELCrn9C60B/BPLrk5mLKObXzWuQ
         lUhVR6YAB3WMSg1PAIGS88QBSo3QWz0STv7BT20ECM+xsPq8PeDY4LGsycGz7XAWhXOu
         ZCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354910; x=1789959710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=PtSAo9hFnYUdyz5VoGcDxUdNFL5YrXhqcUUxg5iTF9E8pl6ODfkrZkdtt5FABfBHou
         8HtbHDfn3GgTmSIFLjBQtKW8U3BybcDvtfz/StPqsy4846HSUlrOZ9cHH57b9bdNfOtU
         2QfisQh1C17Wz3YK5zxBHBhlmU7oTPnP5MGqIGGSZdU2Zq3wmqsit+4Zl7ckgjm7JAqW
         GfOMlXAqtmz8uQNIpL5daI7xeG4MH18eZXk18rh80ohWnVw5a5XRh986tyVzfJQ2xDZU
         v4SpYiYO8nkxfnCBUK1YJ9b0aNkFIE7rxNQEhh8IPEvS9Bt/5zTfudHj+M8Lq73PMr7N
         lpUg==
X-Gm-Message-State: AFuF++lqGB1vsIznL4az0/zZNqmA2z/apNtvu9NbDqvxFeDRwDRdxk7x
	z9HoRrZlCv5aXdj9cJcxK+m8PR2LTLDTJ8bKRCVloI/hwB0c5NiKdfdg
X-Gm-Gg: AYBFou0NOIcTNmlKYRp7GyeaH5+iZn0pici6G28/lwQbnr3VucSWH1/dTiMLmAcIsgb
	TIcSK0xj22xNvAXgKYraNPH4sjgD2ftoCvXdnHSdbkCs/mT3iRLUx/hWYm98BwGyjeBTI8XWKwH
	r2LaUpgLhWfkc66ljK/7CTJkVJ1xbERHjJ4EnuNo/mDdB04bqMZpfH8HkO9nr4Kq0tkAmduR4wZ
	Cv2kn+20Dtix2vN8biou8nhtNfwUmuTmnVKmU1TOQRXs1ErPFFFPn6HA/qPaO+PlFfXeNtVmDLc
	+60wkV/a3SvUSaMLcFaQyKllpU5MStYRDREea0Sx+bUjWXvjjTxHArpOhGiVDuPYYiomfonAr6h
	gu9Rbw+f22ZHjJ7luezaN1qg2tIWDF+i5BCL6U4EGy0tdQN8ukwUXTlumTtuZ/5CJJuqT0uEaR6
	TvwpOqeS/TxnxNo+ReNkOoP7C0zHst2yaew3mP20vavo15kqs2SWsMGRs7mk5uggNyx8lXfJQXH
	3HAZmM5i0Y8bFltc9pYgYSSlZ8j230Tv0fSgTXEvzTrMkC83VdnW9mM43bpnU7OwbiY9kIG4b79
	AcjBWm+/dt2cGkY6cA7uFVI8fYfudNOBapclmRvgcqc1CHh18yCtmUy/ikRqLUpYgD6G92KZgLK
	wYymajn5xctEDwvBtFMOIz2JSUVokT3oJfGeVc66tNg==
X-Received: by 2002:a05:6830:4486:b0:7f9:555:1def with SMTP id 46e09a7af769-808863d0ac9mr310838a34.11.1789354909720;
        Sun, 13 Sep 2026 20:01:49 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:14 -0600
Subject: [PATCH v5 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-8-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200152_044741_0B948520 
X-CRM114-Status: GOOD (  15.53  )
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
