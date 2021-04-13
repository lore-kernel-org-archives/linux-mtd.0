Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496FFC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:31:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C32E60720
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C32E60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f/uFgKUc4f2boOnksIVo7VLMljwdudx75TjgXZ9tLEg=; b=k0PnfSGJijgXd3v+Ayr9dt+LP
	wSUzdXxvSK1HH0H+2YCeW4aMYva5B04fju2jpCaPvDpaC9TQPgWaE+kFay3EAkDRVfX8hseLIuUAX
	EGwXOrDCf/1QlP0Pd/S66V/FyR87UxSwWjbQAVdleP7jtRWHuaeIsmk7FxuAj8vMk4L+6CuIWlW2w
	syye84xLZ/hfU2u3ZVWhXxQopxnartXmL7fMpDPT049+xJq32D89raJnlyyfiakYCv5fB9280Ka21
	mWDoQ0NGINwTDFO2H7lRquJFWJOeHszM3zagnhpL0AzpDAeiqXynyKlq9Gu7DlJWghkB6xHRIPpeL
	Efe0Jt5xw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLw9-009o0C-PC; Tue, 13 Apr 2021 16:30:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLry-009nAB-Tg
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=XXbQnWditNp1sdo3Vzh2Y0E9XcjET6Fpc/1wBB/fKLQ=; b=YZmfNX/REaSJ93dBwgHTLnBivj
 jEKzaUE5GlHmhGk4iDesdnePgCd+1oFknerVKp6z6kbgNFkucBQzb7k292vJdh1XwEro/XKRmhIsA
 k4RnFyrVd/tWlWbD6pBw5pCtqRVmRxVrj/v8DVbyGa0UIVcLdw34iPvQPhdLXB+pRPhBJ2/JTFJIz
 W8wzds66UcFcu0lplO/+KwhTrb08HbgUXoBUNo3nlsM7v1DDpMtYcPq4BzJBG7uj9X3qrQhXVfKue
 5XpPBOu/ZDGatlQyr/FJGe5CPFQC8Xt61Be1uZDJpFy+O3Cv/UThvZpc1Tp4L6Cq9iNWn8uwuMXDs
 q5PZJtnQ==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLrw-007BA5-9v
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:26:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DGQPp1051152;
 Tue, 13 Apr 2021 11:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1618331185;
 bh=XXbQnWditNp1sdo3Vzh2Y0E9XcjET6Fpc/1wBB/fKLQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CgmK0i4KFnopnSlWDo3RxUE0prDltGCCgNNnGG5oQ7h8ohTm/HRXfLfWOdu27QsxE
 eg2YPU275SRWGhIgeN8GEBGoRR1BJ5Sciuv+cin/k7OPmC9QdAnmNH7exhQtwHUOdz
 vdjhKJSjoTM0JRl+Q1CgljaOURCKOhupAQkFq57Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DGQPvU032944
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Apr 2021 11:26:25 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 11:26:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Apr 2021 11:26:24 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DGQMl4129374;
 Tue, 13 Apr 2021 11:26:23 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-mtd@lists.infradead.org>, Mauri Sandberg <sandberg@mailfence.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <richard@nod.at>,
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: AMD chip 0x2201 - write words
Date: Tue, 13 Apr 2021 21:56:14 +0530
Message-ID: <161833061201.9818.14636884633616951588.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210309174859.362060-1-sandberg@mailfence.com>
References: <20210223170052.963927-1-sandberg@mailfence.com>
 <20210309174859.362060-1-sandberg@mailfence.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_092628_406174_B78C59DA 
X-CRM114-Status: UNSURE (   7.08  )
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

Hi Mauri Sandberg,

On Tue, 9 Mar 2021 19:48:59 +0200, Mauri Sandberg wrote:
> Buffer writes do not work with AMD chip 0x2201. The chip in question
> is a AMD/Spansion/Cypress Semiconductor S29GL256N and datasheet [1]
> talks about writing buffers being possible. While waiting for a neater
> solution resort to writing word-sized chunks only.
> 
> Without the patch kernel logs will be flooded with entries like below:
> 
> [...]

Reworded the $subject to:

	mtd: cfi_cmdset_0002: Disable buffered writes for AMD chip 0x2201

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next, thanks!
[1/1] mtd: cfi_cmdset_0002: AMD chip 0x2201 - write words
      https://git.kernel.org/mtd/c/7e44041136

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
