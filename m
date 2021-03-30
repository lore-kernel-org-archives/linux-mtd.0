Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189C1C433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE2461989
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE2461989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a55NWsaFHT9Uy3Yj4WuiggSzH8Kn8HfZp/5K+somwk=; b=nvfXeXm3GMFmuYdZddElTqExN6
	tZa+VEuHZ8ssgXhCtwqSmmjV14OYBNCxL8KfeY5Bc2R2MEmL7ZEec6xd4zYkdRvMVU5ZJKGhpDWXb
	Ee88AI/ImSWBJ7m+jueRH216/eGetPkz1lqYvoMX10cQqbkOO8FR/l1+U2+H5QBzBLmt1MacilPD4
	F8DvFyDz/n0VbbluYLR9CT7TgMOwRqFbOMHLoSGYLbwfs6gQSPHakQq9IrMtCSfBTUz9UNURkRQGK
	4/BDEmCSynHya520sjoiqX7sslHOGtOIMolTEvyoSic4lDuuCDY++VYwQNje9QyON465kimUtbs6/
	gvNSpP8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8Qv-002swN-ST; Tue, 30 Mar 2021 07:05:02 +0000
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8Qr-002svd-2r
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 07:04:59 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 2743DE02F4;
 Tue, 30 Mar 2021 15:04:52 +0800 (CST)
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
Subject: [PATCH 1/6] mips/sgi-ip27: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:44 +0800
Message-Id: <1617087773-7183-2-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZS0keGR5MTE1IH0pOVkpNSkxLQ0xDQkhLSEtVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MAg6Sio*UT8KQzcdLh8rTxBM
 GUoKFFZVSlVKTUpMS0NMQ0JISExDVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFIQ09JNwY+
X-HM-Tid: 0a7881f30dd92c17kusn2743de02f4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_080457_527364_8CAFCF83 
X-CRM114-Status: GOOD (  11.34  )
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

The TODO file here has not been updated for 15 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/mips/sgi-ip27/TODO | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 arch/mips/sgi-ip27/TODO

diff --git a/arch/mips/sgi-ip27/TODO b/arch/mips/sgi-ip27/TODO
deleted file mode 100644
index 160857ff..0000000
--- a/arch/mips/sgi-ip27/TODO
+++ /dev/null
@@ -1,19 +0,0 @@
-1. Need to figure out why PCI writes to the IOC3 hang, and if it is okay
-not to write to the IOC3 ever.
-2. Need to figure out RRB allocation in bridge_startup().
-3. Need to figure out why address swaizzling is needed in inw/outw for
-Qlogic scsi controllers.
-4. Need to integrate ip27-klconfig.c:find_lboard and
-ip27-init.c:find_lbaord_real. DONE
-5. Is it okay to set calias space on all nodes as 0, instead of 8k as
-in irix?
-6. Investigate why things do not work without the setup_test() call
-being invoked on all nodes in ip27-memory.c.
-8. Too many do_page_faults invoked - investigate.
-9. start_thread must turn off UX64 ... and define tlb_refill_debug.
-10. Need a bad pmd table, bad pte table. __bad_pmd_table/__bad_pagetable
-does not agree with pgd_bad/pmd_bad.
-11. All intrs (ip27_do_irq handlers) are targeted at cpu A on the node.
-This might need to change later. Only the timer intr is set up to be
-received on both Cpu A and B. (ip27_do_irq()/bridge_startup())
-13. Cache flushing (specially the SMP version) has to be investigated.
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
