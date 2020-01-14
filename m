Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E707C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:10:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F10424656
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EEhtlR7T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F10424656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3wMOovEiXOiNClB5o1eu8BPlzSiR8cXGrlnNpPUy/c=; b=EEhtlR7Tha3RUt
	0w4P4EOEz/rSydhQnIab5GHgrXqDTy3/+oZwr+UGNjyK9+bIcMOwAhxz67MpppK3FkqgheT8FhapH
	tRu/UnlhyCh31LDkAdnUmsLGHSf+AKMTNy041tTsu0tW5qsxY9gFXsMJksKxQaFFD6BithTUmKMwM
	Lo1LTTblBhVx5PPxl3rbafWFsn7KLe/UNZxZjM24svjNKYS6dcg3xwtdGoWRwRVcC2I895VLpL7Jc
	a6h9g+qWPA+o4MvV7KcqFgceuzobkbv2mtPP2K6anRbt6MvxzNxE1/bF4D5zUs4hWJmRoKnaAbK6O
	xU43+WgGeiwD7croxaRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPi8-0005q1-MY; Tue, 14 Jan 2020 17:10:36 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPgf-0003LU-M7
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:09:11 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13.lan (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 51844E0011;
 Tue, 14 Jan 2020 17:09:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chen Wandun <chenwandun@huawei.com>, kyungmin.park@samsung.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nand: onenand: samsung: remove variable 'tmp' set but not
 used
Date: Tue, 14 Jan 2020 18:08:49 +0100
Message-Id: <20200114170849.2229-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1574424534-141265-1-git-send-email-chenwandun@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: dce02513d9922dd41c49a4bf1b9fd21c22fee76c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_090905_877015_49E97461 
X-CRM114-Status: UNSURE (   4.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On Fri, 2019-11-22 at 12:08:54 UTC, Chen Wandun wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> drivers/mtd/nand/onenand/samsung_mtd.c: In function s3c_onenand_check_lock_status:
> drivers/mtd/nand/onenand/samsung_mtd.c:731:6: warning: variable tmp set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Chen Wandun <chenwandun@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
