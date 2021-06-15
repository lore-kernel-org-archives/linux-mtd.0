Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE7EC48BE5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 22:50:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550306023E
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 22:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550306023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aQ20/H/4CZ5M8+//0snVpOobyHTN7q7+C0TcmaFIxg=; b=fJ+YyLe918RAyn
	cQabLfrwl/rrG+Yllt/6Zl0r84SmN6/YPgGKuN/H51S+WAWdX4xMgA2rBimXIsP82n8R5GGU85WTz
	I7/Ia38T7JetbtcCteSvHyf46GlMFF2J6bUQ5OVmHfxIzmplxQ7WWfHeHz6rI1UUaFDBkYqc2cbNb
	xeUI4o/c/Mq4V6iiPgIMtjiY1oZeZMFSZHdZolFgMjxO5MbNPqMdQWfJnFvWwZ5o/piqkj3XjyZGB
	7Aesx3NZOPcVA99k3y6k3SDuqQ7vaF4BoaP5jQMy09cEAhMdoWo0ct3CrE5aYMjwCEhYCnvYyUb2j
	deEhpolo+2Eg7N1Bx8zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHsc-003hDe-P1; Tue, 15 Jun 2021 22:49:59 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGUx-0036jU-Ob
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 21:21:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id h1so27498plt.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jun 2021 14:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=83yPG0EbFVr3SVh9NOBRiR0LGkMMFjPnxGPwEf0h9WU=;
 b=SJfhMTgBKkNck0DLHiyFQAMGBQiYJl9bmikbn+3Lp/t4d1oeBHwObQNlzZ0dOjAe0+
 RC5UWlZgE81S6saO0a2ztgFpvOJz1wFIl8BtV5rtghxD6cl081EJbKw9nJ6EEfQQt/o6
 DWerWeabH6YkpA3e0shmR+s/i9A8w39jLF7Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83yPG0EbFVr3SVh9NOBRiR0LGkMMFjPnxGPwEf0h9WU=;
 b=Vrxm0IDXisa6vUyXYgyKVVgKBzmr/0jkK8aDAngpX9/x0VOlBVtlZUDxYhbkoOIG/j
 dlnq3tZZ3Spe76DpbLiYIVSzNjZcmrGTFiPn0/tbdsf58A9niAdpl4/nSoizYRT6srie
 5RTwKYzab9t1462XPCpPi4ZwOUquczhVDb4baANt0Y7OloqEm3IMC2qJZVI9UpJCiJ/y
 2roSKvzVJ293/Otdpn++E8IC5AT03CzYnq4SDvRSzhaWBwPa1JRT8zMmxzZiX9vsGrf5
 sMAWBJ9yBd8VItg1tDwQHhLf/dP5geQsxZhFb1+1fx4GfT+j6w5M80VrI7exNqTER5jE
 QPgg==
X-Gm-Message-State: AOAM532MMMefQBFKsuWk7pRSSYufUljyxt40srzLM/lumYdThCoBH9Am
 j5Rl7YvVKI/yXIq2jP74649wfg==
X-Google-Smtp-Source: ABdhPJyOHvKXPd88U7Ng3kUR5Pe6gtsxiOBZKK/gSe0WnsnJvTx8JUA7RX5Hc+uDNGQLtnT3Xgv0Dg==
X-Received: by 2002:a17:90a:d483:: with SMTP id
 s3mr6958605pju.61.1623792086887; 
 Tue, 15 Jun 2021 14:21:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z9sm98105pfa.2.2021.06.15.14.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 14:21:24 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 1/4] pstore/blk: Improve failure reporting
Date: Tue, 15 Jun 2021 14:21:18 -0700
Message-Id: <20210615212121.1200820-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615212121.1200820-1-keescook@chromium.org>
References: <20210615212121.1200820-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=782d384d6486fe89f671933d300cdcc0b58915de;
 i=x+eth6WIY3ZV3RikljpGvsEDOkHC4+JR/D6VkOL4MwM=;
 m=KWKLltarrgCHVaChKkiXTTMXR+nWhEDb2yQ+7Fx0dy0=;
 p=Tg76lnQ+eXJOmzqDWYbfNJALp24lTAKgJm1/vS8S8JE=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDJGdAACgkQiXL039xtwCaQmhAAhER
 rf9rrrOC5Ufm5tSBzRs8WRgIklq6gyVFRzdiqk/xEzIN7j/qlXR56KeI6dCfskYhf8JGky/FBdnoX
 5YRfXX/ANRiZ/pA69pClLA2fYxM37EX7gqxYA6XmwgeIPGO+3w7mlZ9rxstLmg/7msVicK7+aDVsx
 tv3ufAl9Yp1pECdZ90FaFNWEdTw6+lmHYzmMqGiRfxr8Vg0cClO7kkAy6DObfCXqCsUaCp8tsjCFa
 P1ieQ+PGW3vNIxZci3zADPFWQz6/t8VkT3gFl9vUqHrtYtwpgBK0hcdlu0tHrPunU1bhkvR9J5aJA
 i3x5psdyNaV2E2KKXeq78irRPceNdQxbxpxrOpWqJrKa3kxyEHFlZe//HT2QfyXjrVI5uAAl1M5mu
 D189qXiSeS6UDh/Kr78HbJE9o0S1xAXaA9/mtRHLcZNC28dcTkzoqi4JRQKRGugZynGJyynWTsfUu
 4ajxovmObroq2UPfcj56fgIfOavfUmxiWWqfI21SIZ1WbrepKrcsD4YYLfMv9t/8kUpGanhyxTkVg
 xvVVyCOfA+ReUVgFidq/mFPM8xHPEkXa+zo0weOncXhAyBYO25ugYR6EgHkkukrrak0yoFgyZdkUe
 +4ZOhtYaDtANnr+eyj8qcSmr8FaC2gcxt+aR/NGq9ekIlbOqfNABgjj6aN93VczE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_142127_858242_03D7D972 
X-CRM114-Status: GOOD (  13.87  )
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

There was no feedback on bad registration attempts. Add details on the
failure cause.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 4bb8a344957a..91d7a848c85b 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -114,8 +114,19 @@ static int __register_pstore_device(struct pstore_device_info *dev)
 
 	lockdep_assert_held(&pstore_blk_lock);
 
-	if (!dev || !dev->total_size || !dev->read || !dev->write)
+	if (!dev || !dev->total_size || !dev->read || !dev->write) {
+		if (!dev)
+			pr_err("NULL device info\n");
+		else {
+			if (!dev->total_size)
+				pr_err("zero sized device\n");
+			if (!dev->read)
+				pr_err("no read handler for device\n");
+			if (!dev->write)
+				pr_err("no write handler for device\n");
+		}
 		return -EINVAL;
+	}
 
 	/* someone already registered before */
 	if (pstore_zone_info)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
