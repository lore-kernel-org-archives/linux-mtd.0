Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33442C388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFEA1206DD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CEKH/IV6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="osHcwZSv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNe1UOeI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFEA1206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RlXXchyRQEZZcaZqSiooFaDc8K98hvNj5TPVnE7Pr3g=; b=CEKH/IV64hQfbC4Pa3AN18AUe
	9WGOUTCpZWLRNsVJmDO3JhNe1yok8YQ/AYCRPdrVAlkzxjHz92XuAAckZZ00oWiwff57FQisfhLnq
	R3MVAPbd9KTLUw0bjijbn51Jio+gLrEXiQg/wkkybadS+voisZ/x6Na/NRF965Qv4bBJo0zW4khOF
	jrFGx607bhLq/YloKTsQ1PNU2JkmmBgAia6igGQpAcP/mPzYelw4Lk1a9/e+iASbPYwhdv8iC49XZ
	rip6GfjzZmlbn+blM6ZvCOOKdrPSmXsIZUrMJd75+IxXJ12E3B+BXEes5+qMFQJCq0eUK8gdw7Ylc
	nBtZbxcAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYhN-00049B-Fm; Mon, 02 Nov 2020 12:12:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgv-0003p2-Jo
 for linux-mtd@merlin.infradead.org; Mon, 02 Nov 2020 12:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nWKR6uPZUpsHw9fLiQN+tCUhIOQtuUG869jNO4i86ZY=; b=osHcwZSvg8yRLGXW/8UfelNlr1
 o0vo4u5GchCJ2LYrz0hpHf6Q0koLv7VRWIragcS0C4YiYkaqYBq65cXZXcrrHHRGBca/1V51JzEsC
 K6UJJDxMxRajKAMuRoK6GUoj8N9rmV7USWn+phx8QfVXWirFj7gV6LYGlh7Z9xmrvyyLT2IwFCH5C
 yoZCFuPpdR8LUA+NynnvtHqMDtIkDbGlvMo7alHS+5q7QP+EUSpKdKR8gaaQBGgB2ZnzAE28vzfXd
 qMCl2C5oSy5Ump+xQnRnLFXpkan8In3eUMUJ8blm9mI/cuP9FS1L5XAi4qvqLphOCaW3M928YQBJW
 qL3mmozg==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPu-0004rR-QI
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:36 +0000
Received: by mail-wr1-x441.google.com with SMTP id x7so14269315wrl.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWKR6uPZUpsHw9fLiQN+tCUhIOQtuUG869jNO4i86ZY=;
 b=aNe1UOeICRZDUj51juIkYs9Lwny2RtCmIIYHfF7raPNXvUp+MR9f7l1orsbrnuxaBn
 dFgMO6Uhc31U97A4YcGg71hc16dSHtix2szsIu89S7KBiTHxbVGfwYZU9Ko6YZpfSFCJ
 p7CvZnBrY2uG+sttDlSxDClusnDUONxk97e/DOyn7SZnyks47+/lM5MDpnZKE3GxWQ0V
 Kud4XlPlwvuIrit0mxlFUmdtsg0i6TgJyECZ+C80K4aODQlYd8thsKFe9EnFstB3dY8z
 iKZY6uZHL2i5NmVfxneEW/j5oW9Oh2P31BgXBk0w/ily0GnbYDhw9NWIUgCg+y2EYBA4
 NamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWKR6uPZUpsHw9fLiQN+tCUhIOQtuUG869jNO4i86ZY=;
 b=RP6wNbXuchEtZbEPHmMezdcPJKE/CjE5DCtrxR8yLegDL8TcLBWjbP7cL/qaCF7yMC
 4DT9gt7wUbTTMVCn5YIruryLt5lzFbVhD5BOkpOmqB2/JTgp2XoIEFnHOeQ8uDE9cq+9
 dyPo7zxExlFNVYjl38tfay34GyzTH5/BJi531amkv9tfIbF8XevEYU3eAsiU4fo/p0mA
 fD9Y1ISC6Oc2OA0qu9OBV3VtPWITiE3zSJoWpgw2+60szf8Jvcfaig8cET08MbznWu8R
 kn3y7W1QNOraSwcH/cL9F8PPu2VyZG7JGOJQna8nxikg9HCUmI3DUIVZSlIuGEdlrvE9
 GwRg==
X-Gm-Message-State: AOAM530+8YqYnHJISgYSYfGORvQrDuFVx4o4DeqwCYULtSLlp4vvDfVb
 nd2WhwjsYsGf/jY6ID4LjX0F6Q==
X-Google-Smtp-Source: ABdhPJzz2I+xtA7lYt3DrHliYeba2hil/cvbDSwq7Fj3zS9Q6D0jbmdPE6XMMJ5sSnyzxxfkbrFOLA==
X-Received: by 2002:adf:ec47:: with SMTP id w7mr19909593wrn.253.1604318067409; 
 Mon, 02 Nov 2020 03:54:27 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 11/23] mtd: ubi: eba: Fix a couple of misdocumentation issues
Date: Mon,  2 Nov 2020 11:53:54 +0000
Message-Id: <20201102115406.1074327-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115432_051631_D2C72467 
X-CRM114-Status: GOOD (  14.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/eba.c:1304: warning: Function parameter or member 'vidb' not described in 'ubi_eba_copy_leb'
 drivers/mtd/ubi/eba.c:1304: warning: Excess function parameter 'vid_hdr' description in 'ubi_eba_copy_leb'
 drivers/mtd/ubi/eba.c:1483: warning: Function parameter or member 'ai' not described in 'print_rsvd_warning'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0edecfdbd01f3..892494c8cb7c7 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1290,7 +1290,7 @@ static int is_error_sane(int err)
  * @ubi: UBI device description object
  * @from: physical eraseblock number from where to copy
  * @to: physical eraseblock number where to copy
- * @vid_hdr: VID header of the @from physical eraseblock
+ * @vidb: data structure from where the VID header is derived
  *
  * This function copies logical eraseblock from physical eraseblock @from to
  * physical eraseblock @to. The @vid_hdr buffer may be changed by this
@@ -1463,6 +1463,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 /**
  * print_rsvd_warning - warn about not having enough reserved PEBs.
  * @ubi: UBI device description object
+ * @ai: UBI attach info object
  *
  * This is a helper function for 'ubi_eba_init()' which is called when UBI
  * cannot reserve enough PEBs for bad block handling. This function makes a
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
