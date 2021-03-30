Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897A4C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05FEA61990
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05FEA61990
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW9aioyDmg+IjQ5In5CD40+42FGB0et7uaeKtw12X4U=; b=c8JZaYGLfT1uC0pPMbVWhd4n5Z
	iE4p/1QQqlBj1r0aqizBLC7jIzXi/yw8TFvT4eADLvSbBG9bDjX79oztw3Pjj5c7X4qwvCFg1ncKe
	dByhIeWRGbtYJbm/pepKMWZbDF2ytcZHjDE0MOkwxOQGpoA6yxBe7NYMVHtqzNSgQJmK6hAEMSEZ3
	mQNN9CPRspxv1juqGcNGWQcfRd24MbLzWJLt7IDBAZI5DV9DkFU/HBYvLK1meaQDJr7qPFPrT94ED
	iFWdXFMS7fe6qy3E5490dNkDoMIS2oxtoe7f2ydeg6lHKV7ct9LKuLYTdZf+WQovVWeRHFt4CXIDo
	MDsyZixg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8Rp-002t7C-99; Tue, 30 Mar 2021 07:05:57 +0000
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8RP-002t1V-3k
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 07:05:33 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id F3B90E022C;
 Tue, 30 Mar 2021 15:05:27 +0800 (CST)
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
Subject: [PATCH 5/6] net/ax25: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:48 +0800
Message-Id: <1617087773-7183-6-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHUhMTU9DT0pLGkseVkpNSkxLQ0xCSUNDSExVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6Axw5ND8SEjdNLh1WTikW
 NB4aCklVSlVKTUpMS0NMQklCSkxNVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFITkpONwY+
X-HM-Tid: 0a7881f399782c17kusnf3b90e022c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_080531_594272_F86BAFBB 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

The TODO file here has not been updated for 13 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 net/ax25/TODO | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 net/ax25/TODO

diff --git a/net/ax25/TODO b/net/ax25/TODO
deleted file mode 100644
index 69fb4e3..0000000
--- a/net/ax25/TODO
+++ /dev/null
@@ -1,20 +0,0 @@
-Do the ax25_list_lock, ax25_dev_lock, linkfail_lockreally, ax25_frag_lock and
-listen_lock have to be bh-safe?
-
-Do the netrom and rose locks have to be bh-safe?
-
-A device might be deleted after lookup in the SIOCADDRT ioctl but before it's
-being used.
-
-Routes to a device being taken down might be deleted by ax25_rt_device_down
-but added by somebody else before the device has been deleted fully.
-
-The ax25_rt_find_route synopsys is pervert but I somehow had to deal with
-the race caused by the static variable in it's previous implementation.
-
-Implement proper socket locking in netrom and rose.
-
-Check socket locking when ax25_rcv is sending to raw sockets.  In particular
-ax25_send_to_raw() seems fishy.  Heck - ax25_rcv is fishy.
-
-Handle XID and TEST frames properly.
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
