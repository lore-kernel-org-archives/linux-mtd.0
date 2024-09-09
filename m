Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4B8E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXETe1oiOm0PXz+gh/bTKaBFmJB3Vl2yoGMOYK0N+lg=; b=Exkxwt9T9arK9d
	R6N3fckBA9E/WiZpmMYS0WVs7bFRE1dpI0LMAi1hDI5gvNHiqadI8JOB/mk6ml1HBZPqIdkWWaoGk
	njmyt55K32r9YxCMA6AnbhiJpT5TUDRG4A3OkOnYvRO2ibyzpPFx8ghJgYG8UaJcO+aN1vFI0JUI8
	iIqH7+GVoDL1pUFUFxbgGcH5hQJjcJnurhcJyQKt96uua9vjDFvX/MtUBHXfubjrKcl/wCs9TC0f4
	vBwJ0WOxtKs3MejZeF4iewWM4W/8Chd+RBSBkpCXFgvKNSyN1UTx1IEMptOekfL+EAShXHCzRq9DG
	RPTpKALjDlDJLai7nbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGt-00000000wNA-3Sxl;
	Mon, 09 Sep 2024 07:57:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGj-00000000wBm-0e25
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=; b=LLoUd7aToAtGFgf/m6q0/qnYK/
	+2bd1TDhoXQ6pZz4deD5hHtlWsahu//73ywqf1SJ74OzM2+bGflL7bBGqKXq/6ttSlR1nVAMVy3ZW
	RhQWXVUjjNyDZv/pvSbSTM1TyMOEDO0fi2TYFJ/8sjC0iIxTLELAEQWM7jrkTgv9UO+P++Irp4MsL
	P3JYsiYhhi1uxRfh9+I+QhtbVqPkiZlmhTlzQNUfxcBABTmHdMC2N2y+QJVi9sPbUUyP/eCW/9250
	L6rz16jZJ6p1jOGwkYnmGXDviza6ayV3RUFIaFSnkMPhmaiBNMP7tJ0rNa3v5vrF4u+UB0bOG+/Cx
	yYziloyw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZGg-00000000LPC-02vD
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so35806625e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868619; x=1726473419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
        b=VZLQNJTFDQLWQPKX0dI3XKflsNftdxFheSYYmeiZqmE0u9G3f3CPN3UwaLii13bKqk
         vNYfPTHyvU9l4HqWjuHmLcygXKvPnKIXb2AOljkyDoRRyBkZTiuy1c2R4ZeKW4hzmzJv
         bIJJgJUd+64qv9+O86w+4MZ1hbqb9YGDe9J43bHPKm8qXCVplRMxWaciksxEr9gANuYW
         kNAVRP0pAYa45g1srdprlWy3JfjH8n+4OgEh/LT0JU6QrSmGN1CowHOtnTZJDq0myz4d
         F/kBMPoKDElDFxyLfx3RTezkRKUJ25TxO0ovXaK/QL+ps5CDBdWG8qZaIeUjsxyNZL3E
         vf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868619; x=1726473419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
        b=Qg5cokyo0g0mkmW0DMDbuJP7bIDKzKD/Qb6n5YIeochGJieU6i3J/L6UHwB/Lb22cX
         MVVaFrGlzRZl9DqaqIHNKL/ubivxc4Pm5WnLzHw4loNt3vVUtXmm0IQq2VS2YGt7FlTx
         W8J9tS9Rrc6QXqvua4qhWU/XfXGrThahTJ4xh+Xzi4hvC70Nv/Ma6JYlALG3umkJoUbN
         PRlufIHHHq96y03yHrR1jZbr+Ku1O49diSc55Xoh2h3DoagEB8HU8U6tSReRIh2EVWrn
         A0sdmXYA2ckQAdEzzk3Nzo7GxLviMNZrX+LQeZIQ/SAOwFopBGg6MwJE2mTo0IHQRN6Q
         65Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVrqCDU4ErRiY52cAkeAI5WWMYsdlaW0q5PIaqGX5m3BcyUrycXW3w+m3NngiN0DibLnuWiAIgXwDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHnGv9rNbkncvkqtcxHQV7gsXBnwxrmzMDmRHKB9ELI2+Kd3PC
	ZpTMek2RAOTwykw/Ti6Ag6g1ycEPlfFXOp9vkI3+JgKMKKgpdqLI
X-Google-Smtp-Source: AGHT+IFhnqv0adc/jPasshP9DFOYVF7kRZj6iEAk20wgpizKEHq4SVzWSg8dz/tDp3cddgfDjkxL9w==
X-Received: by 2002:adf:cd0d:0:b0:371:93eb:78a4 with SMTP id ffacd0b85a97d-378895c5b22mr6825835f8f.9.1725868619298;
        Mon, 09 Sep 2024 00:56:59 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:58 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH RESEND v2 08/19] scsi: libfcoe: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:51 +0200
Message-ID: <20240909075641.258968-9-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085702_211721_A65819D5 
X-CRM114-Status: GOOD (  11.35  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
---
 include/scsi/libfcoe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/scsi/libfcoe.h b/include/scsi/libfcoe.h
index 3c5899290aed..6616348e59b9 100644
--- a/include/scsi/libfcoe.h
+++ b/include/scsi/libfcoe.h
@@ -15,7 +15,7 @@
 #include <linux/skbuff.h>
 #include <linux/workqueue.h>
 #include <linux/local_lock.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <scsi/fc/fc_fcoe.h>
 #include <scsi/libfc.h>
 #include <scsi/fcoe_sysfs.h>
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
