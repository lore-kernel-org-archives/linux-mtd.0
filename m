Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F295C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00FD160C3E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00FD160C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y++bFMZiLJhuaEUFgpYD8tgaocMuZ5ooiJlXx18TLc4=; b=gNyWJen/ZN6nSKWsPLAFTxklHC
	QAwG5paSKz9VbvrVi2PD+ruFvl95IKl1YTJiqz08lyuoaL+Qbv5f9o5I5sJNRCXgnCr0YqdYoEXzf
	az50Y9qeqhKo4uPAd0fb91oEjGx+KeLdTBQ+U1o3cbE9IvykyzOV4wFQEXWTAA/t5XGSLxMy5kBoz
	lSBP0KodeYJLMTlYq85B3//i9SpX5FvpCqbemDS1aTk30gQh92HyfIjB5o6F80NCP7iKMbPVq5EQK
	bUHGM/W7jXcxF30G0Bf7GvalZJeegUzPbuaUWX0E/OSuyKIlc9ZEKu7sXARBcr0hpchhH976C2Xq7
	Oe2KZ4uA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8RZ-002t3a-D9; Tue, 30 Mar 2021 07:05:41 +0000
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8RH-002szC-R3
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 07:05:26 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id B2F54E02FC;
 Tue, 30 Mar 2021 15:05:19 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org
Subject: [PATCH 4/6] fs/jffs2: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:47 +0800
Message-Id: <1617087773-7183-5-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTBkfQ0wZQ0lCSUNNVkpNSkxLQ0xCSUtNSk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhQ6CSo*AT8cQzcyEB5KTiEu
 IwsaCk5VSlVKTUpMS0NMQklLQkhNVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFPTEhLNwY+
X-HM-Tid: 0a7881f3797d2c17kusnb2f54e02fc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_080524_449736_AB5F4915 
X-CRM114-Status: GOOD (  16.46  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The TODO file here has not been updated for 14 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 fs/jffs2/TODO | 37 -------------------------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 fs/jffs2/TODO

diff --git a/fs/jffs2/TODO b/fs/jffs2/TODO
deleted file mode 100644
index ca28964..0000000
--- a/fs/jffs2/TODO
+++ /dev/null
@@ -1,37 +0,0 @@
-
- - support asynchronous operation -- add a per-fs 'reserved_space' count,
-   let each outstanding write reserve the _maximum_ amount of physical
-   space it could take. Let GC flush the outstanding writes because the
-   reservations will necessarily be pessimistic. With this we could even
-   do shared writable mmap, if we can have a fs hook for do_wp_page() to
-   make the reservation.
- - disable compression in commit_write()?
- - fine-tune the allocation / GC thresholds
- - chattr support - turning on/off and tuning compression per-inode
- - checkpointing (do we need this? scan is quite fast)
- - make the scan code populate real inodes so read_inode just after 
-	mount doesn't have to read the flash twice for large files.
-	Make this a per-inode option, changeable with chattr, so you can
-	decide which inodes should be in-core immediately after mount.
- - test, test, test
-
- - NAND flash support:
-	- almost done :)
-	- use bad block check instead of the hardwired byte check
-
- - Optimisations:
-   - Split writes so they go to two separate blocks rather than just c->nextblock.
-	By writing _new_ nodes to one block, and garbage-collected REF_PRISTINE
-	nodes to a different one, we can separate clean nodes from those which
-	are likely to become dirty, and end up with blocks which are each far
-	closer to 100% or 0% clean, hence speeding up later GC progress dramatically.
-   - Stop keeping name in-core with struct jffs2_full_dirent. If we keep the hash in 
-     the full dirent, we only need to go to the flash in lookup() when we think we've
-     got a match, and in readdir(). 
-   - Doubly-linked next_in_ino list to allow us to free obsoleted raw_node_refs immediately?
-   - Remove size from jffs2_raw_node_frag. 
-
-dedekind:
-1. __jffs2_flush_wbuf() has a strange 'pad' parameter. Eliminate.
-2. get_sb()->build_fs()->scan() path... Why get_sb() removes scan()'s crap in
-   case of failure? scan() does not clean everything. Fix.
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
