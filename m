Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAE4C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ksFGuyHBqx6OLihZ4ctXN4aK+x93xh15Efa/CCtrRs=; b=ZJrQ9ctE5xA7SQ
	xpgZB81V5d5qPhj6jF2gp6g40GFSw3zBr0ROqVkW2bydP8qjQK+Pr6EiadgALe8/DcuoooT+JV5HW
	LmXwzanWD0l+Z0aPLTcbutpwmdJQncT4nffet0LppclU5g3ushuXyb+Y4fovORkSDpuoz+2PWBAFO
	uxL9H2WrNp6J4KInOtqL1SlwR+dira3Kp3a1DJVzWChC+xFrekLRaB5ZIsgX9ZZxpYZQKXn6jjVF4
	Pmr6on/QW40GGNqr2Ww1uipXvXsv1LjoXr9AzhDH/tiDInT3za1SqreK7L+AKji8XbmUSdTvw2iQv
	OrZ4r0PuawVbDTCdiDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kAV-00184g-EG; Thu, 16 Jun 2022 07:43:55 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1k6v-0016bU-Jy
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 07:40:15 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4cRO8008239;
	Thu, 16 Jun 2022 09:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=SipFXcGwtRjKmtMkah7OgGa+SDsq/sC6LlzRtxjzz1Q=;
 b=Iu1xrDjMQnngH3NDjfLk7RYH1PcGlevXAJbB6+ZGPPGw/jcqkMTCxjXFDUHaz7kH4eqX
 0l787Yz7xLO+ayJ0xMFYxd6XSPiC3ktbb0Gz8J2276Ab4BHI4zP8V7xhapNSYMmEUf7A
 S2hr9MBoSfHE6kl21tdKDeX9FtnlUOEFhjEv+f+bFGK5nhp761/ldV4XtkCDqaOV+K3T
 xz1S9HOiR3mHHDH92IBXy+JAT2iZGjAVQKo5NlVFFDqKzwQNxlgY0/s++EvydvAvB0q4
 UgHENjluQ/B4PyRyTD/vT7sDiPUpTHYwHbe9lNwh0Uwb8xW9Brhp0mt8SnuNcQoeizL6 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gqeb0wy48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 09:40:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE7EC10002A;
	Thu, 16 Jun 2022 09:40:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA24421160A;
	Thu, 16 Jun 2022 09:40:01 +0200 (CEST)
Received: from localhost (10.48.0.175) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 16 Jun
 2022 09:39:59 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christophe Kerello
	<christophe.kerello@foss.st.com>
Subject: [PATCH mtd-utils] nandflipbits: fix corrupted oob
Date: Thu, 16 Jun 2022 09:39:43 +0200
Message-ID: <20220616073943.669332-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_03,2022-06-15_01,2022-02-23_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_004014_001463_506EA1A3 
X-CRM114-Status: GOOD (  14.22  )
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

If a bit is flipped in block 1 or higher, the OOB is corrupted with the
OOB of block 0. Mtd_read_oob API has to take into account the block number
to be able to calculate the right offset.

Fixes: 9fc8db29cf62 ("mtd-utils: Add nandflipbits tool")
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 nand-utils/nandflipbits.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/nand-utils/nandflipbits.c b/nand-utils/nandflipbits.c
index aa6850f..cd66d0b 100644
--- a/nand-utils/nandflipbits.c
+++ b/nand-utils/nandflipbits.c
@@ -249,7 +249,9 @@ int main(int argc, char **argv)
 
 			bufoffs += mtd.min_io_size;
 
-			ret = mtd_read_oob(mtd_desc, &mtd, fd, blkoffs,
+			ret = mtd_read_oob(mtd_desc, &mtd, fd,
+					   bit_to_flip->block * mtd.eb_size +
+					   blkoffs,
 					   mtd.oob_size, buffer + bufoffs);
 			if (ret) {
 				fprintf(stderr, "MTD OOB read failure\n");
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
