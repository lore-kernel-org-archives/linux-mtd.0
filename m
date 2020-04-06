Return-Path: <SRS0=p/wV=5W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F5CC2BA1B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 16:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3EF22838
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 16:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VWn/ciJo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd1Bchu2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3EF22838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DU8Rzetc+tb/XfQcbXiqSEONdJVkK5bv7RcXTwpMuII=; b=VWn/ciJoZL8c9n
	ZPw91c6e6Cwz0pvItXDk1AY8f6+GbphHG0MmX1Fsd65Aa5WzL4eRCgRHRgfxiE1Td7fXX2nZ+UPMX
	EwNzMz8vMK/s727Po398L/CePc+Aegg8z/xw0XcirEkrn8mr5l7CWbLWXVKHrprFvz9L2NeMu43ag
	2cdi9lEYTWo0nG9fVWbe/pOitjhjE3EcRYSqLE01Rn2Gs2+575Am3gccZogLTyA3rIf9tGBThRNRx
	XfMynf9usrxhqRXljG5weCUavUIGxTTefsnkalm8gvkgI63EnVVUJZ9/RrOnaQa2O6n4Foi2/rDdJ
	xLRmwx/KuEJGnFfVuHMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLUK5-0000Mx-Fr; Mon, 06 Apr 2020 16:10:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLUK2-00084B-OU
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2020 16:10:04 +0000
Received: by mail-pl1-x643.google.com with SMTP id v23so6087457ply.10
 for <linux-mtd@lists.infradead.org>; Mon, 06 Apr 2020 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1WkoK9eOo3jxX/ZMr07VW5CQfweVLKsOKrOBu3dllxs=;
 b=cd1Bchu2c9ROFaCpeTSYw8aDQj9D/amAIE3E5AJ2sk4uajkqPr0368tcgzvZNw/gd5
 A5KYbrIqj/6UHQdd420rCelaobfdCCx4exj75OWcKjgo9FWDqLL86GXRqLr/REYm7agu
 yQaexJqpfpP4jwbfEng5PlTVd8EWJ4g7mmxmotOdgL71Nn4cd68f2DIL6NYQNH0/Xw1S
 QLGYGGRfSDmUPLI1yI9Ga1IVA4OTZS/2QltXrHv4zRhsAzILKPbfzYUpOgfgRrBiZupF
 hKK8GHidAfqbbaYqeEqJtbwkxSJbFiWGvptuwMeIAxHUNHkw6W+aOozPmVkYo6V/h8yG
 +Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1WkoK9eOo3jxX/ZMr07VW5CQfweVLKsOKrOBu3dllxs=;
 b=pkQyHvvZv+XbcKKqOdGpWec7Cc1WDkix63+t8qQSNKPKv58GllOKMWY5R6LpiQw6b7
 /SlAtmth1OjT5A+ReEqEyDSEyV9g4K6M8ydREP3Hd1+cyHhQpiDPcJWCX06qygxlgTuN
 SeZlrWizYcHd5prt5vPET7H0N1tGp80iymBURVKyR1RAMwy/aAGu3ZKfs4eM6E8znOl9
 ohWOmyRd7f8NUBeZphfPDncTDBSSO2UOY7y36j/VAFqUwuo2xRkgad8i8lBGfDAqcKJ8
 wgDH1AtRQBElkcewep9QQHjTSbFckSUY0Evq0lxrDIQHODY9dMx2Hq+avLb+d0JKDf46
 0Q+Q==
X-Gm-Message-State: AGi0PuYxDmUjz+oIOdXWl+WNcjuf6mPmj9Gg9oG2LuOTrgWN6e7LOylv
 srMHNcLg33APJb/BRHQgB80=
X-Google-Smtp-Source: APiQypLW2+hk2HRhI7Td9Jl9Sdkz5Z5glDoXOKZEYa0pW703MJ9vJ5kxV4E+ghEwKkJw4Cv7ZtixkA==
X-Received: by 2002:a17:90a:8909:: with SMTP id u9mr3007pjn.149.1586189401046; 
 Mon, 06 Apr 2020 09:10:01 -0700 (PDT)
Received: from minnich.svl.corp.google.com
 ([2620:15c:2c5:3:65f9:fd8e:a0b8:2917])
 by smtp.googlemail.com with ESMTPSA id y3sm5242416pfy.6.2020.04.06.09.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 09:10:00 -0700 (PDT)
From: "Ronald G. Minnich" <rminnich@gmail.com>
X-Google-Original-From: "Ronald G. Minnich" <rminnich@google.com>
To: miquel.raynal@bootlin.com, rminnich@google.com, richard@nod.at,
 vigneshr@ti.com, linus.walleij@linaro.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: parsers: Support '[]' for id in mtdparts
Date: Mon,  6 Apr 2020 09:09:14 -0700
Message-Id: <20200406160914.14698-1-rminnich@google.com>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_091002_835438_727B7D49 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The MTD subsystem can support command-line defined partitions
for one or more MTD devices.

The format is:
 * mtdparts=<mtddef>[;<mtddef]
 * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]

The ':' separates the id from the partdef.

On PCI MTD devices, the name can be the PCI slot name,
e.g. 0000:00:1f.5. There are two ':' in the name alone.

Change the definition of <mtd-id> so it can be bracketed
with '[]' and hence contain any number of ':'.
An opening '[' must be matched with a closing ']'.
The ':' continues to separate the mtd-id from the <partdef>.

Signed-off-by: Ronald G. Minnich <rminnich@google.com>
Change-Id: I17a757e65f532b11606c7bb104f08837bcd444b9
---
 drivers/mtd/parsers/cmdlinepart.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/cmdlinepart.c b/drivers/mtd/parsers/cmdlinepart.c
index c86f2db8c882..ef9dc0bd7724 100644
--- a/drivers/mtd/parsers/cmdlinepart.c
+++ b/drivers/mtd/parsers/cmdlinepart.c
@@ -10,7 +10,8 @@
  * mtdparts=<mtddef>[;<mtddef]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
  * <partdef> := <size>[@<offset>][<name>][ro][lk]
- * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
+ * <mtd-id>  := unique name used in mapping driver/device (mtd->name) |
+ *              '[' unique name as above, not including a "]" ']'
  * <size>    := standard linux memsize OR "-" to denote all remaining space
  *              size is automatically truncated at end of device
  *              if specified or truncated size is 0 the part is skipped
@@ -221,14 +222,38 @@ static int mtdpart_setup_real(char *s)
 		char *p, *mtd_id;
 
 		mtd_id = s;
+		mtd_id_len = 0;
+		p = s;
 
-		/* fetch <mtd-id> */
+		/*
+		 * fetch <mtd-id>
+		 * If the first char is '[',
+		 * the form is [mtd-id]:
+		 * otherwise it is mtd-id:
+		 */
+		if (*s == '[') {
+			mtd_id++;
+			p = strchr(s, ']');
+			if (!p) {
+				pr_err("mtd (%s) has '[' but no ']'", s);
+				return -EINVAL;
+			}
+			mtd_id_len = p - mtd_id;
+		}
+
+		/* There is always a : following mtd-id. */
 		p = strchr(s, ':');
 		if (!p) {
 			pr_err("no mtd-id\n");
 			return -EINVAL;
 		}
-		mtd_id_len = p - mtd_id;
+
+		/*
+		 * If the mtd-id was bracketed, mtd_id_len will be valid.
+		 * If it is still 0, we must set it here.
+		 */
+		if (mtd_id_len == 0)
+			mtd_id_len = p - mtd_id;
 
 		dbg(("parsing <%s>\n", p+1));
 
-- 
2.26.0.292.g33ef6b2f38-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
