Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55BF606A8A5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TeXo12Uq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RaX7FggS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tZZCqAw6K8VEtht63htqsWWZfShabO1i8pPdcusOGT8=; b=TeXo12UqyFtfyyKu2XO3dGYMp6
	Z8S5VX0oQknkRSB0DUxzaXULvFc99csscJ+7oxfkBd5m+VHs5MBXwuKhia+UHkMR6D0oHlmsFS118
	8arwlOTpdBrbDaTfaWqEv6J0Dkn0MVJVQYi17GDu36MEtJ7J8M7lvF3wqZ68/JEN/PxR9xTTOeKyw
	6FbLsIeB3P+cIW4a6Um1W+BHG9kA7ml2iMbEdIQPec08g1N3rQjgY2sHQVCqjTnOI5Tb8HMVkXjoZ
	B65u9rtFZKiveidNpkcru6tN9MJvicaJNWXh4NYNPzNLmKZNXIpBAw1+rCPBFSqYdMuZv3j3EtH12
	tUE+Wxbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyhM-000000035Fs-0EQh;
	Mon, 16 Nov 2026 15:32:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyhH-000000035D2-3CJm
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 15:32:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2398974f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2026 07:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843161; x=1795447961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xyBkwKv4BrxAZVMZWySx0jWDoYepT9/2qGbvbAFTiM=;
        b=RaX7FggSKgrVmfepDr4IMLoFjMi9OSXe2knNF3Kf8N2XhDycooVwaPm7wBN4GMkB7z
         eRRziLqZSKmn4LAgQ75ioqg5DjE2PgG/In8wljOI8EsY4sQF5OSMDs1xj1rZ100nzFcv
         IERIOoM2ZdjXewIeZwhAg/aJD7uv55XiGTCpVwRQMfKEPnCzBlyRji8xhtOfGNw1eial
         ihqYQWZejM+0TeDzPrKZi8p5X3SnCHP1RFyY7FBp7BqyrPc1bvOYqUrI/S3Oh+hKnKG+
         Tcp6OQfaWqSUeEIjWs6gOGbHCFBQEuYUqU+BR+Bp0pw4bRDn7PfibwTGVg+D5KKlwtDu
         SQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843161; x=1795447961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xyBkwKv4BrxAZVMZWySx0jWDoYepT9/2qGbvbAFTiM=;
        b=oQvXPHsKh2LZZ1zIK/oTg8VFtpmYhgAUOpNmtILpPaqyza0pBRBDCtpghtZn5fokqA
         uNimKI8eeSj9wsrJwOZXiQLYLrVXP9TtCssXgeUmLN4q44XvXAldJWzV5RDFl6JMMuKg
         BfKGTnD9GcEcWnZ6infho2JIqoH2ioWuGUi/bS1h0J6n0GtCo3IYQpKw+YbB5yCyOKZc
         4TmaHPAmSB+o+d/5z2JtL2T2k2seCzBZ9fbbUqzQslbZC/xPw6ZqRVAsI5ylgnG+8h+S
         hWIWAkYMeSo2VQgQRhqWHV4wP7l6Nt71XkC3vrA7XPrs293w0ybCYK/t+h1yCgZLjHau
         3a9A==
X-Forwarded-Encrypted: i=1; AL+hErFwYpuMJdpip0Qz4KD7ubGoMKwMRnBaEJNXZ+fgDa+x4OD7cmnTqY0nOL3PBi3N44595HtEe7SYU6g=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Ul9Xcoezk2okJgV8W19Z+r2v3fG0ZC/SSlw1WrGx8S14MuP3A
	1R09//CqcfkAnFpcxfgzHg/WFYgZhYXoOpW4YI03MnKIS1KbHgap4iS9
X-Gm-Gg: AYBFou0//EvIe+HgGIJ0w+kftYfVNrN9ncXFtGKwWHYmC6Era/XEbaytaPg/XPaiCm2
	kIZAgRMUC81CcMAIfg6b1b2GRbnEPfcht/vV8cjYY2yUL1Ygx18tyNbkjVvnKyts1qLORuqLg/C
	2X02SOJ8H8NeQKT7+u1IFGF2P2SA2Qn7vdUsFCa79vzNBXKSGazs1miChYfgcUaMoOI6YfYebJW
	i21ljQYnlGSSSFUbr8SNjC9cCjqfBf30s8LXtn9qNuLH5scHF+RNbqL3HDqcVbqtiL6/i2bsNlA
	3zXMP7Z3tcI3TGJUoB3w8s4XZK6P4LbvESrJKxgQ3r8QdFW4I/sj0Gl78+dng/oADLP00apv2je
	85dVdNDTY43bfhe4bQi8lSUecqxx3g+a355mIEYPn5rz590UX9bib811G/iXjRugp7plPhZoG3j
	dGPHRXj/CJSmCxGXuRo/eEzqLs6AZLRcVCJ+UeFgnwxZYzw837u/S5fHzSTzP20m+VLHpm0+k1m
	XEI8QzNsTvIw7/2I27y72mkCdLK5IZIsgjJ9k2aZIOX0CG6M0DykSi6ZjR3kLUdhTNf8laQGXai
	jGHhzzw/vg3+YOnOQzrVHBBKhOs1Q+t53M+xJ9Ey/MCBj/gvCBOgZyQxARIVsDNNJAKdn0yc5w=
	=
X-Received: by 2002:a05:600c:190d:b0:4bb:69d8:3e92 with SMTP id 5b1f17b1804b1-4bb69d841bamr119311075e9.29.1794843160950;
        Mon, 16 Nov 2026 07:32:40 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm86798195e9.3.2026.11.16.07.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:32:40 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: [PATCH 0/2] mtd: spinand: add GD5F4GM7UExxG and XT26G04C
Date: Mon, 16 Nov 2026 16:28:45 +0100
Message-ID: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_073243_804565_E60C3B62 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds two 4Gbit 3.3V SPI NAND parts:

- GigaDevice GD5F4GM7UExxG
- XTX XT26G04C

Both have 4096 byte pages, 256 byte OOB and 8-bit on-die ECC. The
GigaDevice part reuses existing code. The XTX part needs a new ECC
status function.

Both parts are tested on STM32MP133 boards with UBI and UBIFS: full
device read, write and read back, and a system update.

The same entries are sent to U-Boot.

Angelo Compagnucci (2):
  mtd: spinand: gigadevice: add support for GD5F4GM7UExxG
  mtd: spinand: xtx: add support for XT26G04C

 drivers/mtd/nand/spi/gigadevice.c | 10 ++++++++++
 drivers/mtd/nand/spi/xtx.c        | 28 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)


base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
