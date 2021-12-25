Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66254C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LNIrFZWdOmW4eTyLE/QNQWz+KSUAxEtCHaAyQwFg3ZQ=; b=zTCz+4M1Xd9pbZ
	3Ibf8r+gOevdLcE6D358sbFd6ZN8nQdg6UxKEf+tWtyRryZo4Dv7RKsm30aepi2NG8MsCIP4FtrMZ
	CkeHNz99W8KCcPGLSbB053GVOw9q4qDErimgfCfXDn3kqOO/kKaqil3R5km1D74+PGkOS6SA6BnyZ
	pyGx8gV3PJOtN0k3W9zUqCL4FQ6XYbMAGX92doigZLHLggLJNwzSy5liBMvHxqm36jcwyED8DNZIa
	q5dWI5EAwz5umFCxTsGlBPihiuWrtSEXutlmALnx+yC4aGxWZBjlDZezitsn8m7KzYePT5HRexSg+
	tTXVhwH9CGWBbDg9GPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n13x5-00Eo8B-7Z; Sat, 25 Dec 2021 10:06:59 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n13x3-00Eo7M-2v
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 10:06:58 +0000
Received: by mail-pg1-x533.google.com with SMTP id v25so9448703pge.2
 for <linux-mtd@lists.infradead.org>; Sat, 25 Dec 2021 02:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUimozoxjLlUVh1Qi+7L8g3Ewbj5TnU71txJNWxTO4Y=;
 b=Sq2jlEB8IRczVrBgF6mBAJ5lXVF/Jjd451dpeaq6OSgxyj9dJNWw1qVCoMfVr/Z7Yp
 587Ec78pnZMzsRaSJE7WrlFtk6jCHHwOpnt+NGsQpM5kFWDUnXDH2ZlXJZOLOo7lc196
 RdM5BqILpweahRNL0OFO2e5jmIu1FBScP9oz0nWQMpMDfORARBB711o5RlcREqzFczJD
 lfZAKCK4qOcDv4b9mMcN6ag2HFZAXUXH2HeGbWiJxWL15fWXgti8y6snRViEr8jTTYeK
 IK1DkpdDGKuic1wyKwIrt8k25JjMd5DRMHdy90ysWF5qMBLV52UkBXalf+gF6RF/G9Nk
 O7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUimozoxjLlUVh1Qi+7L8g3Ewbj5TnU71txJNWxTO4Y=;
 b=sU0lbnXzBZDrNrVec9yQVPs5bclYOZ+lyJufyz5YN2hAPH1vu50KWS+ySmADY49Oz0
 WAV4dvnqi98pmvQXX0fJbj0PvJvFrgBAj+t6781gJ4UC5glc5/IrC4lWKYNSZRw7UGU5
 4ieL7VmXNIVA7dq+x825M9P3HtNrHJM4ZEFqlLzACBMGrJAdCCSVRxPtuQqtkw1WKVrc
 nnQRRVrEny517oTi2ngo4vz7ZxWaY4ossqcZ30m0D7hEgreVubHKr4VrB504dTgwupDt
 7awpFKx7BBDMezuscxuHkXJJUlrEYUjAD6kzREN2ZTiVEPmFxYv/sTtVf3HVNLt7oVAN
 4iHg==
X-Gm-Message-State: AOAM530PIARp/by+faI+66LyVvdzg28i2I9EdfDG6rZj7k5HixDrc6GU
 RDrNZoihSbBdUjK+pehc3gj7v5lTUfVZ6gPU
X-Google-Smtp-Source: ABdhPJwAvY5JWXTyFKJcxmY2a70V2qqbGlRZIfUO3b6sSt5MMg4Fs14WOgxU/vyvPDQ99LQKRheszQ==
X-Received: by 2002:a05:6a00:2391:b0:4a2:cb64:2e01 with SMTP id
 f17-20020a056a00239100b004a2cb642e01mr9956583pfc.45.1640426813013; 
 Sat, 25 Dec 2021 02:06:53 -0800 (PST)
Received: from localhost.localdomain (1-34-229-86.hinet-ip.hinet.net.
 [1.34.229.86])
 by smtp.gmail.com with ESMTPSA id i68sm1246109pfc.151.2021.12.25.02.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:06:52 -0800 (PST)
From: s921975628@gmail.com
To: richard@nod.at,
	vigneshr@ti.com,
	miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 RinHizakura <s921975628@gmail.com>
Subject: [PATCH 2/3] mtd: rawnand: nandsim: Merge repeat codes in
 ns_switch_state
Date: Sat, 25 Dec 2021 18:06:48 +0800
Message-Id: <20211225100648.119011-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_020657_161489_1F85EF31 
X-CRM114-Status: GOOD (  11.49  )
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

From: RinHizakura <s921975628@gmail.com>

The moving block of codes is shared between both 'if' and 'else' condition,
we can move it out to reduce the duplication.

Signed-off-by: RinHizakura <s921975628@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 3698fb430..2ef6bddf0 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -1731,14 +1731,6 @@ static void ns_switch_state(struct nandsim *ns)
 			"state: %s, nxstate: %s\n",
 		       ns_get_state_name(ns->state),
 		       ns_get_state_name(ns->nxstate));
-
-		/* See, whether we need to do some action */
-		if ((ns->state & ACTION_MASK) &&
-		    ns_do_state_action(ns, ns->state) < 0) {
-			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
-			return;
-		}
-
 	} else {
 		/*
 		 * We don't yet know which operation we perform.
@@ -1755,12 +1747,13 @@ static void ns_switch_state(struct nandsim *ns)
 
 		if (ns_find_operation(ns, 0))
 			return;
+	}
 
-		if ((ns->state & ACTION_MASK) &&
-		    ns_do_state_action(ns, ns->state) < 0) {
-			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
-			return;
-		}
+	/* See, whether we need to do some action */
+	if ((ns->state & ACTION_MASK) &&
+	    ns_do_state_action(ns, ns->state) < 0) {
+		ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+		return;
 	}
 
 	/* For 16x devices column means the page offset in words */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
