Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A32606A32F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 04:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yuEkI164;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjepaDgw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pIOtWGgAwjkavlr+waKcxEKP9KAyFtHEBdGs7bW51YI=; b=yuEkI164dLjl8mag7oi8Nsn2c0
	d/Rj48JoFvAT7Q/v8Sz8r9Mh7C74aJ09QlfZBFKGP2UJ4EID0pSgXxtetNnZo39Z8cGir7iKIe154
	pr6BJReA3mHuCSlnKM4SWk5GTc06I/fvd1c45eWVlwekjfAHEH7/cqwItERXLhvx/neejuEOsXoB+
	MdhDtXZCGUVH/nelBT2nn3X8Hkk4/HFWXewhD0acUmOf1TT0y4BgRT25Zvfvso0nn0H6fVB4G/Li0
	BHgwa/3bJhmhpPs6sMDpilxQ2po9LOFtupO86ZsxO2+VVo0ThoLuGgF7sfflWt81dN8fWiPucVBTk
	OtHoKcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY5P-0000000EBt2-1p9B;
	Sat, 07 Nov 2026 04:31:27 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY5M-0000000EBsf-1oLJ
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 04:31:26 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-716b58a4365so783801eaf.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 20:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794025883; x=1794630683; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0h921tV9Ds9KKioXJ9IFecI2/WeMjRPzZktFXa2aBNY=;
        b=QjepaDgwRvd5W+ErlHW2eLIS/3oUmeFjaa6/shwW1jx3nlf7aMRXWz2hPR78tWttoS
         sFOfWoGzYBogmSHGMRxpvKcLRctX/yHPfW+KrH15U44aEFyENwl8Wnc/60WktgGM8r3t
         pT2gAOTFOjkoAvPxqp2hStLofEGjFFcrgczeNfZecWc6O2zCA+MAu2q7fOKQzPCYGbH3
         s3yPuLqPH+V5vX0jURoUOxqKMogForXDoCt7mb5hUWKvOHLvyr3Zn4vbF1uEq5tw/JY7
         7XYo0dzQX6Q0kdpKpIoUye7zzqx8JNXdfJx84hyJF4leJ2ocOwGy3qdN7DWTmUr4MkQu
         dJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025883; x=1794630683;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0h921tV9Ds9KKioXJ9IFecI2/WeMjRPzZktFXa2aBNY=;
        b=AlbpNbrei3JNRBpvJysIth18tutXe/uv0TaLzG66w9H7qc9xbeQigwJ+UpW5YUauFG
         FGMJUPMXXSro5puhkp9scDuQvZppUms7iZ1vtTidlIIFob2e6j8aDkexwj+obeTb/A+i
         Ngcp/AfhZYO9szNnVxuO42GrTzGvT3lwCYHbHxjNfdzCWp/q6CDeb0gsZGyFYme2jI75
         x/++znarVzBm+dtCHkqQNOKzl5FFkGJapGeTVQHEj2+z9Cq/rsvNYnQ8e64257dl2h4q
         SF4jfjBCPQELO8a7YDGnEU+ga76208vIkuLg1B3DWbChPhwIv88gKW4l6kJZHOtXXiTx
         BDDg==
X-Gm-Message-State: APuU4Z81fnF6F+3SmnEChbHvd8lfmEuiiRupcZ+KzD3AkXuL7b5iT0N3
	py5M7qWNHD4wqPFd9jFLQMLKfKL4EuYIri2+gWQBLxoxEVrm3UiDsj/0
X-Gm-Gg: AYBFou1DnbzcvX/gQe1KRBc7MDZyya3tla9YtGRj6ncEteM/beMcMrRBGYzhNRzBf2W
	k6jCV+Dcu5GcwQVC0x+ZKXAcmTL1bfN/gJI1+igSGVxfYQY/ZYAtQqKpp4DXzI7+P6OSEMknpEd
	y9o9h9emU2fOYQcTnfovwgOcKCj5tUXDXA/qUGDvihbUBwymVtPW+1u95qRsfcXbMjo1C/Cza63
	tPV8qAKszhURnkDaqwQy8To1XcH0/i2XqvCzgO9yKdRwfaZl2PvBV7hUTiGAqQZqMrBx15BuCVt
	ORWTaRjyv1qnDlg6bsMg5kJq+IJL/jHxEMfr880visPoLh81zUfGmXMRBIbNtcx0lHfAPOKfsPW
	nW+CvH8bdTjbC1VdqM+5ClKJvsw0Qs39xErAHCZ2GyFbZWZaBbvCvv0mipb8xPcym8JwNjNy27/
	XkZtDGUhtNQSgGi6ip/e3dz6C+u7AOy6O7XwZZcSa1HP5sWQqe2P8Zg4sQdWvmrHMTEUe8wtQ8G
	A5MPEpbSONz+poC1nKgr4UQBW5GN48RoBQqistIb5WRIeYeGU+cO5l/8ClSITEFONuoGIXYOSiy
	+HJMEmV/uk54FihMh/OyASBrvmo3ZZy2Ae3YlTBrNNJfi3OTRPmjovHmJqA5KG/0VmxcXHBIx4k
	rHIqunXWIrauT5DgnHJSKCCukewsz2ZZ1Se6DMclng6dpOQTqkWR1KLQu4r1uQ1YvgM8JMY0qiH
	7P4F6+yPInTN7eIHa9lPPd37GDKAFa8ulqgS5jkqSIAWVyDoTVmLo=
X-Received: by 2002:a05:6820:3417:10b0:713:da3b:9127 with SMTP id 006d021491bc7-716e7912499mr1864653eaf.46.1794025883255;
        Fri, 06 Nov 2026 20:31:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad979ebbd1sm3579607fac.9.2026.11.06.20.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 20:31:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 21:31:18 -0700
Subject: [PATCH] mtdchar: initialize MEMREAD statistics before each read
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-submit-mtdchar-read-stats-v1-v1-1-173ac5c3ceb0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAxFf2X02eBaoWz+iviQtpmrsCpJHcLYv
 5u6h/twbnLPZoQ4k5hrtxmmNUt+FQV76kycsTwIclI2rnfe2t6DfMKSKyw16Z2BCRNIxSqwWsD
 pQujG0bthMKp4M035+9ff7gfr/kmxNmf7CCgEgbHEuVWqPbccq33/AejgRP2gAAAA
X-Change-ID: 20261106-submit-mtdchar-read-stats-v1-af3ea2996288
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_203125_149012_CED732BE 
X-CRM114-Status: GOOD (  11.16  )
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

mtd_read_oob() can reject an invalid OOB range before initializing
ops->stats. mtdchar_read_ioctl() nevertheless accumulates the per-read
statistics before checking the return code and copies the accumulated
values back to userspace, even when the ioctl returns an error.

Initialize the local statistics on every loop iteration so a rejected
read contributes zero counters and preserves statistics from any earlier
completed reads.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac7293..cbc7114686b9 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -750,7 +750,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	}
 
 	while (req.len > 0 || (!usr_data && req.ooblen > 0)) {
-		struct mtd_req_stats stats;
+		struct mtd_req_stats stats = {};
 		struct mtd_oob_ops ops = {
 			.mode = req.mode,
 			.len = min_t(size_t, req.len, datbuf_len),

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261106-submit-mtdchar-read-stats-v1-af3ea2996288

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
