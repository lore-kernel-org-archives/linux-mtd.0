Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB0EC5DF67
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 05:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfkQi8mAQjdLksjLnaML+7WoIeJO+5hyro/ecgijNTw=; b=EHETGn9Xi7ris2
	HXSA+51tbhYukGdrh1oU2l3CUC4immKSO3q0Ky2cHbY57xvmo7PBndpI6jUBkLEwrcnVPolsnX6DU
	BYjye5Q53ro0cQyBrYCtDDzPK45ODJDKIPkPaM3pLG/l6Evq/op36/eFIg4rUClcBYRSkRVccIyJl
	rtI4nmq2ASH7/gNibMdl4q4bF8sMFB5A2OafmPGgIRV+jmJAAuUbj+OCprVa3hmpZAt126lS//6lz
	fvcUjecEEy2qQA4MzFrDpOWnb9SNUYw5Hum/6cn83+PjxHJOf/ItHCM+6vJNqKYcaHYMcNPxgHX0h
	b9veTAHvlbuNE0dZZFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCO9-00000007LZ8-2YyF;
	Tue, 18 Aug 2026 05:29:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCO7-00000007LYg-0ZeE
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 05:29:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so534690a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787030966; x=1787635766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwo7izKlDdLv61ZfO6XjTuwjicNuk/bFE3AW2yim+4M=;
        b=KZob5ar/e0qdmT164xW/ixu0hA6+v7KUCYUmR32As0w7TWcv4iCwF7tXMVvfCjfbv7
         59LwwXuaOj3MraBF83AHsfRGWwpitT7eyXI+HSKgvF3Y7sNM9eat3djHUhjempwTZrd0
         su9soW3R9luDqB0b96A/T3VQVXT+vL126WIsPtC2kq818EuUTN2V/i01r7Bfo6HFi1Dz
         L3GmmPF7VqC1kDUWL68OqAexZpYg2HVLV5aX400XRh1LycPHI3aDOWmswDBS8MqQR7sb
         7VKNlWhL7ahfnjaUFy1fj8Rjz1C45cjo11g4gKBL8dog55eyyRbXAgWiZYdtBH6b3Zon
         XqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787030966; x=1787635766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwo7izKlDdLv61ZfO6XjTuwjicNuk/bFE3AW2yim+4M=;
        b=Q9jKxcvFCaues/iroDVKGpoUmm7a5wr8WMYKb1dt27bp96W97zztH61rsUQpSem35U
         R4NqO0JX5wbGVWDBxKRtD0pDxGkfCkahbBs87kuO3C+ET9qA3iK3u4SlmEp5R0/2+Ii6
         8VDHHIjE9NDPzKclD5UgSxWWJAx83Trcld+KUOPx2TYiLx6m5CJziY4iSR4sLMEoILqA
         buwyXRurQW6JJELU2+ffPh/ybR7qpm8aERs8M0DeOpLVHKApGTJw2VRAVxojieU4wure
         UERtyFxfxMSnAA8ckTlxTdyLaxxOb/riJ7AdbZkJvgJiZmMyNeIzJM22mdm+5vDfmmgG
         ZPzQ==
X-Gm-Message-State: AOJu0YyVYYbf/Z2e0VTx7skq7JxyKLeqK4k+I8nqJL6FVcp6X5hje2FJ
	xCLtQg9BjtGPfXpklUJHSho8btUYQTVyTmEJQ+dCV+UTTW/XaRADglp9
X-Gm-Gg: AR+sD13xQwgPyTpqDgtzECSf2rtUL0MppRec3EpOqMhmfOmJj2zwRw308/K6C6Q3Fe9
	95x8xFONuhJRm/wAWh56UEpNXGX/Upo7lr2CXdikL21lZz08kF7Dg4gJTknnkIjfz6T/341dh2B
	3rBFdDnRTTjEpfhV8uLPqrnoiyn+DN0aFp6sYgB3jRkqOLZAjZjsYlp4fFpK0wW1ed0+ZIXPy0I
	DbqFuuZKqCTCn9avvx0QhUoBN5eFghMdTeyqEqcjI7lS5HaDMH19r1DQGo67ihDjjwOXsHJCF9w
	O6rogH2BUeKq3vMzNiFTULRCdSkA/syGnhHIxFPkihQH93TrnawNjbcgXwtYDbGeKmc4P9sjfNr
	TUw2FjR5MR0/FnhOJ2WebXT0xoxKzOux2lzR/pgpVDeMz+hx9NacAHWWbr2ZZu27ggSUyOGKBzg
	38EZvEtsjk++ZNvbqgGRrdPVYgexgxBnAjuJ/IHpKjPcznIP7T/0k7KYbstdAnqJRu1e3qq0N0F
	7TDATUrLA==
X-Received: by 2002:a17:90b:51c4:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-395638cbd63mr2766728a91.9.1787030965696;
        Mon, 17 Aug 2026 22:29:25 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39532026f7esm7386651a91.16.2026.08.17.22.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:29:25 -0700 (PDT)
From: Cheng Ming Lin <linchengming884@gmail.com>
X-Google-Original-From: Cheng Ming Lin <chengminglin@mxic.com.tw>
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 34ECC4163B73;
	Tue, 18 Aug 2026 13:29:23 +0800 (CST)
To: Russell Senior <russell@personaltelco.net>
Cc: linux-mtd@lists.infradead.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: Re: Regression: mx25l12845e stops working on my device after commit 947c86e481a
Date: Tue, 18 Aug 2026 13:29:16 +0800
Message-Id: <20260818052916.135931-1-chengminglin@mxic.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHP3WfMMK8GU3jpwxv4=C=Pc_9H4ZkmqAJqxZ0gN_rYqPDU3XQ@mail.gmail.com>
References: <CAHP3WfMMK8GU3jpwxv4=C=Pc_9H4ZkmqAJqxZ0gN_rYqPDU3XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_222927_183271_F17F18B5 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Russell,

Thanks for the report, and for narrowing it down to that commit.

Some background on commit 947c86e481a0 ("mtd: spi-nor: macronix: Drop
the redundant flash info fields"): it dropped .name/.size/.no_sfdp_flags
from that entry, because from that point on all of those parameters are
supposed to come from the flash's SFDP tables. spi_nor_needs_sfdp() keys
off .size being zero:

  static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
  {
          return !nor->info->size;
  }

so once .size is gone, SFDP parsing becomes mandatory and any failure is
fatal (-EINVAL) instead of silently falling back to the legacy values.
That is exactly the path you are hitting:

  spi-nor spi0.0: BFPT parsing failed. Please consider using
  SPI_NOR_SKIP_SFDP when declaring the flash
  spi-nor spi0.0: probe with driver spi-nor failed with error -22

MX25L12845E does have an SFDP table, so in principle the entry without
.size should work. Please see the datasheet:

Link: https://www.mxic.com.tw/Lists/Datasheet/Attachments/8693/MX25L12845E,%203V,%20128Mb,%20v1.9.pdf

section "(33) Read SFDP Mode (RDSFDP)". It documents SFDP as per JEDEC
JESD216 v1.0: signature "SFDP" (50444653h) at offset 00h, two parameter
headers (the JEDEC Basic Flash Parameter Table, 9 DWORDs at PTP 30h, and
a Macronix vendor table, 4 DWORDs at PTP 60h), and the flash density
field at 37h:34h reads 07FFFFFFh, i.e. 128Mb / 16MB. So a part that
answers RDSFDP correctly should get its size discovered just fine.

This makes me suspect that the part on your board is not returning a
valid SFDP table, so the driver ends up with no flash size at all and
bails out.

In my opinion the best way forward here is a local patch for the single
flash that is affected: just add the size back in your own tree, and
your board will boot again.

Thanks,
Cheng Ming Lin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
