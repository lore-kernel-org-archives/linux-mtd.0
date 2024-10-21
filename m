Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09186D0E6DD
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgycKV/lKPjuyKWsksfV9+W6D4OHxACjvHHETRd04wk=; b=O6IWRMt3/pLxxI
	HPZfi/NXr1gIBKOfCoDfbIUMyVqshu79VXJrQFYYwgKzG0U48X7g3z1OWxyLkIID1BPoactNloBc4
	vrYetF+4m4K0TqPv3YcP9Wr/5VdBJxMsISaH1EJDlOe0p211kPklYxTc9AxvPtN4+mcf0fFOHoLm7
	rt72x5JXcJWHbhcBkPAq5q1xioDQ0SYIdGHloaX9qwMr2ZdjEgJ6pAu9Tb51v4dLBmGbEyskxdyLH
	8/AQdU2rNUzZaX23AhIGmgopzgag0fluRyX+u/Mb48XlIIbDfDXtgcXYYWctGR/eXYjYeUI4j8HaI
	DyoM3Xrqs0brY93KZlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pH2-00000006oMh-01OB;
	Mon, 21 Oct 2024 10:04:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFI-00000006nqN-3CZ2
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CBD01C0002;
	Mon, 21 Oct 2024 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KmJDdtwu7yFlMx6CxV7xwkga/0e7ocqt3YdcjbK1Rg=;
	b=pjbCMal61lX5svKMpZO0z6ApOb2Dw/2/bVvRRRpuArn1BJGFNb4GvBmVFvIlL6tx/zyH3j
	lCGj7EB33NNkVRnZ9WU6jM7BPKmphjSncIFAyNkKmIkojgjB/vHk43tVRX/8+9gc5NFmH9
	sMYr1TP7vP1i2Lu6Nr4EEHafifQ8TR806pVg/guHDipGI/n5Fy62deuerNO0rPVOOnlkxk
	ghOgwO6GfNqsxmOV5MnCbLau/Nd7kny9IslI55ISfFnRzrfX7ELOEbLCVt2kWgxjhyPjfl
	wt+Neug7+XuvJqV7VVV41Vj7bmQyYQjQ3A4BQ2inCGFRIg6TUzFwWmszptxOTw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mtd: nand: raw: gpmi: improve power management handling
Date: Mon, 21 Oct 2024 12:02:36 +0200
Message-ID: <20241021100236.173365-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007191319.220775-2-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f04ced6d545e20b3579c575b0afdbd7054db2543'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030240_966785_6831C9FB 
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

On Mon, 2024-10-07 at 19:13:19 UTC, Han Xu wrote:
> Refactor the power management handling in the gpmi nand driver. Remove
> redundant pm_runtime calls in the driver probe function. Handle the pad
> control and use the leverage runtime suspend and resume calls to take
> care of clocks in system suspend and resume functions.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
