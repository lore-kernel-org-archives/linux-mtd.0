Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CE1CA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ewmV0RYuMqJbSAw+m5qhGhaaKWnh9X9LwCFokZgyN8A=; b=LUZ
	KC/V5TwH6Ime5ebZX+ZvB8bal3NcdvQNJhxp6AsCJsrDMmD00M4kcdgRAdF7K9ITWA4KxXk9wjgs+
	ju2+G7VZLqqx2XgRYCIYQdNleWztYNHNqizwnFmASU9nO7ig3YRnRXUGNHQh/SqNlnSlWiTIKz7JB
	ZZMOPh9xj3XIPJBlcf5Bd06Vi3px04ypWn694w433BmWMNTwL3N1Wz8EdFhltqRdnyRc0Xtz3q9Fs
	M2YOPh9a4E6m+9v1al5pHaE3PIYIS91KpqWDGDLlSQ7WgiHj1qUusLBInmgKbhQylO6NEz/4bmyvq
	bYoQ5sopd2vcgPdWP6LtV27ynfTV7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIAG-0000000DYJN-1JOY;
	Wed, 10 Sep 2025 10:35:00 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIAE-0000000DYIn-0k0a
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 10:34:59 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-627eaf68bbfso4547790a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 03:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757500496; x=1758105296; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KKm0jkbqzCHbQbrD/ZyxopJILHKzxrG8LuPV9nqZYkw=;
        b=Bpzp5kjTzBeQ8gt4mwkUGYig15yRwELJHYqgE6zwLKtzrfAUTmhRQBmSTjknrf7iql
         K2eFjLGHw4fjwCu86Y5xaJd+nu7KVi1AMuDlzOtdv0xMAMCTA1BFBBEJJiZCp4CM8kh3
         LCpOt70EFNtlHrmx73RemYBeQuQeCCxDoglbtqb6JSeNRGQ7tDhGhXuKmjaHkOJEdTFW
         uOH6sborCoAb/9z+aMUNwlzyPMGbYrl4WurkN6xToqyW3BIenIRquBNMFXTwQTO8VMuw
         SkmZ8g0VxW7PEmgIu78ZOkPfQtH0fJRZ6AptsDYNykqxJ5FLjPdl2mDM4Lt/cBQKAJ6Z
         8NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757500496; x=1758105296;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKm0jkbqzCHbQbrD/ZyxopJILHKzxrG8LuPV9nqZYkw=;
        b=ol1i0/pvJoFNQLIM2vSaOJjhJLTYIPwtPvL3i5zJBeNMWx/Zru1pzeKUCdJFOVK1Od
         RP8iVzh0/Mvmvs98zPDNXvjMHRPKfBbNwNyQ1ZItrb/ZRZJR1FU5gfRi9xeT1TW4hQEQ
         7vEHm5fgdfWGwC70S+dSA8grt4d0lMQnWNoW4fcsgWNUe6PalsuSUrNx2yFqd22Cz6Tg
         aABv19xVuJ9ozrTNQen12pqIaiP0cH7x4y4ZkDUtxk4+1ehlIWMx2j7b7s1P+Z4HQ5YH
         U1BSGUqTXVlrq04RAlu88dZzpxs0F0ZscDomNCq9yOYVYbFnpROunL8iRYXtRGl/5wMM
         g2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL+ecHkSVPVykDGL+UZRoUfvP5X0oBByc0j1O/Z5jDsIy7jbDry2zSHGEawTMhpbl2uAgOau+n0iQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZPoyayaeTs2kDN/F0/FwXpA9fQ3qVuk2EssnAuzzY8dzEDO8
	Q1jEgOkt5V+43ShZTLiSjNZT60vZnHeHwYINUe1TC9c7JqUvz2kHM0Hp9MOVu1K8D7rVMkBQUT3
	RUDLGcuuHDQ==
X-Google-Smtp-Source: AGHT+IGQ3fHbE7naj85CdBuLACoB3D4RZfuFn7hndTTGiUVAlDir42uDdrqa3sGbCVuaMELpPzDXQbYL11XZ
X-Received: from edp3.prod.google.com ([2002:a05:6402:4383:b0:61d:1dd1:5e1b])
 (user=czapiga job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:270d:b0:62c:3878:747
 with SMTP id 4fb4d7f45d1cf-62c38784cc4mr4446625a12.33.1757500495905; Wed, 10
 Sep 2025 03:34:55 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:33:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250910103355.629421-1-czapiga@google.com>
Subject: [PATCH] mtd: spi-nor: core: Check read CR support
From: Jakub Czapiga <czapiga@google.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Adamczyk <konrada@google.com>, 
	Adeel Arshad <adeel.arshad@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jakub Czapiga <czapiga@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_033458_223213_02097CAE 
X-CRM114-Status: GOOD (  11.77  )
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

Some SPI controllers like Intel's one on the PCI bus do not support
opcode 35h. This opcode is used to read the Configuration Register on
SPI-NOR chips that have 16-bit Status Register configured regardless
of the controller support for it. Adding a check call in the setup step
allows disabling use of the 35h opcode and falling back to the manual
Status Registers management.

Before:
openat(AT_FDCWD, "/dev/mtd0", O_RDWR)   = 4
ioctl(4, MIXER_WRITE(6) or MEMUNLOCK, {start=0, length=0x2000000}) = -1
EOPNOTSUPP

After:
openat(AT_FDCWD, "/dev/mtd0", O_RDWR)   = 4
ioctl(4, MIXER_WRITE(6) or MEMUNLOCK, {start=0, length=0x2000000}) = 0
ioctl(4, MIXER_WRITE(5) or MEMLOCK, {start=0x1800000, length=0x800000}) = 0

Suggested-by: Adeel Arshad <adeel.arshad@intel.com>
Signed-off-by: Jakub Czapiga <czapiga@google.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4b960101cc..79deee3a50d3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2608,6 +2608,10 @@ static int spi_nor_setup(struct spi_nor *nor,
 		}
 	}
 
+	/* Some SPI controllers might not support CR read opcode. */
+	if (spi_nor_read_cr(nor, nor->bouncebuf) == -EOPNOTSUPP)
+		nor->flags |= SNOR_F_NO_READ_CR;
+
 	/* Select the (Fast) Read command. */
 	err = spi_nor_select_read(nor, shared_mask);
 	if (err) {
-- 
2.51.0.384.g4c02a37b29-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
