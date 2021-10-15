Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBEDC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36FBD61041
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36FBD61041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAcKAcldj5Io+E+Cw8JsTVdbFPcC1eEvyeVnrh/YFWw=; b=K8g/r84w3Wu/+A
	t3SD4lGkFL7Dr3w00BhrqMLnb7J3Cvs4TGnqyYZEk1w9t45WQLjjk4E4rOsvCFBzg7TX8GVY2X/D+
	+wsR449rlDeNcIctSSnyiOZqlc589FnHv1/UGQ8dDAJvcSBqQxPUj5NJgrZCjqQJswoWBODKiysWv
	44BzKG4iZjhWqFLNMnFF2XwrwJuWKNyc1Ae1yIwV2IEzCM+oC2lhtGJdQ7ju8pavlXsNOj5Qn2/AF
	ujw4QZA3iwYpvhiEW/FLJexW7dGfCe+wkDI47M4cvstR0TuTsZnyk9l5U3KCeRzQ8265QFV2lRUXZ
	0pkmRgdZwjaG0dg+tPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKUh-006UWK-C2; Fri, 15 Oct 2021 10:31:19 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKUd-006UVe-93
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:31:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 44DC81C0011;
 Fri, 15 Oct 2021 10:31:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zev Weiss <zev@bewilderbeest.net>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>, Zhen Lei <thunder.leizhen@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Jon Hunter <jonathanh@nvidia.com>, Petr Malat <oss@malat.biz>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Mario Rugiero <mrugiero@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: core: don't remove debugfs directory if device is in
 use
Date: Fri, 15 Oct 2021 12:31:07 +0200
Message-Id: <20211015103107.948869-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211014203953.5424-1-zev@bewilderbeest.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c13de2386c78e890d4ae6f01a85eefd0b293fb08'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033116_060708_16CF82E2 
X-CRM114-Status: UNSURE (   7.82  )
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

On Thu, 2021-10-14 at 20:39:52 UTC, Zev Weiss wrote:
> Previously, if del_mtd_device() failed with -EBUSY due to a non-zero
> usecount, a subsequent call to attempt the deletion again would try to
> remove a debugfs directory that had already been removed and panic.
> With this change the second call can instead proceed safely.
> 
> Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
