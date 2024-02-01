Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8CDC48294
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/geXv0g+3hdEyVJVWB72H5YRtMZJOxILB6pCfJq5t4=; b=bkfFHqIxeSt0l0
	IEP672wGWdr5qvR/mzWvUjDb891or1u37mndzW2RRzd7d3PJoXHHMmjjZug/oQQoUIjvPT/HFHV5q
	WOjnkrj/KQCps1dFpcnfF0vJmlq2w+yGyTqm+uLsEQvmhLw/m+LTUUeeZDbXF0p2xXupdxP+dJjV7
	ZzlYwHNuD4x6xrnsuhq8Ag6pij+TYjChI7opReBeJScjC6gSEMeakQCsp5Gr+dvDrjKIGPCyH601T
	iUxFazi0uC4HGfCAll+d+qPIvcCxvifasLJDm4b4ahUDX/0cUsL9mUWz2byDSkAAM339y1T9Nc5aN
	pPAmanm3vl6uL+bQm9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc8-00000007K75-3v75;
	Thu, 01 Feb 2024 09:44:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc3-00000007K3R-2WKd
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 09:44:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d93b525959so9375055ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 01:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706780642; x=1707385442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoiHjEiMC3UMdObp3d7N54tn3HfFZxLoxbXJN0bZHnQ=;
        b=mkIosvZNFP7hnYPn13LUL9rb4MYH/YQrcNMkMOrl1n4fqnJ/zvDpCBcWM/aZbjVndv
         fZ8Iv2NdM8iinwKqjyOsgxmZx8M/7Gc5R9OuOWAb2CJr9o+x57v7NatPopj/JEYUQkMR
         wdpay3PYOLwNxRSoA3NxbpE+m36a63+Eiozr71d5sGToJSow9pxOWj/VKf54MhQk97RD
         klpKplz7EHoVoegdc4I0vTxnYLtXFKG1hdBx/Wkos2wnZFyVejeGjvEfmKkEHb2kIO4Z
         TDtChCPN36dghilXP0myyUYow3rEeRKhPsAGFPw7COTgNAGNokga+oGouAihxtRYabbC
         Fs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780642; x=1707385442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoiHjEiMC3UMdObp3d7N54tn3HfFZxLoxbXJN0bZHnQ=;
        b=M0ew59cEral6ZekC4ScCEsY1o+l9CC1i5Kw8+ctCgMe9fjGFVaLn2zBMPJOOZEwopG
         +HkY/zl3zXGNQzF1xrC5lzlixnrz4O9Nt1Ofapj3LaCERn3o2DcK/MzXLVbGpwor1be4
         jHyFi0IjJ7n6HL2QVpZ3rS88SvyDUUDm//5Ldf/qKlGVn/BBSL167OxTlpLXnYE/heuK
         IraUgf2rF4k/pSuHfhYQMkf/sq3RirN2V6shnwzODnGdPXkkWqIx0sm0rx0q0BLYLss1
         8MkHfj0UKm+crL6J5i0nLV/jvkFfLsQj92jWrN8PdOX/9mY60x0Q5Ef4Zv9ObiHWupx8
         sTMA==
X-Gm-Message-State: AOJu0YzODuGeEyxXhvTA+MZESEaXOcVjXafxkdlELYKGH9KzFoZ7NYiQ
	j1pMWeNyVy4CUAFDTatvcjKRSqDWoRBoS/k/Bl1vKbyVtUYe6HBa
X-Google-Smtp-Source: AGHT+IGpofVE8+1A4v18ik09Z9DQ6s7IB9a8JzcJEF7L9/ME+uTbuwDmEMtorXGNustkpH/CxCVKuw==
X-Received: by 2002:a17:903:18b:b0:1d8:cfc9:a323 with SMTP id z11-20020a170903018b00b001d8cfc9a323mr5720590plg.34.1706780641761;
        Thu, 01 Feb 2024 01:44:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVxmBobAx6Trzn8ZtUNlOZOeK/OiTwOnOUUmmnVRQALXxlEpjup6DuU73K30cva7xNJWBlVigk0TX7fquX7BBaQghHKv05cJAUeQ0zPt8Khg5bIAYD0MIIVPKbfgfsKQDJGEsMyAA7I9JVPSqdX9b10u8Xz58vDiinhGkWwaPEOH8b5D4SmxCFgYEY6eFrB0SOpAZ4yBcLaYinTF5kAYKPyh7HQBEtA/e1j+wXvNczq5RbAnqDtyuH/3pISIjtHJ7lbs36SLe+VIvfJVSgJ+BlkbqrMtTJ0Vq0Fkz00LQDH5UAci2CrYQNyHqew2B8i00IPtA==
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id y19-20020a170902ed5300b001d8b0750940sm9301170plb.175.2024.02.01.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:44:01 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id D21C2808AB;
	Thu,  1 Feb 2024 17:50:01 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v8 2/9] spi: spi-mem: Allow specifying the byte order in Octal DTR mode
Date: Thu,  1 Feb 2024 17:43:46 +0800
Message-Id: <20240201094353.33281-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014403_688328_D4D722D4 
X-CRM114-Status: GOOD (  15.94  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

There are NOR flashes (Macronix) that swap the bytes on a 16-bit
boundary when configured in Octal DTR mode. The byte order of
16-bit words is swapped when read or written in Octal Double
Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
Swapping the bytes may introduce some endianness problems. It can
affect the boot sequence if the entire boot sequence is not handled
in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
back to have the same byte order as in STR modes. Fortunately there
are controllers that could swap the bytes back at runtime,
addressing the flash's endiannesses requirements. Provide a way for
the upper layers to specify the byte order in Octal DTR mode.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/spi/spi-mem.c       | 4 ++++
 include/linux/spi/spi-mem.h | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 2dc8ceb85374..f8120f6b288f 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -172,6 +172,10 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		if (!spi_mem_controller_is_capable(ctlr, dtr))
 			return false;
 
+		if (op->data.swap16 &&
+		    !spi_mem_controller_is_capable(ctlr, swap16))
+			return false;
+
 		if (op->cmd.nbytes != 2)
 			return false;
 	} else {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index f866d5c8ed32..8df44fbc9d99 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -89,6 +89,8 @@ enum spi_mem_data_dir {
  * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dtr: whether the data should be sent in DTR mode or not
+ * @data.swap16: whether the byte order of 16-bit words is swapped when read
+ *		 or written in Octal DTR mode compared to STR mode.
  * @data.ecc: whether error correction is required or not
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
@@ -123,6 +125,7 @@ struct spi_mem_op {
 	struct {
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 swap16 : 1;
 		u8 ecc : 1;
 		u8 __pad : 6;
 		enum spi_mem_data_dir dir;
@@ -296,10 +299,13 @@ struct spi_controller_mem_ops {
 /**
  * struct spi_controller_mem_caps - SPI memory controller capabilities
  * @dtr: Supports DTR operations
+ * @swap16: Supports swapping bytes on a 16 bit boundary when configured in
+ *	    Octal DTR
  * @ecc: Supports operations with error correction
  */
 struct spi_controller_mem_caps {
 	bool dtr;
+	bool swap16;
 	bool ecc;
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
