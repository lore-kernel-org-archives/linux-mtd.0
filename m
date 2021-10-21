Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D50DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 03:44:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22CC060FED
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 03:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22CC060FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZrtRXvOwpcID4+rRgynmJEl5TdegrTObRKJZeq5kj0=; b=Scd3TKuaaKMYks
	Uw4+rlzzLIJu8PFZEXD0RYCT5Z6v5tpkxrd4gXjccA7gKCRrd5llm1v/4QH0DsIs/4CWAEHt4dKZR
	mikRVI0paG+a2e8HOMlH09NxKwNgJOqJIGBq93KAHGOOvDZY+kO4++gEXw5Qn84fD4Jrt5jPBndtb
	BhT96aelNOmTpcuVuGcZvIHGy460n91SG8HYVQPo7p75JzcrsDw2v8vWGxtS32mee3nVgtKgD8eWf
	evbRC+4n+59ojVor2VzsfTB5IvMdCTi247ARd0Xa6nftWzPup3YA16ZcpgwRjfXNL/0fwFvrIVsTC
	AJiMNUhbUTTocvwru1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdOzQ-006KFK-0m; Thu, 21 Oct 2021 03:43:36 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdOzM-006KDT-Em; Thu, 21 Oct 2021 03:43:33 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L345vU029738; 
 Thu, 21 Oct 2021 03:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=BSjTWby1MMCLQUchrOSGc4QoXnzcMZ91l35lRX12C+A=;
 b=s10GXTgGaX78Zmg+DOSDrfc0P0mwy8l94S/NZcyOPTkKyIMY2Y0KlCwxCAx31besDrcr
 gXfw3fEKtGCdejoVtEWUD00kuevcL/euKQ1b4LL0nm4E8CV6SIOFqCYP0rxj7RC74EVk
 e1PqokwRndi0pkrqAVruOVLwEN5l5viuqDFrINzci/HP18Znfe79FD5iVhadUThPY2uw
 odRGpVz8brO185YsW3tTaXuLihuEjMaflid8MLFI6u/8vn+luvxy/mDr7zofRsdPscVh
 mNLR9sg3Koj94WqKMhqpn6d0kreDZqZeu97CD8yHp5SK3EUYUYKj0bD7U5PsVZFWhw4s kA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3btkwj3wvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 03:43:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19L3etve078225;
 Thu, 21 Oct 2021 03:43:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 3bqmshem6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 03:43:08 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 19L3gu8A082116;
 Thu, 21 Oct 2021 03:43:07 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by aserp3030.oracle.com with ESMTP id 3bqmshekyd-13;
 Thu, 21 Oct 2021 03:43:07 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: zhuyifei1999@gmail.com, thehajime@gmail.com, hare@suse.de,
 jinpu.wang@ionos.com, jgross@suse.com, johannes.berg@intel.com,
 geert@linux-m68k.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, axboe@kernel.dk,
 Luis Chamberlain <mcgrof@kernel.org>, jdike@addtoit.com,
 kent.overstreet@gmail.com, richard@nod.at, colyli@suse.de,
 agk@redhat.com, haris.iqbal@ionos.com, krisman@collabora.com,
 roger.pau@citrix.com, anton.ivanov@cambridgegreys.com,
 sstabellini@kernel.org, ulf.hansson@linaro.org, vigneshr@ti.com,
 chris.obbard@collabora.com, jejb@linux.ibm.com,
 boris.ostrovsky@oracle.com, tj@kernel.org, snitzer@redhat.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 dm-devel@redhat.com, linux-bcache@vger.kernel.org
Subject: Re: [PATCH 0/9] block: reviewed add_disk() error handling set
Date: Wed, 20 Oct 2021 23:42:44 -0400
Message-Id: <163478764105.7011.9400354892813636458.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: BAR8nzodBeKYX4DEPTjC7SU079lshTb2
X-Proofpoint-GUID: BAR8nzodBeKYX4DEPTjC7SU079lshTb2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_204332_509227_CEFC1CC8 
X-CRM114-Status: GOOD (  14.21  )
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

On Fri, 15 Oct 2021 16:30:19 -0700, Luis Chamberlain wrote:

> Jens,
> 
> I had last split up patches into 7 groups, but at this point now
> most changes are merged except a few more drivers. Instead of creating
> a new patch set for each of the 7 groups I'm creating 3 new groups of
> patches now:
> 
> [...]

Applied to 5.16/scsi-queue, thanks!

[1/9] scsi/sd: add error handling support for add_disk()
      https://git.kernel.org/mkp/scsi/c/2a7a891f4c40
[2/9] scsi/sr: add error handling support for add_disk()
      https://git.kernel.org/mkp/scsi/c/e9d658c2175b

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
