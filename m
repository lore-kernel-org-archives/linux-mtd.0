Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E697C3601E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tBbbxXWPUUhDiwm4ImupCUbpE+owsCjGzUaNveRxXnI=; b=MLyv2LhOi4/i52
	ySXLBANUgebcQUuhPbvjUGBRtFrkpJhmnZRUvueLYBcj7a+jPivxgCsyqePyFfe+uZUl/pw14B8RK
	iDB/NU5x1PZaI0ksmTz6mmlKVic0Va2LMEFgjmw2HdfdpSZ/vnNuE3dM67GiwSU6YKpa52As5NZ8f
	KeuVXpehKtUcjTEdSNxppZMAM8KhqdlvNPREjzc1fdEr8J2B1oeeNJjdzDOg61oH8s4426FeRyE0v
	0MJwBLLGA0NeiZcqHq5rbJsSrdVU9qWY6EhqiOmyFfepCE9XfNHtFgneJ2qaVuX4qJktHgbMuuTWD
	OOz8ytg5ftiKqmgA/Fvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HWs-00000008UX7-1n9E;
	Thu, 03 Apr 2025 10:10:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GjK-00000008Ne7-1sIj
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 09:19:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFF364320C;
	Thu,  3 Apr 2025 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7V6qA/XzHVTroIuI74KJrCBJRdORiBQvGuNFthjMmGU=;
	b=I9qyCkidT4PpfUmPTyguFUulUTwjlKBkhiedEUJ3qT3gMlqtIIIrvyLmFuzvsNWXmPHQda
	dQ9QgAn5JRFHFnM7NI2iPB5ieOMmzJeBzIuYBW6aycVI/C5WfoSUEf/WfwNeGeInviauGd
	IKlQQ3LjFFQPaaXwEMdvrXKpwqCjX0PZsU9i2L83NAs1X/5pD9ZVnugSLIk4RDU77rNife
	GmR2vYFjn7p/svhbv8/2LGAkWlpVE/8gQVoNvOte4KiQ5wzMioJYsTqx1NoFH7hi2E/1mG
	LzDnOiBcOJ3TDBQG7rbS7dmPeQKfvPULV0PMRKY5fAQib4fD5tHf1qH78ONNnA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/19] mtd: spinand: Add octal support
Date: Thu, 03 Apr 2025 11:19:10 +0200
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI9S7mcC/3XNQQ7CIBCF4as0rB0DSEviynuYLgpM7SSVMUCqp
 undxbp2+b1k/llFxkSYxblZRcKFMnGs0IdG+GmINwQK1UJL3UqtDDwpOo4BOqhIXgH7MszQjTa
 4zqHU0oh6/Eg40msPX/vqiXLh9N7/LOq7/pInaf8lFwUSTOsVSmuGYM3FMZeZ4tHzXfTbtn0Ap
 63Frb4AAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfefveegtdfhvdehudfgkefgheetveefvdelheeuiedukefgfeejheefheevueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddutddrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelledphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehsqdhkieesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_021922_953486_0734355B 
X-CRM114-Status: GOOD (  10.63  )
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

- Adding support for the various octal operations which can be
  supported and using them in the Winbond driver.

---
Changes in v2:
- Collected tags.
- Squashed and re-organized the order of some patches following the
  discussion with Tudor.
- Link to v1: https://lore.kernel.org/r/20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com

---
Miquel Raynal (19):
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
      mtd: spinand: Define octal operations
      mtd: spinand: winbond: Rename DTR variants
      mtd: spinand: winbond: Add support for W35N01JW in single mode
      mtd: spinand: winbond: Add octal support
      mtd: spinand: winbond: Add support for W35N02JW and W35N04JW chips

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
base-commit: fec9f7d6629901decc7b4ecb6170913c02c2f213
change-id: 20250214-winbond-6-14-rc1-octal-6f7db6be0204

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
