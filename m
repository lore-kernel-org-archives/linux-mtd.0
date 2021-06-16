Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D71C48BE6
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0F661245
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0F661245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcfYWsZVlEv/zUSKJIdvWb/AgaofjuvMsglNWTRlx3g=; b=qs2ICcwl4501jN
	S7uK6orQi0fWiAwRYZ4QxuOd8eiyHYln6dOgDMOZzZ/md6Hxd/t3bl9g2TTqDZl5p1WkZpUvLvXW9
	lJ79J5dJFZJjrsFSV9T7cdtqZcNDkhZiF8SpBlD2sIuAdHJ/rWhOqn32FC79SWP6IXo0Zb2ZswdSo
	9vMjMxlv/WMKiZUaBbCM+9hTd/dJti5Aul5sF93UJSGNbDjlhrjYnVyU1hFAo1lJDqgYzg8ZM6zRw
	aCVTlyfsnd60eNeQNibk+tczMkASsgHiKxvSDOb9tDBEMf7HplrGDDapXLaU+qhU2t294JKT39J7Z
	M3ku8YuOhEyCkPnIj+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltYbf-007C58-5P; Wed, 16 Jun 2021 16:41:35 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltYav-007Btu-Rc
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 16:40:53 +0000
Received: by mail-pg1-x536.google.com with SMTP id l184so2439463pgd.8
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eSj7QMM867fTBuxD4WinDi+YMzIWmxuOMcHgu40wLvE=;
 b=DyQz5l7fpg7DJHxBpx+gaUleysT7fIha1KRTi2aysMIVFvhjDQdRTUQTtOQGIJSrO1
 lsZEUc349QhacNULCXDdTjNE7YPtFtNAJ3AjHV9zZWcr8Pu8c65/NaQtOlsrvg6bV12h
 lgZaKPCey7DRAYpFzufgp1ZgG7SfxtZxAopKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eSj7QMM867fTBuxD4WinDi+YMzIWmxuOMcHgu40wLvE=;
 b=cZexzrO6Ddm6usQmQj3V98xBKB53vrd84C1qQKh0QIznW0lMSPPWo5Q0sloOpNcjZW
 7u8HNdcaLDVQG9QNk1KMHJduYq+BIWb5J2KxBpevvMJfrAJ7uL+zIsjI0fLr9LFyb3jg
 M84dzHWoYGGmztk6RebT12yfzO53kO0u4q5Q7c7cmNzhVcNJWGG7wh2jmAuLoKQkbmM4
 LUFDy7gX1dNmJHmuEshQFh8pqsJrh3rfq+s8fVhSuJfDDxZxgbasYom4PfrYM4knbsip
 XWg9q67+rFWQmTY5vNiqHswXnhLDvRE0w06X16o3TO2sP0/qJdcVOMNoIe5MIlBWG7P0
 WgIg==
X-Gm-Message-State: AOAM530nN4B32eLWozghXBm9/mM9STi8g/7GrU1KGrS2IIYcInRrM1wK
 bI45Y6EyEkbUfK97+zELG4vAjA==
X-Google-Smtp-Source: ABdhPJy3MA/bMpIrn8612O4lt2YxXA4tGPu4lGhMOvCNonn/0H42hZku6Xg6BUsLLwaushFAC8dGtw==
X-Received: by 2002:a05:6a00:b8a:b029:2ec:761e:33e3 with SMTP id
 g10-20020a056a000b8ab02902ec761e33e3mr555954pfj.35.1623861648707; 
 Wed, 16 Jun 2021 09:40:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b21sm2773113pfp.134.2021.06.16.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:40:46 -0700 (PDT)
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
Subject: [PATCH v3 4/5] pstore/blk: Fix kerndoc and redundancy on blkdev param
Date: Wed, 16 Jun 2021 09:40:42 -0700
Message-Id: <20210616164043.1221861-5-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616164043.1221861-1-keescook@chromium.org>
References: <20210616164043.1221861-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=0cec17aa50667cf776ad33debd4d5d780669e07f;
 i=yTEuvN+d2QlI+CgetW2A/mnEULnwbC3Uy5kOoKgmB9Q=;
 m=nv3cX+zCGZ64OKaS6k3hCuIb776pM3aoPeSdwsW4l+g=;
 p=USoGnLZwk4a402OJka3HYldDNWjTYcaDbaDrZ+4qeFA=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKKYoACgkQiXL039xtwCbD5g//WUB
 YueFZ8I0eRHi1rVMlUFvST6Tou0jUWvjup1L9XYSQ7CObRFMf5whc9+7yjyAXu6d73aH4FI9Hu/6X
 T7Hyx7yu3/yh08A94+EGmCw3x3tG+u2+YsaXC61syZ655r2Y/5srYaFS3JTBDHr8secOyxNrvqtW7
 JacflvvLmBnr/UYiHn65oAFthh8XAzyj1e6eNek3bCJZwYhmf/E2C8yNY6Rns7jD894FG3ce2tVAD
 2h+wILUbWcrLNZRoHHosY8ma7rye5JHBtf2/2dhr3zJRHx7CtaMwNn8f8v4B8BdbHN4O039E10Tzi
 hD7DvJPoow6zrMy39jrThL/RccFIMlzc8EdlmZgcJaixxuIeVgy9TKO4Qzz2Rg/HvCypEKrE2xoal
 04ktdhkwTCH7uOI25jkm8dPaDzmrZ5nRLaOW7iT+dMtWYiGnEq1hkqVnV9aQFBzTIE7P7cY1fmqEj
 Q2kdlcSwWGJRIk9hvj2E1fuM1nvf116U7ERdLjtpHA92XvKoFHEjFNF39MWQJXG3VU5LN3AuuHKc5
 nlBMBAlWsbRbQs1Wlj1vv0L+9vIsZ/jHBrc4FAPdsFXMXFzZbD4EDDoDn1e3OEUkqKnd8Dk0QECDY
 bDtz72/3myeeQVCpSCVqY4O3Glf3Q3SN/eTwLvh2RovIV6uIgkpOHtayxGaGP6GY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_094049_932392_E91DED9E 
X-CRM114-Status: GOOD (  16.10  )
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

Remove redundant details of blkdev and fix up resulting kerndoc.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/admin-guide/pstore-blk.rst | 11 +++++++----
 fs/pstore/blk.c                          | 24 +-----------------------
 2 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index 79f6d23e8cda..2d22ead9520e 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -45,15 +45,18 @@ blkdev
 The block device to use. Most of the time, it is a partition of block device.
 It's required for pstore/blk. It is also used for MTD device.
 
-It accepts the following variants for block device:
+When pstore/blk is built as a module, "blkdev" accepts the following variants:
 
-1. <hex_major><hex_minor> device number in hexadecimal represents itself; no
-   leading 0x, for example b302.
-#. /dev/<disk_name> represents the device number of disk
+1. /dev/<disk_name> represents the device number of disk
 #. /dev/<disk_name><decimal> represents the device number of partition - device
    number of disk plus the partition number
 #. /dev/<disk_name>p<decimal> - same as the above; this form is used when disk
    name of partitioned disk ends with a digit.
+
+When pstore/blk is built into the kernel, "blkdev" accepts the following variants:
+
+#. <hex_major><hex_minor> device number in hexadecimal representation,
+   with no leading 0x, for example b302.
 #. PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF represents the unique id of
    a partition if the partition table provides it. The UUID may be either an
    EFI/GPT UUID, or refer to an MSDOS partition using the format SSSSSSSS-PP,
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index dc5ff763d414..c373e0d73e6c 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -58,29 +58,7 @@ MODULE_PARM_DESC(best_effort, "use best effort to write (i.e. do not require sto
 
 /*
  * blkdev - the block device to use for pstore storage
- *
- * Usually, this will be a partition of a block device.
- *
- * blkdev accepts the following variants, when built as a module:
- * 1) /dev/<disk_name> represents the device number of disk
- * 2) /dev/<disk_name><decimal> represents the device number
- *    of partition - device number of disk plus the partition number
- * 3) /dev/<disk_name>p<decimal> - same as the above, that form is
- *    used when disk name of partitioned disk ends on a digit.
- *
- * blkdev accepts the following variants when built into the kernel:
- * 1) <hex_major><hex_minor> device number in hexadecimal representation,
- *    with no leading 0x, for example b302.
- * 2) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
- *    unique id of a partition if the partition table provides it.
- *    The UUID may be either an EFI/GPT UUID, or refer to an MSDOS
- *    partition using the format SSSSSSSS-PP, where SSSSSSSS is a zero-
- *    filled hex representation of the 32-bit "NT disk signature", and PP
- *    is a zero-filled hex representation of the 1-based partition number.
- * 3) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to
- *    a partition with a known unique id.
- * 4) <major>:<minor> major and minor number of the device separated by
- *    a colon.
+ * See Documentation/admin-guide/pstore-blk.rst for details.
  */
 static char blkdev[80] = CONFIG_PSTORE_BLK_BLKDEV;
 module_param_string(blkdev, blkdev, 80, 0400);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
