Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CF9C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Mar 2022 03:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZIxDupdh1MEmddDDJu8S4SHknPriHjEbbVPDp5IYw8=; b=Jx30CqEneNS1SX
	ec9y3Ytq87lfMqiEH2Uey4CtG2JSAm6jX9dby2Zy+Smd2tOw4kdMnavZuXAJuvahoLr5RNbJWJUWu
	shmkON6yi3uyEzSzXvMECjjU264MveoTzLZAmqk1C1rv+fR4IsaQR7OfeIIixNRLb/mFIEdYckGGh
	fLRw0XPsApClxvMiSANVN+2quXuOCAGAYvXJQ4wYBNL3p3UPA441J5vqPT61RfVtseOzlZ4GgXJam
	MTvB51PGdp7tt+eEsMgTOPiSsMCY2vNTcGNX5l+vLYkXbm6Vfdhz/noZCIpZZvjdycST9/2Bqkh1/
	te6wGR2DxtpuC0aWInOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVQDn-003CM5-Ix; Sat, 19 Mar 2022 03:57:43 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVQDh-003CGu-Q7; Sat, 19 Mar 2022 03:57:39 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22J2ro58012531; 
 Sat, 19 Mar 2022 03:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=dOCvppNUKgOlcA89bNUdrq8FTQRYfsjfsvR3rEo7hmg=;
 b=rB4F0btdvmuQ8qSVzB0TI/MVdj6L1wLlPT1srOv4birzBP2VsA5D9mxqDnty9FGI031e
 OhuXiDi8PP/hnk9+43pScgnlvc1Msx3IXhpur+XlVll5oz+03KUF4YG2ZJeO5ctAVyuc
 ABInatOkvEpdjQe0XOBM3Vw23gTi3RCDw1NbsqI8/p8gXop58M1CrcTLpLi34DxilkOw
 aIKWvxzBLmxogO1BmHkA0n6pbxmOlCrA4EQcUelFgQP2O0W9a5LqlQOoSqpIeuQaOZbZ
 7pKjNVt7qrQPqi5lf6wtbxwtbMHhpxhomcEA8IcEfMLaUK5a8MKBz0qkUbZ41JgSbvMB dA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ss016q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 03:57:15 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22J3uvsm007045; Sat, 19 Mar 2022 03:57:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ew5kyshp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 03:57:14 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 22J3v5Qm007126;
 Sat, 19 Mar 2022 03:57:13 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ew5kyshmn-6; Sat, 19 Mar 2022 03:57:13 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-can@vger.kernel.org
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rdma@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-s390@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-spi@vger.kernel.org,
 Shayne Chen <shayne.chen@mediatek.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jiri Olsa <jolsa@kernel.org>, kernel-janitors@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-staging@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-wireless@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Sven Schnelle <svens@linux.ibm.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-power@fi.rohmeurope.com,
 linux-mtd@lists.infradead.org, target-devel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-mediatek@lists.infradead.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH 00/30] fix typos in comments
Date: Fri, 18 Mar 2022 23:56:56 -0400
Message-Id: <164766213032.31329.14855996441316567317.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ryygBDbx4ESlJehbCVsBuy2qL-PPuldd
X-Proofpoint-GUID: ryygBDbx4ESlJehbCVsBuy2qL-PPuldd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_205738_009808_84F5686A 
X-CRM114-Status: GOOD (  11.65  )
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

On Mon, 14 Mar 2022 12:53:24 +0100, Julia Lawall wrote:

> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 

Applied to 5.18/scsi-queue, thanks!

[02/30] scsi: lpfc: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/9a866e6aaf4e
[17/30] scsi: elx: libefc_sli: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/8037185d1ad8
[24/30] scsi: qla2xxx: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/5419e0f15622
[25/30] treewide: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/9d05790f5187

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
