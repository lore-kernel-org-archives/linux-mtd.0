Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E335EC433E4
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7606060C3E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7606060C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhWj9rWHw9hbsrNaNvHfucngrdviN3x5PlOxN3+C9SU=; b=HEwQ2jVfgW4kp5jG59RjaIl602
	ZCknOE8U3a4VJh9DdUeFrRA0FBPdAPM/2ZKmGdAVKAVdr40l1YFeclar9N73tXauAJsFgl4e0md8d
	/rMeluOML7WPrZMia4zvGnR2WpgdB5rr9TaX9limRIOIKI7BHxHPUy1crM86hcon4hanaiXHb072b
	1aTEx68Bgo1m5DEOT3So6xLjT2Wi8uzNztTjwInR/D5OKw98hjnpZqeaHJ5mWq9V3S7+e0P+1tkwD
	22u/+aDf3i+R5k400QplvYzx2QUodOI8O9U0WS1gc8K2TXI3bgp4kAklFHoUJTswQjzvlA0IsXZ5J
	Q1BEpQ0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8RL-002t0Z-8H; Tue, 30 Mar 2021 07:05:27 +0000
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8R9-002sxs-Et
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 07:05:17 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id C3FCEE03F2;
 Tue, 30 Mar 2021 15:05:11 +0800 (CST)
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
Subject: [PATCH 3/6] fs/befs: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:46 +0800
Message-Id: <1617087773-7183-4-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTk9LTxhPHx8aGUxOVkpNSkxLQ0xCSklDQ01VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxg6Qyo*Oj8JDjcJEB02TjEO
 OjdPFElVSlVKTUpMS0NMQkpIT0pJVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFISktLNwY+
X-HM-Tid: 0a7881f35b5c2c17kusnc3fcee03f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_080515_797236_6FEE223F 
X-CRM114-Status: GOOD (  10.20  )
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

The TODO file here has not been updated from 2005, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 fs/befs/TODO | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 fs/befs/TODO

diff --git a/fs/befs/TODO b/fs/befs/TODO
deleted file mode 100644
index 3250921..0000000
--- a/fs/befs/TODO
+++ /dev/null
@@ -1,14 +0,0 @@
-TODO
-==========
-
-* Convert comments to the Kernel-Doc format.
-
-* Befs_fs.h has gotten big and messy. No reason not to break it up into 
-	smaller peices.
-
-* See if Alexander Viro's option parser made it into the kernel tree. 
-	Use that if we can. (include/linux/parser.h)
-
-* See if we really need separate types for on-disk and in-memory 
-	representations of the superblock and inode.
-
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
