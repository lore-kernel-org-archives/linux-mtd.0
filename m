Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61968C433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:29:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3CB64D74
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3CB64D74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aKXO8l4HtbjpxNdMXywJcg1wVJdiBQ+VXe3xKqkUE10=; b=Isu/K5OR+HImcs/FAH7unPze5P
	BSPO4fTJ3Ih8MIF1S2wNv3jVtShl0C5PnaWsQx+PRXt8E1NH7M6o+f3TBf0yTkodztrW0mPIqL7en
	ciAZIDLf/AtSOMkB7U64YkZBMySmw3zR51+5LpANrL9XG4sUnFEODwzr2hfT3PE7+KpvEgBer/BLL
	fa1h1jzxcXiZBAIliysVETWhPkTHAloxfkqRH6Jcpou+w30RelVZNOuIM2etC3lS6VQNwMZ3OHpyq
	r8NwJqP5P1gnII7nP3n66u8SYs4VNbzXw8bnyXxJSHY8vGwVXxuoADADBlI6FTQEMIke22tfnPJSB
	wBlP+W7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5pB-00E02b-3B; Fri, 05 Mar 2021 08:28:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5p6-00E00v-Jg
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 08:28:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61E3D64DCE;
 Fri,  5 Mar 2021 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614932915;
 bh=d2yIkPOp3EpBCDhbDKuigF1lskG1wpuFHvgwfi1+Olk=;
 h=Date:From:To:Cc:Subject:From;
 b=MJ4gEx3OpgHoWnjpm+LLhkQoztvJ4dNQ0FIl4X4IP3p0MxWny0fC52tSsXdF+vzS7
 666gt3UNL3qt1sB5lzwGeAkpZiuC9RLgigYfT26qmUS8yAACbR0hqvzIzg2Ja6vbO/
 HPrKpXSm8Txwg1eqhk1lbg5hrJpSeICFP89uaa7mAZQ9wb/dDxjaqbxKjT3ENzLBXh
 5bCxqO8eodYmLA+K3f97Mtt8BxImUj8bdRZnk2KFAy6tdRfGm5v7f52FRrXxANl9KQ
 HyPu8VDqzKmV8fLgbvcVYS92dIds9KVhTsqer55Rrb9Mk8bSlY3TXsYDTUmn1X0cTe
 aiawgkA+UICnw==
Date: Fri, 5 Mar 2021 02:28:32 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3][next] ubi: Fix fall-through warnings for Clang
Message-ID: <20210305082832.GA137724@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_082837_368389_284C461C 
X-CRM114-Status: UNSURE (   8.06  )
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
Changes in v3:
 Update the changelog text according to the actual code change.

Changes in v2:
 Make use of a break statement instead of fallthrough, for consistency.
 Link: https://lore.kernel.org/lkml/20201123093347.719a77cf@xps13/

 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index f399edc82191..a7e3eb9befb6 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1350,6 +1350,7 @@ static int bytes_str_to_int(const char *str)
 		fallthrough;
 	case 'K':
 		result *= 1024;
+		break;
 	case '\0':
 		break;
 	default:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
