Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B96D2F011
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jan 2026 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2fsupP5ueUXNW6Jd1Q1tuz3yY0LjCxQmlmGzghCn2Sg=; b=hOj21DqPGo9fFL
	IUqWAjSyxJqEfEARaSGLe8hAcUGiW5kQswbvAC4hbNJTV/BD9yDFjMhjPgerPCUOpqjzSUK8Nix/o
	46firy2NrlyDXBFFRgzkmlfVRvhoX9G/9I9PLqzmLbQLe+7RH81jcci5+Cjjj/ZA8ho/WsG39HRVt
	RRYXVgTagiOih4cBBGdkP7Miz0U/WLL5FwRpWR/enb6vvreoYGE96L+8dC/T7hNJJKDKQT4k+1QiI
	9HYJHxsNTakleIPTGkSiITSbtwW7MqEvDwgAKSHuV0svtNmuF8QoytYFUMoZ5Yo8Qt4Y4vsIOJadk
	uWk8YHWrsBC56HmxeFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkivl-0000000EIPf-1eWn;
	Tue, 27 Jan 2026 13:16:29 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkivj-0000000EIP8-0reE
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jan 2026 13:16:28 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-382f9211cbfso50428951fa.0
        for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2026 05:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769519785; x=1770124585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ksQzxRuarB8sEU9IfyFq1yud94HvFMUMMVPuG8fO9R4=;
        b=jnq6zZwOWqCMEATIz8od1p+DZvLg7bN+i0rz84dF7whLxMSST4hFRIK4ICwWjldCao
         vDmgDEq2Z+h5ASFL9YlMcGq/59sdvW8HPcdcyNTPReeGloPsInFr5rUaiqFRlWWcHWeb
         WCpla1LCGif7aC4w89q+GV/30EjQ1mepDDFnfzMpSCdOWhGLJ/wIEp0irqjPox8ZfCDE
         XbBgVmV2SbeGbp7ti0D/89dTqxZIMdMuGkdpqSzOpOaJQiJZZKrRKw3otmBuKM9cj4K5
         u6ITjqFMExF/kyXEIkOPQ8Rcp+NqEn2xj4i5lkEDjiI9f6kFiYU+w3aI5XMqwAJPHXwS
         6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519785; x=1770124585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksQzxRuarB8sEU9IfyFq1yud94HvFMUMMVPuG8fO9R4=;
        b=T7fs8MUSlaQb2pnXDT85oM7NMWa8nW6M2Xk9V487CWZoz1dCht6RQ2U/k1DAFKSA47
         adY4Hd/cgx7KeWSdSGFn+S4uHj5SZaSwh48/kpngVxYxk4Q0liACYnB1WIBrDvxyDDMJ
         sl30Ko8ajUR5kukXOhxMtMvofDtO5ImMgyx9KgrMRlDKTkapqiNYoK4VkLLPG44NXW61
         rSJ6zAEVZgDcMogDXQTTDxTP0m4pbVyJeKvLbJPgpha3yE2PWRnJGB3YOoScLgDMAUot
         5C/oxxIG4T1uczseqi0TYZ7xDj2tVv2KpsY0UfkWfH/8xsTvnL/oFsHE7/HDu+OZY/9i
         aGWA==
X-Gm-Message-State: AOJu0YxGxsfWm1zm4EMs+aUDcjyHOgZpAXiv72bQ1Z3D5dcwaHMVZZQO
	g4h01/Cb19cXBvWFfCxAiruMUYFL/MOPx2F2ghn/KkQyud1bEIg1PIDW1bZhoH3eO0I=
X-Gm-Gg: AZuq6aJqtrANInIPy0bZomgTdvy8NizAEyP3PWWNYuyp60ka9h1Z54tVht3yPY4+n1J
	W1aOzhgWABzHk+JJr0hwMqM625SdrCXOjvsYV6dp3FTx0S/yP8Rj+JSwOK/xturNE9a+hCvIkZS
	siRjQMe+KQTQqJ4vUjfO/Kqv+Bha0tgbmBYUfsAMEdyD5Rwh/7x/r7bL5PWyPxc0urrw566RvpP
	LHp4Zne+/mpu2dCDiwHc1RRT7d7GPi6kmE/qaachUxDocYjtVvdL/hrF43WN+b9YkmR4Wp5YtIR
	VdR2ed7vvJJ7wuTGQGTnlsQOBJxrNVbjY4eYkhg1FV/ZZB8TF/ey4RaJ62zpcZmtLu0QMJ9x0V+
	vy5CTv02iG6QqdCVHccIxscDtzZCI7Y7arVsrLmwk2UmzxZL/B+cyZQjsGPKTo73gqOEM5br1We
	UgivO2/RM9MKe87z0NjASQD9nMi675KKT/MNfhpYMnVImz9sBXpShEc8apS3I=
X-Received: by 2002:a2e:be91:0:b0:37f:c5ca:b737 with SMTP id 38308e7fff4ca-3861c83f9bemr7613961fa.1.1769519784425;
        Tue, 27 Jan 2026 05:16:24 -0800 (PST)
Received: from lnb0tqzjk.rasu.local ([178.66.156.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da017b5esm35130981fa.19.2026.01.27.05.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:16:23 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] nftl_format: prevent buffer overflow in BadUnitTable access
Date: Tue, 27 Jan 2026 16:16:09 +0300
Message-Id: <20260127131609.53932-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_051627_386600_8BCCF3B5 
X-CRM114-Status: GOOD (  10.61  )
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

In the INFTL formatting path, the code iterates over erase blocks from
`pezstart` to `maxzones` (total blocks on device) and accesses
`BadUnitTable[ezone]`. However, `BadUnitTable` is a fixed-size array of
`MAX_ERASE_ZONES` elements (typically 1024 or 4096).

If the MTD device has more erase blocks than `MAX_ERASE_ZONES`,
`ezone` can exceed the array bounds, causing a buffer overflow.

Fix by limiting the loop upper bound to `MIN(maxzones, MAX_ERASE_ZONES)`.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
---
 nand-utils/nftl_format.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/nand-utils/nftl_format.c b/nand-utils/nftl_format.c
index c8b8b50..0d38ddd 100644
--- a/nand-utils/nftl_format.c
+++ b/nand-utils/nftl_format.c
@@ -372,7 +372,8 @@ int main(int argc, char **argv)
 		pezstart = startofs / meminfo.erasesize + 1;
 		pezend = startofs / meminfo.erasesize + ezones - 1;
 		numvunits = (ezones - 2) * PERCENTUSED / 100;
-		for (ezone = pezstart; ezone < maxzones; ezone++) {
+		unsigned long max_iter = (maxzones < MAX_ERASE_ZONES) ? maxzones : MAX_ERASE_ZONES;
+		for (ezone = pezstart; ezone < max_iter; ezone++) {
 			if (BadUnitTable[ezone] != ZONE_GOOD) {
 				if (numvunits > 1)
 					numvunits--;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
