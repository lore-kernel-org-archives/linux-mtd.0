Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C154DCD8C88
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jun 2026 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SvPp/wjHOLpxawBonwtid7DZtqcTQHxrf8vXY+oCQ+M=; b=F6XI3XjvJYKUYD
	UQcAf6/dVp9kO8Ezg6Z4SmFM84T8EuOSEd+srq5nI4C2oThVf7PqQVRRO44acM4PbCEkdFLt6cRtB
	P8cPqGYbMCF5gVFSkQr2WEeukwTWrVDvp/50t4EGuR9/Fa8MMM9bzO9fTROCHSutjO4yAKzizNF+Q
	XDdCBGNF2UfzthRv7NuvKBwHZiGDXUaqwP9n5NArLrydOXHMCxRXD0iBQSQ7URoZqpnqSKNU5/Dxc
	hGKyUcCANw1lFqiJitzqAOcbsqz+ggjuzrt8H5nMQsMOjqsRReTHIB9UQZR9I5fWTS7uOF/oWMDOP
	Lkjx4rweoj7GSGGJnMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxcf-00000001oFy-1Q9u;
	Sat, 06 Jun 2026 20:28:01 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxcd-00000001oFR-0XSz
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jun 2026 20:28:00 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxcb-007NWk-Fr; Sat, 06 Jun 2026 22:27:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=BqSj6sMMJtBKls1RZgnD1Em19FvNQq+nxXs2VMR7HV8=; b=IjHIrl
	XnoRoXcw9sXk0XizwbMyE0ZQeMZv4ohY60FUYhp5VkSFcJ+kD1V7GLPpviM+ss4nH0tjXD2M/My9H
	9xLEhY6Jp7VXULNQOyOTvn1r6pPRMQWJAz8gFiFnaagrtcplEMyoOQnhvM+Jmg6YJpH8reSgLY1C3
	9iECS6azYsDtQ7HQx30M1nDbqhU0E7EaneSdGeTfP4nTgkvnAn/6tmbzMg5xGX2YS/sIBlfjxzXvv
	1mdf+tLr+GJyqSN63DMYsJDVDAYkmnZirhv4JOfZJ3ir32mQqMqtBhMTrP6sEYU+2I5hyzOfVZMCi
	xaOvpnWsogZ386o2R4v2KQ76xShA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxca-0000vl-W5; Sat, 06 Jun 2026 22:27:57 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wVxcU-006elj-1q;
	Sat, 06 Jun 2026 22:27:50 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/mtd/devices/phram: Replace strnlen() strcpy() pair with strscpy()
Date: Sat,  6 Jun 2026 21:27:40 +0100
Message-Id: <20260606202744.5113-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_132759_175046_0E5414DD 
X-CRM114-Status: GOOD (  12.96  )
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

From: David Laight <david.laight.linux@gmail.com>

Use the result of strscpy() for the overflow check.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
This is one of a group of patches that remove potentially unbounded
strcpy() calls.

They are mostly replaced by strscpy() or, when strlen() has just been
called, with memcpy() (usually including the '\0').

Calls with copy string literals into arrays are left unchanged.
They are safe and easily detected as such.

The changes were made by getting the compiler to detect the calls and
then fixing the code by hand.

Note that all the changes are only compile tested.

Some Makefiles were changed to allow files to contain strcpy().
As well as 'difficult to fix' files, this included 'show' functions
as they really need to use sysfs_emit() or seq_printf().

All the patches are being sent individually to avoid very long cc lists.
Apologies for the terse commit messages and likely unexpected tags.
(There are about 100 patches in total.)

 drivers/mtd/devices/phram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..7025d9bf5929 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -268,10 +268,8 @@ static int phram_setup(const char *val)
 	uint32_t rem;
 	int i, ret;
 
-	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
+	if (strscpy(buf, val) < 0)
 		parse_err("parameter too long\n");
-
-	strcpy(str, val);
 	kill_final_newline(str);
 
 	for (i = 0; i < 4; i++)
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
