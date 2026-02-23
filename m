Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943C7E98E14
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZndxL1ovc2ZlRoNW9I5/jU7pCpQ5l+fJfXOTtAvjmPA=; b=WC18vQrVnItNIl
	neNreTPp/+g36TNerBdwAKhnUtbmLSaGeFwQcvSuymvj8k6/MyzR6cybvRH7SjiRd6XGi5hSb0nJD
	HIsVKj4oy5BET/Pm25BflIjyvYt4FdvH/0Nqafp3Bd6yBSD9iGQa3XuRuBlPtRVI8+S+Oe9gGzIcP
	EaXXCUmn6U7urX+jA8HyLvKTI1BpO0UIsRaQ90RdfWG2rXfx6CzkNbFqZRE+IVlisHrI8gw/gpT3N
	OoYqnmxgdkAlVOpSnphNhtpDQ+CJZ8iNDO80TRap26Y3/faGBVq54dfRORzA/eXsvCsrLrFuEE+Dm
	NU+fjyWfAqM6O0t5vvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT0p-000000001kB-0z3p;
	Mon, 23 Feb 2026 10:17:59 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT0m-000000001iz-3tBH
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 10:17:57 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1496166a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 02:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771841876; x=1772446676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxR8y+DDVU/sD2lLySC6/WbxsSmg5U6pRubVnyPkrSo=;
        b=WDwBE8f2jqqVMDhjZCR0k2iutyDgq60b92YIWpQcIdmq8dRZ7tF7GquZFeR6EhlBRX
         sWfwSv7Q2wQ2HzfDse1kl4aC0RZJfc11th6L+Dk3o4V5zMrijEIpugORqAYMNSFuSoRB
         j/0RKei1qKS6/Vm7NTfiDRAcwBub/Cf/RN/QtVOKz6pqE/fsKLas5MPznIW5bZoznCPH
         7fP2wgPl0RfRhuZJlCSwcRN/L3dFJSxKw9cIpRCjnj1vIKusFc0vdn6E+Fg8S8QV2YzK
         tcukk8ZQdh2gsk7cfjV6xsd0CFz8rNh9IGTxt4SsSIgxWrRUOHzw+lR0OyTxUZenvjY/
         Bt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841876; x=1772446676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZxR8y+DDVU/sD2lLySC6/WbxsSmg5U6pRubVnyPkrSo=;
        b=lHifbiVtbhVr5D2ryGjkLhjuqgDhzH+Mn58jv7ve/JGo3fxo0gB7/4Mam/4bwhXsok
         QRyejfPG+mXGK2D9Mw+St6Sf3G59/DujbkdhYwGyVDGM/W0+lJem5Y7XEV/Y2Q9Sm2PS
         V7G8hogswp4o8nPoV6HlXqPGKhA8YG0g+87vRcmZxkFvhsJeP41yOG7yTRQeL9D4fGxv
         Cugd/KyYSNRNoMgVwaHueYkVYSe4WB00++bpMII3uxzMCXhUiiJfS4t+jnA6LkYH4QDl
         suB2uUxu8K05pE47N2M2LYDP1tXyTihzqlDB7ygstQxW7csYNDdC6OwpsHAItoKpEk+G
         LYgg==
X-Forwarded-Encrypted: i=1; AJvYcCUx/HgETHJza/tdT+nBRuY+yrG98o7u0AYAQHW+H5puJwFp0FvopgT1YcZrG20yp6NqQfB7CtGfrkw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3/DK7saItb/kGF9Rkju5pyQZx5E1TfHAbOjNa+6C4jt0p5ntV
	29RBTkmr7W/B7k9lp//MR7G4HoaLqEDYzPAqHnBPKKsHZL4bh1263Pvo
X-Gm-Gg: ATEYQzzlqFbxH1ejUag0tTCDmjK/uLy3yeSYX0VHL/OW9Q5INwEhiPRptFO0TjB2DN1
	O2Xv9rDo5tg/PzEEjHkhs0I1A5v4KUYV2H/rGunKzdFw0KkSfUxpYsFVHY16s6OToyOxdzqsN8w
	EoWKc7Ftx1lwhFYgnm2rpP7SLhI7gVs8/3uI9WGajuJ1d6KrIy4fWqGCT3Ilz/hMNze1jWHIqr5
	V0dgvRq2753e2PeSzXISTy4B5kbhykxVIXngH5+aXvcJ9O2tKW0Erd2G5DXdGcmdVCZ0iDbUzxt
	+i0m5JPZ2y/ydxVDswCU7owqM0ruz9o0BKfnzW0fboXpECBmdxNpiHG2n6QSdRigX4lkG62uzvk
	EBB0JTA8JwLb6oQyCRVbEyLnDUQyHFzrHRuvtAZAVuFO25nXy8HsWQsvLcmSPneZoS8jIIFHCLE
	Nc5c1YDqq7TM+WziqWEpEPG9KdR4v8mw==
X-Received: by 2002:a17:902:d4d2:b0:2a7:c2d5:bcd7 with SMTP id d9443c01a7336-2ad74464b22mr67997785ad.20.1771841876019;
        Mon, 23 Feb 2026 02:17:56 -0800 (PST)
Received: from c6dfb3cc7c9a ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e3425dsm66574795ad.16.2026.02.23.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:17:55 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	sanjaikumarvs@gmail.com,
	sanjaikumar.vs@dicortech.com,
	tudor.ambarus@linaro.org,
	stable@vger.kernel.org,
	vigneshr@ti.com
Subject: [PATCH v3 2/2] mtd: spi-nor: core: Fix AAI mode when dirmap is not available
Date: Mon, 23 Feb 2026 10:17:18 +0000
Message-ID: <20260223101718.89-3-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223101718.89-1-sanjaikumarvs@gmail.com>
References: <20260220094236.28-1-sanjaikumarvs@gmail.com>
 <20260223101718.89-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_021756_962397_81DB4E0A 
X-CRM114-Status: GOOD (  12.18  )
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

When the SPI controller does not support direct mapping (nodirmap=true),
spi_nor_spimem_write_data() calls spi_mem_dirmap_write() which falls
back to spi_mem_no_dirmap_write(). This fallback uses the operation
template created at probe time with the standard page program opcode.

For SST flashes using AAI mode, this fails because the template cannot
handle the dynamic opcode and address byte changes required by AAI.

Fix by checking nodirmap and using spi_nor_spimem_exec_op() directly,
which uses the runtime-built operation with correct AAI configuration.

Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78efd3b..7caeb508d628 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -281,7 +281,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 	if (spi_nor_spimem_bounce(nor, &op))
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
-	if (nor->dirmap.wdesc) {
+	if (nor->dirmap.wdesc && !nor->dirmap.wdesc->nodirmap) {
 		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
 					      op.data.nbytes, op.data.buf.out);
 	} else {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
