Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA25C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:05:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16F261989
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 07:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E16F261989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cbB36lwLyPzSIVjKNBKmHSCOFJQm2CnjdlAK8v2zLQE=; b=WSY6dhgijJkiUe0hqz/tmM9VVa
	bcqiRwl6fNS3PCfqLgAZglYRjyQCcbru4Kdu8I7VyHSMeEpl75LA54zM4qfpd9MGYBF5f8avHqHLK
	j28MZmkS2G6xT8TlYbZCBwYre55ccXIxc40RVm2UfBRJ6+EU8ppEAG1Opoqbn42WKedU42h3vrmhJ
	PVnEMaXjRfFIbr5PJe69/T6g8zOWdI6slL1xfFcEa9qDAgvazyJnWAtmzAOr/Tmpr4lydw4IOQ0bT
	0kSOVtHtoO+ZHInYiexxYx6hxu+kvzpWWIvDOpWlCI2n1q43SssYwNAV4bbI4xO3H6NXBF2G+BlKN
	0Zr0sZZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR8Pv-002ssa-Mn; Tue, 30 Mar 2021 07:03:59 +0000
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR8Po-002ss5-Ur
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 07:03:56 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 1D894E0131;
 Tue, 30 Mar 2021 15:03:36 +0800 (CST)
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
Subject: [PATCH 0/6] Clean up obsolete TODO files
Date: Tue, 30 Mar 2021 15:02:43 +0800
Message-Id: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZH0sYSUJISR1PS0gYVkpNSkxLQ0xDSkxISk5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAg6FTo5ST8SNDcJPjwVHT8f
 MhRPCi1VSlVKTUpMS0NMQ0pMTUtMVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFISkNONwY+
X-HM-Tid: 0a7881f1e60a2c17kusn1d894e0131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_080353_314550_A01615EB 
X-CRM114-Status: UNSURE (   6.83  )
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

It is mentioned in the official documents of the Linux Foundation and WIKI 
that you can participate in its development according to the TODO files of 
each module.

But the TODO files here has not been updated for 15 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Wang Qing (6):
  mips/sgi-ip27: Delete obsolete TODO file
  scsi/aacraid: Delete obsolete TODO file
  fs/befs: Delete obsolete TODO file
  fs/jffs2: Delete obsolete TODO file
  net/ax25: Delete obsolete TODO file
  net/decnet: Delete obsolete TODO file

 arch/mips/sgi-ip27/TODO   | 19 -------------------
 drivers/scsi/aacraid/TODO |  3 ---
 fs/befs/TODO              | 14 --------------
 fs/jffs2/TODO             | 37 -------------------------------------
 net/ax25/TODO             | 20 --------------------
 net/decnet/TODO           | 40 ----------------------------------------
 6 files changed, 133 deletions(-)
 delete mode 100644 arch/mips/sgi-ip27/TODO
 delete mode 100644 drivers/scsi/aacraid/TODO
 delete mode 100644 fs/befs/TODO
 delete mode 100644 fs/jffs2/TODO
 delete mode 100644 net/ax25/TODO
 delete mode 100644 net/decnet/TODO

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
