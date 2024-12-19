Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B465E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tB6REse9P+ukOih6bQbO9wNwIN70YbpgSupfO7mXswI=; b=Zs8Dgcqs1E8Id1
	jeBScEwuZiJUxglKdb8wptjOnjgeh43db2BKyDwvkC05V0ncIP9Dit4fJwV9N0ZSfBXxaHhIySQWJ
	EwvzgOfzTWK6UI/JJ3NmDqlMmPk+B1P4FrjkSrhPuDi6eRTKuv7m43x72XYPjIN6kX736Tl8oyKRn
	7ujE5PG7lHkIP/0kcLqslmKk5DzwzZ64HqJ54tbJ9hT2ctNxWbQoesSKS7ewkO4OpLJgw2H15as7e
	95Lrz+W+vQ48E5g0U6K6kT0NAxomWCUBtsNVEM7C6Wtdx9eoQV22HE07zDZdKOzWbhjLiEXgYtsY3
	B311QJ4c0mmKWXOyrIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF1K-00000001hqo-1JZc;
	Thu, 19 Dec 2024 11:48:46 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF1H-00000001hpr-37ch
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 11:48:44 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53e3a90336eso658209e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 03:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734608921; x=1735213721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARNrUufiP2DHZ92V4RFuQjPr/w8nSU4R7BF6TS3qxvQ=;
        b=e8WJnCa/gq1CFirGagUGIdURmCEGiv/86pvKsNGuAHuetT47SHLEgZb+Et1sRghzeU
         FZWj14fSHekMoVYD8V08Obk4weiA8IOPrEfxysJC1M5eeT8o3HZS1+J13bA46dWggOtv
         DDoCaTPSy8Mfr8AIt/256qwyk56gHj6is7p5QBLI/FyQpjGoBQKyOP8GXed6iPvqUnhi
         liNefCUCo8LoO4Tvr+RCNt5i+/TwTkCYXRu2uVa/ZBqvazyEbYc+Sq5JjEoC1K+sJ5wY
         kgGvSQW3xKLBqoV6ZEusuh97aYxi6GZ754fY3PT/P6TLS40FqSHqz6jE6hs5ewVqZiYb
         oakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734608921; x=1735213721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARNrUufiP2DHZ92V4RFuQjPr/w8nSU4R7BF6TS3qxvQ=;
        b=i3zFeekVLptoy3OvCDfnFWQOunnjXV08lXrlKgftLNu3lcn4eF6U2cw0HLxnmGHfqK
         bXySCckQcBRw9DrDzw7eIwYsuePoHEsqu7tCXC0BbXuCqdCbu9GBwkruvpaHd5MERmpl
         wVQrI37J12R/PFG0qlB4OpcPk0RgXB97uaLWHNKOq1V/jOfwspeI71HbTq0JF2Bgj4H7
         GIluVxbhLpPvRfavqg4wIfV1TEmblin+sMhKp5+6+UJPhZ4ml8ixWWB+sXDn6z09v+Sn
         KDp1wnePOA/NsAkCMoB/68zNT1UwWrGxBt3DQhRx5IZFHA4LFwEYv6oRiLbRitI8aI68
         i7yg==
X-Forwarded-Encrypted: i=1; AJvYcCUCabrCd/xSET9nrTn6H+UH2FKA9LyS9+HEZbiL1Z4azm5/+TI09BtjZdxzRBWnf2gBb7i2AqdGu3E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi0A87nlT1AeAUnUMSnk+lW253ub7uoF63PgnG4wiA8UkUHrBA
	px+RTRYsmreEV5lCCFlPaffZcOPNm/C+3jRxvS9h94fWcK0jqyO/
X-Gm-Gg: ASbGncu0jq/qlPMdDDPSEHywwJcYfIFsolI0NuyJ0kPKSAwd+00lpe3jwqGLmpgK7GS
	2wwjXVtfOixamN6K+B9NfF+CsD7GfWqgidf+RDat6S3u/VOeA2tjQD7Lbi+VIQG1ltmcIHO1OgF
	A43SmDRcrKbFJcDNE9P/eVa+iE9DZ/yAC4/JJ5mApbrw3fR8e9yjI35WJP9bxxPaLd5A3qktU9p
	e8Y1V70ixadl5oOSUiEpSHdX8y2DGFKieHdzjk7rul53FONDPkRsIVvx/6jGDolU3YIP8pYp3/H
	eUVAtvME5bBn6yT2oYD9vbMPgDpLC6JKT14MexVZ
X-Google-Smtp-Source: AGHT+IGNre/tZz2lYkknWP/PSC5ELXicRXgqCTbwCCq/gBPN1ByG/PmaBw/mOfNY9SWS+9iZLOSKXg==
X-Received: by 2002:a05:6512:b89:b0:540:1fd9:b634 with SMTP id 2adb3069b0e04-541ed90265cmr2250634e87.34.1734608920990;
        Thu, 19 Dec 2024 03:48:40 -0800 (PST)
Received: from astra-student.sarov.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235fed7asm148185e87.61.2024.12.19.03.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:48:39 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] misc-utils: fix integer overflow in ftl_check.c
Date: Thu, 19 Dec 2024 14:49:00 +0300
Message-Id: <20241219114900.695819-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_034843_778782_273C9558 
X-CRM114-Status: GOOD (  11.75  )
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
An integer overflow may occur due to arithmetic operation (multiplication) between variable 'nbam' and value '4' of 'sizeof(u_int)', when 'nbam' is in range 

Corrections explained:
Avoid arithmetic overflow that could cause an incorrect amount of memory to be allocated.
Handle memory allocation errors (malloc).
The code is robust and safe for large nbam values.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 misc-utils/ftl_check.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
index 5b2dae5..fe43a24 100644
--- a/misc-utils/ftl_check.c
+++ b/misc-utils/ftl_check.c
@@ -120,8 +120,17 @@ static void check_partition(int fd)
 
 	/* Create basic block allocation table for control blocks */
 	nbam = (mtd.erasesize >> hdr.BlockSize);
+	if (nbam > SIZE_MAX / sizeof(u_int)) {
+		fprintf(stderr, "Error: nbam value too large, potential overflow detected.\n");
+		free(bam);
+		return;
+	}
+
 	bam = malloc(nbam * sizeof(u_int));

+	if (!bam) {
+		perror("malloc failed");
+		return;
+	}
+
 	for (i = 0; i < le16_to_cpu(hdr.NumEraseUnits); i++) {
 		if (lseek(fd, (i << hdr.EraseUnitSize), SEEK_SET) == -1) {
 			perror("seek failed");
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
