Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35205C25B0F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Aug 2022 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFE0jILWAyoBCvmjEjuLnwxaonKqDu6BvFK7MXOBwWE=; b=TBK6uhRhBstUc7
	Gqd5nS7mopWdq1xG26rYPptLhQQrC9iShviUfUx+uFqBHWDJW6bWGYLOa/EwC+Kb/S7PaolQQnH6I
	4RyTfbgtscnZwA9yZyo5LubFCHW37Vvx1J9HJwtvzzCBrDY9jGHF8Ryoiyk8rcSXklauQLKtJbwW2
	Exo++bJLaDDEGJVKnbWNV+m6pyDmDrKeVz5IJXT1RfR0a1ZsDUq3q5FLZYrB1cyT1CRJiijkDDen5
	9KvXGEUP3i9xwSfhSzdX1wnfeuu97cl27qG8ThTb+U+03qbc/8Xv7RmZbVZllvK+e+DCb0aOc2lWt
	/S5tecsEvk7cPNMKgGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPhT-002UnR-RX; Fri, 12 Aug 2022 08:07:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPhI-002UOV-O6
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2022 08:07:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id f30so319257pfq.4
        for <linux-mtd@lists.infradead.org>; Fri, 12 Aug 2022 01:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zuHWbJBc/sLNoIZnACDP0TFKgedOgbrSIRavKxG9kQk=;
        b=ExEImUukaK9ab+AgKQbWrpEVw9hn3KU2y3G0P7ZsmHMllyTNFw3NIKXAXFcVVQ95cO
         Lx/ogmzNgIwqrDteyl/eRoQHBPSfxmIcRC1ITEbVBR1LRbm+RLvw1/DvJFMKVEeUruQh
         IOmEVGjcWRUSb5/Ms7yOkPc60tAhEAJ2cux1G62MmskAMlq7dRqaxSDKMfxc5xig9zts
         44cQhaPby7wJG8/SRRJpP3JM616mavH7ffoUkLfibCg9PoYfnACMWZeq5Jy5bzUmzZxY
         2v97hPnYhOFY5T2LshnhHM5XmU5cf7MxGFGbV/Ej1V/oLRQFjJpp4TRvmTG0Y3mL5wFw
         bnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zuHWbJBc/sLNoIZnACDP0TFKgedOgbrSIRavKxG9kQk=;
        b=KvNdQyJnaJZJv0UHHikWp8iBjIuNZs1ptuXeEVtNgiO3Fx3mSf61y/33/Padjny4GR
         sYFnsTnRCR/4lsQa+V4hWV8GCDHg15T5b28Wy+WtMaiYKLjqP3vpumRJUUxLG6a6n2Ps
         Te6j7Bb1MjjH51bw/oTM0bWu/1b3NFqTSw49z6uo5I9HfBgTJ+CJKIPNkbCxJx0/aLGB
         JtSl2MVzP1bLmmNeIfKpo5li4c1WrOszLxoKoh1f4F4AyOSdADLHu94YlTbjyfgeSe+b
         PY+nmC5K3TrgkuZUeJM3riCvP1yIKh5oBKeKAWM/mQbU+J3kYGkK8CZI+dCEzH2T7NCn
         4j3A==
X-Gm-Message-State: ACgBeo04bLCqyZHkD9upMyUsBxRVEjWorsOBhnhEtOxY5i5n8hxjCSKw
	TQVU9to1PvU/+5ho/Yytf9GCjmsYL+Q=
X-Google-Smtp-Source: AA6agR6FJ4Jg+LzeD3ZtuX3PySU+Tyt7CHGIyCpfuhWef5Lb3pB3rm56hA9XSj8GNlAfDEdSktkCZA==
X-Received: by 2002:aa7:88cb:0:b0:52f:76bd:7a65 with SMTP id k11-20020aa788cb000000b0052f76bd7a65mr2913202pff.72.1660291629946;
        Fri, 12 Aug 2022 01:07:09 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id y192-20020a6264c9000000b0052dce4edceesm960013pfb.169.2022.08.12.01.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:07:09 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 1/2] mtd: spi-nor: core: Add a helper to read with alternative method
Date: Fri, 12 Aug 2022 17:06:32 +0900
Message-Id: <fb71ab7a03e98456fdb9cb65f46521d77c37cb73.1660291281.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
References: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_010712_842132_41D8AA95 
X-CRM114-Status: GOOD (  11.99  )
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

The existing spi_nor_read_data() uses preset opcode, number of address
bytes, and dummy cycles. During SFDP parse and corresponding fixups we
need to perform read op with different opcode, number of address, and/or
dummy cycles from preset ones. The spi_nor_alt_read() helps that by
backup - read op - restore the preset opcode, etc.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 48 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..ae98b4ad9b19 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -247,6 +247,54 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len, u8 *buf)
 	return nor->controller_ops->read(nor, from, len, buf);
 }
 
+/**
+ * spi_nor_alt_read() - read data from flash memory with alternative opcode,
+ *                      number of address bytes, and dummy cycles.
+ * @nor:		pointer to 'struct spi_nor'
+ * @from:		offset to read from
+ * @len:		number of bytes to read
+ * @buf:		pointer to dst buffer
+ * @read_opcode:	read opcode to issue
+ * @addr_nbytes:	number of address bytes to send
+ * @read_dummy:		number of dummy cycles needed to read
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+int spi_nor_alt_read(struct spi_nor *nor, u32 addr, size_t len, u8 *buf,
+		     u8 read_opcode, u8 addr_nbytes, u8 read_dummy)
+{
+	u8 bak_read_opcode = nor->read_opcode;
+	u8 bak_addr_nbytes = nor->addr_nbytes;
+	u8 bak_read_dummy = nor->read_dummy;
+	ssize_t ret;
+
+	nor->read_opcode = read_opcode;
+	nor->addr_nbytes = addr_nbytes;
+	nor->read_dummy = read_dummy;
+
+	while (len) {
+		ret = spi_nor_read_data(nor, addr, len, buf);
+		if (ret < 0)
+			goto out;
+		if (!ret || ret > len) {
+			ret = -EIO;
+			goto out;
+		}
+
+		buf += ret;
+		addr += ret;
+		len -= ret;
+	}
+	ret = 0;
+
+out:
+	nor->read_opcode = bak_read_opcode;
+	nor->addr_nbytes = bak_addr_nbytes;
+	nor->read_dummy = bak_read_dummy;
+
+	return ret;
+}
+
 /**
  * spi_nor_spimem_write_data() - write data to flash memory via
  *                               spi-mem
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..4f1e636f9362 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -656,6 +656,8 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
 ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 			   const u8 *buf);
+int spi_nor_alt_read(struct spi_nor *nor, u32 addr, size_t len, u8 *buf,
+		     u8 read_opcode, u8 addr_nbytes, u8 read_dummy);
 int spi_nor_read_any_reg(struct spi_nor *nor, struct spi_mem_op *op,
 			 enum spi_nor_protocol proto);
 int spi_nor_write_any_volatile_reg(struct spi_nor *nor, struct spi_mem_op *op,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
