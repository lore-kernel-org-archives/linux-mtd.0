Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F60FC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:25:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C538D65016
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C538D65016
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KlNuanNw/BVn3vILuGTtR2z+NDemisJOhkhawOTdugM=; b=RaYVmH8l3vGzCsNkswopuQZUno
	jj8925D35d4bZQ6r9+RaMVN3mPCTVPEeMiIp3JVtTzUm4V4r4wcAbA+a8RonVIA8p6ve5W4hE9HDs
	mP2261gQLCgjWYyrBOm5w2wIy1MRe4EP2HubGDS/2NBQ5M+a/Oeje/2TDHGh3FR25yIO00azzWsJ6
	yW9GcUYFvPviU/O63zkIA3OYP27iP2Ukx47zVsEl2+Z7RW3WZSi8Cbx9r6mE5nayw35gC4iGeB2SK
	5uqSVUiVZ6s8PmPym9SBjcbOGrGByJHE+UiHlN7446GbrR7AQOGbT1l4Td68ZW/+MHXxdmFXK7InQ
	43jvcZxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5kj-00DyeW-LP; Fri, 05 Mar 2021 08:24:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5ke-00DydM-Cg
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 08:24:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3099E65017;
 Fri,  5 Mar 2021 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614932639;
 bh=5dWhuUO/oHpV2V7fo9QOdb69sHzl2L5kSFQKxqFnL80=;
 h=Date:From:To:Cc:Subject:From;
 b=VqlbfHag5aW6BbFYB9RTCZs0dAhUAafKuWXqSI4KMph4sX5i63ZkTaigItdgXCoPX
 J97beKjQpQ1XMQze9mn0j5B2z74LWrAs81P1qQYwcZeErq2zO+bm16iRNLXNW9biO8
 uc7i4uGT0hugxan5BHs4gQzNW33wLXO/z2HsfSFa5bqPmZOkWBZFN44CxqkRi1mf81
 JFyX3YCqPcr3wNESLLQeV/SxaGRFelO5dQuTG28xNzFZbb70fGLF6VX+nlobI02BJ6
 xjfbfeaukzTaZf2Acs7vZVaMkOJ9T3V+PZ/Ts2Z/B5LfYf0fENzlZ4guLnyFrqebl7
 Kx3U9U7FRkEXA==
Date: Fri, 5 Mar 2021 02:23:56 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH RESEND][next] mtd: onenand: Fix fall-through warnings for Clang
Message-ID: <20210305082356.GA137489@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_082402_079757_3E3CB667 
X-CRM114-Status: UNSURE (   8.56  )
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/nand/onenand/onenand_samsung.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index 87b28e397d67..b64895573515 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -396,6 +396,7 @@ static int s3c_onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
 	case ONENAND_CMD_READOOB:
 	case ONENAND_CMD_BUFFERRAM:
 		ONENAND_SET_NEXT_BUFFERRAM(this);
+		break;
 	default:
 		break;
 	}
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
