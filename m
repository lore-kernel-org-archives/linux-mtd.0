Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E54CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 03:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7+D99zePEN0JzjvDzN8c3xS3jyY505xTqxaIvGXgYQ=; b=bTfNhbovQRsy4L
	CktQpIJy1wiEnN0Sec5POGP6qkqxaTfk/Xws1y36yZ2TmmIQnwaaeahWludTioI6XSIPy7P0n3chp
	DWvSSjbASCRFQLhmdraJ8tMp0S0Nt55Bys3dU9jAm2eOCr41OOJoLwnkG0J0JZzAEop5R930YNlNO
	myRNX3Nnh5ZCEueGpREk/NgwNhY3xryxJjll7XltZOvlBbvFAuF6xutKtxQkVa3leRC5HpeZ7nv/2
	XUKTzEF2jeX/iAvTETtYA1FHXKg9fk1EB9VruMgls4tXvSG8JYEANp60Tk2eFVYC1CBwhxAF97F8d
	NYznA2ewoOZ7WpDsmk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9r-0000000BnMb-1AQ6;
	Wed, 10 Sep 2025 03:06:07 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9o-0000000BnL7-2vKU
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 03:06:05 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b523af71683so2038405a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 20:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757473564; x=1758078364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lApSKWlbDDCVaUIvBgJHVYgBpeBz7q+50mzfJPpQ9Tw=;
        b=FJxHC2SsCTMy+9l/rycRb8eagXLXHZgu7AWGqxCN2W6D1NYNu1rMLLaSdMqSKxZK2J
         EJyNYfAaU0hzpVosB2VqACsZLRdi7sDfoOtU1WMVDyL/8Y/fGyxCApaVKnP6uOkZ0sky
         Q/JFRQXDVDQ3wGiYiroFkCFn8OaDLZqtNgKMnxFFZB6K17AlO3jO7qRvvGxivNwxfQJq
         7zhmoaXgz1IaFjetJTXzysV2PrtawYE51W3Hn94Hp9nafXfeGNsqQGlW8g6urC06QwV7
         vD+CDtV7js8XiiQemL+IPBdYwh6S2cDdYMpiL+6kIEq/0jIXRz58Qpl6b20zuZ6POQXq
         Js0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757473564; x=1758078364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lApSKWlbDDCVaUIvBgJHVYgBpeBz7q+50mzfJPpQ9Tw=;
        b=ZFx0FuNuY79X5iSpJxRFVYPU8PDcevJ0eeiqxnhN8I1Ldsp27aZgUnln+ouGKppSru
         TZaD8BBMIt54yxWURXlk7+rmqJ1U9tCX4/nQsp1Rly6nePRMk2/jL3WkIxv3uHlyVJYi
         1kRa8FP+CboGxRJZwPTv6t4gcEtqgOnPVFtxfyHKgvDGDu3SkT+Vdc+s4KnSK8ABzi/1
         VVIZ3hkdIIAjfZtvAWm9+mPyy1WXBPsQuLjqp/sWfPok8mBS09zhnag+VHi32tvmd/65
         rAY+22yih216AkUo8wDCLKf74+q/AwLT3v2ctPFzcHd4EA3d/bEHI9aDv73WYOlJL+s5
         l2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyAQKLFKd8RxUpBON/hRvm/jd+Zl+x5s2tFfzzHk1Rqf83ITV5sPBjvKT5hwWqZhpmBlC2Bpixllc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRq7ENiBpv2HHt5PLd7iYmqhfXYl7AVfE/1kQwMlGE4tCo3ENZ
	7Wl0IlkCE6OTNStYbMPHDN++wC6QBb8nYYvPT/9ZBzWSgGMvcL7oi9Iu
X-Gm-Gg: ASbGncv/11yihlcz6TumcApVrFKi9bnXeCl1a8WaIjPjmXtt29gf4w5zR4OD6gz03O0
	mmZ8U2v3OhgBxVg5Rgn4ioX4wyUQCPxlTIMxTwDDxaUVxK9f+tsrQWDUP5ZqgKMg/fYpxhM0lVa
	1TcVU3/htfTiJmQf4QRtXycEWnL5jcsQLkJCOoXKaW2c+fPj78sa7buOZfLpMjaJXmRa2uLgfOe
	Ty80opwwp7stIo/pYoNKKxBqoDvr1Xd02Dvg79ABdYsCCUQaBU07z0HPvns7KD/wsXMeaqB5F+X
	WKJ7wkG3R2qKQb6omPkwqgHBUitU917yULmCwAyI48bpTgxQiJZIjTO43/836UYBdp5PsXVTm3q
	OY3DSrjX9sr4hDVLL8nQ2wm34s3UTKM78DSompBiv7Kc75GvNlxsM3RGGgdAX9L6ivlZMZnCmIG
	RAG/bjJGvOWheLpLvVezbhNMyWoChlZETUt12LHn3eAoluREzUP0prr7k=
X-Google-Smtp-Source: AGHT+IHCY2/ZUuieJa6b8+0cszmNX36/5F/Lrag0799NXHCWBy1pFhZxsR4kZ6/iF+Li0mFGFmNmFw==
X-Received: by 2002:a05:6a21:998d:b0:24e:e270:2f5d with SMTP id adf61e73a8af0-2534547a6fbmr21524873637.43.1757473563820;
        Tue, 09 Sep 2025 20:06:03 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662908a5sm3512047b3a.60.2025.09.09.20.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 20:06:03 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id F16A2800FC;
	Wed, 10 Sep 2025 11:10:36 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: tudor.ambarus@linaro.org,
	mmkurbanov@salutedevices.com,
	Takahiro.Kuwano@infineon.com,
	pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add enable-randomizer-otp property
Date: Wed, 10 Sep 2025 11:02:59 +0800
Message-Id: <20250910030301.1368372-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910030301.1368372-1-linchengming884@gmail.com>
References: <20250910030301.1368372-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_200604_741553_5B3609F7 
X-CRM114-Status: UNSURE (   9.16  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add a new boolean property "enable-randomizer-otp" to enable the
randomizer feature on supported SPI-NAND devices.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 Documentation/devicetree/bindings/mtd/spi-nand.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
index 77a8727c7..432bc79e9 100644
--- a/Documentation/devicetree/bindings/mtd/spi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
@@ -21,6 +21,10 @@ properties:
     description: Encode the chip-select line on the SPI bus
     maxItems: 1
 
+  enable-randomizer-otp:
+    description: Enable the randomizer feature
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
