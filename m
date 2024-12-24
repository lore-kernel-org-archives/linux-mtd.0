Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711D4E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 19:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V1lPKd3Xr6CAnlOto4rDJM37mfm6+0cLGOgSPBvbhPY=; b=OEAvl5i7SXrMBD
	v9UkgZVryPE5sXaWaHySuPWzd2EUKoQpV3RazT4/FMqKTvXDMLEmSO2PbvKGov36K2CDHF358MdA6
	5qTpogtG0nidX6ZWYzG7OfQ8fOOBx7OnbCXHrfFcCcfkC773KyUxQV2AKpnQ/AWwolndFZqdaTkCt
	MkEYfhqtAB5qjIM1lakQBTWITy72/Tvggn0Zb1yXl8w6OQRYz3ceQHnrTg37XtY8W+pFXhRRwT1qJ
	VrP5xkPQ8UZP4FzVrfc0aM6s9mwyb3k7ccUGkh6OSZWqSp1zfei3qZ5ZYmO9KShol3VWHMEeS8GPy
	FseiAMCr7fU43w5Tt4BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAlo-0000000CgWH-0Vf6;
	Tue, 24 Dec 2024 19:40:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAl1-0000000CgQR-3Qk7
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 19:39:56 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30036310158so48900131fa.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Dec 2024 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735069194; x=1735673994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60obxeVgekyo3TizgwHfVIyKp/6qPz0iiuoJK3TAe5w=;
        b=SAquFKSJZZV7A22RDSjmnrbf/TfnuuQdjJclQjlOcK+H2S2uGyxLRsv4q8REEmB6PU
         ZR5N7LV/3aQo036xSPMXU5wBQBEyFw/E8wCe2D12iUh1z5tImIj0ky4QAzw6AoMoF1WU
         KOD/0OjboHJwwQZVwgwwFjztPboFugVr/YK+2D8MZmDL6P5bu3LjSJ9Z6IgiDsZF5hLY
         898K29vo/h276yeZGP1B+jo2/gcgmL5z3U9Dy08WqYn06tBdqT42xKZ2nvyidmd2fjb4
         QtoovWgUwthn3dL/xsi9Ah7OErJS82obJ/2so4keYfY5FV/GdvyYejohzbvusD7MSEwr
         e3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735069194; x=1735673994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60obxeVgekyo3TizgwHfVIyKp/6qPz0iiuoJK3TAe5w=;
        b=GTlo2nkgoblR04alitT0zKmonVb4mEnPGi9mj8RVfe5GIYd7CQ9hUP/3MEwvMmqBmx
         zYQ3Vwwo9hualg+0vIixFk5Mi91D8LU/Y782PoFENbAjC+HlMcu8EAaAWIt6PbaSbGCJ
         XK9LvonT9TkHNqBDXTS2Hj1+FB/EZp24uqlzU8KQpcqW9rPcPGNEn3azz48EBBiGjFOf
         6KMpPqI6Km+pysf5Ap0Hk+Sh8xC/+gT4fxS61MgrWxSzP5mYOOkvEY00mepMu/HVTsoO
         HrFXVky5iKIwj5Rd+68d4twRNv1izACCpqfCpI8dSRseLICyrJflyRKzSlt0xKasPG+5
         YbVg==
X-Forwarded-Encrypted: i=1; AJvYcCX94x9u/zafVd48imk88CBjkJ0akv+3GXsC4QYzD+nd91tIu4jkfHF15N6CPJpav+uOIqd75JGcWV8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx47FWOGbjKp6B210Op4fwLBKW3QhW6m7ssxoR4m55AAaop3UfP
	mAKXaiQo5q9gf8r9/+Erhnbg5P8dSrzfCNvuTNdDjn0+5vljw5lGUD7U3O9o
X-Gm-Gg: ASbGncsjhrZvZ5FonhMdJeRP+pr/AqtH6QeBzqR1uVLhUaJdTWcG+H3K4lnQhF+WjuD
	3tbuDLoKWUULQiFFiUJ0Y3NhxftU+FPH4RQhaRaJJsr/c4mVyCFDzFXTSyNI7IwsXBMZVPYe4be
	bfH1qV8hPxbIULBculutjbKFEN1+4DhtA0hJF7Akk/lweCCQPI5jwL945/kmDwYvx3NQ+wwD7Lp
	TpiNNQd58/KPYl2nwH+yoRfSTl+mOlpJzM0F+f8I59F1ddoxB0sxN78G6+XC3axcVtS3m/cWDFs
	mUNEj9L8EbOeDzMZnmNGOkXmLl4UuSuNQAUHig==
X-Google-Smtp-Source: AGHT+IEQPaA96/yVrXiZ1+9IW+5UJ02xlDn7xKkzFAgbIAqSkmNNhCnDdH9kHqbPQgxBEaaxHzlAvg==
X-Received: by 2002:a05:6512:1241:b0:540:2ff1:309d with SMTP id 2adb3069b0e04-5422953c3famr6063393e87.34.1735069193343;
        Tue, 24 Dec 2024 11:39:53 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6245sm1642889e87.56.2024.12.24.11.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:39:51 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: FIX DIVISION BY ZERO in ubinize.c
Date: Tue, 24 Dec 2024 22:40:13 +0300
Message-Id: <20241224194013.145454-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_113955_886839_6E3D5C2D 
X-CRM114-Status: GOOD (  14.87  )
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
Variable vi->alignment, whose possible value set allows a zero value at ubinize.c:375, is used as a denominator at ubinize.c:410.

If you look at the code more closely, it will be clear that the vi->alignment parameter is obtained from an external file passed as a command line argument.

A check was also performed if you pass a test.ini file of the following type to the input:

[jffs2-volume]
mode=ubi
image=../jffs2.img
vol_id=1
vol_size=30MiB
vol_type=dynamic
vol_name=jffs2_volume
vol_flags=autoresize
vol_alignment=0

and execute the command:

./ubinize -o ubi.img -p 16KiB -m 512 -s 256 test.ini

we will get the result:

Floating point exception (core dumped)

Corrections explained:
Updated the validation logic for vi->alignment:
- Replaced the check for negative alignment (`vi->id < 0`) with a more comprehensive check for non-positive alignment (`vi->alignment <= 0`).
- Updated the corresponding error message to reflect the requirement for a positive volume alignment.
This ensures more robust validation and improves error clarity when invalid alignment values are encountered.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 ubi-utils/ubinize.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index ac8c1e5..9c950b1 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -375,8 +375,8 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
 	vi->alignment = iniparser_getint(args.dict, buf, -1);
 	if (vi->alignment == -1)
 		vi->alignment = 1;
-	else if (vi->id < 0)
-		return errmsg("negative volume alignment %d in section \"%s\"",
+	else if (vi->alignment <= 0)
+		return errmsg("not positive volume alignment %d in section \"%s\"",
 			      vi->alignment, sname);
 
 	verbose(args.verbose, "volume alignment: %d", vi->alignment);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
