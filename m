Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80CBC433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:07:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 364156198A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 364156198A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiRyTXqTJ0B9aJLWxdC99zJbg/d2++DJXhYx6iYu0ys=; b=Zt94Wlga/hzryaP075FTFERhIf
	uvLot085oPLoUw+9P7dZILcpYJr54uVgVwmU3jbFhqFjKXrySsPSqH9U77vgYdXsSXqnfcutsOKKv
	AHm/pAmdXUgkixkoRjyncM3HDqZPJZ0oGasoL9KtbXRlU9MDYFtwgJHiltkJvCMnRHTwkQ224eUld
	lOR+IcFDat6qRkcbyeaIif/1GlinHcZI/6xP/Y/3Pibg7sYJx64uEt/IZSxBNX6csJuDlXCRQSb4v
	xdSTE54x0/1wIBq3mXPsKzZho4OcccKMKBpE/UGakRfyjWRo16cTsJcqdmK2eRVaY14dUPoOOBpWC
	RveP6d0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8SG-002tEg-JN; Tue, 30 Mar 2021 07:06:24 +0000
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8Rl-002t61-Ai
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 07:05:56 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id B6735E02FA;
 Tue, 30 Mar 2021 15:05:49 +0800 (CST)
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
Subject: [PATCH 6/6] net/decnet: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:49 +0800
Message-Id: <1617087773-7183-7-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTk0fTkJNGE8eTExMVkpNSkxLQ0xCTktDTkhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6CAw*Tz8UAjcXPh88TgE8
 Ej0aCk5VSlVKTUpMS0NMQk5KSkxKVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFPS0xNNwY+
X-HM-Tid: 0a7881f3eed02c17kusnb6735e02fa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_080554_062200_2E8C378C 
X-CRM114-Status: GOOD (  13.29  )
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
 net/decnet/TODO | 40 ----------------------------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 net/decnet/TODO

diff --git a/net/decnet/TODO b/net/decnet/TODO
deleted file mode 100644
index 358e9eb..0000000
--- a/net/decnet/TODO
+++ /dev/null
@@ -1,40 +0,0 @@
-Steve's quick list of things that need finishing off:
-[they are in no particular order and range from the trivial to the long winded]
-
- o Proper timeouts on each neighbour (in routing mode) rather than
-   just the 60 second On-Ethernet cache value.
-
- o Support for X.25 linklayer
-
- o Support for DDCMP link layer
-
- o The DDCMP device itself
-
- o PPP support (rfc1762)
-
- o Lots of testing with real applications
-
- o Verify errors etc. against POSIX 1003.1g (draft)
-
- o Using send/recvmsg() to get at connect/disconnect data (POSIX 1003.1g)
-   [maybe this should be done at socket level... the control data in the
-    send/recvmsg() calls should simply be a vector of set/getsockopt()
-    calls]
-
- o check MSG_CTRUNC is set where it should be.
-
- o Find all the commonality between DECnet and IPv4 routing code and extract
-   it into a small library of routines. [probably a project for 2.7.xx]
-
- o Add perfect socket hashing - an idea suggested by Paul Koning. Currently
-   we have a half-way house scheme which seems to work reasonably well, but
-   the full scheme is still worth implementing, its not not top of my list
-   right now.
-
- o Add session control message flow control
-
- o Add NSP message flow control
-
- o DECnet sendpages() function
-
- o AIO for DECnet
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
