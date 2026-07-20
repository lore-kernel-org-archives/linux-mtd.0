Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91711C44515
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XLKy/nCxkwJ6WXpkFMsMMQQlaS/bGxwl6+expBsp1A=; b=yVol2YPTAjneQv
	a4gjP4LKL8G/9KknnvSwKOr/a350UvAuiwaw6nzhzeKvLoP50yqZwhtI1rcRSXkCIIU6x83jOgQLs
	JgsTP5VMx0nq0GK/wyZ+0TfPkL/G9jesu0awp8bkGYlMibQJdpd+uw/Tp9isP2P4Hz7mrGr9OXfTV
	k/bK1WdaZAY6+ji4BeUZK8bhFZ939RGpuvvI5AriOUjzvfrvy33Fvyfy7NnvKctvnsUL4JscwWFaV
	TGgimCFN9WXL4lMARAERaAUghgq3uyDd4bwB81OiEPlS8lecMcVosWo5Cvn+tnbnhiF0fj5unrn4e
	Cj1cMmXJa5eLSs7r1xsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlok0-00000006vku-47oy;
	Mon, 20 Jul 2026 14:13:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlojy-00000006vjv-3HOy
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 14:13:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ceaf8a1265so98987795ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784556786; x=1785161586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8N2Eh9+kjraqWaH+OPY3y8zXKExuWvOOjFqxAzkUc8Y=;
        b=ZLgz5Qb7pTnBaY5RsgTsvBceTvnIX5JURQjPXvxRRaJroxaH7jjUOWf11dwfOFUclB
         DsRA5F7z3rI9oVsa53llKC1AZIZn8Q8El8pJHQxV8UXOrjEMPw3vYDZt9lzhfoE98tVd
         mX2DBJ9helZMTWh/8XWpgsSBGDyOq1Cwx4D2INuhCSa/1jJ2xPCbYAa2SAxMhZH3K2K/
         v5ywEYWfLn5hL2uqa8mZECv478GBuhgQuMvbiNtRQP0xipW2Y/9jr/DKnxabdrsivnIO
         5fh1hUZ3bOodeIrsTyhkbVYuTGWCOV7Hgs904tezA9F0ERig4HlxqyKQ/lxoZnPLcOPW
         7ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556786; x=1785161586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8N2Eh9+kjraqWaH+OPY3y8zXKExuWvOOjFqxAzkUc8Y=;
        b=NeZjVrDmUrCCpQVPttl6yvvOI6xHHlPjqJXYnIo9N6AHAtTTIayB6P+eCehpJsGAwJ
         NIvor0TI90Yo9JGZwYrbKtNbDhtNNl8jVeymUbCGsfrbqXC21ONzYALDhPmjW3/OXuWd
         ScT2yEANFdKrZiXVugiFeMFw3c+eepm0bXgqtfzpDDvTL9kwsPgfEDLNW1qMaGoAs9xo
         NjyIeq/4xVlUpGLYhwVJG6VUrTfieIxlNuqaxNrVeoVs8nbe6wQZZg+sqHb7zN/lihJZ
         EXCnmAxhr7NnaqUB9o6sKE/7Hst6zt6m0tCyXO/6c0MstE+OLLmVgYys3DoYYPGiB24j
         cC6A==
X-Forwarded-Encrypted: i=1; AHgh+RoKVdlpf8PsIADB7yqvBqH52u4Sy3xuv4BNXUw4kK1TPdHmC5VatJ3ARA9csun+GbLSOiE5HPHZtd0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWAbmB5DWTIemGof0EglEVNLWEcx/Ij6+iQkGy1pHHfLnQ5j7L
	IhzX1lFYI1Yb1UnZUWlxwzgec9rdJuq1RfiVGegWMlUDc/rBV0TIvJFc
X-Gm-Gg: AR+sD10Kvl+pAMdkhJrY1OxSGYhGoKDeh1ex+c9m3V9ipbi1xt0D5rVuClcZdghYwmZ
	WtFthF/wAXuzkK+bO91P5EDvqnJ5oHCatSknc/QBX7xRH0QvoPmvg3OTg3PyNXdXMRn5TO+Pmi5
	CE6EdYefqh1paIJ5MQBuJtV+XNG54lSGD0nPT8g2RqRoZnbbe69ZYiAZLyJw6knL8TFfXO3rRmu
	e39m7I6mJVghRBfifbA5gjyN7xx6ewZRyLjDdPUfPAdjrCOnoUzhH2rRI9/7TNVGqs6t9+o+BOb
	LOfnLX8XGzIsVrLfo6JDTAq8qpbEEZzFolmMVHpyFUs7KbWngN3cZbB/Zamf2EDzqfqfxIYqa3U
	Q7kS6w0AHKUl6NFBBlzU39AzMAHrOP+8hZzZv3O9ZB0Md9oLU9ZhQrL3E8hEwhXmlwh59p5xaZX
	XAewrWxng6E4dkAdUaij3HwenJU26vWeDEBSfRkS2t+wGpS2pUZOX2RnjhC+aduhav5wU=
X-Received: by 2002:a17:903:3243:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2cf348f9dc4mr150032705ad.18.1784556785760;
        Mon, 20 Jul 2026 07:13:05 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34730e35sm57578155ad.64.2026.07.20.07.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:13:05 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: takahiro.kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 1/2] mtd: spi-nor: sfdp: check the length of the xSPI Profile 1.0 table
Date: Mon, 20 Jul 2026 23:11:03 +0900
Message-ID: <20260720141104.2054417-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720141104.2054417-1-sammiee5311@gmail.com>
References: <20260720141104.2054417-1-sammiee5311@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071306_821693_38B2764E 
X-CRM114-Status: GOOD (  13.10  )
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

The spi_nor_parse_profile1() sizes its buffer from the table length the
flash reports in the SFDP parameter header. But it then reads DWORD1,
DWORD4 and DWORD5 without ever checking the table is that long.

So if a flash reports a length of one, the buffer is only four bytes
while DWORD4 and DWORD5 sit at byte offsets 12 and 16. With a length of
zero kmalloc() returns ZERO_SIZE_PTR rather than an error, so the NULL
check doesn't catch it and the first read dereferences it. And the value
doesn't just get thrown away. It ends up as the dummy cycle count for
8D-8D-8D fast reads.

To fix this, reject a table that's too short for the highest DWORD the
parser reads, the way spi_nor_parse_4bait() already does. The table is
optional, so this isn't fatal. The spi_nor_parse_sfdp() warns and
carries on.

Fixes: fb27f198971a ("mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 4600983cb579..ece8bbd4bc47 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1175,6 +1175,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 #define PROFILE1_DWORD5_DUMMY_166MHZ		GENMASK(31, 27)
 #define PROFILE1_DWORD5_DUMMY_133MHZ		GENMASK(21, 17)
 #define PROFILE1_DWORD5_DUMMY_100MHZ		GENMASK(11, 7)
+#define SFDP_PROFILE1_DWORD_MIN			5
 
 /**
  * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
@@ -1192,6 +1193,9 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	int ret;
 	u8 dummy, opcode;
 
+	if (profile1_header->length < SFDP_PROFILE1_DWORD_MIN)
+		return -EINVAL;
+
 	len = profile1_header->length * sizeof(*dwords);
 	dwords = kmalloc(len, GFP_KERNEL);
 	if (!dwords)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
