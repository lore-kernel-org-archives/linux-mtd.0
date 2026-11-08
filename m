Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA0606D809
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A1sSTylg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vqQmqwFI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ECjs1OoCDu0LS8GMeCYcmkIYYra3agz1tVUy4/FBCao=; b=A1sSTylg5Tw8plMPY+pbil9KXb
	yXscLJkMxjpDj5HELNh2FlFdpTCDxZqngHaHJED3fB6e/WJZ++pttIxL2G885qHDb/++2qOCPrPG1
	e/j6hxMkImPgKr/bDQNvDpHLO2quYE7cc6cBigazL7JLylyUjY/Jq/Pu2+w0I6LxUgSJ9VVMRbTVs
	uXNwAUyExoZNjfWqQFA/U1/hG3yLLHN8yjH/7jNRHQi5HeRjJ6Y9IKVFFU4qTrjwXjVmhQqZ93q7t
	raFpcGqJC2W5FZ7fnVLT7KTPaBRRdUoM3neapmF72PKGf1CbAgYDGe5R8ln3YiOja8VLExOOXQ3OO
	6/rQlEqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdy-0000000Gw2a-2AC0;
	Sun, 08 Nov 2026 23:49:50 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdv-0000000Gw0n-2S92
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:49:49 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-8256106635eso126174a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 15:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181786; x=1794786586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=vqQmqwFIrw2vmd2kf5tMl6sVP7OPGIKCwFNygJ6GkFmbQBylL2NGjfut886UGG/JAm
         PjDRnmlOIrLvLedb4iEMMhUV/2OAVgHAmQX37eNBTG+u8apEty0bvTvWxl7tM36v3pxx
         y5p8j6i40N5XSVZv7enCPSV7AxAR9llNNIZ/V6/5To0pJ5qL3b0DGBnf2NNwgp0aHz5n
         midOQ5H9QBM+PTSojb7pm1OAyEKimdlDE36x2MyRufhnHCezU55uTV1iJW6XsAZ+5dLf
         3/UOE/CseqDEXNcu8gS7FpzXbUOXNtXMj6A1yF55knDqizXeEzZc4PYoEfRMj0KCMRZ3
         BGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181786; x=1794786586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=dq5zl29ag7Gz0hUHk+pUqvdU/lBsbtnBJrbE3fggep0TzL0hvjmvqmbBMnMGWG/boF
         UGKHNvLd6walIDN6Q8g5Zq6hoVhvWYaWetTZGwFyR5683UE5FxbEqT0bB5qqTpFjPhDI
         7P1bViDs2XwyQ0VFpSJUybvf7C3Q3QPpPw270+bs5fPhDDFbj668v8OtYqdDMZd3tdeq
         pIHM5Ph45ws3hMiDlwdzpq5ApHA+M0OTbrWXpfbJBC9ZLBf2F7jkEhpndRrzoO1SB6C2
         b4QBvoTKDuYQsTDl1DXnubIz20uGRFCjoes5ztBiVxBHoQr5csLRPrmJRx68iatgAZH5
         +69g==
X-Gm-Message-State: APuU4Z+oe8Y56/fJ+bgNgcrH8B5VtrGdBAwqEXPkyG9qSvr25o7h4sAk
	hWh4th/IUCaYTwDlBjzRO/1Jd8f0Q8c+rm0QNBE802xrfficTZNZtAZC
X-Gm-Gg: AYBFou0tQ+6yOywddsAaFXAHFHfWOVgar1jEa8ri7cSZoZZE6KWXfZ1Gj67/vpgZ9Dw
	hrxwp9hljKbaSK7FaG9O47MWhyoMUbpbOprnhB1FbgLSf/udhzsK4peDfVkYo3d9h5NyxScsS0U
	A3mOzk2OI3MQvpuo5rK+ZlCa4uHmLioQossrJxXCTlAkhgpkXmBaq6eJh0Z9VWCCOJBP0hQWk2E
	xwkknrSqTXhwWCo/BIuFPZnuVkX3+CJ3zp3PDDUBWYU2mb1hd2UzBWf+T01WM7kfIuOagvWY5Ts
	XBIqTysQq/SbWQG4sxuzVXtpVh2BmuE71rUOnL/HSkGcTVP1RC4G0FcNYGsRsdzyi5gfaRt+B1v
	wTlkhHH5oprr/SMKmR6I1x1SG6/6v0H9RjAh4l5PWvpBTwbTVRXoYCmXJojbNiIJe+HLlWQFXPp
	IczQgVofpHSsQrVe+Vy1yEwY86EaO2zhDzBNRnZ8zEwL3Y2uSuordUGqk5oizdiqiCRzsQDxeaV
	/Z8dZR66GAVRpKJCia/R+D0H7ae0Fd6UGjgOuxPIyIWunU+sRgdpssKs4CWfvBa5iXzk7kUNZSz
	UWZRt4mjKOMHEqItRyB7YNgnQ1G5LlkPSzkmxkkIlAh/GahIGXmb4Sda3lt5GOCSJTcXXQ/ePXI
	V1fbep1b2nvS6e0d8+qNmnUw4e98B1HjOs8++gwjx84zhWXzpNhuS5iPcrnROjGd06BeDOPO0Jm
	JK0VBIxw5FViVR7EfsMfFKrDSpvA3Hk3Ej9VbiDGSe/Kf0rzeR99Q=
X-Received: by 2002:a05:6808:4497:b0:539:596f:6623 with SMTP id 5614622812f47-5681464c020mr1356594b6e.64.1794181786514;
        Sun, 08 Nov 2026 15:49:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:13 -0700
Subject: [PATCH v2 2/4] mtdchar: bound OOB reads to the data in
 intermediate chunks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-2-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_154947_624029_973AF241 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

MEMREAD limits the data and OOB lengths independently for each call to
mtd_read_oob(). A backend such as SPI-NAND continues reading until both
streams are exhausted, so an intermediate call can read OOB from pages
beyond the end of its data chunk.

The next call advances by the data bytes transferred, not by the pages
visited for OOB. If OOB remains, it starts again at pages already read
and returns their OOB a second time.

Limit OOB in intermediate reads to the pages covered by their data,
as MEMWRITE already does. Leave the final call unchanged so SPI-NAND
can still return additional OOB pages when no data chunk follows.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 19d33dacb62d..189e462a9df0 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -769,6 +769,9 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		if (ops.len == mtd->erasesize)
 			ops.len -= mtd_mod_by_ws(req.start + ops.len, mtd);
 
+		if (ops.len < req.len)
+			adjust_oob_length(mtd, req.start, &ops);
+
 		ret = mtd_read_oob(mtd, (loff_t)req.start, &ops);
 
 		req.ecc_stats.uncorrectable_errors +=

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
