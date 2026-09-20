Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA60C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YD+tCS3bgjd1dRp5XsZqECXtRZXecRc5hFc9W7xyPF0=; b=Va0jERJwStmSF5
	G6E3ZY3Xmor2nl186MoRTA3CHlrdU4HL3GEJI1duK9PX7HSPElpcDo9s0gioZdodkYr+w/hMSzOPp
	zuHQXpaINxXghWIPFOYQi9oY9C8EusmvOH61xR2DGusMLeE/6FREzdaA3/xvbmplzzrIXSZckgIZ8
	o+H3ivJySgt4TDAx9cw7o7BjB1g7LmYgro/o4EIKG+/ijhsP3VeQYsw75kIS03IXL2vAlU6ApQHXf
	DV7phvmx6WX7lMccKkDdyTXFXLoZQtvLJh7O0u/6jVpEj4JLvswhrxDcynypDnLY8tqarKWEg86aH
	OvtY6R4PN9Yv8qKb4eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Nxh-00000000Lpg-3c7X;
	Sun, 20 Sep 2026 20:16:33 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Nxg-00000000LpM-0QDj
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 20:16:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso31306635e9.2
        for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2026 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789935389; x=1790540189; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUvRx48jmV6bVP6KiA3+WP6/NpkH0FRdNbK2IoWyhcI=;
        b=lhkgTNj36DC6LMRA+H2nqPSK7AnQO25XOaX/DyZ29Wq3gLYCU1kRtE0znRS17oyXH8
         wZuXZQlTcImHh2IrgI0qYkYLra75DAwxAtt8cu6G62TrFTlUSGS958m6UYrEoqS83+V0
         /12N/c9cepE2gaO06dycTIVL6YMfkCvWIiCr7cMW6zv+go6cvyPlL0Y+UlnQNcrQPfe/
         QA5ebrGutC8DrB47BKc4JhMjJu3odDcRjFPzRC5Aik774L03YbJxB7dL1CaQK5MpfG/j
         lSYboGK2d0c2p0D5d+F4zFrdSgMdK8FR5JXFpN+Cn1XQyLYX2cVy1tajoGqm6mgl/gf6
         sASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789935389; x=1790540189;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uUvRx48jmV6bVP6KiA3+WP6/NpkH0FRdNbK2IoWyhcI=;
        b=zQWCYL13UWiYsu/JnQy6niPEOBqtKqERKZVaI/XZef7jxLIgrQbvx4b3l3oqbAXDFo
         PWjsfiE363oitqyr5IJzXQsh2ZK8SSs9zaajyYl1Aw9TZHVZJUkGI9tp8BbCiC+852q3
         BCoteXrgcXh0ppfaiTfGNNG8OMr0R3iJSU8r6HKG12hAqIIsPewIkJ0Xcj1Yt2MfRsqY
         gtrzRNfE4+v3u3QMr1GstOvp5g1z5sJ5vKwfU8qyK6uHIoU88/+jYRfzCGHocaxNU4yk
         OQtY9FhpD6rPudNEvagjff/QEQL1M3vDV0EW0exNzwVNesaxSMIOg/g9rO9si/37noAU
         nIPA==
X-Gm-Message-State: AFuF++nWhGx/S5bl3O6zlwvx44TWRbNsv38ALeBiWJWw3fbsp6LvJmRt
	64T9Zr9QZ4N6jxNsRLZV/HXi479Rt4HDCE5nX4kmegxDJikt5TrYrkBZ
X-Gm-Gg: AYBFou37bJz1RDdx5KUnJmmzW5Kz1rDPObKgazBbvnZPOQQO4HBBfQCx2pDMD/XRkCk
	DdgaK8WyhaxZ3vOGYoKTdB7rTAunDrteiFNk5zKlWmG8qZLXdSGeinpo9JX8tb08FI2rdhZxDEO
	7esxZPyEYSljEolZp0Gd2W0vuvBw/1DqA/OwwfSUUsQnSd0h0uGOgYS4oXYd7jIUL5s1XrCvoqA
	g49lgClHbJg/ZnMdNVjKu9CPIkraL4rd9FLzxOjWy/Le6c+bmF0iYmX5+m6oEfA+foYQz3pO3TQ
	6AVaU45tdfuwAZO+VxqiEBN6pB7dRuEJoA1/Ov7iWRpjcchvB8Ni3KMwd51NstGnL7Tp2yrHj4V
	yOrD8FkFYF7SUW7HiQtbnkKKYC5CYpiWzt2Ux5kto6cfECv4J7WUv/s+Trm5dELFPaNDZ44g2Yu
	K3TFgxtE0GAuYPcm+s1rTDtBM5NvCINO2a2L6nWpqit6LQYob+4aC5Te8aogQzWk2r1r1bMwokA
	V/OIP2S0GgrusaZ5pfN41LWrXPS
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id 5b1f17b1804b1-49fc573a0damr132160355e9.25.1789935389229;
        Sun, 20 Sep 2026 13:16:29 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-487244608a3sm16480146f8f.8.2026.09.20.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 13:16:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 20 Sep 2026 22:16:18 +0200
Subject: [PATCH] mtd: nand: qpic_common: drop stray empty line from struct
 'bam_transaction'
MIME-Version: 1.0
Message-Id: <20260920-qpic_common-drop-empty-line-v1-1-fd5f241e314a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqDMBAA0KvIrB0YAzXEq0iRmkzrgPk0kVIR7
 25w+TbvgMJZuMDQHJD5J0ViqOjaBuzyCh9GcdWgSPVkFOE3iZ1s9D4GdDkmZJ+2HVcJjDORnh3
 rh+kU1CFlfsv/3sfneV7mFigfbQAAAA==
X-Change-ID: 20260920-qpic_common-drop-empty-line-b007bde75912
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_131632_151808_1D9FC618 
X-CRM114-Status: UNSURE (   9.72  )
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

Drop a superfluous empty line from the end of the 'bam_positions'
structure group within the 'bam_transaction' structure.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 include/linux/mtd/nand-qpic-common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 437448995187..0f40964eefe7 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -262,7 +262,6 @@ struct bam_transaction {
 		u32 tx_sgl_start;
 		u32 rx_sgl_pos;
 		u32 rx_sgl_start;
-
 	);
 };
 

---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260920-qpic_common-drop-empty-line-b007bde75912

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
