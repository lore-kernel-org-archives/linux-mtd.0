Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843C606A333
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EDRsVPZ4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aqGdHp9q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZjN9uQN1Qgk6kril4JWqP/yyTITBw7RuD+FDvyjgP+w=; b=EDRsVPZ4bC2hC4Ir8Qz/PwgiY5
	jtSWDJwI7th6tg29xNRdRicEZclHJv/SJQoYJVgOk7PqPjcYWlwygJAuhXymgp1YxPs3noD78BXrm
	tua8yYkgPqDqmuba7NPfsc0hZ0M1Sk4OJnibZfFcoOIlsgQ94GUCixAXaSa1C8E/fdiX3y96ONkBf
	xM1NbFFAlcvaegF1YaK6MMhawYBb3YOU8nqdqYVFdCgQ4Gp/WdETvoxX2at5aBcWXvwnarbEwZJSm
	v/DfNdmwnPfeXp/E+VghjzLhvSd4CZsIpgw5pkHLLMJ6JgTPZ2e8itg8axBrs+NzFDB7ohCnjE7Dk
	YQRGOXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjpq-00000009paC-3oHT;
	Wed, 18 Nov 2026 17:52:42 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjpn-00000009pZ2-3FAs
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:52:41 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-53dbe9b8d6eso41919b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024359; x=1795629159; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aKUtxq3JGEiVMt66Bm6OtfCap3a4xkXQXSy7MpwOvJg=;
        b=aqGdHp9qSvKjVQ6zxouR4Qxss2HvqAGyfdbG6ycDiHAqBs8N+1jsQmE1jwtg5NKaul
         S2Bz3oKnnQ7s8NH5p5VHmnzDcQ71KMeFi4Y1VCOL7B08JciOnkUf3YqJCa0i89HZdjAa
         XFeh0+g3P43KZDTvylq0jZce3IAEvhfomyBtoHnA8IIPCz5veptaP2rpVwZTYZpQKeZ+
         T+fByAAuxXnRDXux8smSMEz08Ufv/Z0WBrYKTeyOaNh0JqaIhHT3TbdKiF/yeU+xPsaB
         B3gyxkyp8KZl+LHYzptcuw6hGAIlKwupNCCcZitufoOn/mAZIxRMxmtNEMTRABufweNw
         FoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024359; x=1795629159;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aKUtxq3JGEiVMt66Bm6OtfCap3a4xkXQXSy7MpwOvJg=;
        b=ycj+sN+6VkXGklPwuX068JnxSdaPYYmGPXIWkfXLH/zxJGVGk9VsvN/tYFllaJjgz4
         IIf1meIxaZw2Om3OuXBomuqXo+NmIXq/P5LEUNM+s/wIaBu9/0aTkhtn2q4quvPHPalx
         ORYmwwvs5NwkNEPMkhzf25tn8U+g1stbQ3uZShjJMZOGM29GiPC7SYhvN244VpwoHAzV
         q0rQOErf22CKB8VpCoKqM6nWbUZk7xSsILJg4MCnkNFKli3dGdEpSEZMApUOMpgqUcN6
         zDmYVyIW6Ndud1Y7TMtyc/0xsTz/PdP59xCTJ6bN/7qxSkpSloo8Wyq/e4c1Chr6hK/J
         RGTQ==
X-Gm-Message-State: APuU4Z+xPVuj5nRZstemgLabQhrYyEzxSdQd/KTPw9Gb+yOcxkReajTV
	KD9f0XRyaj4E1J0PNNtoA5xdp5yTE6+otN18V7rEvZqSbyYrETFs/3X8
X-Gm-Gg: AYBFou2ZX83mPyH5q6Tj41ujodxzz3W62RVh7WKKTgx62F5bZpDOUVK94fYGFvOxG20
	SwaIF8IE6Y3EfHp/zeZTlY/BCe+97x9ZSXIi90KLloObxhjUKSLRWsAxL74nLe8jmw2p2If5J7J
	L6mc8+wlffle39ilC0rtefSH96Q+BxSWc9JEcbAXSjUfIskDZ1eO7H6YXwSTwV8HUNitadcRwUd
	Bgxg5ozvLlhsI2ikmXTvcDfioQgGfYOxTKFllpx5mzDoK0BlfgmqfYdPyZ2s0Cinyz8TSyUacN2
	cC3NsBsDLHI3sCQQFB89sMSN4hZ5esfrBzXgWZMQJPo3BWrO8wK30GLiwSuf1VylOGw31ReJGrj
	sNRCbCyqgDCvKh4Wye6KYQoPEN4eDqTZJo33EBPmZExbISemJU1zCKan/3u+0Xf+JVs3iuNZ5Yf
	KwEdLsdCM7KcF2jm9DHu7s68qc2rsQxkQkqeDI98tlFTthNu0Ou4Ox/W00hRCVfg0uFNqkIcLbL
	BxaD8WKcnt2C1Pc0rZiVPzF4Iwwpf1MqkLATAJGOdMYv9AuLdc628xco3Pwt0AAKHJoU5acOCcR
	Q8jLiL/ympu3v+AzkLOBGgbfIjjD+uIjqy1YtIkMno1hG23IKJfLj0Y8rQAvO9CAaqVe3y4jUoV
	kFqDrlNXerAiAJq5PVqqIfoWEVi6ZL3gRMtuoIDZuzVfIcUFC5OGfEmlzqYu1hnqNou6Ixm/cKU
	An4JziZABw/EmHK9+FoaIHDlc0Abr9v0Ae9MLv3xlxbKLBG4rzvavt
X-Received: by 2002:a05:6808:6d8e:b0:4b8:46e3:e229 with SMTP id 5614622812f47-578b95284a6mr194814b6e.21.1795024358723;
        Wed, 18 Nov 2026 09:52:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777a2bbc1bsm2095003b6e.5.2026.11.18.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:52:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 10:52:25 -0700
Subject: [PATCH v2] mtd: rawnand: propagate mode-0 fallback failures
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-submit-rawnand-timing-recovery-v1-v2-1-d14d4b79e543@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQrCMBBFr1KydqSZ1AquvId0EdNpO2ISSWJUS
 u9uWk8g8zcPPu/PLCIFpihO1SwCZY7sXQHcVcJM2o0E3BcWWGMrZa0gPq+WEwT9ctr1kNiyGyG
 Q8ZnCB7IE3TaNwgHbQRlRPI9AA7+3jUv34yK5kUmreG1MHJMPn+2JLNfeP3sl5YxR6oiK6gOeR
 6v5vjfeim5Zli+Q+qbI5AAAAA==
X-Change-ID: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_095239_823682_CFA50AC8 
X-CRM114-Status: GOOD (  12.04  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When GET_FEATURES reports a different timing mode than requested,
nand_setup_interface() tries to restore mode 0 by reconfiguring the
controller and issuing a NAND RESET. It ignores both return values and
returns success even if the fallback fails.

Return the fallback error in that case. If GET_FEATURES itself failed,
keep its error.

This also lets nand_do_write_oob() stop before programming OOB data if
nand_reset() cannot restore mode 0.

Fixes: 415ae78ffb5d ("mtd: rawnand: check ONFI timings have been acked by the chip")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Narrow the subject and rationale to a failed mode-0 fallback.
- Link to v1: https://patch.msgid.link/20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com
---
 drivers/mtd/nand/raw/nand_base.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index fe8c6dcc9c07..e050b27aa578 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -840,7 +840,7 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
 	const struct nand_controller_ops *ops = chip->controller->ops;
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { }, request;
-	int ret;
+	int ret, reset_ret;
 
 	if (!nand_controller_can_setup_interface(chip))
 		return 0;
@@ -909,12 +909,15 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
 	 * timing mode.
 	 */
-	nand_reset_interface(chip, chipnr);
+	reset_ret = nand_reset_interface(chip, chipnr);
+	if (reset_ret)
+		return ret ?: reset_ret;
+
 	nand_select_target(chip, chipnr);
-	nand_reset_op(chip);
+	reset_ret = nand_reset_op(chip);
 	nand_deselect_target(chip);
 
-	return ret;
+	return ret ?: reset_ret;
 }
 
 /**

---
base-commit: 292f737382d3913d0d9addf220b7170fedd7a04f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
