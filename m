Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47638C61DB9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seTTS8aB/8ltA6vsjVtgJ1vF02ndHWQSS14a6Cpmhds=; b=s4E2XHvW6XcD3v
	+ienAGrrUjrt8qcsl5Lw/uglziZCmzIw8cyGfLYml8Rbmpx0IPb9rK/Jx1vCumv4PyfR/o22jI5kn
	RlpiNTbHCUEnvgLCQDyQP3FQPjxs6VgCOQcLl0Z2HpSLElvN6lfJ0MNazru6MkcELGOnxsOe3XpIW
	8FT915/c4g0MuWOkyHT/J2gd1zGsFVJjlQH3+GqKMene8YW6jTmQS6E3Ax3PruebNaDSUdNc5Qg/t
	y0vUqwI/BgnjXpRwIBZBj/5VDjyR1i4uPXz5UqgmWLQOSqKItlr3QQqJsk/xYIkiHfopOYKlvrg62
	nBUXpQDvt16guJ6ru56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVjY-00000003ftJ-0g4z;
	Thu, 27 Aug 2026 08:45:16 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVjV-00000003fsm-31oR
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 08:45:15 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b89f5ffa;
	Thu, 27 Aug 2026 16:45:07 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v5] mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
Date: Thu, 27 Aug 2026 16:45:02 +0800
Message-Id: <20260827084502.2794139-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87jypcdku8.fsf@bootlin.com>
References: <87tsoigz8x.fsf@bootlin.com> <20260827082656.2772784-1-runyu.xiao@seu.edu.cn> <87jypcdku8.fsf@bootlin.com>
MIME-Version: 1.0
X-HM-Tid: 0aa04264f23a03a1kunm724801185d503
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDThkYVktNGkgYTkIeQ0ofHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hZ47xYxSI2yFtfwGl/7HTcfUTMfdWjqOYesNTf57QZXRGfHhnF2Q0GTpL0aWq7QDuh4gg6HPSxbZwqLsFth3wdY7mE7LLFfClpCHceooN2u9ikcoMGUKey3RtcUUhbGxfgn9fyKWTbSANupwaCA4ldA/X5QPKc8JNnfmuvUoSQc=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=4Bgb8Ks8ORJZQI+Q5OtaZYmlbYL3o1UYZygCCGgaZvc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_014513_969723_4ADD2D41 
X-CRM114-Status: GOOD (  11.26  )
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

On Thu, 27 Aug 2026 at 10:33:03 +0200, Miquel Raynal wrote:
> This paragraph is a bit irrelevant, we don't really care about the
> feature itself: there was a conversion to scoped mutexes, this
> conversion missed one place, you fix it. That is the justification, but
> fine, let's stop iterating on such a trivial fix.
>
> Didn't I send a Reviewed-by tag already?
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for the clarification. I agree that the commit message should focus
on the scoped-mutex conversion missing spi_nor_rww_start_exclusive(), rather
than explain the RWW feature itself.

Sorry for the extra iterations and for missing your Reviewed-by tag from the
earlier thread. Since v5 is already sent, I will not send another revision
just to add the tag; I have noted it for the patch application.

Thanks,
Runyu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
