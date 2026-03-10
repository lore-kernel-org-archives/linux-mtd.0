Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E191EB105B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Nz1VRQ40zCxBpF+uQ43lyeMNai/uf89+shguu7lI7M=; b=dRJIHWy2Wnd9gD
	DHPeskNuBLAYTMYOGtHQ9LbXBjcS1LJcduHXBJQu6fVxgvF3NxDB2166EiXYfrZUTnrOiVq7kUoq0
	B6KWoFNXl++2lZvksnfckHtrLJusxt6ykE5BsEEEY0MzEWtY4dCQ+fvhHC7KMd7kNjPVcsqJOp9Zf
	t4d/x87npVQDy0105VH8+QArXIrzoQuGrbnkvrCBqI6cai5WenaYRfaG65lQ+tb899g5+gTVfjfDp
	fmcVRLUhhiVUGXq85sqt3qY4wK38R7QmLLw2MxC0PkDbAX3qnzCRlSIVNUKyg+QHOftiG+qkI07eH
	4kQoBYv1I0Sv8uxp6aqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvi9-00000009N02-2UWz;
	Tue, 10 Mar 2026 11:57:17 +0000
Received: from mail.avm.de ([2001:bf0:244:244::120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgd-00000009KZy-1XoT;
	Tue, 10 Mar 2026 11:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143728; bh=ljsuTOpGREUyGER98xbD6/ci86SD8pohlonTQBpqGIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PqCygKH8TUTFzdsVoltpS6V+urh3nKuUaWPGyQ9+G5dBBIMLMlSqFUF2pQu2ztCks
	 nKjygDeUmN//qOptE9nqaXpkixC5XmuX8GEDJn5HpI8613PWAZldzQgtG5ilRHjEDe
	 PPv3OqXdqRSmvRO/4sRCoDxU/Kdn2GWugjDbKUbA=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006b0-b734-7f0000032729-7f0000019cb0-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:28 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:28 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:25 +0100
Subject: [PATCH 59/61] debugobjects: Drop likely() around !IS_ERR_OR_NULL()
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-59-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=ljsuTOpGREUyGER98xbD6/ci86SD8pohlonTQBpqGIg=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAafUF4Co3bKHEJh1nSPEbGPanpbmXqLGBVTE
 nsli8aGTIqJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGnwAKCRA0LQZT0ays
 2/eqCACfKEiwIm4grjaffCaqYK9UtMC/I42k93h5L5QQzw4cYMYd8FGhvLp+Ug9Jk9iQltpydL0
 M021kU+8e5LuC9HNGAP+FvXfKicTrLe4WOGLghTKJxJD0Qnwt87qFBwN4C5TgDS7lK8yPptqdRT
 xavsstUunap8iVxwbzeUWdgcTpG4nsY9KAjliWo7xLgVYhCSEWYrkYbks39zWe9p1rptJWM2IT/
 +/O3p9icHSV3twwgGTFQhBYPys+tvE7XNArxXHhB+XYW7AEdqLgSeLiL6ig5y++9xZFwEIcnWi0
 5dJklCZYTethhL0MgTuOAEkoSCl0Bk6MDrD8akTrSRkzdCkv
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143728-7AAFCA3D-1B7F7E41/0/0
X-purgate-type: clean
X-purgate-size: 1118
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045543_639769_1C3DA66F 
X-CRM114-Status: GOOD (  10.66  )
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

IS_ERR_OR_NULL() already uses likely(!ptr) internally. checkpatch does
not like nesting it:
> WARNING: nested (un)?likely() calls, IS_ERR_OR_NULL already uses
> unlikely() internally
Remove the explicit use of likely().

Change generated with coccinelle.

To: Andrew Morton <akpm@linux-foundation.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 lib/debugobjects.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 12f50de85b621a743a5b6f2638a308f6162c6fcc..12e2e42e6a31aa8706e859aca41b81c03889cffe 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -1024,7 +1024,7 @@ void debug_object_assert_init(void *addr, const struct debug_obj_descr *descr)
 	raw_spin_lock_irqsave(&db->lock, flags);
 	obj = lookup_object_or_alloc(addr, db, descr, false, true);
 	raw_spin_unlock_irqrestore(&db->lock, flags);
-	if (likely(!IS_ERR_OR_NULL(obj)))
+	if (!IS_ERR_OR_NULL(obj))
 		return;
 
 	/* If NULL the allocation has hit OOM */

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
