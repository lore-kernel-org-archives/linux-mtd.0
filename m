Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F7DC28B25
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S1uSTam5mDBW8xKQ9prC9POoXMjaz1lx/yzgvhgJs9A=; b=J026nMAThEvOME
	oCz1BJicfzUh89JEXEHZryFPmJdhFzRMgOSayOzBgtkcIT3AzLmJZ7KRFAwPxa9sIvIhq8DkSX1Vl
	v3zckK1NcK6FF/LmbAk+T5BFjHChkE+OFzHorpUZSNYzCDusBdFCPJMQUvFBjfJxqpf0FDVCarvXr
	6N8OICO5lwNXRWIDdmqbXC2SckXBfWvbU3mf3mwPGL8Df8R4MB8xyYekm1StIG8GwE1CIAOCNI6pT
	CE5Fy8DBvZ4DY6hMrR8yrtkXLltlHppnNHr4f+z6qxx6SSZzxl7MJb43HJs7z1tgC7gb4VsE1jfwJ
	Hkml6mEYZxehdlZqLZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZKh-0000000EYhI-1FKb;
	Fri, 07 Mar 2025 15:09:51 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZJS-0000000EYIj-1nAL
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:08:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F285442CC;
	Fri,  7 Mar 2025 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741360111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VGmtI+SKLrf/sudcADm+6/sRFbbFUHl7sOsN7wcaehM=;
	b=omhhvBeK+J5BBV6p5GqmAgiucIVoWh3s1rCE9eAdzS0LDSUxc9N24Z04oVBXXGhNwtB3Rw
	W1mClHMYI3bXg96wSidvA3FG6U/PEauc/LXaOdhmnygCvMdCsJ2Oco5UQGBFjmv9Mm9pTA
	Qoxu6TSfHA4j171s1mqG326S/pdiU4R0mq11xi2hkXGgixLzFHZBrAvvtMZNO8OxoylcKA
	B6UQW+lqRHTZjWKbiPjHV+xf9OFQqqwyGoqVJUR62IIyxEqwQ4LdE6d+dKBSH3/72UuIy2
	T4KLc65cDEB4+3uJKYvgoHQRZkluRifWPmQhvzkqQVhhVTGlPk5pez5PmimxJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/21] mtd: spinand: Add octal support
Date: Fri, 07 Mar 2025 16:08:19 +0100
Message-Id: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOMLy2cC/x3MTQqAIBBA4avIrBtQKYOuEi38mWogNDQqiO6et
 PwW7z1QKDMVGMQDmU4unGKFagT41caFkEM1aKk7qVWLF0eXYkCDFdkrTP6wG5q5D844klq2UOM
 908z3Px6n9/0An1UM0mgAAAA=
X-Change-ID: 20250214-winbond-6-14-rc1-octal-6f7db6be0204
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfefveegtdfhvdehudfgkefgheetveefvdelheeuiedukefgfeejheefheevueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddtkedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrudejiedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_070834_619011_2FC2B7C2 
X-CRM114-Status: UNSURE (   8.89  )
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

spi-mem and SPI NOR already have octal support, but there are octal SPI
NAND chips as well, which will be supported after this series. For now
we focus on SDR modes or mixed modes, where the opcode indicates the
content of the operation.

Support for three Winbond chips is added: W35NxxJW (xx: 01, 02, 04).

The series is mostly split into two parts:

- Renaming the op macros to clearly indicate the number of lines and
  whether each subpart of the operation is SDR or DTR, in order to
  clarify them.

  This has been discussed and agreed upon with Tudor in a
  previous discussion:
  https://lore.kernel.org/linux-mtd/4ca13ef9-062f-4952-9588-c14f22867bf3@linaro.org/

- Progressive support for the various octal operations which can be
  supported.

---
Miquel Raynal (21):
      mtd: spinand: Use more specific naming for the reset op
      mtd: spinand: Use more specific naming for the write enable/disable op
      mtd: spinand: Use more specific naming for the read ID op
      mtd: spinand: Use more specific naming for the get/set feature ops
      mtd: spinand: Use more specific naming for the erase op
      mtd: spinand: Use more specific naming for the page read op
      mtd: spinand: Use more specific naming for the (single) read from cache ops
      mtd: spinand: Use more specific naming for the (dual output) read from cache ops
      mtd: spinand: Use more specific naming for the (dual IO) read from cache ops
      mtd: spinand: Use more specific naming for the (quad output) read from cache ops
      mtd: spinand: Use more specific naming for the (quad IO) read from cache ops
      mtd: spinand: Use more specific naming for the program execution op
      mtd: spinand: Use more specific naming for the (single) program load op
      mtd: spinand: Use more specific naming for the (quad) program load op
      mtd: spinand: winbond: Rename DTR variants
      mtd: spinand: winbond: Add support for W35N01JW in single mode
      mtd: spinand: Define octal read from cache operations
      mtd: spinand: winbond: Add octal read support
      mtd: spinand: Define octal load to cache operations
      mtd: spinand: winbond: Add octal program support
      mtd: spinand: winbond: Add support for W35N02JW and W35N02JW chips

 drivers/mtd/nand/spi/alliancememory.c |  20 +++---
 drivers/mtd/nand/spi/ato.c            |  14 ++--
 drivers/mtd/nand/spi/core.c           |  18 ++---
 drivers/mtd/nand/spi/esmt.c           |  16 ++---
 drivers/mtd/nand/spi/foresee.c        |  16 ++---
 drivers/mtd/nand/spi/gigadevice.c     |  60 ++++++++--------
 drivers/mtd/nand/spi/macronix.c       |  16 ++---
 drivers/mtd/nand/spi/micron.c         |  34 ++++-----
 drivers/mtd/nand/spi/paragon.c        |  20 +++---
 drivers/mtd/nand/spi/skyhigh.c        |  20 +++---
 drivers/mtd/nand/spi/toshiba.c        |  22 +++---
 drivers/mtd/nand/spi/winbond.c        | 128 +++++++++++++++++++++++++++-------
 drivers/mtd/nand/spi/xtx.c            |  20 +++---
 include/linux/mtd/spinand.h           | 121 ++++++++++++++++++++------------
 14 files changed, 318 insertions(+), 207 deletions(-)
---
base-commit: 342664f6de706e46a26bc906b6e4f4537ecc8a95
change-id: 20250214-winbond-6-14-rc1-octal-6f7db6be0204

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
