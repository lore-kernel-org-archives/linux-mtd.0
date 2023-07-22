Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F552EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvKEg1Rqn89LD1RUKiwfgtS1ffjyy4ZsjQEyxMipai4=; b=t5RuwL/LVDmd5A
	gldgCD0hzAO/SpNbYWyspQiR7CL4NNoD/S03+ASN++DgyYfI7Jso5bYlY+bXB4Kw7oGuMznQAqsU5
	FJ/5ht3yFHZhwFubexJ7x67m85wT0VmKtNrL2xNY9B4tCaKgLW5AJRGWvCBaeA9ejE61vG1iXSlNG
	qcMH+EPk8SLq2RTkiVB3fEzdeAvf45gJyv7vQQJVXMHWggNi+M0/SGc2UeJ0/7vszjhGP9voJUhdn
	HHiheYZQwymTkhq+mxQIt8bG6Mvs+qTM0q32Iej1x0K02yUdtH5nnjXAjpf9goAvOw2iDKOG2D/9H
	J0yrCewWBR+kR2uvKxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AK-00GADD-2J;
	Sat, 22 Jul 2023 08:40:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AG-00GA92-1B
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99364ae9596so439435966b.1
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015233; x=1690620033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQWD6o2QmQMIWADk9Uuk1r2hOrPJzs9WMOrl4s2UcP4=;
        b=ECEzY1DbcoinZdp68gOfSyvAPGUR4JTFJtsB1E1DYNlUF1ujhfs4VGv+O017IT68xV
         y81ZF2Ne8x0h2hfwSBfcjWRUIHC//WLHYFa9FpBwbvdVFfi18wv6gReaElWnBQO73obe
         0ZyseqLog3CzQnQ94Y4AK74sP9coD8W0lTC4IuMgKlpG8cjWs5dJI9rzNhmrzhdSF0Sn
         pMI1H2vP/NT7lD5cUu8uPQvZ8NXlfGBanc43miLBdSxzkghgm6/DwNkkhcByUpPAWn3g
         luNBWbZrg1C38bKZ5yCXHjlrGtMHgJ8tM+zZdZUAylGTacuACRCJPvbx+zUz3YumDE87
         oimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015233; x=1690620033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQWD6o2QmQMIWADk9Uuk1r2hOrPJzs9WMOrl4s2UcP4=;
        b=TLjf3oQoCfbSeUvocCZDBIW7XaGvBKJazspxJP7F6J41KILWFZk9JPfo72J/VgirAl
         xCByxAAt/YKy/iqW942+GvMEudn42reLyie0O9tF9+Mq6nQG/2Ix/T7fKiyrWlUu1uoZ
         Rf2TtD3eXxS2YByp3XSVJaIQjwlRwBU4UvuiJdp2tjONVuRr+AFT1Icaa0XJRYg+8Wq0
         hudEtinfgNw6LWnAXSRb7qNKXsgIO7Zn6Y8aYwln7HJbF/FXUNBgPGyjDn07f61ZAn7e
         duI0qP4oxA/41vZO1njNdzQN/OPzm7VFwLcXBrT8HN5nfZbclWE9spVmlqhPZoZDy3Zu
         6Rig==
X-Gm-Message-State: ABy/qLaJaa7bCfonTK2MleXWfaxbkg1vv+SY/KI6Oyx7SP2sfWJRpeCe
	f6AHUNTj4pk3eg9lbJXB9sKmag==
X-Google-Smtp-Source: APBJJlGFe4ypvf3AH1f53UgYid2VMLbtIopcCXcbiWs9H70culUgPZ4TmLfC+u+qL4g1jMGzzue4Xg==
X-Received: by 2002:a17:906:9bf6:b0:993:ec93:a5ef with SMTP id de54-20020a1709069bf600b00993ec93a5efmr3687328ejc.47.1690015233233;
        Sat, 22 Jul 2023 01:40:33 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 05/11] mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
Date: Sat, 22 Jul 2023 11:40:00 +0300
Message-Id: <20230722084004.21857-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=851; i=tudor.ambarus@linaro.org; h=from:subject; bh=WVFbE2wfxt/8hLhyWshKgP+KuZXcvV9Z2hzSYAD/Z5w=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5XjywSNb/VFIiWHMUEXC6o5GvL5YbM7I7q4J IEexIEmBVOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6ffjB/9gOC+pMoSHgPuRrB0eWWS5xeHjt1RTf6/LdnurE5CM9RsMgPu/5ImuudNvdHGdZ+j8iTG ageZl+JEpzkPLri6PIXjrsiweNkLFGrcwOfzR3CJ2Wbqdaevtxgm7F2PoRDgdcxZlzFNibL8lFN ccUFNvaUZaE/h/GS7V2X5cO83Ry0wO8AIsCtOa0e5yV76cWfN1ytCVdnlS7E2TIf5YebAMpwiH5 PKAXsm+Kaxa11S0KV5fzew3BaGYNjqa0wiQQ3YZFLNj57LM0SyYOs7IrUQfyv2Q6bqUpOCLfIPa UCFAZjiobYbhsFX0z/PPWm1j5AQfZakx3BOxfU6NrP6M1JXQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014036_402910_B7706122 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

s28hx is the sole user of cypress_nor_set_octal_dtr, which already
uses vreg_offset to set octal DTR. Switch the ready method to use
vreg_offset as well. This is a preparation patch. The goal is to use
the same s28hx methods for the multi die version of the flash.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index dc4841891b74..5b6f36b56e9f 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -730,6 +730,7 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 	}
 
 	params->set_octal_dtr = cypress_nor_set_octal_dtr;
+	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
 	return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
