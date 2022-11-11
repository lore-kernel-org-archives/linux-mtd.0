Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17ABC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Nov 2022 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HSLkDPFY7XszqccfvyWYzchO6A/Op/I60N7AyeWDyA4=; b=4AQZe7SOQpQB/V
	oKi5OLIIRdgGueiw06+eAjmPFACKoRC0BdFHIwRIkoPUp4WlUvB2622EY6daPx9QRJRLDNhoG4tUo
	cexomI5F3oaMxuQMazHV+4hkDnZ8BlhLP9LWUMIFn93ZAqBUMh1iQ39iS6XpCdzk9QEZHgKl8NAR6
	1h44U15cB0o8LJoNfaVbwQ8Yft7RP7ac3wYqaF7HHKyPKFAq9fMamrPqxfFceDs93QhbVUT0tQVJP
	VORZ82TjwW8QhIbC9gu9W8NG28x9K5Jqz3ad9cSNSrwGBr9PHP0KcJpTpantlHcUTr4syrs3QF5HL
	dKujNydI/ovPa0jw9ntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otX4x-00GwgU-7A; Fri, 11 Nov 2022 16:40:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otX4u-00GwfE-55
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2022 16:40:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D408F62021;
	Fri, 11 Nov 2022 16:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D15BC433D6;
	Fri, 11 Nov 2022 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668184826;
	bh=T+/dE65GaUmXRopapuVAGdXHeGWYexFvnU1S9HJYdgU=;
	h=From:To:Cc:Subject:Date:From;
	b=q5VD19RBLIE0Dl4VZ5MJt/arDRok1DPp/7l+obdroYnEh96Zd4QzWuixEvDWq1CtU
	 ipPwopyOGquhC/3iDqCmypNa06VNC3bkovZRI9s5+UxyM9x5hPEL2nJZcN8qnwtRR5
	 gFp84Ng2Z0tQaXFAWxmgtqb7WEiR1oS9q0JaNgo/OoSBdIaxrJpJDS+X7STnbV8hwI
	 6SHk3uiH6qV4eC9l7k5mwOkJUKNTVsf1MCaE8rsvwOWJWdTOnBeloBiH5UyNKEZ9rz
	 grtfmAmsumg2bG72G8uaABzDigHL3EhKMoVGh4AjlMn9AtGT9ZPTMXhQyT1qpDJPZD
	 op70qqFjhZieA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Cc: dinguyen@kernel.org,
	tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-kernel@vger.kernel.org,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Subject: [PATCHv2] mtd: spi-nor: macronix: Add support for mx66u1g45g
Date: Fri, 11 Nov 2022 10:40:14 -0600
Message-Id: <20221111164015.165581-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_084028_248256_D0CE2047 
X-CRM114-Status: GOOD (  10.97  )
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

The MX66U1G45G is the smaller sibling (128MB) of the MX66U2G45G (256MB)
that is already supported.

Tested on Intel N5X socdk board,
  - random data write, erase, read   - verified erase operations
  - random data write, read and compare  - verified write/read operations

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: fixed compile error by removing , after PARSE_SFDP
---
 drivers/mtd/spi-nor/macronix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..07ace9da74b7 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -97,6 +97,10 @@ static const struct flash_info macronix_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
+		PARSE_SFDP
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
