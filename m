Return-Path: <SRS0=hLSA=NS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363E3C432BE
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Aug 2021 08:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E9E60F91
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Aug 2021 08:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1E9E60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQIXca3lKjOLBQVDtS4dK/KSnZBE6jkVBYa1HgqakF4=; b=AzkBB3ph3VfMYg
	0J2xrMXDrke7/jvb3699hk47o67wmNd3GfUGLktbkWFgl3w9/tPfRMXgGrXLuOFj9tnJh7cZuwHqb
	FtHVyS3IVLRtZUeyJNmefDJDcjIl9j2pKLHuF9uKGA0dOuCFCW5sm2aaslhxbmRSHOOCvaZ7UmEvH
	YcwpHLj0+5aEVtsbBG78XoPuNgOqTGbkRYyiYZbDpY9YIfuqnfYBNj0HGah5QimF/ab8gVcN2Ands
	IgKHZN1GEtrgM0qYGlbZedL5JOS5SCwYVlTVi6JNbRTCthYxdcKBDUEQg7U8ZiPtZZziPHso4XXoP
	KTpPasL5YerDFmVqdIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJXAl-00Bwsv-6W; Fri, 27 Aug 2021 08:25:11 +0000
Received: from out203-205-251-80.mail.qq.com ([203.205.251.80])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJXAf-00Bwrq-Si
 for linux-mtd@lists.infradead.org; Fri, 27 Aug 2021 08:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1630052702; bh=kdNq+R0obFyajvXfDeR1/0ekUJBQiMIOA0osmlI5U4I=;
 h=From:To:Cc:Subject:Date;
 b=L+F3U04iJnvFkmiaqHSjgLVCq0i1YRdfnIHJXKRVs1g0LKevq310TEdJ4HAMXN+dx
 oIqyNuIU8+gUT2gbB4ySUQxusTZMeqlsPKapqV4jFU8cmEXE5bid8xJ3BJv4Kx2JU7
 QayW6X6EbxyC9az1HNI3wvb0hGStIARwKOi8UmvA=
Received: from localhost.localdomain ([117.175.158.30])
 by newxmesmtplogicsvrszc7.qq.com (NewEsmtp) with SMTP
 id 60D30078; Fri, 27 Aug 2021 16:24:13 +0800
X-QQ-mid: xmsmtpt1630052653tsb8aprc4
Message-ID: <tencent_B6A2364EAF95E375350548965F4C4FD2EA05@qq.com>
X-QQ-XMAILINFO: OEaI/iTChbugbEf/fqvIHNH0U8FALj5fsEMb5jTMhH8wnwOF3ZXgm06bnnk1l2
 ZHTxdKp+WrnvyMnGn7i0Frx4d1vxCnDbP99UN8WPWsz+U6TEftUPa9IKR5am08BWw96EfAPSKin7
 h3alYJHvtSYxeilEE5MbpLcYYtfMMaeQTMRjyt3yQDjkUR1pwag7iOFVbk+lD3aS4TnGBJbrgeHj
 r2aSkEbwRYNREEnjf++Wg9p4obiNmjxRP4M/L6Hj4QFIIopasbbeQa9TpwNo9ls355PoxAsGWRv+
 tnjalmzLF874lKkqswwi90n6IR4+QgJCeEZHe3amQfzuxe2D0G5BBrOGsk+LS5lST85Ntm1nHn6L
 DPJFUYotS8ZcQi8UOw98zuXgfDj7BPD8XQ1LaD1RKYm/nHOINeCH+Jtbu0jGhyCGp1k0IH508nmM
 g8b368yzjxB++l1ofkYmx4glRvxDEAPWhRIbxsinFIFbQPndUYblyvELLzIVjixLIvUFGZsrvSlR
 TxxbOE8DDX7tyCS6mMQUvhiJ6noneUXZsfhGuNpcGjg6hnxMzTLnHpCANXRGlRfkKkJe7/15O3MQ
 ksaQchvnAwysu/z8XWIclFLuYcca24XkoO/oDg0UKzUNIgHDPoEZcoqJC/FedjjDY9K1vJiuzvcW
 BL2sX4EoDHM/vm4DykpBufigEg7szwbTZmidzOpOYYJoVbazPjouScW/Tjsv8qoWzWhi4inVfN1B
 Ol9q1R0vz4iwafD9DcLgD9OfM8R7i/uz2+d+k/uxNpNYz1d2wB5ptRxcH6DnEPCqGlX8Ye2pV5O2
 H4oqkf3ox8tiwrMVVyGCoKN84ssGGtf0DtXeDmWRBoYiPdg+bsqb7ZG5ZzG1lj2gFN/a4/CTr/LT
 RoNwhl31NNhZCMiWXFWWEFR3UVmpulHA==
From: Chun-Ma <1181020707@qq.com>
To: michael@walle.cc, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chun-Ma <1181020707@qq.com>
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx66l2g45g
Date: Fri, 27 Aug 2021 04:24:11 -0400
X-OQ-MSGID: <20210827082411.17986-1-1181020707@qq.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_012506_271972_E9C88539 
X-CRM114-Status: UNSURE (   9.06  )
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

The Macronix mx66l2g45g is a 1.8V, 2Gbit (256MB) device that
supports x1, x2, or x4 operation.

Tested on zynqmp SoC hardware with a cadence quadspi controller
  - random data write, erase, read   - verified erase operations
  - random data write, read/compare  - verified write/read operations

Signed-off-by: Chun-Ma <1181020707@qq.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..4e72418fcdee 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -87,6 +87,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66l2g45g",  INFO(0xc2201c, 0, 64 * 1024, 4096,
+			      SECT_4K | SPI_NOR_DUAL_READ |
+				  SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
