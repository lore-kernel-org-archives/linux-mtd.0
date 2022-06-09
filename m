Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD3C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elM+a7ZQdVpKX3ghinyweQ8k7zyyQuMWt1TZG/T8ReU=; b=sPnWv992PQ27Rr
	VrcgelzNYPlbYweujgoJAjjorwuyE055IuzJbu/SPCSFarxIy1FfHM2lOBvW+jLJ5t+YgASXMfBcl
	NVijuwrbZp35M0V17SmGT3lSbnLR5dmEpBf0Y6lJP8PHCd8OrotRt2Jm7qOCnk7v1ZvnNoJf66scb
	pnRCHjXG0TFao6PsPCLiscOrEg1smFpl4O/Eg14gmI19yaJdKDTE5ogNNDYdTcEnwxoXCbBX2+iiM
	cFRwyvnP2YUgh950p/9ELonwE30vDIXQPF+xWZnM6ZxZIJxseZOg1NIBdDbLeGHOPrigao+5rFs6X
	wMVaE8IDcoTp4liZ8wkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHWL-001qVG-Lw; Thu, 09 Jun 2022 12:44:17 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHWI-001qQQ-JO
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:44:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 349DE1C000D;
	Thu,  9 Jun 2022 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh0EyhjuDEt34kf2NyApfB4/YmN6/yaxANbey6hLXEM=;
	b=RhSngzTJO64S6lbii9KYjY6QfSmkrIxa/gQlLBWM+AZbYqCnJy8iz+R8kQiJl7PSKwPK+R
	8SnKfoh9agj1iA3qV282RjCouMmX4VjIJdB50wX6Qy8UwqFqbphTJ8ro3GM9//YQHH1qfh
	yyE4kjoyOYhUmJ6aJ2lvvQvQ5xsyvsVhfMF2Pn8CyFq6hjeVBMKOvAUyurTk87wZ9gW8sG
	WRDELfDn5JNa7WlzkHDfWULJgDoUFB1K6YomsOGa1W4JGrU0t3E+ciorcEJ+mHhoQ1EUb0
	XC1ZSxgcmIaw8J7VGkrD7jr2h4ObCjiB6mI6K7r49Yph7bUZNaxQ5y2Ac5V2Gg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spinand: Add support for ATO25D1GA
Date: Thu,  9 Jun 2022 14:44:08 +0200
Message-Id: <20220609124408.209175-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604113250.4745-1-aidanmacdonald.0x0@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fc602b4f692cb83c937b5f79628bca32b60c4402'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054414_794212_051B6BBC 
X-CRM114-Status: UNSURE (   5.73  )
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

On Sat, 2022-06-04 at 11:32:50 UTC, Aidan MacDonald wrote:
> Add support for the ATO25D1GA SPI NAND flash.
> 
> Datasheet:
> - https://atta.szlcsc.com/upload/public/pdf/source/20191212/C469320_04599D67B03B078044EB65FF5AEDDDE9.pdf
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
