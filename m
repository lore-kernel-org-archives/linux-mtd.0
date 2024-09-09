Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10669ECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXETe1oiOm0PXz+gh/bTKaBFmJB3Vl2yoGMOYK0N+lg=; b=Q+SJbPPafjWZUC
	Ri30SCanBFSUki7Z4pVN32tSMZFuzq2N5z9QRYiIDcux0EmGqhBDW9j1w9yWApeWZcbXP+4O6G5hf
	+Ju/0Mbq3m97ZypatLCJZ/kk1nS8rFFKpzU5lLF4B9ivtjzd2QmXxSgDgyENspy3iyS0A55rkOtxW
	/ZKcSQlOQsiyDp6ezM4a4yqX23hkxxcXcIR4Dfa5SkMj/opdr8iLA6ipjsmOpBGSBYCnc8OQtPgxx
	i9r28o8l4YmWM3jBG/6XBdEFsPyxJitDJBfBjSDXsYa1SlHrtDdXL7/PlVGFc7HAoFgEoySILaYu5
	/hyce8Tc1uBGOnyc6yUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZYN-000000011k7-3U1c;
	Mon, 09 Sep 2024 08:15:19 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVj-00000000jaB-471M
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:34 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so2573617f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865709; x=1726470509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
        b=FbrBH2TlTQCz69f95h+vc7uWA01Rpwibivs1rc07pIyvswyznKujeheWmqudsfWUPC
         NgtDJ4YorUomY1rMnf238ScvWY/vvnleQxIZs7IjKvRJ8fm4VaM3z7r6nGD4urQyVbNF
         +/GrWbL/biR0rKs6Ph7GudiHlXOcC+UCBaPVdmWW8BuxPzC442Odt8XJj4ex+s4+/QlF
         jV2woCyY29xe2bAbb4NoDQO3HCZBpTXBMWFzd8p2yLXgsA2uYcSS8fWHh08mLEPsuppZ
         DZctWzdABbaiuiUDMDZidWTpJJNBFxrCU60IHL1HWk9ir8+djktvTMI0Iw3fL9ZeuELH
         TZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865709; x=1726470509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
        b=GJz8cRORd0fjB70uSxGNXAqgrzWURqHSftw9Fhnbr/zXiJRm8b2fCXmnTu2rPXVhHb
         ywRqnKALYTHhPUxgSAfWjVfK5ufY7B9j1LQkKFRdKpuIM/OZsAzq4CZv5AAKbbbw3z1U
         K8M7C+gJu/ba14bGpDwyXGvl3zL3Zf43t3mURlMxG3sz/fld6A62ldtb2usksv0rW9O6
         iznkJZcrrINODzn8I9wE1+hyXJYJzRw5tEBtebYzSGB1Rha6/kwQzQw5v5bkG+phpyoW
         ZSoS7SOvARG0Lsvy4a2Ykoi7CjpyOXJzvOZuizhkbdWZ/N8wd+2UZBl/rXPI8LN2Tr7R
         RPNw==
X-Forwarded-Encrypted: i=1; AJvYcCUplyj86y7CTZ7wRUvL/r62sEVZoELJxv9QywcFrQv4Y+WYomwowmdDxAo+eLbCfd/07+WxOSgl46A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxM6HvL1lYaAnLIh5V0AgczP+Va8pbWvf5zEYuXHgPlFljr+aKq
	buU6PYuhyP3SxXPiLBbv8GzsiBUqe/08VTEF7Wiz1+qb+CIDnDEtBmYR6P6fNiQ=
X-Google-Smtp-Source: AGHT+IE4gYqw+4rBd+cHrezcNoH0ZCL4/TV7eTgB/uDbDVBwGdbv1e6X9shSKYPEa98NPjsJYgGg4g==
X-Received: by 2002:adf:e544:0:b0:368:445e:91cc with SMTP id ffacd0b85a97d-378895c9deemr7165822f8f.21.1725865709459;
        Mon, 09 Sep 2024 00:08:29 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:28 -0700 (PDT)
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
	kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 08/19] scsi: libfcoe: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:22 +0200
Message-ID: <20240909070742.75425-9-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000832_384564_679AFFE7 
X-CRM114-Status: GOOD (  11.33  )
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
