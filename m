Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC02DC7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNTr1pbsdZyflTJTVzEtLW8i4MWkBIDFjZHpwWBtufo=; b=BmE0lBvGzKtHnj
	GMsSov12uf+Af0ytpK8Qo3aUJbSRKpSPd7rBbHG4cz02htDjXKYGxbO5jjPW6zPpsOj4Q+Ds6i6lc
	Gdvigr1vB+JbVdkeDn0M3qbK88iBLTZBOGpADwJjAbGKe1r5G1QvqPV9zm6QSvWF0iofqy996R2pf
	sZiBQZmAH7y8OtnDemKqmzYzqnCOc82FSfOLL0StwwV5TkNTOBlQ4KOo6eMrrJD1OQGC7tPg3LikN
	4rKWrCNSxti1VG7L1/5KBfZc6yQ2qY5ZulkwSyzgnJsQTQV8MORsWjZ3+ZbOPIx6SPUIJf9BeURn6
	TWQYjGSai2Cmlo+xx7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17x5-0077wZ-2K;
	Mon, 22 May 2023 16:00:03 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17x2-0077u0-1r
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 16:00:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 25E971BF206;
	Mon, 22 May 2023 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684771196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VijY4DoUw40fbRYdmVVSksPIq3IaGyWU7geZrDi9jVY=;
	b=gJdAt2AxCyojcPac3vYSG5L9kgkvZ45+X1jCPtnISIjGf8w8v4bfEXbg+xnrHYrV+vz37P
	h4Fczbm62E4yzY8K49bNaCnwIHn6K6eBD7a1q+ZU0jFYwpp+LjuavdECHFo0S16juy7zx0
	/BDeWyoGoWPotVQ9qtwAAbMPT8IX/eq8jVHgcKndvbwden3PdIcB9XOplbckbQrqxcSu4h
	zf4Sd5dG3bbf2I4srFuCMqb8MlPeD/YzhDLh1J1c6TVt12gdOhwduZ4yEoTc3lNtdJX61p
	PCuLsH82GJ+Om+MP/sggqHShHJnIBpGDuSaiaKHfqvGq2cejWWc2KGxy+ArjSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: st_spi_fsm: Use the devm_clk_get_enabled() helper function
Date: Mon, 22 May 2023 17:59:55 +0200
Message-Id: <20230522155955.119637-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4025ec3980a956b0e776024e88ec960afc457501.1681636580.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a2c2690f0d747c973c6a384ab8cd88faa806e5a5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_090000_767948_06DA3EFD 
X-CRM114-Status: UNSURE (   5.48  )
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

On Sun, 2023-04-16 at 09:16:36 UTC, Christophe JAILLET wrote:
> Use the devm_clk_get_enabled() helper function instead of hand-writing it.
> It saves some line of codes.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
