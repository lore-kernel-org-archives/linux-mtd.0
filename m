Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66084C36010
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 02:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WgXDnrm5IUVA3Xkm17h5BpF+nkSKxKZnCroytfSS3N0=; b=gtOMyX8IDLD9K+
	0fsdXsJzAkrTVr65OTMTaRGKYJFMFSidd4eZ8y93lvwffyaCzFaJUtytO1LZAZ9EYHsJ4zueXGpHT
	wXyqnMsRxYGzS+hoFuO/by7AIg4aBZj7sFfp7viPph53eCHus2ZgR1bIC7OyubhiA/TjVQPkc9tnm
	uphzJAnh8BSBLKWn90xEw5pzF9bVE25yd0Ikzk/EJ41d+zKc8JhLKnaQ5n6Pvyy1ylOkdAbQWN1kw
	kxPdw5ZnYdTZaNAXHiXLQXZdD2E5gph/01qmaTphlLB0Rn/ktk4LTUcdJ2/RL7OF402YZ3uxdSbr8
	RkUshBo52jGU/FLySNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LeC-00000005ytW-29GO;
	Wed, 09 Apr 2025 02:58:40 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LcP-00000005ylS-2fbE;
	Wed, 09 Apr 2025 02:56:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5499659e669so6516048e87.3;
        Tue, 08 Apr 2025 19:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744167407; x=1744772207; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=goFXSeGC4T5VOPuziH2FJorXn4oNj+LHUTP2T7HNrwY=;
        b=X9fO5+YvmK/Xi3/hG6J9i6YD2WWs41xvYOoihTNaf/hVK3J583RCblAMUnW1+Uk9rm
         Rc8Dy5StkwMdKiZ/6SJrvIzw412g3Q3My2/8l5iHgVTs86ZQQQRxViq9XXtU+tneMDBl
         rrPxF7HlBfVEeoVjhGGxrT5nxwjboqcpEyLSe/4uKUcPL9aNsNqKHQalC64/W2Oc/BaW
         7iDKxYXekW83PL9rozSsWqiIHFZG0vr+OtJNbedyQd3T4W4tLxlXVL21uhlMo7/RWJXf
         FTOMe57KeyuXhMFRenB0cxaFDHHtFA/R32uToek2Z1xaez0LIJQa1uIV7EbfxTyOY+t7
         /fHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744167407; x=1744772207;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=goFXSeGC4T5VOPuziH2FJorXn4oNj+LHUTP2T7HNrwY=;
        b=VehOAMEuVrnHi9F8en+k+MXyLSmvAV9Al3uhukckGqzuHO0TJgqfRRhU8mCrDH7DaV
         5ZEQhiYg/eHoY08QznGe35hKeoQVuf8SbbUD7hWx+A8J11JsFB0at8mk+V7VQGAKilHi
         afEWeJM1rSNMVxm8LxT9S9IWYTUImos90mYrvwQ3y0CsVjdLjjluRywNf1umUVbmTUX6
         cdUp2JOtAeIRWjJkwqaHjpKuH+Y/JuB6xwN9jdyHpjzNzRFOoFf3kMRo/gSVul6bYC9d
         l0OAr6Pp2cpVg9EEaJ+um8XyN4gT4Mneyg5hQJU5Uix2w+WU9X++DSmewBCqFJ2XFXXp
         SOvw==
X-Forwarded-Encrypted: i=1; AJvYcCWnO1wGTyXN0ULNjjxaTEJAEKSdH49gZpJyFcCtA9s0ll0X7FhdQa4Pis46r+hLhgkkKrs8z2lKZHiT@lists.infradead.org, AJvYcCXjH9DvwOUhUn5qTPWTrOtBTuMNrYgcCOQHJluT32iooCIJbwTCZaxw7bcmiemVVp3pvdFWbsyPr8Axps1EI2nS@lists.infradead.org
X-Gm-Message-State: AOJu0YxvgiivDGz9nP3v0SdTmXXY2q+otqIKQPL8R6/Fxowb9NpbgRKO
	lCSxZSMwNEXlJe2aAqs77FQ1o6CAb9cGR4yulVt6sm70IYP8pa1yUNNSEXdje2GnPfyKXgbgSeS
	hIKfBh69lGUd2opmGUv3wPGReEIzYSExu
X-Gm-Gg: ASbGnctD9BfSv1c+DZnAwRVvdsvhsMk3atLg4CCKUNbHVe3gRGR0jAh8VqNV8vpYvwT
	EK81D6FN1sO+k9s/pdZb1bm7yASWfHIrEw3Zx3RoDa4NCkhkwIaq1mTBXq3PyDOF4+lscuC/bXi
	D6Q8JnxG9Eg+h7ulT1pAQrRZC0b3jOkTL+6Bucf6384dd/beP4IdnDTcFrBA==
X-Google-Smtp-Source: AGHT+IEm57FiQ2s1gihpYt19HjU7v+HB4F+eXJNmjwWojhtUgsDDDB/PODiABqIITHDLaoPnoKLGiea0kXxELK36epM=
X-Received: by 2002:a05:6512:2350:b0:545:2e85:c152 with SMTP id
 2adb3069b0e04-54c4372ba9amr313818e87.34.1744167406842; Tue, 08 Apr 2025
 19:56:46 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Apr 2025 23:56:35 -0300
X-Gm-Features: ATxdqUG87ph1E6HWoGw4xgNXKxEVTOw47BjkO_xl-0okTMFSjmz3c4a9oX5ToRQ
Message-ID: <CAOMZO5DyuMv7fQbTz33MvswfDKvpWsTCSX7FGJ4T7hkMsyX-Kg@mail.gmail.com>
Subject: sama5d27_wlsom1_ek : Maximum QSPI frequency
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, claudiu.beznea@tuxon.dev, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	Eugen Hristev <eugen.hristev@linaro.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_195649_730820_B850E944 
X-CRM114-Status: UNSURE (   5.45  )
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

Hi Tudor,

On a sama5d27_wlsom1_ek running 6.12 or today's linux-next the QSPI
fails to probe:

 # dmesg | grep spi
 spi-nor spi0.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff
 # cat /proc/mtd
 dev:    size   erasesize  name
 #

If I revert your commit 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1:
Set sst26vf064b SPI NOR flash at its maximum frequency") then the
probe succeeds:

 # dmesg | grep spi
 6 fixed-partitions partitions found on MTD device spi0
 Creating 6 MTD partitions on "spi0":
 # cat /proc/mtd
 dev:    size   erasesize  name
 mtd0: 00040000 00001000 "at91bootstrap"
 mtd1: 000c0000 00001000 "bootloader"
 mtd2: 00040000 00001000 "bootloader env redundant"
 mtd3: 00040000 00001000 "bootloader env"
 mtd4: 00080000 00001000 "device tree"
 mtd5: 00600000 00001000 "kernel"

In U-Boot, the maximum sama5d27_wlsom1_ek SPI clock is 50MHz.

at91-sama5d2_xplained is populated with an N25Q128A QSPI that can be
clocked up to 104MHz. However, its dts limits it to 80MHz.

at91-ama5d29_curiosity is also populated with an SST26VF064B QSPI
and also restrict the maximum SPI clock to 80MHz.

Any suggestions?

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
