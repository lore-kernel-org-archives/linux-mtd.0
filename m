Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50839C25B70
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 11:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tblFyyY5Jpdr+7EmarDjUjBx35liqeBT/r5xGWMe9CM=; b=RP576GVcCj6AaS
	bmO5oCAQfC6HFWQ1MS/lTGQzSNDK3Y3RJA0aWkubCToHWBGf0vUd4i6B3NHxVCB+nJUyDmzkP22w/
	v7jKT1TQU0BVadn8pgr9e7pL5GL0SgNKS5NH6oBLLIWGngCK8+jLskehpursWUFfvJ72a/AsMI/wh
	nn7KOwTfcVTdShySha8HfMJ2HK6dFDsIDo0l5WmidGyai4yWy44UWxxayZJ27b8ECA3xRGXn+9JEO
	pO7WIXo1+9IoLvgqdZ4uKOkVtsUwL0dOQtP2yVxFmvrpaVuNTgKBU3pLEpJN56O4WhWoU/mpf1ysT
	Rgsl3hzTbmRjPjgsgOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvySi-00EMBS-0I;
	Thu, 26 Oct 2023 11:23:40 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvySe-00EM9r-0p
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 11:23:38 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2739c8862d2so156612a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 04:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698319413; x=1698924213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwkuKsYmlW+m0Dyff8DqbSXCchV+IFfsUN6wMmflWq8=;
        b=Z8coaOMjylFkMHNwoRosgzhpmfTLPRyYI93YpV9eMKDypUM9g/w/6EPYTtPEpbl/JA
         IWRkS/iHdjLg1nLNCSSH+lo67QE73LHGiwvfkiyGvCIRUpeSacGa2IEaHDxp9NVAzOwM
         bwdguAY0XWYFGUgJ/gv/Ud64/C/4tyBhbaAEirtD5p85w1ETtac1o5N82ta4Dn9yedHz
         bLjseB5sRopLNqrM5HEVjoqa7KJAFthbllMqUIl0jQ5KRJsKDLIHXdGwhOp8JpalAHGl
         doueMDHSgZngZ+JgiqGHiAXHxS9NBRyUtI/Yi+O5y5T5BF4R0ObxmU6KLgO3VBrLgRtT
         /Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319413; x=1698924213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwkuKsYmlW+m0Dyff8DqbSXCchV+IFfsUN6wMmflWq8=;
        b=dNu+p+q51ytmxto2vZeXnlhDWYNHmeM43kWSbCcSKoSp5GMjvGwx4BE2R/J1yHAxnI
         +XdXRexBcuXdJTgP+JuFEe4/bquUR8dJpcwd9EsNdR2TACpITwBbu0PaawjAYBc7Pvs7
         IInz3FEy0iNd2yTWGY8K7bqZfLn4YDWUnpfXuP3er1vA65Xk3JiT2KjFHy7SMWUuQVim
         lwdkmnDhywgQ331JvPUR4VS3jx0iCALab3GDZUa2ULVw7ukMvMUdopKNa+0hho+Nm2xR
         A7eI9631+6+Wpfio5IGxGZikdMhU0q8nZs2IZlKnJZgvtmUX1qIPWtba9jlMA3Vf+z3n
         PdaQ==
X-Gm-Message-State: AOJu0YxkhVekJuIszact0HWOrxS7Tg/nQyIk139ygSNCOvSKxLX/0s99
	RYYEPEVcRu2LRboHej8zcUN8a7qM90o=
X-Google-Smtp-Source: AGHT+IElPaNM4iXbuumEuycISTNEeTqieKZXMu8pa8ZpdpELHLtR0vndEAvFWWfjkLRApFmQEUREyQ==
X-Received: by 2002:a17:90b:33c4:b0:274:60c7:e15a with SMTP id lk4-20020a17090b33c400b0027460c7e15amr20449379pjb.4.1698319413203;
        Thu, 26 Oct 2023 04:23:33 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:4887:380:b001:41f4])
        by smtp.gmail.com with ESMTPSA id c19-20020a63d513000000b005acd5d7e11bsm2445690pgg.35.2023.10.26.04.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 04:23:32 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tudor.ambarus@linaro.org
Cc: michael@walle.cc,
	pratyush@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 2/2] mtd: spi-nor: micron-st: Add support for mt25qu01g
Date: Thu, 26 Oct 2023 08:23:12 -0300
Message-Id: <20231026112312.3217502-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026112312.3217502-1-festevam@gmail.com>
References: <20231026112312.3217502-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_042336_314608_E8526C2E 
X-CRM114-Status: GOOD (  14.53  )
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

From: Fabio Estevam <festevam@denx.de>

Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
model.

Datasheet:
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf

Tested on a i.MX8MP based board:

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
20bb21104400

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
st

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
mt25qu01g

~# xxd -p  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff

~# md5sum  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
9d28d1b11de8b15ba9152644219d9a78 /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

~# dd if=/dev/urandom of=spi_test bs=1M count=128
128+0 records in
128+0 records out
134217728 bytes (134 MB, 128 MiB) copied, 4.77424 s, 28.1 MB/s

~# mtd_debug write /dev/mtd0 0 134217728 spi_test
Copied 134217728 bytes from spi_test to address 0x00000000 in flash

~# mtd_debug read /dev/mtd0 0 134217728 spi_read
Copied 134217728 bytes from address 0x00000000 in flash to spi_read

~# sha1sum spi_test spi_read
6778615a7b7db2d3c3fa122721d940082eb67039  spi_test
6778615a7b7db2d3c3fa122721d940082eb67039  spi_read

~# flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 -- 100 % complete 

~# hexdump -C /dev/mtd0
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
08000000

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Added fixups to report the correct n_dice information.
- Removed .flags = NO_CHIP_ERASE (Michael)
- Removed .mfr_flags = USE_FSR (Michael)

 drivers/mtd/spi-nor/micron-st.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8920547c12bf..31839d6bc3ac 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -192,6 +192,20 @@ static struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
 
+static int mt25qu01g_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/* MT25QU01G does not define the SCCR entry, so pass n_dice manually. */
+	params->n_dice = 2;
+
+	return 0;
+}
+
+static struct spi_nor_fixups mt25qu01g_fixups = {
+	.post_sfdp = mt25qu01g_post_sfdp_fixup,
+};
+
 static const struct flash_info st_nor_parts[] = {
 	{
 		.name = "m25p05-nonjedec",
@@ -429,6 +443,10 @@ static const struct flash_info st_nor_parts[] = {
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
+		.name = "mt25qu01g",
+		.fixups = &mt25qu01g_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
