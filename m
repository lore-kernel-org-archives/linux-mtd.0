Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976D2CA0FFF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Aug 2025 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/J8yCn4Av7+j5WO2em1s+e97tmJ/eQBxVOwDYKN/yc=; b=k2Pg2fgngomkAO
	Jq74VYNouyxhVVNnqDqiMnQWBg6urOQfhzSa2f75g3ECu/xt5coeosDCFUPoreaUkqg/zFDKaWgfN
	eXWUCoo/6Am2EqCR6jTik/Cf5eI8J8c3XHXRirbBzwFLeE8qKnAGYLKXerJSPpRtIkY+yrGktkQq0
	G1usnf0nfFJucrb8TNRbLPe/PL5jBn9RRJHDilDW3eoaI5IC3WzyL8+giNkyGgKim65GamrN4/CEc
	1/i+vy5xCs0NzaTBe/VmxYUOBBHenCa9Y3VJieeNaZHOCRkYgfzUmefazGU10nP7wm9ay2HuZtszS
	ALuhnL8Ft2MyuNdgcLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPEz-00000008Dnx-3Nlq;
	Sat, 30 Aug 2025 17:19:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOxA-00000008BcP-0EWr
	for linux-mtd@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso718237a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 30 Aug 2025 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573282; x=1757178082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZX6cnQtxQxZvee9YX/ODpRQkmgtz5DN0rLc02L7Qaak=;
        b=cn8i0XmTpnYy4Emf0i8D7anhabM/X6p7I4qVN/D0CzNwG/do+8o18z2nmkp4hi98fj
         6d5jfcyn16IAq4IR67lGZ0lmC0mP02Bu7JsOUjiacRSvqJKDGw4UGXvo4ZiEKM67te/5
         JFYxywwZcoK611VHHvliDt6DYiUMTBQIz8nt98aBZghoLvRCMlGfLhV7k/3HACcFp4+E
         qnoHpJPPHX2kz6fvKe7+HOtATWXz2Tp3Mg3UFziMrfaJdf7HOmNINLU+BQir+mHp2BVA
         0zYXjxRm1hFAl/jaG8u3erih5M4mSuIMxK7G8ecAyWu5RouC53EGlPTXInPH7aA58/U0
         j80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573282; x=1757178082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX6cnQtxQxZvee9YX/ODpRQkmgtz5DN0rLc02L7Qaak=;
        b=Nsk80uGU6fEc5DCrBo2cP1mi6HvVPVNqlMOgRDzbSFPTgcCy7uqgW1hja9BUfNXi5Y
         HoAeb3FovTD1iYFUFfq3Ufg41Ue1PkxC9/5UWPL6ZBC87WuRmvOJ4vfgDeL8YnWgEWwg
         nIqmh1eE+mHYzuFDbGKOsY1oVnuwCPdUJaJq8kG2IgFNWNv91m0F/Yw+mZJDRUhisQBq
         bFkLjMTaUcG6I8SXTZZunuV1rQ3gPQjZ3Ord395Ivu2KbcOJv5lPrwPQ8apJX4Zpwhhc
         iqEAX16fnqxKRi8W7u3lntxuHqm1tCr9Rhr0CBYi8Nn1a4vrcUDL936K27RRcvtFO18K
         xKnA==
X-Gm-Message-State: AOJu0YzM2e4WEJZhFJVlOBhvvwcF5EKPromwMs+3zoq6WqUGCvoL/cK/
	kQQscRaKhImb9wejwJpfTd1IQIjp+RaudgGiA+0cepOeu4W4YPyyzU4atqQg4DcCB+c=
X-Gm-Gg: ASbGnctSKzRtwAnYfAK03fCcrIxFsjpL12mJLMU1wtBCZns07bp9ARTsQKMzDnSsSv0
	lC9SJMnTouNrTcXy5hwy47Rt8+Ks8SXqqOAFK1oxASDCQpAsfd2QV/6Gs2WzSBcjfOPU8/B0Ohf
	kWHioUS9nabJ6gGRk95Po67PJNf68kw27RNcRKFvV72SYkM+CqGuAKUBSlSaumGPW4f+A1s/psS
	qNJMOBy5zzCPSucQVH4YvFrwQIBEn4AH1JvESF408lfWOGitjIheTPbv5jvqZ6q+77o3DWRW0Mp
	hyDXgf9DXQLGS5tZs8mMd6iaFfbE1gB/gKiVCEBs/3mkPi0C8bdhIJE3yS3RReb2lLgnUtSx/Vm
	P4O+8jo4UAlzkeqZtbtf+vRorV02XDWN53xrmSfI=
X-Google-Smtp-Source: AGHT+IG6v7udHvpdgU+cS2oIvFGVg1zj3T8UwQ+2al+IoXWKlYP8p1wC/7NRk4XZOd4DR47tWUgP7w==
X-Received: by 2002:a17:907:1c9f:b0:afe:d028:ebf5 with SMTP id a640c23a62f3a-aff0f0207fbmr225223566b.5.1756573282447;
        Sat, 30 Aug 2025 10:01:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:12 +0200
Subject: [PATCH 4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
MIME-Version: 1.0
Message-Id: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=euoiA9H0IBKKhfmhLLup7i4X9ldC4By6je6Eq7Dk2mU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5Z0MFsP7uvApyA5lBYdFGTBsKp1EP93sAPl
 S4mTXnlm7mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuWQAKCRDBN2bmhouD
 1yaGD/9ps5kKEsFoE7cwJV5YbXWQRh6c12gbpekdIil86expD66B4EqE9aJiprN1sJkisVMeRa9
 KzRKfWDrkotxbxmxcF1S8RlACyBAHc9O1eBaYD4p9ZJSmDXGManBHmMuAXnrCvajSUcQxDoZXkz
 lA8BX31lmw7dl/WBYqnDaUjox3pRJJLOIH9Bpsi+O2Zh/LKbL3LjCbmDNvQ825c2jSHfcKeZcZO
 lVu+NnN7j87OY3gdsky0Fy7iY5gGnvyem8yBOYVBjlk4aUQV4el8npkzE95mcUbLGWdxuOZUOO6
 OQ8y9ng5eMnxd4wxWE7xehibqDn1RODbA2ku2wCuQkcFQgubF5QgH8rk8KTVWrTM67xfwQ+9lNp
 NPlWwUL8feF6EgFXQF/PlfSc+L3Ajmi+5SuyQAu0pN25MoLTAvguRBaz0HSWBZ/ccH+FaTCpnqT
 2qgqIMd49hgAiNnCbVQq6Q7JU1r0CpKbw8XHdOZYGGMJj+FGR7JLoOeJAbhUlSymvkzcoPNI/Rn
 5eGcJbkCph5qNXCMqMCKMc+twgH0f0KDwQ3z/C9fGSrusirQ23ULNb2MHGgts4ZE5aeycJm7nGh
 rZJ4sSZwAnbR/aw5brRpow4Jk3rucpmHcBrFYvBaAMgnClM9qhC/lRVoyrDipkQCbidFAmRh3P2
 AuhCtHO2e/1GaLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100124_092416_25C6E92B 
X-CRM114-Status: GOOD (  10.20  )
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

MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
defconfig as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I will take it via Samsung SoC.
---
 arch/arm/configs/s3c6400_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index a37e6ac408251903212a7e6cdd5972c10bc10b79..967b1cb22136cb60ff8eccf15997c669ac2ec743 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -11,7 +11,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_MTD=y
 CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_S3C2410=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_EEPROM_AT24=y

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
