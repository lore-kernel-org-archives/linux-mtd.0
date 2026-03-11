Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D9E104BECD
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZ1GyQi+ZlisK8u7pX3BNn0JGAF0UouWf1wDYR4Vlzw=; b=W5cyWlNhszbmCY
	v04EJIbVhSN9n6RkYtZkd+gmMFozICfBFIbvW3et9aYWuZqADrk2FJHiEZZ5u5gwtCqFahnNPJOYG
	inTr+g7tW2D4tEjnTGB9dO036AGEYYPFdrAXHJYD0CHnoUEowWrb51UeNKtPp02dEIwc5h+/KRnLI
	HzBABv+CFMwpQwh1OvaTparKyco+uA6PKqlVVP9fVhkhpi+eMsbHZtZFgGys0UHKc6Xr6xvZsrLt5
	SHU9PPwOubUjTw35Ufp77PxomrYSB6rXv62rvy0sMajsXRPPzxgLtWzdQgYFAf63ECQkAw3zEgQim
	onKdHZd9fZgqdpFgVAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gqc-0000000BR6X-0vzs;
	Wed, 11 Mar 2026 10:31:26 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gqa-0000000BR5k-2xPB
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 10:31:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-827270d50d4so13662435b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773225084; x=1773829884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68kFT9M+v1YFr8fLxiUdg7OyCK95BGAep7GJPhPQZJ0=;
        b=IcvkX2c1v+3h/OlTUg9Q4Vg8FsGwAbJ7t6alE6nFOSEUcGczlL2F/dxiXqyb24EQrS
         QCnW1SVtKJm6gDXeZpUl/l5OmmpmvY4/lHW/mGjzHbNvXmllvjfD+bQDDj3hTn/P+l/X
         Xy+9BRddVW9vdXKp99cI9rcvUBwsakprOpxLD22ge7pHVC9FzytzbLY4W6wp25HF0HgX
         D1j8yfA/EjvsDk3z6b2nugv5iZ8VEwqFHPZ2OedjxxWaqFpletZLLXPYix2cDIXQ9cwm
         EOyNDHUNmFLxv9g4jPeOQQBvPZrTwPth0/DvCo7mnzmIUdaiBCsInEqXIBokRT9/0mMt
         VhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225084; x=1773829884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68kFT9M+v1YFr8fLxiUdg7OyCK95BGAep7GJPhPQZJ0=;
        b=uhYEllgETtFR8Ukt76Ptjx400vehO7hd3DsnArPIb43QMy26H9FFn4baoPYH6IHh/3
         TI4/xt/QNYa6LEQXMVIOmkfsjepthtf0Ibs1O88Oxx8bAY8eZ3xy8pP/DpfTbL3cFb9P
         IOnDorji0OKTRYXm6eh/Ysf4hfu/0yAiqgZrPCtwpqlKMQcQ1tuERO539qhpKUFlnxOR
         c0lhrhHb5v8AJin/5a+w11GQLg9ErYEFDdXL4WLpnakgwahEpycXVAB7af0hnq9bJ3hv
         OlLNNejJ3w18BZS/nA3Om89EEfr268PL0tBC4Ve9u8Ed47PZRA9PczpguCmaz54TYRkd
         WB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1MWAPD2PFkh5BlHn34lcHBVodkuU8R3R6Vw1seX4vBGnTSpMrekoyJIJGw0qV/P9A5GygQnJNFEw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/AAnm3D66F+oxg0KchnLg3Rm2WkzxifK15Zl5ZY0k1NUxKJZr
	r1asmEYgrvWDJEcNJjUWImSs1pp5aNuItDE4oxdCXwFv247sNia8yVHa
X-Gm-Gg: ATEYQzytqUYUc0UuQpDexN34YBVPpTyh/IWo+nEydryhEi0jfizJ+46WufkSiyhIbl/
	QZNqlUBHnOcNFiWP3NmWuMKcBXxBbYE6tnTFnFoUdCuejIT2xd+CdijHFtrcF1uMT6gxYyfb955
	UMkomi48nvwlDwF2j3YxKw9yHpBuRPPTJHT5giocnI+ZbZlh7J/2iR+a8dYRTk2DY3+2Hx4OdPq
	C5pou3Dw7v3GLg1ZrIdQBFd2krsGT7csjFOmx/whYsp1NVcGMcfegKrqc1vEzb9sbS034WXY06o
	DwLep/HZHWP+/UoI73yB1hoNm0v+0A1j39nHaIcrDhNaIxicAUqPBIsYqtuuM9oT4BD30MvMm+6
	WsqFLCA7rYmXRqNczcLrwGoGeT/MpvO+l+gI61j6P9ithh6y2+yf0iIJiOiRWOGsJZNMamviKZ/
	2Lm1FQiMsTg2S/mN7ZSHnDI6vdyViwmSldrAE6H0KO
X-Received: by 2002:a05:6a00:2b88:b0:829:924c:3482 with SMTP id d2e1a72fcca58-829f7148a9emr1655467b3a.53.1773225083833;
        Wed, 11 Mar 2026 03:31:23 -0700 (PDT)
Received: from 1f3ae71dd79f ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebf57sm2052558b3a.38.2026.03.11.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:31:23 -0700 (PDT)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH v4 1/2] mtd: spi-nor: sst: Fix write enable before AAI sequence
Date: Wed, 11 Mar 2026 10:30:56 +0000
Message-ID: <20260311103057.29-2-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260311103057.29-1-sanjaikumarvs@gmail.com>
References: <20260311103057.29-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_033124_743774_75330B25 
X-CRM114-Status: GOOD (  14.72  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

When writing to SST flash starting at an odd address, a single byte is
first programmed using the byte program (BP) command. After this
operation completes, the flash hardware automatically clears the Write
Enable Latch (WEL) bit.

If an AAI (Auto Address Increment) word program sequence follows, it
requires WEL to be set. Without re-enabling writes, the AAI sequence
fails.

Add spi_nor_write_enable() after the odd-address byte program when more
data needs to be written. Use a local boolean for clarity.

Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/sst.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 175211fe6a5e..db02c14ba16f 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -203,6 +203,8 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* Start write from odd address. */
 	if (to % 2) {
+		bool needs_write_enable = (len > 1);
+
 		/* write one byte. */
 		ret = sst_nor_write_data(nor, to, 1, buf);
 		if (ret < 0)
@@ -210,6 +212,17 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		to++;
 		actual++;
+
+		/*
+		 * Byte program clears the write enable latch. If more
+		 * data needs to be written using the AAI sequence,
+		 * re-enable writes.
+		 */
+		if (needs_write_enable) {
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				goto out;
+		}
 	}
 
 	/* Write out most of the data here. */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
