Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A24C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:29:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8243361369
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8243361369
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QkkzI5+LzdbyQ1nqApsyPhq3IPJfIAANZQwgqytAhJE=; b=D4ZQG2M+7iAZ+acmbNDIQCp+v
	ECF3Hw6DSJu9JVwHsGutBpmsPz9fjq2ma8RZTavmz1j/pbsvak1snbkURxo01PB/66F7qWOqZvLoV
	mAcSY47EvGuYi6rnh5ziPjWDgURh0iL0JODrFi51ySkDXYSPMWrPyAU6TTVR/F+a1knB/yB41Jq9Y
	rwdvFFGs1RcjSvdSwA+hfoiUs+/JmI2liuYsyQurVd44tS9DNZJZQgFXGVoujXwl0dnXDxn2DfmZN
	jLGZUrzW5J41O5cIYOBOpHK5Nbzw9L1WfPxFJMSCe98sMRCfKgOeG4YxFmvoc9bk+NEA/aPJibyBv
	+h02H8RYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLuT-009niL-G6; Tue, 13 Apr 2021 16:29:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLqQ-009mqA-FP
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=gwnQlLFfjOtnC10hC+oYQoIcfSUphk969fe6ZO6bWqc=; b=2rUmpfaPt8zHMyx88QZOlX3q3e
 nY6h2doddOTZjZLwZkLdg1kpRrT5WjmAA/UJzGoYkvY8bIJbWNPwkIIsCBXazBkURZQzAvYzaFEPi
 hiiQnK2oFNPmMMkIyMlww2qTcmVsUBfngTydEuMvsz57xIacdRPcRIPuVYuqfQJglrObZuI1fFetv
 j4XC5tf+uWcTQbNSCrMplb06IuixMRlwcCnUVwFeO8cpxHOghJ1cob7zC+3Z/bGDBuVr2jbdNagYO
 bwhxmyznSqHGx3javSDZkwO1JQiczptj7gxYq4bUVpRyq3ihap3Tcp1jYIrTXRUu0Iex4HkPGH4S8
 E3GL/MSA==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLqM-007B5Q-Ii
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:24:52 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DGOhCI050696;
 Tue, 13 Apr 2021 11:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1618331083;
 bh=gwnQlLFfjOtnC10hC+oYQoIcfSUphk969fe6ZO6bWqc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=RaGhtZJ3Nohy04axDv3bFqW6sXEhS6bgpX+BZg8vKdH+OGzsB4DrD1KBWurl89TO7
 S/2kq1ZxTIWZtpOsOKONAxbLnb2BLQ52an0RISAikDq25MTy3VyFQw4N+gza+WY54P
 Fd2Cr7OdE8ij1J0/Ke4arUUZn6l8amxNUUpIyl98=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DGOh8S038952
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Apr 2021 11:24:43 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 11:24:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Apr 2021 11:24:42 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DGOdDN098425;
 Tue, 13 Apr 2021 11:24:40 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-mtd@lists.infradead.org>, Colin King <colin.king@canonical.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mtd: cfi: remove redundant assignment to variable timeo
Date: Tue, 13 Apr 2021 21:53:26 +0530
Message-ID: <161833061201.9818.9751246290513017958.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210325174514.486272-1-colin.king@canonical.com>
References: <20210325174514.486272-1-colin.king@canonical.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_092450_742498_83E6275A 
X-CRM114-Status: UNSURE (   8.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Colin King,

On Thu, 25 Mar 2021 17:45:14 +0000, Colin King wrote:
> The variable timeo is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Fixed up $subject prefix to match existing convention for the file.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next, thanks!
[1/1] mtd: cfi: remove redundant assignment to variable timeo
      https://git.kernel.org/mtd/c/f3907773d6

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
