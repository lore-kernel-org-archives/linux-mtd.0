Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A084C48260
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 20:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUP9/UWuRSbedv0IgjXVNu4xiTemLyvRBgOtimFWIKc=; b=K6Miv3U0cWHN+E
	rN5feCt/80KS0I62ZklrOtckGzIgKO/5IKY7WzxQ/vyS/BB3wneUboDd0tA9A9TR85nnzronVRMOR
	mYwQp2DeuUHTNwNhSzXzci06ho53QnGGzU7TugN5tMBII51FXz1CUIXy1D6SA5e3FwEfLhdxzyo01
	ChbOwYLYwmE8LyM1Pd5OCm8oNX2lHV2K4COyChEkuA1fY1a8aWcrxdEnC5LhsbX65i616na67JagS
	MnNPShM94cEXrIG82b0gzMtSX3A+8SvIpl93TG7LSrwcF64fEolwixC46vziRKm8e8sFGiow3skiG
	6ymzNMglbX1PbIGivsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5uh-00000001h8P-1p1z;
	Thu, 25 Jan 2024 20:01:27 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5uc-00000001h3r-0iiN
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 20:01:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a2e633c5365so193723266b.1
        for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2024 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1706212878; x=1706817678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ0g29wlAAYawG7enqb5FROZ6lIs9rjJ1HjxjPIRBr4=;
        b=M7qchn50YnzUfk4zdgfozASJZirZhB7OmmiDtDyj6BdzohR7JyOLoEyD2mxUn2Fwv/
         vaWKfOfoj5+HLbI6EEvc2a7dE9+9yL0L9AeLib2FOBd0zN8Qt0SzebEGVLZgTZ4blY+6
         kWZJS92Gj/807NU7lLVdcy3GxoKcl2+JJmRXTFc2rH7NhsBjRpwHR+X8yBt19Iu12o9M
         DGPhdMZ9eSgiJSEl7ODr5HrLf3kZFHJvMnv/GR21RUCJQYv7G+L5Ka9sigx8oB6UErIy
         p/0MOczfWz5jPORSYD+h70HrIX88CBYYgxjqteZ5TjrMXAXluzEWsumUtwIzrYTqoWjS
         hKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706212878; x=1706817678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ0g29wlAAYawG7enqb5FROZ6lIs9rjJ1HjxjPIRBr4=;
        b=dD2on4GKvG/JnMUUWSm0TWWW/14kaJpU7EsjK5s/hpxAxffnVWE5EQ3ADNrdtEcYCJ
         Q+Crek9ccAQ07YTvL3AGIuJjklBj4GVi0bUnR+8g3y9RMqQ+5YFttHIthU+uF4lPkcdP
         kznllpKHNc0o58jP4D8L5/plDXWBCuDGRxQyWN8ihwVK2tvrlnxpvH7jGKszuXOOhwQX
         5N21J/GNVIq2MjfF0asBe97z4gY7QOGcT+Z3ma7/9h63D0ZxjtKItAVdfxr0VRw1qOW7
         oW70k9i86Qy+QUNhyjhlZHU793o9bgdLnTYDKJQpwh7mKXv7FxpQPxBM/3nxLV9PN4JS
         Rtqg==
X-Gm-Message-State: AOJu0Yynpd/ws+W/aJlC9j7RCUVuvYBC1f8vZaUMTKB6EaA6Cw6XpFuM
	cBqnoiCEdT0B1cD/1eq5clweK9RtR64JQHijS/GKYaJBLZ+tchZYYxSz46iFVBwjuQDuE9HUg1L
	p
X-Google-Smtp-Source: AGHT+IHqVYL/lJVL7JEAq3szsDoY8tNhXCz0ekp9lxwVygOHTiAaO1z5D4lST0SmwVn/brdSUyzCLQ==
X-Received: by 2002:a17:907:7da5:b0:a31:1d58:262c with SMTP id oz37-20020a1709077da500b00a311d58262cmr170599ejc.5.1706212878670;
        Thu, 25 Jan 2024 12:01:18 -0800 (PST)
Received: from pikachu.. ([105.225.45.176])
        by smtp.gmail.com with ESMTPSA id ss17-20020a170907c01100b00a3496fa1f7fsm195577ejc.91.2024.01.25.12.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 12:01:18 -0800 (PST)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: spinand: Add support for 5-byte IDs
Date: Thu, 25 Jan 2024 22:01:07 +0200
Message-ID: <20240125200108.24374-2-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125200108.24374-1-ezra@easyb.ch>
References: <20240125200108.24374-1-ezra@easyb.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_120122_348300_7E85A584 
X-CRM114-Status: GOOD (  13.72  )
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

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

E.g. ESMT chips will return an identification code with a length of 5
bytes. In order to prevent ambiguity, flash chips would actually need to
return IDs that are up to 17 or more bytes long due to JEDEC's
continuation scheme. I understand that if a manufacturer ID is located
in bank N of JEDEC's database (there are currently 16 banks), N - 1
continuation codes (7Fh) need to be added to the identification code
(comprising of manufacturer ID and device ID). However, most flash chip
manufacturers don't seem to implement this (correctly).

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
 include/linux/mtd/spinand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index badb4c1ac079..5c19ead60499 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -169,7 +169,7 @@
 struct spinand_op;
 struct spinand_device;
 
-#define SPINAND_MAX_ID_LEN	4
+#define SPINAND_MAX_ID_LEN	5
 /*
  * For erase, write and read operation, we got the following timings :
  * tBERS (erase) 1ms to 4ms
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
