Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E34C5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJuXqUfWGBjFVwgz0DIl2aUDUeE+jf963gR7wPfGReo=; b=fzAerY4oN/UJY+
	Bja95toAlgmtEzoyHCnf+kFs+fbQLdfheNPtUfWsl1BBgA/tDMWpeTH1c3YJd+Sd0BfvguGR79d0I
	6WEFQPLxQgi3MUA9RWGRoGeujP99xLcPXWhOW9XiSvAK12SupbSnwxudyTV1Uzv6+2kLiiiM2i317
	5mz9R+uQ6Mdn4jmc3Z9vdMeNVJxuXBBNYtNlGNlOGRk17l/ECVBzQ4LTliotSZd4lMmqZvkGsUCz6
	NnnrFvHvyVZUwbPW+WLjUZx2lBXCKg0QPvhdyTH0PCUPOwshnjnQmMPYFdwdQjHXVuumoqN9l8tkG
	KVCnj5j9+TivMztQ2Kag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuFn-0000000F0AX-1BrF;
	Tue, 11 Aug 2026 21:43:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuFm-0000000F0AR-0bx7
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 21:43:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A818540254;
	Tue, 11 Aug 2026 21:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9B71F00A3A;
	Tue, 11 Aug 2026 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786484601;
	bh=j8XvTfegQkTxeOUa6HZtsVKd9Rec1DKfG0GfXEnrguE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FfTGg09wBVrSo9UJx529+bDYj2nw6OFR7zRD0I1XxXi7vG+E4EqgBwNB4FXRxWpmw
	 eVwM4KggFvzjPT0aOeEhgyo4NifedQGanQuuTbNhz2EJU8TQsVvJSdBNCraMNicDdM
	 nIZ8uxirMeujlyjAFcWnDhQOD/06JI61xrCGin5Rv/kXpAYha2iYu93qwFbHwrL5gh
	 mg9lE1HPMCONyJ1JQg8ybxCWUc5xfNHSPUoUzZvMClf7EybMuvs+tsuL/GAIy9by5j
	 4P3WtSB8o2xlfRPyDFJUa4ZYWMTdHU/AMrG1y/BCso6NQ5qRg4LFCBMdXS07jxZ1T/
	 k9J7MzwsnT2bA==
From: "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <rw@kernel.org>,
	linux-mtd@lists.infradead.org,
	yangerkun@huawei.com,
	yi.zhang@huawei.com
Subject: Re: [PATCH 0/2] UBI: Fix torture flag handling in erase and fastmap paths
Date: Tue, 11 Aug 2026 23:43:04 +0200
Message-ID: <178648450813.3956437.1095449689683161957.b4-ty@b4>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260704083042.459915-1-chengzhihao1@huawei.com>
References: <20260704083042.459915-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
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

From: Richard Weinberger <rw@kernel.org>


On Sat, 04 Jul 2026 16:30:39 +0800, Zhihao Cheng wrote:
> This series fixes two issues where the UBI torture test flag is
> mishandled, causing physical eraseblocks that should be tortured to
> skip the test
> 
> Zhihao Cheng (2):
>   UBI: Preserve torture flag when rescheduling failed erasures
>   UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs
> 
> [...]

Applied, thanks!

[1/2] UBI: Preserve torture flag when rescheduling failed erasures
      commit: 420477a84f1e52babfe60a43dbdd0988ed956845
[2/2] UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs
      commit: be04fce9945aac2a843f5d16725391eb80d948ef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
