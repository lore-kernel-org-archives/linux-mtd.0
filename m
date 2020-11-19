Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAFCC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:19:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7671522256
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ykK8Sbht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7671522256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bB5phSpK7F/Dlly+H5QzIcQRBwffn4nQKlPPbmkJeS4=; b=ykK8Sbht7VEUdkz1Z32uE5ePY
	nSaCS2KD9ccou8q3rK6xCl9MncAXH5TvporxTyqLxav4iVmBC+HPFK/2vB0UtRATQzlmiW5UG+pJP
	rANVRv0Im9p8MdFJwnWgpXRncEY43KWLa0cWVaKEPJFQ2cjbxz+KmAt6EyrKWoHH8+/gM19Ap/X9Y
	cEaVZ08m+mwoOjJDZfEf9R//9M8QlXVY5Ez5Nt7VnhJHxCA2vRsRCowIJ/HYDCJWjNS/w6aTZQDBJ
	LR+OCXq5KOzmkHygiomnqyGI3q/OvVrUIYaJmquNLNSBgzvwDANr5kIbdawP2OonYKhuwZhmhLTsp
	Vl6sE8Vyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfklt-0003O1-Al; Thu, 19 Nov 2020 14:18:49 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfklg-0003JP-UX
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 14:18:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id A2F1F181C8902;
 Thu, 19 Nov 2020 15:18:27 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9PdE9r_0My3r; Thu, 19 Nov 2020 15:18:27 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bbDK0ihAvCod; Thu, 19 Nov 2020 15:18:27 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 4/5] mtd: Add MTD_MUSE flag
Date: Thu, 19 Nov 2020 15:16:58 +0100
Message-Id: <20201119141659.26176-5-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119141659.26176-1-richard@nod.at>
References: <20201119141659.26176-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_091837_339447_702144C5 
X-CRM114-Status: GOOD (  11.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This flag will get set if an MTD is implemeted in userspace
using MUSE.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/uapi/mtd/mtd-abi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 65b9db936557..2ad2217e3a96 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -105,6 +105,7 @@ struct mtd_write_req {
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
 #define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
 #define MTD_SLC_ON_MLC_EMULATION 0x4000	/* Emulate SLC behavior on MLC NANDs */
+#define MTD_MUSE		0x8000 /* This MTD is implemented in userspace */
 
 /* Some common devices / combinations of capabilities */
 #define MTD_CAP_ROM		0
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
