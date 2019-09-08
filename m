Return-Path: <SRS0=tARf=XD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B56C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Sep 2019 19:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B42821479
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Sep 2019 19:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bTEUrct4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fishpost-de.20150623.gappssmtp.com header.i=@fishpost-de.20150623.gappssmtp.com header.b="HDGZUjLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B42821479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fishpost.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DLtzPq0HvOUyZ1jj059j0TXxDb6jcDitbqb3dfDMsqg=; b=bTEUrct4jDDs5e
	smiXZS/p076ZyWaWtuRSA148ReKIkKFAKP1+CeH5n0TLlDqvSGFgxyyML8jx3FxHEGQSABxoA5ICQ
	04i4TBHEvIarLraBZPbltrMInyO4H/6Qvg9Ea3NZvga48LrDeyndpLsXMusNgIdIvHRTzQerNRN4z
	mydIwuInsopvS3AlLaCbL0f59Lezoq2qDf1ykvz1I8NGlXycdbOy3xQp27xyXjuqKhxW7lKK5x1hS
	wlWAZtWenKQWn7g4/B788U+GKZcbuOfO9IUUgf4+hf4o9EtAvXF7g28bRU1lfpNwvesDVAwRYx3RB
	3pxRT4EFBEPleGROgSTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i73Lc-0005UP-Qy; Sun, 08 Sep 2019 19:59:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i73LY-0005U7-5V
 for linux-mtd@lists.infradead.org; Sun, 08 Sep 2019 19:59:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a11so1795129wrx.1
 for <linux-mtd@lists.infradead.org>; Sun, 08 Sep 2019 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fishpost-de.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bCokeVc6RldZtsW1uUzBQdZ38uOXfifON6fDkTpAkk=;
 b=HDGZUjLO2IkOtw9PosKqttAwzINzyBx+ePRTZqx1QC9ko46GtaUl+s6Hd0cx3viDbb
 4nLnTsf5lcz/NADed2xU/ws3vEleQ5WLBbYqrN8PlxUUJydhdumg8BC1MXEG+6YeXm6N
 Uji++ah147GuJMjV1dnJ/wVRgTyc94Cgz9sNeCXbhFbX8CsGQICY//qydk6c6YdBRk5c
 e5Oq35xX5Dw9uFHS9inCGOVgwDPReSgMjOGPKewuyCVeXOCGVNn5oVoTGg8UuDk1l5Eu
 zG9tdl8MEkSuibF9KVwQZ3oG+0fF/bzTGuKWO1x1yR4KQNCRb01JOQxqqhkNNI8BgF70
 ALzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bCokeVc6RldZtsW1uUzBQdZ38uOXfifON6fDkTpAkk=;
 b=OBWlxFwsFm4u604XcMxMR4Ldvp1BHX3oaolKoOKPfTQ7AEo/gzwrMX7ulB9Hp9Lqv5
 FOlAF2W1SBZFHND0dSC/M45TZANMUvkKas6Vy30IhpAjinWyRzDerwTOZTwWmPQQ7f1I
 BQoZaGHALtaW4ZcqCX603mWXmSwsRGJlMgVKH1eA9Et60OjcWerohsXlaL5bnqQP8f3m
 fE7KMznAVj4HCiUbMT5Vteqt1t2LWMwKpUYHi68BlBbUXcT7GGbjUc9HE3kt/clbX81b
 ez/QPM0G3FwH/IxbaXgqwpJoxs0nHYM02luhf9xssx35M0bPdfgLbNH6cEvN47xUV6Jn
 +R2g==
X-Gm-Message-State: APjAAAWS1M9Y4Z15aFinOqUtDb1tAvehmhgBx5dbIfQ1TcRp2dPWjItn
 /+D1zj0HqTpp38TJ6Fq53nyM14uQGrHJPQ==
X-Google-Smtp-Source: APXvYqz9Dc2zqlVV3VV7kvwFwaWmeifH04MBFifBbGc9q5TXC/JnOhw/MsfDIh14kX1r3NnsBe2lAw==
X-Received: by 2002:adf:f601:: with SMTP id t1mr15870534wrp.36.1567972777219; 
 Sun, 08 Sep 2019 12:59:37 -0700 (PDT)
Received: from thinkbage.speedport.ip
 (p200300D06F3423096F9163FD737B60D8.dip0.t-ipconnect.de.
 [2003:d0:6f34:2309:6f91:63fd:737b:60d8])
 by smtp.gmail.com with ESMTPSA id s26sm23552551wrs.63.2019.09.08.12.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2019 12:59:36 -0700 (PDT)
From: Bastian Germann <bastiangermann@fishpost.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiupdatevol: Prevent null pointer dereference
Date: Sun,  8 Sep 2019 21:59:22 +0200
Message-Id: <20190908195922.23643-1-bastiangermann@fishpost.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190908_125940_272780_0612B8D0 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Cc: Bastian Germann <bastiangermann@fishpost.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

libubi_close(libubi) is called in the error handler if libubi is null.
Prevent that by handling the error case similar to the other ubi
executables.

Signed-off-by: Bastian Germann <bastiangermann@fishpost.de>
---
 ubi-utils/ubiupdatevol.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/ubi-utils/ubiupdatevol.c b/ubi-utils/ubiupdatevol.c
index bdcc091..1b3239e 100644
--- a/ubi-utils/ubiupdatevol.c
+++ b/ubi-utils/ubiupdatevol.c
@@ -308,9 +308,7 @@ int main(int argc, char * const argv[])
 	if (!libubi) {
 		if (errno == 0)
 			errmsg("UBI is not present in the system");
-		else
-			sys_errmsg("cannot open libubi");
-		goto out_libubi;
+		return sys_errmsg("cannot open libubi");
 	}
 
 	err = ubi_probe_node(libubi, args.node);
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
