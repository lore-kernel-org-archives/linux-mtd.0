Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF50CDB470
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2026 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF0Kx35z3i99p9zdfCrK401wvkH0wAuJNtxXNKNGokY=; b=CEqt4L5P3L05BT
	3txgFepZz22ztFcOiRvp/z14PG2hj1TpXHgVXK5FWrpUYNz53GctEt2Lpt0/YX4sHp1Mq/P1Zm4jo
	MmfuRlHVSHT0ifhC6ZTbi7EgUmE7po3OSYVIZjbLYT8jbhpdNSAwznf8eGi4aCwU+SOWqxSVTl6h2
	0vQyHXqEUni5ykn2h3OeBaluygak1E2RcR+LnV0kVsM8vYKsEAodVGPcg6+0qhI3XKtu+KsH0k2Wg
	hVskzCezSi+4Eo31wrMVuWDZ4Lj+euE8jZPva6rJW0YibHtHDS4+JLCbAg2iBxrx6hzIlUrQ1lFSa
	+3Tg8tMq9fa7lWd5DDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHvo-00000007Iln-3WJa;
	Wed, 24 Jun 2026 07:21:56 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHvj-00000007IhS-3TZK
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jun 2026 07:21:53 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 370922C0728;
	Wed, 24 Jun 2026 19:21:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782285710;
	bh=Kiy1gSb9XrxwzNm9y+T6r5psTGT9d0KPP6ZTuYi6s2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oN9CCE925IwaEZMqfA0+G4YWfDE8FTNMzGEvyRlIbwk8D0jxQt0nfjntzqcdKadRd
	 pIKtFYPreRDLWFrTgAdmPNDWj2wYbb/yP6LOg/zPPku4lUPpZ+wGBvAZuT3Um5Z9W/
	 48wYrpwbFai0E2kgBhydU1iO/w8JtP779Q5sQfnXp+Gy5c1Wt2ZMmpkNe//Rw6XQrr
	 zHDewL9berBE8hQ/bAhHon6JAgEEshFinRZ89jzGAm36OYbeFUc0PovrakbNcLP3mo
	 4MSNaHBz5ao5AW4clwk5Rq2vZk0SLkoFO0HmriIPly8rS2TkMp+ZpFkJNtVRdswFyk
	 a3O15Mb51dQNQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a3b858e0000>; Wed, 24 Jun 2026 19:21:50 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id 14A3B13EDE9;
	Wed, 24 Jun 2026 19:21:50 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id 11A844E10ED; Wed, 24 Jun 2026 19:21:50 +1200 (NZST)
From: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	takahiro.kuwano@infineon.com
Cc: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH 3/3] mtd: spi-nor: fujitsu: Add support for MB85RS4MTY chip
Date: Wed, 24 Jun 2026 19:21:07 +1200
Message-ID: <20260624072104.1123580-6-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624072104.1123580-2-ronan.dalton@alliedtelesis.co.nz>
References: <20260624072104.1123580-2-ronan.dalton@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a3b858e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=FelO9ux0wxsA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=bUQKSiCPAAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=ifWAZ-2JUGfw6fYFB0cA:9 a=3ZKOabzyN94A:10 a=1CNFftbPRP8L7MoqJWF3:22 a=-fHZXUhsFbuwFN3fwQAr:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_002152_034828_155F024E 
X-CRM114-Status: GOOD (  13.91  )
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

The MB85RS4MTY chip is similar to the MB85RS1MT chip, but it has a
higher capacity and can handle higher temperatures. Compared to the
MB85RS1MT chip, this chip has an expanded set of opcodes which allow
control over power-saving modes, access to a special sector data area,
and reading of the unique ID and serial number. However, since the
spi-nor subsystem doesn't support these extended abilities, they are not
taken advantage of here.

Add support for this chip by adding an entry to the fujitsu_nor_parts
table.

Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---

This flash is populated on the Allied Telesis x950GEN2 board and was
tested at 40 MHz using the armada-380 (CN9130) SPI controller.

mb85rs4mty
047f49
fujitsu
xxd: /sys/bus/spi/devices/spi1.2/spi-nor/sfdp: No such file or directory

Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
name            mb85rs4mty
id              04 7f 49 0b ff ff
size            512 KiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR

opcodes
 read           0x03
  dummy cycles  0
 erase          0xd8
 program        0x02
 8D extension   none

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 d8 (512 KiB) [0]
 c7 (512 KiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-0007ffff |     [0   ] | no

512+0 records in
512+0 records out
524288 bytes (512.0KB) copied, 0.723481 seconds, 707.7KB/s
MEMERASE: Unknown error 524
Copied 524288 bytes from address 0x00000000 in flash to spi_read
0000000 da13 14ec beac 3864 78cb a48b 29a7 1edc
0000010 446e 772a f20a bcd1 9edb 8b40 bcf5 544c
0000020 3152 63a1 3081 bcb6 852f 06da f19a 284d
0000030 1655 4d58 62d7 bd42 90fb 7921 0be8 3ee7
0000040 3e78 c995 ba19 4f10 09bc b67c d7da aff7
0000050 e6f9 0691 a5a8 a40e 9a5d bfef 652e ba36
0000060 60f6 3ecf dfdb 32cb b4b8 b7b4 a0f8 d307
0000070 19d7 456b 1f35 296c 7e85 7fbc d1ff b1cf
0000080 28f9 06dd 55df 1f7a 1309 50f3 e30b 14c2
0000090 3638 6c9b dee0 3101 9b11 e03c 9a01 c0bd
722489d44edaccfda786c82c63037ae90733998e02d81e985db54588b229ee83 *spi_read
Copied 524288 bytes from spi_test to address 0x00000000 in flash
Copied 524288 bytes from address 0x00000000 in flash to spi_read
343037c927f0dcdf1ae42d51730d316103aca620e701ab9762440d403c057312 *spi_read
343037c927f0dcdf1ae42d51730d316103aca620e701ab9762440d403c057312 *spi_test
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_RAM
mtd.size = 524288 (512K)
mtd.erasesize = 524288 (512K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

 drivers/mtd/spi-nor/fujitsu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
index 3777c80251c5..32d5404b7402 100644
--- a/drivers/mtd/spi-nor/fujitsu.c
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -15,6 +15,12 @@ static const struct flash_info fujitsu_nor_parts[] = {
 		.size = SZ_128K,
 		.sector_size = SZ_128K,
 		.flags = SPI_NOR_NO_ERASE,
+	}, {
+		.id = SNOR_ID(0x04, 0x7f, 0x49),
+		.name = "mb85rs4mty",
+		.size = SZ_512K,
+		.sector_size = SZ_512K,
+		.flags = SPI_NOR_NO_ERASE
 	}
 };
 
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
