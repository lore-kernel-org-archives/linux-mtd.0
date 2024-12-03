Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5274AE64AB3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jISUiqE6p3GMGuC0xtZzR6wOSWuU2Y9NGrvWTarZBck=; b=egMgOzDbTTd9uU
	KgMGrKWCH29niHk3m5VX/V4BgQpoM1/Dkh+/W3BCzHC0Zf7O8TYPOB6ER8auWrJgvXGFV1Os4VbP3
	CTREpWQUcqbPlpzI7TX30Ztr+of63qo5dv+8Maz+FW7VJQEuEMlv2Ehbwy0FwjvNh0wf9Uy3vNBeh
	7ihIVf9DLiYWX9bJ62OfWKibBb0TkR4IHXTpdxKgFQuR7YuEcPijQx3mMrog+78YniBEekwFQ3qe6
	m6YyFtDZw32QkmXaNNiEEZzxvoN5Dn4yX7ggSGXOkA2/OFRwx9+z2v//LK+knSDMPc5EtbHFUlFvO
	l3RcQRlvgaT6pQlG+1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIU4V-00000009oDn-1WqM;
	Tue, 03 Dec 2024 14:40:15 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIU4S-00000009oCb-20cK
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 14:40:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53df119675dso6845643e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2024 06:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733236810; x=1733841610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3Nr4XeB1CbtFa9bFEvuvgsDgOngGNQm3FTGU0CVoU4=;
        b=BOUNLFuHGGKFe3lBGHk0EcxHOkjytmJwpriqIQwS0u88wbjVer1NW7uftGsOXxqhW6
         AjRWC7yDX4+FbUc0zM8OMz5Iu61+2bRVwsCN9xn2GG762KUpbiEUfHvNfhXTNUniA4VK
         34Y/dwsaLJEm+oHsneVu+eFdcvd7H1N9em8BDgAyqoTrDXFicmtKZbkrnD7XBf+FkpX1
         fUx0TQJeNY8hC1OkohvCiaiseMTceNgyrlIULmBrrxvF7GpY6gmzWXl538QDRA1BMjki
         OnlRLZMBExDUJcNLqK2bGoOmnXLsqTPcmJK/fDJh9Po9paZnqg6vq8bsl2SX8Mcw5orw
         T+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733236810; x=1733841610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3Nr4XeB1CbtFa9bFEvuvgsDgOngGNQm3FTGU0CVoU4=;
        b=pEeDaLTcNGmEk6Es3wk9BLs/i3kEzTnvY3ZIoi+mfqMfaIGQTdZTigw+77AQ9wSGzP
         7Tft+jLJtjzXd+EeW2XPsTzbSkA46g7cKYS6tKhh5ZMiDEZ6o9bNTXPrLEqupz9uhcq3
         wK+bGPyc6ncoNx5t33anxTEfNx84ftHiwfAf8sAyZaCqibopJOWS0jg0XBqds3qwaZDB
         ultBa4H7akE57iGcJFSDh35SiLOOsd2TLf0IRGCETKAQXJNHaU/+5WI01gX/T6uO3n30
         T7S25+SphKzSLu8cP5LGfmhoF1FaU3+PUak6cBdpj+Hg/6cgdwZFlenlFvItvRRDMfUo
         WbOg==
X-Gm-Message-State: AOJu0YwR2IHDyZ7ofen+8zWhSzOwon1ZY+D5YnKaKevU7Rf3QqiaLLgy
	O17BLaf+Z89WQd8FibVCBkggHQT/dkzZS3zV0n8WgqIerUFCM7Rg2SoNYA==
X-Gm-Gg: ASbGncsmj4tbANV6S+/ndM6Kyxlp9ARVx+2w2DCEPrV5nzQBkeWzz8HzaPL4CjMUMXZ
	0xBBQS2jsyBC3eZdpkpUji7GpMo27fODoheKJFfC/+0/sJQ1vK2ba6THtajwPQwqHueH2efpX5m
	aa9gFq1Q0THPY77z9vIB7cUTAuG34zE1W5PZO0yvYL4SE+fWB7fldBVY/Ld08mELi6kOBknOlsd
	dk00pLNQMgPLLI1GWdmDYRyfBWQEqbrdtg+oziX9OyyjW1KVjDv9iUw1Vrp6dLnmAnKEFaXlhir
	J7Mq0kmrXmbOkbLs6DRP7rBNFOq8fI2R
X-Google-Smtp-Source: AGHT+IHRkUTW7rbf49dU52UsPPQtnYedl4yMaDH2QalzrbvS6UmlDYd2E1N4HhXairQZubX6q/bJzQ==
X-Received: by 2002:ac2:4e09:0:b0:53d:ed15:5ab6 with SMTP id 2adb3069b0e04-53e129ef4f5mr1844574e87.11.1733236809997;
        Tue, 03 Dec 2024 06:40:09 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6496ce9sm1853246e87.220.2024.12.03.06.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:40:08 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] FIX: NO_CAST.INTEGER_OVERFLOW in flash_erase.c
Date: Tue,  3 Dec 2024 17:40:15 +0300
Message-Id: <20241203144015.144533-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_064012_518583_0D735EC9 
X-CRM114-Status: GOOD (  12.42  )
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
Added explicit casting of eb_cnt to uint64_t in the condition 
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
index c6f6f66..36f8d57 100644
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
