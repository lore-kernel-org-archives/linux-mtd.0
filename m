Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D68C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1191C60F58
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1191C60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKQFVe011YjlCXhwh2nO5e3pPiq+oeS3e/Etk07kVpA=; b=e2ywailALkhdXd
	u/4zO8UKE6tguRVHd/P2aFaUHEdNL3dN8u/5Vydw1HL7gGRD6tQiTPC5GBYKG6w0S+pGn2cEOfPac
	1x/fnZ1vZXQPj7oASt+g0d9jh172m5bgy8mF95NHcVonWE1PTMNgeon7RWjBAJpSJ9jZ9fYmVGeJn
	6mqzresvXJl/t8rLv9n+/6edgZj8AAz+YbheDinAN/IFgIr9KSXHMUwwJkdxza7QbKVi6CDNvlAJx
	+4UkctnUpxTptlb4hOw2SCAwwDWXNmre1k7A9BhF/S3pN4Fquu3oEAhBkbqk5Oe36qYlK2oVu8i9L
	kpjYwVBj255WBMQ7TjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFdb1-00HFKe-PX; Mon, 16 Aug 2021 14:28:11 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFda8-00HF6q-UC
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 14:27:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 71DC6100007;
 Mon, 16 Aug 2021 14:27:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com
Subject: Re: [PATCH 2/2] mtd: mtdconcat: Remove concat_{read|write}_oob
Date: Mon, 16 Aug 2021 16:27:13 +0200
Message-Id: <20210816142713.15165-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731023243.3977104-3-chengzhihao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e128bf2f39da400cc3c69329ea236a992b429d40'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_072717_148294_5F4B2235 
X-CRM114-Status: UNSURE (   5.65  )
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

On Sat, 2021-07-31 at 02:32:43 UTC, Zhihao Cheng wrote:
> Since 2431c4f5b46c3("mtd: Implement mtd_{read,write}() as wrappers
> around mtd_{read,write}_oob()") don't allow _write|_read and
> _write_oob|_read_oob existing at the same time. We should stop these
> two callback functions assigning, otherwise following warning occurs
> while making concatenated device:
> 
>   WARNING: CPU: 2 PID: 6728 at drivers/mtd/mtdcore.c:595
>   add_mtd_device+0x7f/0x7b0
> 
> Fixes: 2431c4f5b46c3("mtd: Implement mtd_{read,write}() around ...")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
