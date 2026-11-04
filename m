Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DFC606AC17
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aMYg7UIy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkEkrFnY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FWdwTpuSvVMYxWGKIJHI98TLEQLSwk8DEGUREbAV9as=; b=aMYg7UIypfegzeNTQwaE4GSINP
	06N0gQkRp6JCQX7ledT78wre2YhjPAe6ixYuwaSQCl58qzhJbxqIUhrhgqir/zoQy5BEnKVYwqkzW
	W0Z/T39dz/Pn5IOvUJ2LWSgJyczv5/+ojh01y3ZaHb7A/iGfqk1pfaUR3FTD3tkh3SrP1WELoqeuc
	kUi34aNUayEMa7XKTN/q/KnGvVtVMZfa3xutalI6W9lVjGyAaQqtOoj7WEQTXVodDL+p4tp772/Vx
	zqxUyEaBNnOvcznZH2E5wBE+TbPymVooCCcXxlZe3UkDrB1mml0vQiwSk8QVLGVXzttqGEJ8I364e
	cGfkVa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOh05-00000006lph-0ofo;
	Wed, 04 Nov 2026 19:50:25 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOh02-00000006ln6-2jRx
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 19:50:23 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso438716eaf.0
        for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2026 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821821; x=1794426621; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OT/io50s2GTf++6usH4VAdftnCA55S4d8sAF74Ec5zI=;
        b=QkEkrFnYSYUDE5HEq3AM7GB5qXhx0FE50gnSiGZY/rkF0sCCrGWcbF+apO7h7NbjM4
         uLzRBRz4LCwvz4VIz0BA0V7AAgmqOrVmvhxRKEUDvLp2bJjrtso17uuUHuw1IFWeyuTt
         G+bP6URZ3RxomsF4HOeiw5J1zKFF1ItUkJQoXIB8fJPUfGY1g++3cdT2mJv+8UxznHKX
         T6MI4uA/jknOjiDbY0U6j5ysCWaYL0mkugRrSEvV90tKT4SuMDnzpS2OaQirDem4S37U
         ktCn3VTJu+VW5LVvtZydM4tswrfhsBX6LCLdFKk3AD/Ur7ky0wib2qCe4JGtgVlCd3Qz
         5H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821821; x=1794426621;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OT/io50s2GTf++6usH4VAdftnCA55S4d8sAF74Ec5zI=;
        b=l5J+DFHPigr5Bt/2FU0dwjH8wUVwYC3InnOc51E5kgu3acvfj92euNfU+FVxneHXoI
         IWOQxom4LfuizyctAuwv7TolWSKsIzBsSiBoN2DM7ek/rgvbpXCbbcHR/NO3a+wkYDo/
         k6XwbfbPPuwrZGBpjSIEtbvtSvJ49ehFp3KYHWJpXp0QgfRHqLeEZkaLr5bnxtSsHzhn
         +JUNfe4s4Q2PLC4BTECxwTVLp1eacKfrUwrmu/UTwu1N42xLkd0urIvSV+3m8/0J9ANr
         GQ2ZxNSpEf0NBZLVdZaz+Tn/GAC3Mi2j9W/9BTwWDsSphHp2aE954DMpKRHpfjI81cvG
         TJBw==
X-Gm-Message-State: APuU4Z90kA2BfZ9uls/WahcbjWt8Q1RavRnOC/OOG9ZfmAvRHZPMN+re
	RD0F4Dcye2QG9K5eE9glrkwSfs9LyX3ChP9+pTvJvOW9KKXo6TYe2kaK
X-Gm-Gg: AYBFou1SQyP6zbLHk+30AuTBJXIovgxYiLG21QUsXqAr/6xih3imYnhzDbvjlUzdaMV
	8skZlaXcjcJNjcCwAgblzXFMT57R1k0Wm6l4BtJEA9JstJ+oQP3a76qgbm5+NddXpR5fJU4n5Ic
	8W0nV6shHSK+wfYcBx98CHNoTTtHFNCbhaVOisCV8tR+zsQbXlFBaWN/aOM5+GqcQBIO/XGmQpC
	cTrBIgJ4KrZjdtQrF4yK2ya4Ms4eZC0HfLZp4ytpRJRQp0wYwOqacdANzLDZ6MKADIRE5CnK8ls
	l1hlrXYzBniYm9z1ZyNsBA6JPrfsq/jAY2vpO/WR1ZIL/Wt2ZmLgsfxkzRmOFW8ZGOX4zlUitke
	RUIXNR9Y3SGcFJeWPbTqwzjYCGE8LU1PfIxqnBD+4Wi6y2S0KxOjfyrd2hxIRDrT7ztsxfUAuXC
	tsEyljfklFH5uLK06QnLSmdOIlXNQw0QBsV0CzvQgUZDQmPvUDn4xYxP590aRhttTP+DscUBuqi
	PD/FVDYJhxTxl+VLaXHR2BbeSMt/G5+z5cUU2plhESPLBWQvS+JgtQ6fFODUn7JwEpKzTWmifnO
	vO/zcLnuvkrQME13M7njEr77T+o5hge7iFeRCdS5YY1Alb22GvrIqGvRG9VFIlJEElW3pl/07qw
	EMik/PXcc7rxjucL/LmHeFGlGsazj+ubdFCi80faGne0wgHXV2cPzmxfdNcMva/eapy2Pre4SEL
	7C9lSo+vQbA/qUDyDvLHWKJZ/tEsxXVeE9rq8INLjIw8pRbh+kvZo=
X-Received: by 2002:a05:6820:55c6:20b0:716:bf0b:f804 with SMTP id 006d021491bc7-716bf0bfc08mr1741495eaf.79.1793821821491;
        Wed, 04 Nov 2026 11:50:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12eb1b9sm2504522eaf.10.2026.11.04.11.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:50:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:50:19 -0700
Subject: [PATCH] mtd: core: reject OOB transfers starting at the device end
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-submit-mtd-oob-end-v1-v1-1-5cb8ad921cb0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gasiIu5iszCpokTwXZoqwji3
 a26fIv/D0gclRN8qgMib5o0+AJTV0C/0U+M6oqhbdremKbDtNpFMy7ZYQgW2TvcDErnqBcrJDR
 Caf+RRffnO3xfl3BmyvcMzvMC9n0lXXkAAAA=
X-Change-ID: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_115022_700187_DE72BE94 
X-CRM114-Status: GOOD (  12.72  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtd_check_oob_ops() permits offs == mtd->size when the data length is
zero. For an OOB-only request with a nonzero ooboffs, maxooblen then
underflows because there are no pages remaining. The wrapped value lets
the request pass the OOB length check.

The OOB ioctls can reach this case by encoding the OOB offset in the low
bits of start. On a partition ending before its master device, the
subsequent address translation allows the request to read or write OOB
in the page immediately following the partition.

Reject nonempty OOB transfers starting at or beyond the end of the MTD
device before calculating the remaining OOB capacity. Keep empty
requests and data-only operations unchanged.

Fixes: d82c36821684 ("mtd: Fix mtd_check_oob_ops()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..b82fd7ccd111 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1676,6 +1676,9 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (ops->ooblen) {
 		size_t maxooblen;
 
+		if (offs >= mtd->size)
+			return -EINVAL;
+
 		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
 			return -EINVAL;
 

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
