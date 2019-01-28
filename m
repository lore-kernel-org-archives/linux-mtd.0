Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA21EC282CB
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:36:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B479B20880
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PbjurbKF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyoB5Mva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B479B20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=YTAE5UrBxEon2390EsUPwr0jtzMrT1Wd4e6VAwuJgQA=; b=Pbj
	urbKF8flvB81PLYC1Cu6qqwZnnP8Re6NXIpdZr2wG7bu7kyqvdshAJUo18erp2a9bAsLG9QK22Mde
	193kleC2fICVJ5K6nCCHE5sygkKm13hLmkidkB5vEJnt0FOJJiHiGMQLc9PiqX76RmE4fcZ+CBpPN
	NnTNszZUB51gZv55rqYUhcbHwYuHer9BVU0zLKEsnEWECm+4q2EMHmrr32ilMDVc0A+phDGQydKOj
	CXctPWdnc6on4CfJZdxdJAeQQydyur/SSaerYgtddCIOKdPGTzOIO4bywiy1SOt6/UXacB02IDLjN
	F2rmAEZSEWGCVzbsxUnrf7OgA9JDmbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3LW-0000HM-0b; Mon, 28 Jan 2019 09:36:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3LE-0008Mj-9A
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:36:47 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EAE320880;
 Mon, 28 Jan 2019 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548668191;
 bh=HnmiZDDnIoodoZisvzDrAioD+D+NSzvDFN8n4IKpNPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HyoB5MvasufV7olTUeFE9b+9WeMQpOY5yW2UzPeHzi7OhAL3i+b8yxIRVbv3q6k4Z
 +uCKXwOC2XVlag+xXeQ7jgah5B29r0yuLePzshYPacmf6aZZYk5S56nk7tOtQKERYV
 dA1MGvUoo0ECS25WXZy37Sg+RVYHBUGyo+hXND/E=
From: Boris Brezillon <bbrezillon@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>, robert.jarzmik@free.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org,
 marek.vasut@gmail.com, richard@nod.at
Subject: Re: [v4,-next] mtd: docg3: fix a possible memory leak of mtd->name
Date: Mon, 28 Jan 2019 10:36:22 +0100
Message-Id: <20190128093622.18620-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: decbd9e173cadf348b86038356d1aad8ef69e4f5
In-Reply-To: <20190125021242.17268-1-yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_013632_842555_A7B6A21A 
X-CRM114-Status: UNSURE (   6.54  )
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

On Fri, 2019-01-25 at 02:12:42 UTC, YueHaibing wrote:
> In case DOC_CHIPID_G3, mtd->name is not freed in err handling path,
> which is alloced by kasprintf(). Fix this by using devm_kasprintf().
> 
> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
