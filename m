Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E903C021B8
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPGKfN/9yHPCOeCUulnKGgM1xhj3xRdBAsG7bfqJcjk=; b=EaL/QBrO1HSfwx
	VMBS/5mKTGbTQ3bQ3u62bem3e5+CEuuEjJex3VApC2/OARZj9Eo/hX29Lycr9tZRykck71wGw2H/9
	nCwLQgaLBta2LpphYAp16uHsAXWkN2Fz/mtoV4m59+1b9gkmAJ2x88pagIROKCJDVcgjSd57tOxO0
	Mhg7BEr2HLyhEzOE44fPrBa6OCNpJnSZ8ecIZOdRWz4FggTk3pmV3n7Az+8UO9R6RIYIJr04/CueS
	Yu8ebNlwjvPMmlgkzS8WhHscDnxPyWZShm4pnx6LO1nRakVU/D/9TpYgIaPrGS3gijDHjJ1pbmV8I
	P7qImSVNxBbuXJrTto7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNo9-0000000ESmp-33yR;
	Sat, 01 Mar 2025 14:27:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNo6-0000000ESkc-0C3t
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:27:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22113560c57so59390185ad.2
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839229; x=1741444029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=ielDNSdNGZHnzuxi1joREsBIVKwpsDldmeA9kPyzh6wOGyuFIjRPkmIMKCTisWWOT4
         zU61rk8TJ0/OYzRd8FU73yceJMcQFK2c/2XJplGWIAwzFDp80jUfKkPxjPIr30QSYdhn
         6+n9DQ877JyXp0aOqXJziAHS5pj7I2ZqY/ZM5HXKrerbHtPs6dkKlx+37BQoPij0eOy/
         5VUTIZyIGv2BpFK2gmqtLHSWHff82qe3GTaYIAVzPLXjPFA2Ks2SD5fhiQfP7m0DfSJg
         zI4+Diz1JxgE84P14udLjJazdgdlyH+eEs9AJP92llsvd+dLZ581PKNumUfscmvSyUU5
         hUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839229; x=1741444029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=pvWmlagkT/hF/dWXAUk51LKKhFszQCTjKQwW/NuRolHSTJUPix7PyY1AY6oBLQ2zW9
         mx2GBZIkdOgt00n9PxWZZBjpCp/h3jOkUJrUDjx6md7ia2W85FNM3Sv/LQrQdM4NZKYY
         yW4NU+WSNcz8NStKnEvdUfZcjtCm6bLUmLs0UX0Q8O2uPd3sD3USyJVXJOTcOhvWWH70
         Yi/cXMxfdb4flztqEuYZaO3WTYWZHkrCFy6zox4sLb4S0OoVFNL4dl2hzAxC/eOo/9vy
         gmYSFVcOzUVP6skaEOe3cq0esguQ4+o/LgJ0MmLNs0iPrGX50PFq/QDVPjREtDjfccqK
         NzlA==
X-Forwarded-Encrypted: i=1; AJvYcCXqJUNWWtTIZ/pXdxYXhGb76OZKX1495px6hNdTS4vmVA078u7GXpOwA8tyDm0e/JHA4JUWk91mK8E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk0wWffNYVoqUeT1MUF0hueZdrkr7xhJDrV2/BV4usXwzGe0FD
	L3Kxb+g0Av3jHvSZ2gxD8BdcI+YYul62YhB7/CeXG2RafCeo+Uwl
X-Gm-Gg: ASbGncuWl2XFAQlNrO/7iugdjEvZ1Cfq1scnR4VT+/8gMRFGljmplWYVD9X4OTYFo0v
	NF2RGHDXFR7QvL68Y0jFGb13DQajoS7t4ffQpXuo8BqxCUGabbhhxwknUM6iczPFd/vVxJNIcWc
	VlnxcQDhaTKE+uu+wvnkExk7UnBpt28nITbX7DwSblWgT0W6dHbUSq33rehTNd6+c0Gp+VivWJ5
	LVdKq6eOjmKQSMdV1dGfV8Jne+D9KMsAf9cTm+Q+aGhE1fNN3wQ4E1/aBkeMW5p5WhTFo6YGrsa
	2up90xapd8MWgevsCa/WZEGTfbg2keRC688m36iN4RxebHldmcICj1X3guOkAaJlh9zPcqtJpyk
	=
X-Google-Smtp-Source: AGHT+IEWIU2a96xKy97Vw2OZbiqRo6ZsV5By1mOyMKGEerXJ25OnWhIdagB26u20PcByLRXKVw2xEw==
X-Received: by 2002:a17:903:32c8:b0:223:2744:cb32 with SMTP id d9443c01a7336-22368f732b3mr142906935ad.5.1740839229452;
        Sat, 01 Mar 2025 06:27:09 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:08 -0800 (PST)
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
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 11/18] wifi: brcm80211: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:02 +0800
Message-Id: <20250301142409.2513835-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062710_084357_C57B57CA 
X-CRM114-Status: UNSURE (   9.67  )
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..d1a1ecd97d42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,21 +284,6 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
 	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
