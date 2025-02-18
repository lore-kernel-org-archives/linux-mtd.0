Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23AFC02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VYWv5A2J4Ac7SvJ/eQS4ojHeCXZkDXYx4buY4TdaoNo=; b=KcGh6ZUN8HHkXa
	06LBDpahSBBuYyIi/Z4h19AxVxcEBSgfsskYtZcJO3tJngbKxqqnPcFAFnmb20w4EbbtLT9nM8fC7
	v7rLyhhyLb5z3G3RVrmIckgE/h+zgyuaucmzuuIS/pxrsRZBSLX5RH+3GRj+BAkROCNmAPwqrQQ9c
	mEd/Ykyz0pm9HBy72Ue3Bq0kdpc5Ng9CU8qCiG0Lcu829vfjpgWSIetUaX3wqkOwWqWlyagoIivtb
	0OcWld0QcOdvNQW55ZrybAGJrUrEyq+Hb9oI2yNnZ9qNWiehMBQh8STDae10h5csmn5eyXkFgdzjg
	orhWUoilXJulsFs1smJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNaf-00000008J1G-3lam;
	Tue, 18 Feb 2025 13:24:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNXw-00000008Ibl-0Ume
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 13:21:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220ca204d04so73555275ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shkspr.mobi; s=google; t=1739884914; x=1740489714; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vGyNh+yUFFGrKndGyRtq3BCCKJ9iF/NeUQj7XuO4dpk=;
        b=daqqNMA+g2d8xJSfzBaox5R6BckWIYrDzgiS/07SKrxbIRM0FAp5TIIdeiUVPamjjq
         jJeZS0jRUjma/vdiCliCBV18/HPI5UzS0bbxKDvELptEYy2mLidB+kU9zNafeHR2/S+Y
         mqFG9ewXmW9Fkr1vAUVGXc/d7Wfpi4JrgO/MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884914; x=1740489714;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGyNh+yUFFGrKndGyRtq3BCCKJ9iF/NeUQj7XuO4dpk=;
        b=ipqQRnQ5uVN70+QFfwDMTluE4ef6Nj7/KM61SCin9Iy1LBh5n1qGLxReChELEF91Kp
         nqs91LO9Wk9ak5s5X1Tza0wNtpPlyE13FbbHYfKqEu2v89aIX4DUgcKZ/BvHWF1X+x3m
         acnQwjaNNhSMXzuunhRQx2DKe2uCGfBn0UAN3Ss1cvkWSIfQ5pp6FHhiPX1ZhmY3LP0H
         y6+IaeqfH4cQb+uRzQ9XqklZ2liGwME5L4S4i3RGyzaX0NkCJzuT680pIyfMPEzZzbda
         f0v9PTXTi8pG2+oKRSz5uBXaRf+O7wUssjp83isZ/lbfge/o2nf4mCS+AGTBIqvcuIrZ
         wB/g==
X-Forwarded-Encrypted: i=1; AJvYcCUYPbuuoPei5nTLc9v0v0nFjJqrLwvZ/9OO3LlTg3d08mPR37nNvYpXOXsvGUd0pDAr6aX4eLXWbqk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDEsClCMD/pDKoVacSkqb3YPyFxcPf4YqgOgEt8/ap9CwopOvm
	Wm8l8hUuodnevkeF3nO3+J8V96y+3CxGDTY7ZzwyJpUzr+ZKYtpjRGwAZRi9n+5nj8pJts1PlVb
	+YIKdqydy2a8LZdACU4r4zFlmflb0GzOXFSfLkg==
X-Gm-Gg: ASbGncu5tdhyERJgMS7I3yeLRRy166ovhi3GkfB2Lfq5xrs4J0cyveuJBqrEnuiUBBr
	lG9Li25+GTJ4FnPsP0CyreeYJULxIoiQ8prmKB1Df35zQAUp4tNPYMHoS9Kl9Gh6GLIP9yP0=
X-Google-Smtp-Source: AGHT+IGYwISPYytG4IVY1AqTmQX/s2MLmXL8bShNS5ZPRZoYIRdhPBN8vgROTeh4Z/BJ4LWALp6umK9K8/EdyTFXp9Y=
X-Received: by 2002:a05:6a00:847:b0:732:2170:b69a with SMTP id
 d2e1a72fcca58-732618ba2d2mr24395367b3a.18.1739884914593; Tue, 18 Feb 2025
 05:21:54 -0800 (PST)
MIME-Version: 1.0
From: Terence Eden <terence.eden@shkspr.mobi>
Date: Tue, 18 Feb 2025 13:21:42 +0000
X-Gm-Features: AWEUYZmGwytYCELLGP-V_6kd9Ja-_X391aaL-yyzeVP2m7qXb7s_IEoCtQYbBPE
Message-ID: <CAPFVDHokn+kfyk9AxTHuBJjRKMNJjZy8w=e-qzvXaA8Vfcq6Dg@mail.gmail.com>
Subject: [PATCH] Fixed a spelling error in the comments
To: maximlevitsky@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_052156_416020_26B53622 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

Continuing the work of Commit #8ab1b51 /
https://lore.kernel.org/linux-mtd/20240923065649.11966-1-shenlichuan@vivo.com/

Signed-off-by: Terence Eden <terence.eden@shkspr.mobi>
---
 drivers/mtd/nand/raw/r852.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index b07c2f8b4035..136589f9a0e9 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -242,13 +242,12 @@ static void r852_write_buf(struct nand_chip
*chip, const uint8_t *buf, int len)
                return;
        }

-       /* write DWORD chinks - faster */
+       /* write DWORD chunks - faster */
        while (len >= 4) {
                reg = buf[0] | buf[1] << 8 | buf[2] << 16 | buf[3] << 24;
                r852_write_reg_dword(dev, R852_DATALINE, reg);
                buf += 4;
                len -= 4;
-
        }

        /* write rest */
-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
