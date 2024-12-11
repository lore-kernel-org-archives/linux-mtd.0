Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5803E7717D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2024 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sKQszCLKMDl4UMXavnSS84SgU0NBPy+hfnIzUF19+b4=; b=qnRMLSOI7Csns2
	n3iEG70l7d05YTkc37SGhbFVfWObJZSgGPYxMC7SC40HvvH8mw7E78xhR2ZcTW+NEjhoqDuFgb6IB
	nxUxcEI7TuUEH0Z2viufxbzvlHslzINfuUbt59Kye1Z0zWSOElp62dq8oifahDW+CVZL81JwVAYoB
	frTxfjMUBJ7hvTrIJ7vY1G6SKy/FnGtu5K7aEhWAGqfbKvudYhnYu6VsJSawk713woAHmA0r8BCin
	JXJPAQ7I+lNjzDXKn4QeR64t5E7PPcfm7ZhEhpxyZeg76FJN1D4zlLj3Aos4O9fBdC9fwbAkj3bEN
	WDQFIb4/DvzJ1Ql9GewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNJp-0000000F54b-278M;
	Wed, 11 Dec 2024 14:04:01 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNJn-0000000F53x-28xL
	for linux-mtd@lists.infradead.org;
	Wed, 11 Dec 2024 14:04:00 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3003e203acaso38244231fa.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2024 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733925837; x=1734530637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heheDaExrsNEt5cRfdySpaUkTohrZSl/r0NnehX+oL4=;
        b=ecVPdtnj4dpV00N7khIDSvHpWTeHRP68O/M+yP9YzSs4hsup1fSOx6UZKHC2g1dros
         5SicGEDH+7e+ko0Z28XBx/C+Fehc44jiwNeMc01CG0JOqASg3SllThDQget6tgvQri8G
         AWWMw1avIWbMc4Sbq5SpwE1aKPOPzu8Zd5xiXhQRDo3K3TwX3jvxgZZQwyUgju/gqVLs
         rDade6CarNj4pKxnh3MJWURqxn5RwK1C1LixXzGRj7tfBPsJXoCtN1gj/V/sPgx+JK6j
         iD84mEp5q4u0jFZy07E+qBiNnF+r5lEcE165jbkgXy8LocphaUkUTbEh4d6jGhiR7NPf
         X0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925837; x=1734530637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heheDaExrsNEt5cRfdySpaUkTohrZSl/r0NnehX+oL4=;
        b=Pe6qBThn/hHDprpk16n6KuBeZDr469vQUCV8cEZS9QhGr3bmPQVjSBK98TId0BzUar
         Z3CBi2JwafJ5q/dQ18Hsv2IsqMfzrLA56JcZSBHiCb7Dp6rPdLbJhQyU6V0bUAdKRyd+
         frEVGCddryO0o1w+6/NjJoegozL6nfhaqZBruOFQ9lilfk1qT4izarg9LaTFWhX+s1RT
         ZBRIw48Obt80uX2Hob5RH6xFEauPDHlquAvOlcMer/X2WOYYfFYScPTdCtRQ9wsA8sLj
         y1PzkIztsfYnu6opsJ441PeILbl/tPtu88+cusv64LXA6zvwtppMjbWwv7xPh5H8FBqi
         pCiw==
X-Gm-Message-State: AOJu0YywfJ7L7qRGvWv/h3WksgUszahBAgJwDLOFQCw0S8BzBV1qrkkg
	xvGA+PmCJvaeF4U5e+tX/GimdWemsW5hKNEsDNBc6dx7cLwDWmC1Htm1eAMeUhg=
X-Gm-Gg: ASbGnctBrksKBuIq4C4WkmPDLzzZjAvEDl4jR1Cn+xf6yzSwXVgSqzdZslxLA8Y80rV
	XUgwt43TyZM2lF6LarMhSDFOCBhhjr0goV5EewbfBVAqlVR1FagA80my3fMECH1Nkku4yKmFBBD
	WsnVB/ExivSyVplcukJ7BDqOl0xxk9Y1AeuuV5J87YWN6xKylbo1LjmIFni5WUlxtwm2v5VbWo8
	d5k16HYp0z8Y0AHKDB6b+hjl6dmh2pcaa8aoDjv3ugpWWebnHQr6i2/2VHQreGpJ3L+J8wt0P1n
	SZuyTmWqb1KHgDQ4dlOtmyJJOVWmI6wS/R1H
X-Google-Smtp-Source: AGHT+IFOz+fpMRNaew65ek5NDnJOA671YzQtwmnHRahtgZOgYOPskwJ5ZeWxIyy4X7IYx35LV781bw==
X-Received: by 2002:a05:6512:1302:b0:53d:f1cb:6266 with SMTP id 2adb3069b0e04-5402a5e81cdmr1001966e87.28.1733925836368;
        Wed, 11 Dec 2024 06:03:56 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f2307fdd2sm1364689e87.159.2024.12.11.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:03:55 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org,
	chengzhihao1@huawei.com
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] misc-utils: flash_erase: FIX integer overflow in flash_erase.c
Date: Wed, 11 Dec 2024 17:04:03 +0300
Message-Id: <20241211140403.1340141-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_060359_549793_4A4084B4 
X-CRM114-Status: GOOD (  11.42  )
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

Report of the static analyzer:
The value of an arithmetic expression 'eb_cnt * mtd.eb_size' is a subject to overflow because its operands are not cast to a larger data type before performing arithmetic

Corrections explained:
Added explicit casting of eb_cnt to long long in the condition 
if (eb_start == 0 && mtd.size == eb_cnt * mtd.eb_size) 
to ensure the multiplication is performed in a 64-bit context, 
preventing potential overflow for large values of eb_cnt and mtd.eb_size.
This ensures correct handling of devices with large block counts or block sizes.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 misc-utils/flash_erase.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index c6f6f66..78a3bd1 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -239,7 +239,7 @@ int main(int argc, char *argv[])
 	if (eb_cnt == 0)
 		eb_cnt = (mtd.size / mtd.eb_size) - eb_start;
 
-	if (eb_start == 0 && mtd.size == eb_cnt * mtd.eb_size)
+	if (eb_start == 0 && mtd.size == (long long)eb_cnt * mtd.eb_size)
 		erase_chip = true;
 
 	/* If MTD device may have bad eraseblocks,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
