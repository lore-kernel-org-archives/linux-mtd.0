Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E9EC8303C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jul 2025 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gptyuEwxxlwOPxjJptXpXCuLpSjXvzByDBisos8TgU=; b=NIU09HnS2PoyUW
	9gZYzxDXb2wY/JN8PEO+5zRv/h6EutPwdDgA0zwLEzYVrmFOWmCSCZenmqAyedvg8Ylm/MK5xrTWQ
	hQ5yfiWdLWr5HNViZwqew/PEdAZcunQvDWerk4Pt49+vp1Bj0xP3V2g5ccHJ697VMvYxc9vhZsbd3
	WVK+QUSXxcGDrJy8LSDGNwch99vPK6vApOIfUCfTChgI65dtfdY8i92UBmp1uUTYiJtRoWpyYpdZj
	tGzUKmeH6fy2sA1h1SF+fX8KiErgY7m+fp+MC0BPP+aNi6fKZuS+H1820gefxjKz/5UjLf7ew8SlM
	l0ajldaPh0guV55V0Jlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAOq-0000000ENRu-2YCR;
	Fri, 11 Jul 2025 09:50:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9MT-0000000ECQG-1BIh
	for linux-mtd@lists.infradead.org;
	Fri, 11 Jul 2025 08:44:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2350b1b9129so14376965ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2025 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752223444; x=1752828244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMcW1zKUHWZfFi6z5+n6piMr/Mp/s+hjCPnEGq/fHXg=;
        b=ha+GGCFXOh7ve2eugoW/gp1B1I8sMbwQKOrihesiiKvUIGXoyIG+HjxHoeyiEFeuNu
         kejk9M9JvK42q10DrrD3BaGQghFYEeYeh3kSzk38u3T97uX/yz2isaH1Wr+zNrKI02w4
         G+fyXZnZhDCfx3ff/IIcIEokwmsairksXlq4MxXW1Dgt0MWU30s9uZMWl1SE/HkfrWO7
         nyUzJ1+xkNURf7OI7haYOIfVrVRqgq2nXaNBbCaEpwaHWxpGIiLUlp/NaTF8Dc+BQ8Bk
         x4NKgZQ33nOnrvW23HSq2IT6fKS6zPry6PNP3CVSVfzDiuwTr/mSRIWzqQv5bfy+pC14
         +7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752223444; x=1752828244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMcW1zKUHWZfFi6z5+n6piMr/Mp/s+hjCPnEGq/fHXg=;
        b=sblz4VPNeE1g2+lsVtztDyxk4iujRLE4XoJOwxL5MWHB0cMwNyq8L9cSDx8sq3Xh46
         nHgPD+VWMcdrn11arTX0QhV2TGD3RhfeYB6Il923D7vl7BN/YOc1yS0FCoMqiSEndc3Q
         AxUyxhtyE6zIA4vKhQpaTcjzHRsCIgvzzYxRTPumKFCR0ZGGnbyauS9WLtoaw3DmAl1C
         tOOpKkv8HAHFxpQZOAYkXDhvVEItPI/tGPCaRmhXlHidg8iZ/CaUHMJhndOvNRDiQNtr
         Nvi3XJ/rRVYXUzxx73Gne4BQZkVc4KEbk/dJAp9D4qWsqjrQdOOcRnsrwTuNIHdqFpPh
         NuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBZ+8TWc20bAoHBMMmzqChWcHDPkHUYubh7o5wjoElcsv5G55km75BV1oj7j4Rt5OVF+qXBVkbyQA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+IXy5n5chdIiokKfc2ff1Qa7XoCLeRR1FMbn7LCyqUBMNl+V5
	FuZb9rfiDuxXIID/cigyBF5UjIGP455ZJ5t1huXyuXP8HmWbyUvzX+C9MZIsqg==
X-Gm-Gg: ASbGncv+DxIh8bQx2Sm0xjOSYZjbNQ3lYwOF0iXpS3mjAaKebZ0gavGZcS3haVbdwvS
	ExtY7AvDjRcvwGiXC9LzbEkgg5Au0lmE2nePxMOjbAf41iWca23+oF7T/jjnfGbXAwizvyZ3Thj
	IomQDiRLr+u2qLDwc8RTsm0EgHEnfpTDbPwl6JQBWNqsRRbu/MTlAy32k1aBOYtE5nHn80vJAKp
	SddbKA7kXXPKMCt5cMEeQ9N8V2uZAaL+8Z+k5RztjrZtht980ut3h6mVY6Zwz23Io8qSsw7e1SF
	WUWsYxGVhcqj4l8ZkLTxzYkaPzTzi7UvSFIv34DftQv1etCMLg/RXJWIlxxTqSWmvAKGw6h/8Av
	EsJYGp8Heqe/tuOKJn/JRKeDByTJ++EbrqwaP9I10ASq4qKidmfiycQ==
X-Google-Smtp-Source: AGHT+IG0zHebnca5S6Hzr4ZHqsZTdp1v26UD80Jr6jQoWCD2MJ2Tzi1uB/46CWX1BtOlpjljV4botA==
X-Received: by 2002:a17:902:db0d:b0:235:27b6:a897 with SMTP id d9443c01a7336-23dee0b4ad2mr33841655ad.34.1752223443906;
        Fri, 11 Jul 2025 01:44:03 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([104.168.88.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43346e2sm43170005ad.160.2025.07.11.01.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 01:44:03 -0700 (PDT)
From: Ssunk <ssunkkan@gmail.com>
To: ssunkkan@gmail.com
Cc: hhlee@google.com,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	roccochen@google.com,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH v4] mtd: spi-nor: Add support for XM25LU64C
Date: Fri, 11 Jul 2025 16:43:42 +0800
Message-Id: <20250711084342.4594-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707121428.3683-1-ssunkkan@gmail.com>
References: <20250707121428.3683-1-ssunkkan@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_014405_318482_3DDCD741 
X-CRM114-Status: GOOD (  14.65  )
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

The XM25LU64C is a 64Mbit (8MB) SPI-NOR flash memory manufactured by
Wuhan Xinxin Semiconductor Manufacturing Corp. (XMC). This device
supports SFDP. However, additional flashflags beyond SFDP are required
to fully describe its capabilities.
This patch adds an explicit entry for the XM25LU64C, marking support for:

  - 4KiB sector erase (SECT_4K)
  - Dual and Quad read modes (DUAL_READ, QUAD_READ)
  - Block-level lock/unlock support (HAS_LOCK)
  - Top/Bottom protection bits (HAS_TB)

These flash capabilities were confirmed against the vendor datasheet:

  https://www.xmcwh.com/uploads/954/XM25LU64C_V1.5.pdf

### Testing:
Tested according to the "Minimum testing requirements" described in:

  https://docs.kernel.org/driver-api/mtd/spi-nor.html

- This flash is populated on the MT8189-chromebook board and was tested at 52M
- frequency using the jedec,spi-nor SPI controller.
- Detected correctly by Linux MTD subsystem:

    # cat /sys/bus/spi/devices/spi5.0/spi-nor/partname
    XM25LU64C

    # cat /sys/bus/spi/devices/spi5.0/spi-nor/jedec_id
    204117

    # cat /sys/bus/spi/devices/spi5.0/spi-nor/manufacturer
    xmc

- Verified SFDP table presence and correctness:

    # xxd -p /sys/bus/spi/devices/spi5.0/spi-nor/sfdp
    53464450060102ff00060110300000ff20000104d00000ff84000102c0...
    # sha256sum /sys/bus/spi/devices/spi5.0/spi-nor/sfdp
    27ef209af54d6fef4f51f14300e50db95f13180024f3e1aa1c4202edb4914be5
    
- Dump debugfs data:
    # cat /sys/kernel/debug/spi-nor/spi5.0/capabilities
    Supported read modes by the flash
     1S-1S-1S
      opcode	0x03
      mode cycles	0
      dummy cycles	0
     1S-1S-2S
      opcode	0x3b
      mode cycles	0
      dummy cycles	8
     1S-2S-2S
      opcode	0xbb
      mode cycles	2
      dummy cycles	2
     1S-1S-4S
      opcode	0x6b
      mode cycles	0
      dummy cycles	8
     1S-4S-4S
      opcode	0xeb
      mode cycles	2
      dummy cycles	4
     4S-4S-4S
      opcode	0xeb
      mode cycles	2
      dummy cycles	0
    Supported page program modes by the flash
     1S-1S-1S
      opcode		0x02
    Supported page program modes by the flash
     1S-1S-1S
     opcode		0x02
      
    # cat /sys/kernel/debug/spi-nor/spi5.0/params
    name		XM25LU64C
    id			20 41 17 20 41 17
    size		8.00 MiB
    write size		1
    page size		256
    address nbytes	3
    flags		HAS_16BIT_SR | SOFT_RESET

    opcodes
     read		0xbb
     dummy cycles	4
     erase		0x20
     program		0x02
     8D extension	none

    protocols
     read		1S-2S-2S
     write		1S-1S-1S
     register		1S-1S-1S

    erase commands
     20 (4.00 KiB) [1]
     52 (32.0 KiB) [2]
     d8 (64.0 KiB) [3]
     c7 (8.00 MiB)

    sector map
     region (in hex)   | erase mask | flags
     ------------------+------------+----------
     00000000-007fffff |     [ 123] |

- Vrify write:
    # dd if=/dev/urandom of=./spi_test bs=1M count=2
    2+0 records in
    2+0 records out
    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0334051 s, 62.8 MB/s
    
    # sha256sum spi*
    be845b59c00525b0e0d570468c7b014bc8e9895c61ce74e8ca4cfc00e34d08aa  spi_test

Signed-off-by: Kankan Sun <ssunkkan@gmail.com>

---

Changes since v2:
- Fixed broken datasheet URL
- Rewrote commit message to clarify SFDP usage and flash flags
- Removed irrelevant internal vendor references
- Added test information of Minimum testing requirements

---
 drivers/mtd/spi-nor/xmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..f1f2a9ba353e 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -19,6 +19,12 @@ static const struct flash_info xmc_nor_parts[] = {
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x41, 0x17),
+		.name = "XM25LU64C",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
