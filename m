Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC42EC3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjbZtmTypewpCGB1rwsKlwI1AXDwfo+QWDB+Q047V4g=; b=tp8MWbnAsQoosn
	qpZFCv/wGbxrw1/MKkvW1U86LOKZQEFtt9Vu6VDlX4+17lGtUuZ6Yqb+Kuvos1kRbUi5p70SHB8nH
	1PW3mlSbR/EiUP38feHY6fo/bY2qf0gCYYtzivYILoqGa1DuG7ftPcc1NhD3URRBqE6/S8pbSK2oZ
	crhkzuLplayevx+wBRNxanKVqAR4JQwhUTfWKrjzIQiJCRlNobPguPypT3Xj/zaQ9RDQCjgXDtpEU
	Lpc5/+4Cot7MI1cXs4sA3pz3Y6v04R3spxIX40GbR52/t6A8aLqliyDj5FgCqiqveR3cp6WcWBfp4
	Ybp575Wn5DIE9DDPZxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIvR-00AlwW-SJ; Mon, 02 Jan 2023 11:24:18 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIrf-00AjXm-Lt; Mon, 02 Jan 2023 11:20:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B57040003;
	Mon,  2 Jan 2023 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIRjjM9BazxN62f1abUsHSvG9e7+Ah1eYy4khCLuHOg=;
	b=KzhEF7BmXRUeMlpa6FFiqhgXvb/e4/K3nKxns1522ql8Lm9/GUejSgz55GJfcoaVsywjUy
	BhJ4J2RfrLH7nzXAqPPrthOoYTibPtPffArZlSWeh9GsD5duXdSQTOClHpeubY91j6NJx+
	ohFG6ulXgj2TQ3cXY/EqmwWf1CyjPbsBcS0W07lja8j174LjHYUvBad3KC2Ga8ReJmpvg9
	bm/FqErp6NL6XtUOkDsBDFkL/VronM0EbYrxQVRWEqIHv0Jlbf90ARFCvrEh9wPQlGIWyS
	Q1K2iMypPXihNYJ4Nqf4yOGtQ75SKcgW8XfIRyP6NitLvt7kfPwteSPueBPkDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/7] mtd: rawnand: sunxi: Remove an unnecessary check
Date: Mon,  2 Jan 2023 12:20:20 +0100
Message-Id: <20230102112020.250809-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229181526.53766-3-samuel@sholland.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'59186a402ab07d205428ee9f62ff0e95ecb06b63'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_032023_910548_314E4CEC 
X-CRM114-Status: UNSURE (   6.32  )
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

On Thu, 2022-12-29 at 18:15:21 UTC, Samuel Holland wrote:
> sunxi_nand->nsels cannot be zero, so the second check implies the first.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
