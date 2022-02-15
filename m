Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9AFC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igwgAfcBud+xsv5iVD4u1lYyO949NgLi4JAzj7IouLQ=; b=Buxj2++J1vu2iy
	vnnVacInA5kjr4gCwsHtlXStMdFDcIOIkXr60OZKDhHvSXRXfHXXNe9GaxMzlfm5F/qqpCj6A2UTC
	u401yA1nEp1KopWsgGFXlTlGMg1WjkI7t5aELjedLynb+tnNWeMlH2Y77u8FTO3q2PPaS07OHY6tf
	ZUl0twVmLxSu8un3RXPKDOfm9CAHUKm9OnKnYSFJyrArJawaWSOF8620W9YVQm646rdjhz65j5Ts/
	9fYpzi+1oTZxzJqlKGtn7i9+1/lrbH6IgcsG8km3o+a1Qe088L/G2pCF+RsW3UGEifSQJfcJx6LR1
	CiOh6lXG6ZHaBMSiY08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJoNU-0003Gi-5v; Tue, 15 Feb 2022 03:19:44 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJoNQ-0003EO-FM
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 03:19:42 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21F2TqXs014923; 
 Tue, 15 Feb 2022 03:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=FshK+SY46LCCks86OhomWMc97OEykwuZ1jfaUJeYJCo=;
 b=p5aq//voQuFsznU3EwJLBgz7gtLt5AjbETpNRfaIw7zZ2tdhVrs7POydyY9S+R3A0pKH
 DEkFHuEGY4anG+9VMi7gCkjpZQy1l5sQo02lzku/22uZcePrmd8bHu52+jQYLCPtlIrW
 LLw5fMkc7ag4PVnKuyK0wy543JPcclS97j3xQdGajzts6xd/UD3jrnfzs0ccOk06wSFA
 PQA+U1OKfcYnd6Q81Kiyfm6P48tRpxqNfuKzdcGra3e1lqZUcQ/72x3eh+AxBC5b9Vbm
 iXk9hvX9fdbGlHD4u+uYY6n09S+/2NF14j4SUvy/fRLu8unWvDnwV+c3gr+Y9KNllaWa uQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e64gt6e8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 03:19:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21F3HGGH058567;
 Tue, 15 Feb 2022 03:19:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3e620wpgs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 03:19:29 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 21F3JMPA064243;
 Tue, 15 Feb 2022 03:19:28 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by userp3030.oracle.com with ESMTP id 3e620wpgqq-5;
 Tue, 15 Feb 2022 03:19:28 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mtd@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, MPT-FusionLinux.pdl@broadcom.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-ide@vger.kernel.org
Subject: Re: [PATCH 0/9] use GFP_KERNEL
Date: Mon, 14 Feb 2022 22:19:17 -0500
Message-Id: <164489513314.15031.15565838256267303879.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210204223.104181-1-Julia.Lawall@inria.fr>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
X-Proofpoint-GUID: nDoBGwfRKH754qY0VCkX57qyJcN4xiU4
X-Proofpoint-ORIG-GUID: nDoBGwfRKH754qY0VCkX57qyJcN4xiU4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_191940_671889_A6FB6CEB 
X-CRM114-Status: GOOD (  11.81  )
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

On Thu, 10 Feb 2022 21:42:14 +0100, Julia Lawall wrote:

> Platform_driver and pci_driver probe functions aren't called with
> locks held and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> All changes have been compile-tested.
> 

Applied to 5.18/scsi-queue, thanks!

[8/9] mptfusion: use GFP_KERNEL
      https://git.kernel.org/mkp/scsi/c/f69b0791df1d

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
