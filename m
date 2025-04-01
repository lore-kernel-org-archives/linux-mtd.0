Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E73C36010
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Apr 2025 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VOhLgOToV5fl4uLCWmWgVfSFpSXW7RUIjNXLq8RTltw=; b=xn8C2H/1c7sPHs
	XWDlTDLetza7d0zxWWD0gNa2CZbE8z72oz4ePyS6I90oCEHVyFId3q9jJSHATfzK/RGEbbMOwUMmw
	3KjpMEbsAOUgIRyAKj7iteumtsgRuC4A1CwJryhEHaVY6251rpx0Y+CCNWn1tXRAbuRC4bln/DI5h
	bPTtl8BWoIR4bY6YpkXKwHHvWobA3ZJhd28aXOot4Bz1erzjBm3IukX/AS++oELya0TJy3ylUjPh4
	lmKysgAmdcK+T8eoyvIVb5v/ev1Qj0tZ2JrFEKeKoz905Qu/meHcBQb80zgppxMbIoMt1JF8a2kDA
	iV2+Y/DRlARdf9uVEUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbnO-00000003Sh7-3Vjw;
	Tue, 01 Apr 2025 13:36:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbnL-00000003Sfl-1RFR
	for linux-mtd@lists.infradead.org;
	Tue, 01 Apr 2025 13:36:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7ADF442E0;
	Tue,  1 Apr 2025 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743514605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G2Qh5l+gyOSzaVUsPnabujSE4kp0M+Vr17QUqK8IMGo=;
	b=hnz0mJo/FtIuiTNZ17CpcKyWM2FhblLFMK+45rDewbz8BbFWIwv8s1qZ+3EPC0scP/O5hn
	QS84C8zf56ouOgI4zlSLDcw7WxHMPntOkmrqBaHJkomASPBwWlCfTO+og0I5fH3bQn0yNz
	eOQ+mx204PtGiZy8L8y3rXIVaw9yQAUiOca/dpCN42P+KVYSkQ1Jkz96vs056aGj7xL5m5
	T+EllEztzlrwhY4NREW3J85uWfEs0ZzFCWOyTm05gYfVviCg0p2AmM4fUsh9/gnQa0waqZ
	B7THuwJgijtQQlWJZYJLZXihmgGQoEsb9c8iG2FxZzO76ecPXOKVLZ76S9f4eQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Jean Delvare <jdelvare@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: spinand: Fix build with gcc < 7.5
Date: Tue,  1 Apr 2025 15:36:37 +0200
Message-ID: <20250401133637.219618-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueeileelteeggffhfeevhfeihfeffedvtddvgfelvdejleejveelueeggeevleehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledvrddukeegrdduuddtrdduleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleefpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghls
 eifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_063647_746771_233E19D3 
X-CRM114-Status: GOOD (  11.69  )
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

__VA_OPT__ is a macro that is useful when some arguments can be present
or not to entirely skip some part of a definition. Unfortunately, it
is a too recent addition that some of the still supported old GCC
versions do not know about, and is anyway not part of C11 that is the
version used in the kernel.

Find a trick to remove this macro, typically '__VA_ARGS__ + 0' is a
workaround used in netlink.h which works very well here, as we either
expect:
- 0
- A positive value
- No value, which means the field should be 0.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503181330.YcDXGy7F-lkp@intel.com/
Fixes: 7ce0d16d5802 ("mtd: spinand: Add an optional frequency to read from cache macros")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 83301ef11aa9..0bb06aeffa62 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -67,7 +67,7 @@
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
-		   __VA_OPT__(SPI_MEM_OP_MAX_FREQ(__VA_ARGS__)))
+		   SPI_MEM_OP_MAX_FREQ(__VA_ARGS__ + 0))
 
 #define SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
