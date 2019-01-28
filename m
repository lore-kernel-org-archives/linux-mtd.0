Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D52C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F0D0217D8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UF+qOQIg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+uoNtYs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F0D0217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=0QzDxk12oQDrMs/HR80erfdvaIT6+Ojl/ydmUUW6ZMk=; b=UF+
	qOQIgTFTEm+gE0V7OuS11Sfp6FX09K9EQfVldtyDx4BeLCvq4AKy1fyp3WLAs+ACfWlNvf9Rdy4zN
	H0rIJZ43G25oz/G5LOMQP7eARV2V8ulHvJP7qmosbTtAVKZIoV6InOeNI1H9gYJ5uS9dHr8m+VI1B
	rXWaez3SII9q8y90aPmZiTBrCCFz7r5s190STNg0CLaitDmQMisexUvPFWEeHDr4BNLlmAyrIFq+S
	9gZj6cAQeqI0n3aG0MbpfDzg0F7wrGFm8T3wmYB1cWllGwrSmcZRiy4a6U03rHS1LFPKE5nwQ0ck1
	tI4wYQSeEEJVG8jXIvxuB1Xi1VGSEYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3Li-0000Z0-Rd; Mon, 28 Jan 2019 09:37:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3LM-00006Y-Rx
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:36:50 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56FCC21736;
 Mon, 28 Jan 2019 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548668200;
 bh=PWojIyCQkRFp/6jyCB75SKbnJjFFnbvxVm78zAArNyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Q+uoNtYs55kZQkxDXCgpEI5/nvPR8eUC2zjguaiGAPhe1S795htu1oj2Zt1wL5Ate
 afPs7L23RlMlEBm68b3ECeAty7So0Aa8WluedpRJQRXaxjkTygbycB8b3LQ1uMMYbv
 NAGuJRuZqEiD7NW9hx4Iy+qdfKrd+YbuvBTQlYA8=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org
Subject: Re: mtd: mtdcore.c: Remove empty lines at end of sysfs related
 functions
Date: Mon, 28 Jan 2019 10:36:35 +0100
Message-Id: <20190128093635.18807-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f27d78bac7cfdc2e49fc95a942b7c4bc48bbeb68
In-Reply-To: <20190124155220.20258-1-sr@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_013641_804322_74884F89 
X-CRM114-Status: UNSURE (   6.90  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-24 at 15:52:20 UTC, Stefan Roese wrote:
> Some sysfs functions have empty stray lines after the return statement.
> This patch remove those empty lines.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Boris Brezillon <bbrezillon@kernel.org>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
