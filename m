Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CA9C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dn5c91oqQl5h0iOrwcuQSR3iD28t0MaXzBu5yphZ4PM=; b=ClC/L2HjRsyAHx
	UuXjmW3CNNL/sqYviSzxSbbMbdh+i+ajrecSwELTdEuxvqqfN4flYQLVjMcXbZDsFTBQ09uRcrcHj
	0I36CaBijdg25KrTu/P2oSPrYHXupo9ALUa75CDPLExoYqJNl6myawRVzXwWAWCQXhqfYLtOWygqU
	74E/e3VE4/FNmE2i6R9Dcgv9P8M4Iq725bjDC+zV3Drr5Yc0v1XoL1Qd8k5fi6cqEduqF2Nqy/+0Z
	dXbJ4Z+31vjWQRtabGvE2gsqUfg/1zbPy1XpWkiO0d6+Fsw3LWN4F/dx4XudvSS0DHQjKPkBdfUCc
	2GzXn0fZA9kxlMAv+9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYo2-001x6g-19; Tue, 20 Sep 2022 08:40:38 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhx-001rb3-SR
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:34:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 87C3740015;
	Tue, 20 Sep 2022 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIDCJPbOLzcRAxwQmEioDQfvkrfBcsu30Bu++9B+/1s=;
	b=nUb8JSyQgzCTbXM7v+cpWwMcXHbpm62onfDQG+C4Q0TGOaWjeFVdp5jyCpBXdixxB11H+0
	6/bp84XXzheJdJ7My81RQm0Uf82U8xk6ObbQqOMnGtTGk+aQ5viAAG/8hatzgqM7zR79Hh
	u5EN0IRkdyToQxx8BWozJHZlzI0PgD65nAY/cYakqxOIWuu3j4TQUe2eaNwMC2eSK7Bee7
	3ipfxiaGJo5anGElPv0M3b6yCbgoBAlETcCOp4c6RyvaXRxPzrjDCoYyE/rvb3+ZL40fJa
	KydiiA8VtTzma/xiqg2QLiqSV2p7ix8i45XiEvHiPy4Ep2vvpq4NNJKJk59I0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: cafe: Use correct function name in comment block
Date: Tue, 20 Sep 2022 10:34:19 +0200
Message-Id: <20220920083419.601287-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805180117.2375503-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'81141fe9bc176b6a176abfe1cbc7f6ba71d37e89'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013422_114637_F897EB98 
X-CRM114-Status: UNSURE (   6.73  )
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

On Fri, 2022-08-05 at 18:01:17 UTC, Colin Ian King wrote:
> The incorrect function name is being used in the comment for function
> cafe_nand_read_page. Correct it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
