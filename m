Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29960C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE8420821
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FY/SIgNu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="aURWWEGf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE8420821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l3qGRRSDEOn1KfI27nZnVyzx0RqHQX5uCrzAbJWuO7k=; b=FY/SIgNukd1y2Oy5zYvje9nIBf
	X0DTSAnjFku/odxpcX07zFgMv1qhoW/JbE835lx5T+JdZkib+QcfKLWFhmL1uKd7kajPtphAdKzYZ
	T0zTUPDarMzlWNWBmfsOAOqtnk1sU7v71OhdRiI8NZtrI5k5IlulluMjZz7L5UQAIiEzXGygo4Ah1
	a7Vk/4aNifYTYOF/KQNtrMHvEsdMthjfggCAzEeH+G4w3jAtZ5FSu3u3lDKDq204cL+q+5wJSfiD0
	55dCMpiWl6inUbg/42PG285LbPtn+4ReUyeNVW+ain5eul9+b933qgAgu8nKW9dAuvD5GcFSnHSSL
	oRiYTusA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqirH-0006A3-L4; Mon, 04 Feb 2019 18:20:39 +0000
Received: from nh602-vm0.bullet.mail.ssk.yahoo.co.jp ([182.22.90.25])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqp-0005j0-J3
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:15 +0000
Received: from [182.22.66.105] by nh602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
Received: from [182.22.91.207] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
Received: from [127.0.0.1] by omp610.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 32392.9004.bm@omp610.mail.ssk.yahoo.co.jp
Received: (qmail 41994 invoked by alias); 4 Feb 2019 18:20:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304409; bh=w0isZg94riL6Ijq+ghJ4zY7JTQ3KiC8fJWTxLBIEEPU=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=aURWWEGf2g3b2jQF7DjRLLs5LdIc+b72oWGz/WyGk7uTd8FwfMmpuGK9Yo6idiTszQgf/DIIfPjS3vZSBlRuvMAM73M1HdKjiW/tK3rtb6t6hES5JMsuV/d01UUP70d1QJ5qVxRXVgQ3RQ9k/tiqUafMtn0c8pLuIruIC0Rgeto=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=pGMVTIf4we3JSV39DRCSMPcbec8MWRfwOfTCGNTvGy3d7A2JL6IprypZNTyPoApebno8md6TkUD7theBsMRciMomGIPyGKPDJY26FfM1sW8LymdR5utKyC3eRk0RlOA36rbByzJhS2p5WkRts7BpOG2GsRNN7NE3ULuN7gWW+jA=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:09 -0000
X-YMail-JAS: XsW4XckVM1klhOHepx7XMRmikxvgtfEt6CThK2ouEuIDbuRXKm3GjF7mVaJkwUaw8C1j2MhGcpoK4ynwOdZsAClSckPoxGsn2AFEO1BOhUmcj0JNQ_Pv.MHDgvTErmqfH9mP0rvb8w--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: FNCoowgVM1mXLbKpXhoaDW5p.sXjZZcPp3j4pCmtErdJj8f
 .aH606UORtodsAhPduCBzznoB4qyz7Y4Wvc.CpMeezxAmB7cxxsM9dAP8Rv6
 1T8YpVYZy3hVe_.9Xdp73RK9vinDFGyohe_aYhtJoeZtO2w8vjop5nPxc8co
 y4PiJbAq3hl4iVO0aJJyx2ilF5zIhp_2s6sENluXm_TENEi4J2jVz9g4KSd9
 snWEoarZeI6Fiy4.aOaFq2PFq35Eeth6vKJNmZ6XdvR5XJH7uOrVJq6HpN2G
 D52JL7Sp6I4r8NrUQwJiY8bRlV.VrV25V0_zxnvSwUtZcU1d44d9yBZ0Emgz
 yXdl2vOJ49TlR3V5JGzavGy0je1qB3Zhd.sbNUoRLSYziS1hgPGe5SmBDmYs
 VhnqfCKsSg.Sd1PMgPQUwWs9Jbas71hnNDbMQ3_7gN2jPpsIecvsaktqe.qV
 wuaClRtXmJHWGK1I.W5oSX.U5gtt.bU24JO8zwdjzTgRUu_Hx_9L36iGMjXB
 PMpzAM5vi4bgtvx.cP2YKoPHY5bsvWd057cqCk.HfD.sG6d6H_.oBHvXQXZR
 vsM5G64bycQe1SJOx7WVfGO5MkrSBK2w9FGXUnkIYBBIcczSD
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Tue,  5 Feb 2019 03:19:55 +0900
Message-Id: <20190204182004.29894-3-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102012_183322_1CE1CE38 
X-CRM114-Status: GOOD (  13.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It is enough to use chip_good() only so chip_ready() is not necessary.
Since chip_good() is doing the same check chip_ready() is doing plus an extra
check to make sure we end up with the data we wrote.

For this change the order to check timeout also will be changed at same time.
The order is not a hard requirement, it's just better to avoid the case where
the data update happens just after the timeout has expired.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Update the commit message for the comment.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- None.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 91a491b..ca9d5fa 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1878,14 +1878,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
-			break;
-
 		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
 
+		if (time_after(jiffies, timeo))
+			break;
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
