Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13BDC6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKIMT8aXh0EanDDP8yXpHiA4vCsuZH1jsoM8bYpPpFg=; b=S4ztAl4pPlmu2Z
	oXC12QPfof3LTA1aZdCAv7NjnqRWkmjePlbMtmLxIAhau6GnxL48anpY0SUma6mtNzFy1SAIP1z0L
	lXnD5IhC50xHNPHc+iefFvAjDPwvbYjdxk7JZVrffn656IcWnlLZB+wV7k1ze18uo4rUxBQeZOYHr
	RtvArSWZanNa+DlBOJEq0cRajzQ2z4mFmMavEpbR/DqOsIs4WBR1kRqM1+1N1HVti/VbvNlQrxGnW
	J+5GbwplCJfOURYQ+j5s44sXDx+JkhkQ+phXjTdDcmnEyPV/DxuVaJns1lYn7PmiNQhKd/GjoJMuY
	/mBHjCt4YzLl5/+340EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf118-00Gbk9-1d;
	Wed, 22 Mar 2023 16:08:50 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10s-00GbVv-2X
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 16:08:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 280A61C0005;
	Wed, 22 Mar 2023 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9cdWABbjSFG+G4Dod5eJEhiqyLINQCKDLHQsKXOq5M=;
	b=I+7G0FDLouZhjIlVDkdr5xP67+y+fpkHH/F067PeKXWveRx/pq/6oysz65B2oLn+wqWsT6
	wtfA4O5tA2G+1p856ClQ2KLixuIZdl1vZLBIRPsbA7lSZSOe8c+GeMMLtk+uk9Jopk0d+s
	mTrJqyQc6mRxvfcdz8/oU+qbJgSZB+GEzHCkbzj+Zsc3rg8wqsDTGe0+ECHY2cC6FDRfFe
	ZdSNYF/CWeQsGGhc3sWivPDLXdk6+IYxSEQrkwiSAI5Xbho1senKhkAPiPqkcNnJqLKEGe
	aasJkpeXIWoXIoOKZh2I5q8fIr0jYIZhbacjSfwHr2Q9+4kBSxzi+P0IV5GMKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Avoid magic values
Date: Wed, 22 Mar 2023 17:08:30 +0100
Message-Id: <20230322160830.2232834-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307192536.470997-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'75f32f4b9d5263829d1d13f990000db929140559'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090834_971581_FC9D01FC 
X-CRM114-Status: UNSURE (   5.29  )
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

On Tue, 2023-03-07 at 19:25:36 UTC, Miquel Raynal wrote:
> Nvmem producer config ID "-1" is actually defined, so use the definition
> rather than hardcoding it with a magic value.
> 
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
