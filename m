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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5085C432BE
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Aug 2021 08:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A577A60EBA
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Aug 2021 08:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A577A60EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQIXca3lKjOLBQVDtS4dK/KSnZBE6jkVBYa1HgqakF4=; b=EfsuY2yoaxHmTf
	8aRDWSR+c+CG0skMJ9LikYfWEhme50f44c5fz87I1KVblN0RgR/feQ4AwzTU00nC5Bjhbr2jkjkai
	rQuOySxjZ+8iQXifD9BIAaSBVgcRfGgFY32IYdk6VkropMsGW7leYpn5CSSkInjLB57PGGqiL3qJt
	EJp1MaOi+1f2SS2x7gCtnLq8984kXwFzQsLZBem695cN3scIkTEXPYURY5lqMGOWcONco5wH5Don3
	Gwf47MpIIpFmWv92FBNPHZu8iQlyXS9bg1uWSZh0Drw3twum3lsqFbH0m0JrMvtY4HhoBJvlhnWOB
	LM0hQxSI0ugvvVsl0hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJX69-00BwJC-4b; Fri, 27 Aug 2021 08:20:25 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJX61-00BwIS-Bo
 for linux-mtd@lists.infradead.org; Fri, 27 Aug 2021 08:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1630052410; bh=kdNq+R0obFyajvXfDeR1/0ekUJBQiMIOA0osmlI5U4I=;
 h=From:To:Cc:Subject:Date;
 b=LFx+jjX412W/ZL+yo5xK8la7On+UQfFEeVb++AoMC+lGjvWi9BKrhaFE6FcwxrVyL
 cfgYtqHsQpj+Eu/D/1OpgRc50EiTdC5vlFrtb5uMALVzCPVIEWFzqswr0aF8g9Am6V
 X98llg3imJ4lGehbXBTtN/sDZD8Trzft+dWkno6c=
Received: from localhost.localdomain ([117.175.158.30])
 by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
 id 4F8A9E09; Fri, 27 Aug 2021 16:19:56 +0800
X-QQ-mid: xmsmtpt1630052396t7ksnw40q
Message-ID: <tencent_7373924517657177ADA0AF7E2936B2136208@qq.com>
X-QQ-XMAILINFO: MgQY1K25Ph0mmrqVCpPxECSyvhN+a6PG5Ybjp9a5Jvqbf0t6DVvxp2h7hvNV/P
 7v4+kgJumlqlVNjXRCayHo3NCT2eC5WOqsHf6J1C7PAaipExMks92WqRnSrJ2ziWyMcGPoU9JfEO
 dhkKPGxVpUraJRNR/90X24XBSmGdxHwUMrt2AoCmXjgckWcfp5jbPwgmfHmh7Zc6qeXHaTKpzOKz
 NnspMtvt2cG9Y6zvRWuSJLK+Vy/aMH8EyhCE0sF9f5e3PmxGd2mbQAsadogok31aLACnp+cWf1Yt
 CxO69zK0Z3+U1vdUlWOTZcaCeksXStFG5LoDRegQiWS9oIDkERgZXOK+BPgQTmtlIc01efwmJECH
 hCTD6SVGxCnj7vPokXvktMxvjtONIzQNg/oVpcRIOs15Olr2XJ6OWr2ZRNZTVTyTfdwkfXfcod8C
 FJPf0VNjv8q7WSxnKcAjoq82NpBH7MBS40GmA8Y9f5AJ8+MYWnUnVirDx35urXgaW4ZIyHV1YREv
 ydhgzIlxXxJdc5UwQXDLwS6b2HmczisDHVEqEvo5RioE9RWaTpuLcFcFyLk3AIJbZK3dE9hsU8DA
 n0IBobFe6Z1o944sVngoh1FmRWCta+C1Re9NO0eZjXNsWUWSTMNeGWgt+QVmctyTdqdbBr6NZmjx
 R9mUUAXhmmF3ECumf2SevddyYEJpvlxrC+xVW7S6nejQnT2x/dIyjgkcqAr9IdRhZiJx2My41Os7
 4+7dLcagv5XlUajiAq0WS0MmB7Whf3Zi+D/TfnEHmacDDCpyfzL5yZPVJLyvhjR0TM1cegC0OCbN
 44bITjGL8uKj5dyjlZzptl7XHaiRoclg4=
From: Chun-Ma <1181020707@qq.com>
To: michael@walle.cc, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chun-Ma <1181020707@qq.com>
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx66l2g45g
Date: Fri, 27 Aug 2021 04:19:53 -0400
X-OQ-MSGID: <20210827081953.17920-1-1181020707@qq.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_012017_926903_79B48246 
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
