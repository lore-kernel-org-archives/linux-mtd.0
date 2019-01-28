Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1356C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF4320880
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EEuAxqI2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRSvPOMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF4320880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=Q3x9ejzGx+9XCGOTZ9lm2AEi8U4SJTz13oKltGhUWeU=; b=EEu
	AxqI2Y4I8nubKL7FAyCa8HgesTAXfUORK0KXNxXDtq8HWCJDZz4Uv/y/zc212gt19yvg+oE2riqXc
	WK7rEZowiUjNLwBX0G6BGUaDI0sIlTtnk+G7e2RmIM2hInwGdvtJyj7620Bu4+8tOduV6JFWBloVb
	KEFoh88xDxoX5IwC1Tce5BxvRUjXvoCTX3mAjlOziyr1U0R14E2f4uQXkw7qcB9DiDBgSyRBBdHJr
	aXCQEBsAWeb8MN069RGl7ddb7lXFvZlpCQxfLustAqGEpdd5QslRBw6m6LOePBJaP21uR3jBJ+8MK
	yeBrmYwJiUjzlAgw9LdxKrYeIcK+V4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3M1-0000yU-Cx; Mon, 28 Jan 2019 09:37:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3LV-0000GJ-0S
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:37:18 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF9CC217D6;
 Mon, 28 Jan 2019 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548668208;
 bh=da/vrBQ8VMJmjnf5OTI1PAGzFWvvYe0W1XicVmqsA1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XRSvPOMBWclX5tLlZ5TmpaXMcNb4X4aiKeE2gc8IfTYN5TKdnkLJNNLOkwpl56Bhr
 LbduZH7TM3IPMcev5yoNZY6FxSfZWGo6mC5zR4Q+oHU67RvvLeh0tdr1ly7foGEf8n
 bJUFy6WEi7VcbUzpGDLkVGeFuHLOLs72IihLR1SQ=
From: Boris Brezillon <bbrezillon@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>, robert.jarzmik@free.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org,
 marek.vasut@gmail.com, richard@nod.at
Subject: Re: [-next] mtd: docg3: Fix passing zero to 'PTR_ERR' warning in
 doc_probe_device
Date: Mon, 28 Jan 2019 10:36:43 +0100
Message-Id: <20190128093643.18929-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 05f93739cdfccb4c3d30f821b09d418dfc659997
In-Reply-To: <20190123065827.16748-1-yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_013649_230535_982AF365 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-01-23 at 06:58:27 UTC, YueHaibing wrote:
> Fix a static code checker warning:
> drivers/mtd/devices/docg3.c:1875
>  doc_probe_device() warn: passing zero to 'ERR_PTR'
> 
> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
