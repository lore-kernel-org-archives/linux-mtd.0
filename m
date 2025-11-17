Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FA6CEBF91
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O85bTrDJbzADLfhxcXNYAwnKVBa7HgWNbwDxfbWdGVA=; b=whXFIpypSCxvku
	9ZCTpStGrWCuBYdecvvPeDhtW9z4DGx7L9ek9Q+KYmdCU0HH+AHlkpAoJYd/sXMOlGi4nqhVwyJ7n
	metkUUqeJ1NaSDcsBA5dbUbPuI4J6F1SkzVUUa1u3PNtvvao6H8RoIMne+5/THaP7j7AmJibIiqK0
	ApvFcZNd4im213FqGenc2fDtenU632N7Ljpi3oncZNIthPCCnIqPamWnBVA2AQJVaYz6w9gHINdHQ
	esjg90f6ACedI0M5XQ6Q4FZLslP58puLziAKFEtXTifxn4P9fwDxIy212gqdOp7xA+q1g52zmfgUq
	Ri0622dTT/4dxGgl4sfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zz-0000000GyB0-0bYT;
	Mon, 17 Nov 2025 22:47:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zw-0000000Gy9M-3Afw
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 22:47:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so666763a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2025 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763419619; x=1764024419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZBEUgm+GfP83woXXSnlop5bPmXXmwitxEZB0Co3Scs=;
        b=BA2gUwo4S6nt4VCKQLHitdDL1q68/vWaBHDC+vyALtXRD6eYBQeSBalSbEEE3Epatj
         tnfbhrZqA5Mf5JeG+Qwnbkg7RfsAdILpKOkRRuMvubizzSzAAOKwYIxZ+xcNIVQnfIfV
         ccw3aKAZmiXwhOT4oYtIWF4Tr/vhjcMomOdJ0DvKJqdOwY6DF6AQqbIGFMfuPXcA923L
         3L5NRwKU4lb8WJY/icwQCQtvxW0JDKW+LsPGDV5N8Ax4Ipjr8bVsfOUbJRHZezLIvMYp
         H3BiOK27s+G1N1ExPHXyF9PlATiPPwTRLmQCuLwwjO6GMA/7lb19pv6boxhAQEZprvfL
         HpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763419619; x=1764024419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZBEUgm+GfP83woXXSnlop5bPmXXmwitxEZB0Co3Scs=;
        b=o/QHDJ910pwkGlKQgYPPNx5ZnpQUSfPlmSlM7zaK0OGaOx9fXyjjhzz2MEcxasBOwW
         sjibPDelZ7OAFxiOz9D5uvA3DOClvMzolLxVKWy3wSMRA0kF7emQtyyybgud2BB4Vw6/
         cz+fTzgLw0BIkJ1z+CVwWC84xpC2I3w6K4bpUPSndQtgc+eSvibxPbRNIFOFU3RYc347
         zLTGjFOMdNoAhUKejQ19d1B/RDDk0hrx/6TZmx7iwtn137HMQ49e+o9agT35UF4a6KnM
         wxGAtfIyKIGwnB987UjapPAH9GrVIudg016C1A/UmEtkqv1ZTd+6VSadvhoJQrcDipTX
         C7yw==
X-Forwarded-Encrypted: i=1; AJvYcCVsVsN+uOhzhqCVukDxARW/PTHgJrJRpszHtWEptOgx462tHniaFtrpkdDAT6/6iyqvP303TRruxc0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjiHLoaD4tbcrMTw4xxOdhehDCvh83hzlTv57wjSorv3g+TlZz
	oX8RWbREVWuJsvHEITb3dS6IkBt3Jfcw7hGYR8ZElljQhncfzaIk/fs=
X-Gm-Gg: ASbGnctPo6xyQkj6WEiqPhxTZRBCuldPS9kHdWDQjG7mXSAMLy88QGtxPk1Lun5HwY0
	jHynIZ8rVNQwvx/OZwU1mPLF3dd0ANJFayFLlWaBMiNGF2cmp9nroTL21jfGYLStuppqsgwOQ0b
	rUW/540IwWNX9Yo3ZoFqmq+0aVV7fqU4tBgivqwvYopRydtqmUr5aal8EkDY87eMNw4OAgZ3rNi
	SBjp26RKl1T5/w6SSZn25GfmWoji94AoPhrtlIeCGCAAenCt8DnG2GkKbP0cG1xS423NU+NQXm0
	p9mqScYL1TWTw9JcvQQZybiLi2mRRBQFrDq+eWBWxbwDKRg33cLKgUiqYpyZ1lwa13lxpmfUinV
	RuxzZiVTbcvOjfjoQgx1yyqbGW7jEt5nMPmo6LLGm632GOEvfq6a0Cr/CZ89K17gTLJivAJTaFD
	KyymcGzQYGlE63gWdvqAbiCRAkg0+bU+hP8GF7qmH2NJt2VPm3l6SMyjgV803b7Aw2iQ8J
X-Google-Smtp-Source: AGHT+IH+cYgqyvs7Qy6c3BSCmA/lPzyceCw0kIG0eoKMVO8g31/I9hU7/tJT0mouZCkwTjjQu1aLWw==
X-Received: by 2002:a05:6402:1eca:b0:640:c394:5c7 with SMTP id 4fb4d7f45d1cf-64350e2042dmr13039417a12.11.1763419618871;
        Mon, 17 Nov 2025 14:46:58 -0800 (PST)
Received: from localhost ([2a02:810d:4a94:b300:232f:6d66:f093:4e68])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6433a4cbd18sm11061900a12.35.2025.11.17.14.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 14:46:58 -0800 (PST)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>
Subject: [PATCH 3/3] mtd: maps: vmu-flash: Fix NULL pointer dereference in initialization
Date: Mon, 17 Nov 2025 23:44:08 +0100
Message-ID: <20251117224408.498449-4-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117224408.498449-1-fuchsfl@gmail.com>
References: <20251117224408.498449-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_144700_799241_72DDED14 
X-CRM114-Status: GOOD (  10.60  )
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

The mtd_info contains a struct device, which must be linked to its
parent. Without this, the initialization of the MTD fails with a NULL
pointer dereference.

Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
 drivers/mtd/maps/vmu-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index d0793f1b0fac..153ba6f8f769 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -547,6 +547,7 @@ static void vmu_queryblocks(struct mapleq *mq)
 	mpart->partition = card->partition;
 	mtd_cur->priv = mpart;
 	mtd_cur->owner = THIS_MODULE;
+	mtd_cur->dev.parent = &mdev->dev;
 
 	pcache = kzalloc(sizeof(struct vmu_cache), GFP_KERNEL);
 	if (!pcache)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
