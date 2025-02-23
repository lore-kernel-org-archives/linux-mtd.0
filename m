Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE829C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ror6NNlzWxvDTHtbK8sYpnrCbVxlqAuOl4me2AqkwII=; b=1JzmcXT/nb5f7p
	7D/IKUXGT0Tci05VDeMM+GnGCHEKpryPpGYa5Ifc0KaKdWuYZOOTiBbRdPetF0A7TS7pa/kIR1k6N
	A5P/rq1XxOzJwyoqB4M5avToYEIaPkmJjTa3fWXKbfQ5sIc0yCIlXd+9lhrIT5vJr7SUz8g/l1TZx
	aMYv483vUxMBrvcIrupLXJtv7Hi+3o6FuowpBxKBGnMr557abC6bUsbOfFA8cp5eBP9Cyb0qbTu2h
	krWaDTuGs1ZMsVYutZD8pWLNNXXu6mS62SlWkyecZb9q74LKap0Y7OR5qb3e9TJWzW+sNwgPLnTFh
	od/rPdZhNKlx+UTNa8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5Q-0000000BQ7C-1Ea4;
	Sun, 23 Feb 2025 16:44:12 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5O-0000000BQ61-0ivB
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:44:11 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so7380184a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329049; x=1740933849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hjFHt0d5k578dEe7TlBSwZUIRnR5xMHf3Vffd2Ioq0=;
        b=EJbU0L9Nz3F8aRhV8Bm8b0H0fD0WhGAuAo1rwC74sUfE93axd2NiFLYo/VRfyGDUTH
         LnwOLvnww5nGtjGzmnjrR59Plg0NUh0VwnKMLXAotyJIRyXeIaAYGaxjM/FFUXw4Se7N
         kEPPthUgXvSkTI13vn0zWbo6mOPk2Ac3JhmW9afUGcAYKoc0o/Zfu1h+HF6IPcyUwiQ9
         XMaXjrmV5MiMXsGP+pdvZgAztnzpApPPWssD+dDxEjwy6+SY7tmhmmeRiRwMhU4reutF
         62aLnAiGIvARrtB+TRnkCY/SpZmFuRNvFH+t3xzvzx/Cl7f8MODP9FtpWnmwMX5gCVmK
         U+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329049; x=1740933849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hjFHt0d5k578dEe7TlBSwZUIRnR5xMHf3Vffd2Ioq0=;
        b=T8T0+vqakenmm9eFYcFNT3O22hLUu70iTBPK4E7n8Kmsuq0k72KeIMg6KWb1lPidNL
         c70ZK8c0GUzq28pIB3Sl9qU+PZ+/ZHJkxb+k6JOFenN9B0+Z6xRd2V+ym97Ki2fJHTiv
         bbJ9IQgvJXSmdF/js4XWGikQhomWJ2NyIT9SGMb3ULY85xj7JA68DYqHfDqCoIfEbLH8
         B2SDXwqoWtH0FamlArr5PElhGcsHNI2od2w+mejQVlujve43p4eMWZyu363qideEMFkX
         CfrAlvEWj6E25T/fbIAX6fkKXoPVYPwERMKPduEZjRtY9hKKN3NFXayjRNXh8UkcseK8
         rRjg==
X-Forwarded-Encrypted: i=1; AJvYcCWR8rszqcUguljVcz9s+F9K0Nohy8Zf/IrcXcE7nNuhyXbqZsJn3AvU6axC90IHGDkt4BnjC8E6wUE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyoL2kDtGU2lwWhBxI++lfiCbtLrqYFuBqP104vYkd90SEzsms
	aG/YeJO9U7KJnXdKU0csq6V72WZJudtFQf1UhOzHkuXUFfBr6Vs2
X-Gm-Gg: ASbGncvDPR890ANVuUO0GLNh9IIXEUMiM04w2fN4s5G27Adn7G03764iajEXXL4Ht5Z
	lkcVTC27K4/3MDUCYacxWtfb7liGH4ZknkpXo12z93U8GcXq6xscPc2pqR2vu1RD++OZ6tQBs9v
	wEQsy0wS6fMHXKmUycTcNhKG+U7p0R1CyUILWU+KvuNO8CT/1sz54I5fbWLh6/xLc0Bfu6jtyo+
	n1eXAdkvHUXhNcmsZH7+4u/4LvUT/bid4W5Bqjne0W3iHYBSVj5ndbnTK1jgUhomDDu59i2c2rR
	mM8BNXClb/Rr78Oq2LnsKrScj9JDkgUWebzmVDKYrCYy7WaHHoFlRKXq
X-Google-Smtp-Source: AGHT+IGfwHShsfiPT7dt9SjKmid9dTaP6+iTVws9nn060cC+xpKYlrmp1TQEmd1LFjVUXo+AvslnXQ==
X-Received: by 2002:a17:90b:4f4e:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-2fce86adf4emr17900240a91.10.1740329049260;
        Sun, 23 Feb 2025 08:44:09 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:08 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 07/17] serial: max3100: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:07 +0800
Message-Id: <20250223164217.2139331-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084410_213158_A19B83FD 
X-CRM114-Status: UNSURE (   9.55  )
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..f5c487bdc56a 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ (parity8(c));
 	return parity;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
