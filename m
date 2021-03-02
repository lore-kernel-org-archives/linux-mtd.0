Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E298C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:35:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05F464E6F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05F464E6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OWcLVu1n3h8sIrNvOfP5AYm3C2l6G/ESOe56HhlX3Ew=; b=rZC7ZwZ4bh5PsItL1TJEtssav
	bf7HV1Jyc8rZX6NHxFgUwcmbgdrCGM9GvaZFiXv30pTs35OA8jVGFRko1ivXalxw/8YrOUfE1QzQ1
	JWDK3omfj9RsyHA6REoJ1CccIKkOd1LZZhdJwgWuYdTnJQ6wSvZaVCKPbWSYGS2+ndbbADVwsgOp7
	w2N6aWZrK/4c3j9EWVPL9TfAruwYn3rFasSNRarv/LTpPSNyfvkz2f72ProorrjcuU747+5zq4C3k
	onlKWtkcJLfLvU/JuJRYYbqLdqxeFWuZQBiYppqDE4wIm5jNOGMaXLzP1Ln+jhwvjh0ntyZqD3IFs
	y2uxUtDAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUSf-005cqE-6v; Wed, 03 Mar 2021 16:34:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSpx-005E6U-NB
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=NsVKSrLx57qPjcxmhtlQC265gZ+H4x3Nz0pWXr0i64I=; b=S94UNc0SHWbEJZsEjcZxFwQ8Yz
 MZ83ggiY5806sLjgHmwVJQpCjjWlUT+dBVJBObH3l20PvulvYdOyeC1QQkCVQs3zS3wcJGy7vg7sQ
 GXdhmjhUe1jUz/anLOX0uDgISJpj1n+Kk3Y+l1eQTratu4lnr0/ZrFhZJu7m+nC6zVdnqisTr5xaL
 UU25XouMZPjTLN5s9mmGPlD67AGpasKXuIjzZY0YlxKZlCgXBJX6yW/QR9uZaD7iyIa0DbElS7aEk
 fBBQaDKuAx3pgjvaX5M+lC2L2J38kILPOgE/iTqpfADE1cSWp+6Q8MpZgBWmVRHbZpCSTGow22cbk
 i866R1JQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bg-00HWBB-5s
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:52 +0000
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id AB31F20000E;
 Tue,  2 Mar 2021 17:14:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dejin Zheng <zhengdejin5@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, nixiaoming@huawei.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mtd/next 5/8] mtd: mtdblock_ro: Use module_mtd_blktrans to
 register driver
Date: Tue,  2 Mar 2021 18:14:24 +0100
Message-Id: <20210302171424.1508-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213164600.409061-6-zhengdejin5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ebaedffc4b4e595a50ace22461bc7305b6f2aad7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171452_753405_3E8D9A22 
X-CRM114-Status: UNSURE (   4.05  )
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

On Sat, 2021-02-13 at 16:45:57 UTC, Dejin Zheng wrote:
> Removing some boilerplate by using module_mtd_blktrans instead of calling
> register and unregister in the otherwise empty init/exit functions.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
