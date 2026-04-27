Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBCDFF885E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LV9snItsfI3dDVc9LSMRS5qatBeCEJkTYVB07XEs4Ww=; b=RUjj8ebkSQxYGN
	ZU8zXgbHyFzY2jHC4hisPCfsHor19FDgEUySfF6lsHSdzpoZpxUF4U2w67Kzz39uGTjHIx8oSCPp5
	GOamyK4F2LHpJeV8lHz8G7wsEsl5pwyF7gaYEC3738anzXKIuUjCzB7zZ1S6RgTN0lmK6HUr3p1UX
	M+gYt3sLw6huQDLmbfgTrOPVTUL2dkXC8zXTan+9V6f08ARwW1tEuYxnCeKHSHPby0R7tzG5aK/hw
	PTpBXOzM1H3+s0jM2XpBtesQBVJVf81/vgjHwJv1rzSXLV5P87Kqow9SYp1Ou4IrrpG0lHGRF6Znk
	cfW86dNw0fUE4Ufycm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUl-0000000GpPw-3NbZ;
	Mon, 27 Apr 2026 11:51:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUg-0000000GpO8-1VRg
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 11:51:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44261378651so1228528f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2026 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777290676; x=1777895476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfSdD+/3LCf1oPMPi4U/rRQ7I8X6OVvY9lwSQny+X6I=;
        b=DyZpAQov7GcxOEe/Ll+RNzcIhcZ50bolz/0eCb7RyWHy+PtPyyG2iDt45jFoZG0uON
         jhYn21PGKTiWtJpxUe5S+iY9hRK+hBteHCfeRkZeU/qgD6f5BwkhcOk43/zkw/tNsA6H
         /56bOFb0yfXvNx6i+qXtSZ1NhMEL3++KM9mOeDYBIKU9dZrXPplrFWOjR1sXl0CtyZ9U
         wR7NuV627y2V85Y72xpimJFep1puRnn6AqbSmIJZYsANZBjle9m/im07K9qKsc1bOZHU
         YGO/N4MsWKuH6eLpF+Nwv0OYFzjFqAuTn/FrcX8Gex4hgEqi0eGnGlNRKZmi2Zn0bz4y
         B7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290676; x=1777895476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YfSdD+/3LCf1oPMPi4U/rRQ7I8X6OVvY9lwSQny+X6I=;
        b=IYdLdSfT8K+XR+lSfXvMmJdnsHM2+wde6ALnjdAxbf55naqB0qk576xYp9UUK+/H4b
         7WNgM+hnFpJUbO38t/II/gbojYJwPI2gfEvN52pnbfPmlrPM33FcSNKu4WQpKpkRSndq
         wcUL4hhruvjPs4G80psxWvm7rdxk0nZBFXMWaJZSLaxTB7Bu9x+RdOJ4ANwPjM7+4pi0
         1TJrvJi2cXbQB3CqsufZO5JPHGijHBE14ui25jNf5vr0qZs5iu8GWosOk36/zOu7n+uD
         KOksaehdUGKi1tRI6QYLBRngUX5u/SRjh173JWXSLyB7BqejxixCuKAYHjTk2UMrtHeO
         Jsgw==
X-Forwarded-Encrypted: i=1; AFNElJ/Umu0SLQjyqerHoK+XgXLbeuTvmbq/vs+WCmyWbQnNeJv2OuIPHE3zfajhvtHuwJrN/guEG5n3nDU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeqj0Q4PmkoEftuNpS+cs+zWEqgHVlAfZPwQw1So6fK2fLSsta
	2aCP5u4nRosyaIRExKUUIvUzfK4o+GI3/8PDJ71cB5+qcsqr9NebZVOgPQYbc1M=
X-Gm-Gg: AeBDiesbTmqn+a5wy235Af7e3+p3VhrZacl+OaZi1a7GIsE09Ejv5OrEKNeTC1pvgYm
	7oNh54rInn59NL/PaRattpq/EUXK5/g+sbTpjoVH9P2ungvFo+OpNT4WPHw4rmxFuzVLG40RszB
	PbC9JFwME741YpOWZVZZ+bKAZ0eIu6EHb8dslCKVyz7HIbQJRSstZdZI981r1bCfLC6HRI51TAV
	pJeDlnxw/E/uwnK2qpep29NtGL66BX9XDAkHt9v0Be2COaqhCFGyUUZxe+lSt9fw0HFAwAKR2Gl
	fTDHRcpjJirxGNrfpgk0JYaL1nSwjk1nhkAsO6wbGFgvO6KXo3zOLX5xEHpu8HXRMupLhv6OzTx
	viNFh0V+n2RqFTi/W+wwmMQzuYAWHNl1MM+wuLoj5rcmUZz+OTn/lpbQhQLejBaN7tZWEPbABiH
	bh/fkpnUcHsGlLYfmPqPZgR3LeBlBmM3fHxL1leeI4/SpvHIKV+ktQj/mcEHr6gEWnIOEGfzCW1
	ByxK4SsmacXP50r9rA=
X-Received: by 2002:a05:6000:41e4:b0:43d:7dc7:12b2 with SMTP id ffacd0b85a97d-43fe408b8abmr62962656f8f.21.1777290676373;
        Mon, 27 Apr 2026 04:51:16 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:3c87:b0bc:8c35:1ba0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-444eebec868sm5255150f8f.31.2026.04.27.04.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:51:15 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 1/3] mtd: maps: vmu-flash: fix build error due to missing include of linux/device.h
Date: Mon, 27 Apr 2026 13:47:48 +0200
Message-ID: <20260427114750.2480900-2-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427114750.2480900-1-fuchsfl@gmail.com>
References: <20260427114750.2480900-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_045118_577717_4E950FB5 
X-CRM114-Status: GOOD (  10.87  )
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

Fix build error by adding the missing include of linux/device.h
linux/maple.h embeds struct device via struct maple_device, which
requires the definition. Otherwise results in build error:

./include/linux/maple.h:81:16: error: field 'dev' has incomplete type
  struct device dev;
                ^~~
./include/linux/maple.h:86:23: error: field 'drv' has incomplete type
  struct device_driver drv;
                       ^~~

Fixes: 313162d0b838 ("device.h: audit and cleanup users in main include dir")
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
v1->v2: no functional change, just rebase patch

v1: https://lore.kernel.org/lkml/20251117224408.498449-2-fuchsfl@gmail.com/

 include/linux/maple.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/maple.h b/include/linux/maple.h
index 3be4e567473c..22f2930251ed 100644
--- a/include/linux/maple.h
+++ b/include/linux/maple.h
@@ -2,10 +2,9 @@
 #ifndef __LINUX_MAPLE_H
 #define __LINUX_MAPLE_H
 
+#include <linux/device.h>
 #include <mach/maple.h>
 
-struct device;
-
 /* Maple Bus command and response codes */
 enum maple_code {
 	MAPLE_RESPONSE_FILEERR =	-5,
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
