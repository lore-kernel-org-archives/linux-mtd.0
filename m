Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAEDC2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 12:16:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2CE6102A
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 12:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2CE6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJxvwRzpiPwsoaVc70xEj34YHkk92+HK3LuloYvsJ7c=; b=T/lj7HKGaLt3B6
	eCZn+7MzWLK+JNNpmvn6ooU4YqDMTsNJ6dePnVqZE8Rwt9/eyk0oJsZw7fbGtwbxlP1BgosaP+amE
	de1ipyCknBFirQ3J67mrHJZ4bMR5maC5RRDnd07clOY2JI0kV7/mnx1eg45OJ2t9DMNN2ZAsuFfkA
	8t6IBiLn7Km8QLEvIBWqf+7nBCxzAC3gWs8pbZM2Iex7KGdv8Z07kqXQFu14qtEBATJYvMnASq00D
	smL70glMhhFZMKZrTJfkv23F/uHtmfjwlByu6aaXiEczBmWtBrODI84YOrPkBQE/JUGLZXfa0G7Lr
	igWUEypKht2WURwezoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvfJN-0075jx-Dn; Tue, 22 Jun 2021 12:15:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvfJJ-0075jD-5t
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 12:15:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15MCFFQZ053902;
 Tue, 22 Jun 2021 07:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1624364115;
 bh=VXl+turadXEnbo1KvsAjQeLsr8jDoDct/9xwVEpSP24=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vfk9zw3qA8STy8oMrHARhDBi+4Pq2AgjZ+aUCsfAaTshQKPMGcAV4+FeD6VVo2Lwc
 8j1+UBTA78bzjRGfcOYucXfY/GRPFUk7tXWwHEXgHR+EL4yBqzDuMx877X0OSgzTb/
 HxtG2RtZt0pFNEMEhDXm6PEaa4n9gVUtEnqAC8a0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15MCFEjD048546
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Jun 2021 07:15:15 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 22
 Jun 2021 07:15:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 22 Jun 2021 07:15:14 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15MCFBHg049752;
 Tue, 22 Jun 2021 07:15:11 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Colin
 King <colin.king@canonical.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: remove redundant continue statement
Date: Tue, 22 Jun 2021 17:44:47 +0530
Message-ID: <162436407038.6751.408040408294040312.b4-ty@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618093331.100006-1-colin.king@canonical.com>
References: <20210618093331.100006-1-colin.king@canonical.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_051522_280904_8012A35D 
X-CRM114-Status: UNSURE (   6.86  )
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

On Fri, 18 Jun 2021 10:33:31 +0100, Colin King wrote:
> The continue statement at the end of a for-loop has no effect,
> invert the if expression and remove the continue.

Applied to spi-nor/next, thanks!
[1/1] mtd: spi-nor: remove redundant continue statement
      https://git.kernel.org/mtd/c/c17e5c85b3

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
