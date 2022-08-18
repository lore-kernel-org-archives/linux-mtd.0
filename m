Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A57C00140
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Aug 2022 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NVPl6o9oI2WYTLIk/L2EtTcPiWL0YwSAuH5MK3M7lNQ=; b=CCvTb7/g6HftmY
	qfCMSzqxMpfjpC79Jo9xMwW6E9Ri/2zvDVpZqbHn1MsVlO28vV1EhapLnSZA1nyKF8qWAkGiMneR4
	IC8IVNFBarrLFCXD+t4T5tzEeYlUsnqGLxt7PEcZCB7+MohE5lhavEl7LpSD0d8JQeyDjgFl/Fjdb
	/w1VoiovW6C7871hTWTGZEPvCh8O9J9W8Ng1lF6DHdzdrWjByNOi9R9IysBvup8/dNeEQY/xK5K5J
	YVbvCXl1U2+E9jHl4MX0SXewgF38Skl0W1HOKPq9eOO4bcHXveGZgdZp/JruQZM79RCHEBwu2TwkN
	rnUAllUQVZMZOrSgEf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObws-001ipD-7d; Thu, 18 Aug 2022 09:36:22 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObwp-001ijK-65
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2022 09:36:20 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 0028222175;
	Thu, 18 Aug 2022 11:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660815364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TZv97iU+nE4J9iD72giS1GK/LNb6udxf9nNJFxCneq0=;
	b=E/ihAXPcfr1NT+ZVIvrl1HBebWiYuQKQbhgi+ETP6O163INj6RzdgQxAvBXc61uJqaw2IO
	w7R7fMFYQl16eynGk12aghYW2+6QqQWI5xzqY1IYr3Mk7qhFEG5GvcZrN88YZpruHvZC07
	4QXBhFQcbGGe//qC2K1+xeKaIke2B2M=
From: Michael Walle <michael@walle.cc>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org,
	Sergei Antonov <saproj@gmail.com>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd-utils: flash_otp_dump make offset optional
Date: Thu, 18 Aug 2022 11:35:48 +0200
Message-Id: <20220818093548.1932952-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_023619_464440_6343B730 
X-CRM114-Status: UNSURE (   9.50  )
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

Commit 0a5e2fa5c1e4 ("mtd-utils: add optional offset parameter to
flash_otp_dump") introduced an offset parameter. This should have
been optional, but there was a typo. Fix it.

Reported-by: Sergei Antonov <saproj@gmail.com>
Fixes: 0a5e2fa5c1e4 ("mtd-utils: add optional offset parameter to flash_otp_dump")
Signed-off-by: Michael Walle <michael@walle.cc>
---
 misc-utils/flash_otp_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc-utils/flash_otp_dump.c b/misc-utils/flash_otp_dump.c
index f1e1782..324d856 100644
--- a/misc-utils/flash_otp_dump.c
+++ b/misc-utils/flash_otp_dump.c
@@ -20,7 +20,7 @@ int main(int argc,char *argv[])
 	int offset = 0;
 	unsigned char buf[16];
 
-	if (argc <= 3 || (strcmp(argv[1], "-f") && strcmp(argv[1], "-u"))) {
+	if (argc < 3 || (strcmp(argv[1], "-f") && strcmp(argv[1], "-u"))) {
 		fprintf(stderr,"Usage: %s [ -f | -u ] <device> [<offset>]\n", PROGRAM_NAME);
 		return EINVAL;
 	}
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
