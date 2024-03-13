Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3926AC54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zntmyfFw19CvUKUsCz46RjxgbidcjXVdIf1pTtzbFvM=; b=sHPLIiQ00StclB
	sEIT74fwUYDOiIEq8DRlVa4Grcw4LRsqhT86tuI7d2kpvL3wwT6Uxs5lsw6+C5cA4SELnJB05d7JW
	Ibfmy1cNgDES5+IYLjAb99SriebCsPDghd46y/azf7rCbMm9X3zFhx/bXvVAXYVlW8/YntLvCmOP1
	AuLXeyEAfECVcF+DCvwrL7njRxZA+XVV9WvQIdmQywxt6tcj67DrP9DpeWfkCZY9bvZegdAa10360
	w3Ax3OeMohU2GvIPKBOKHrNg8+t1Z6lfrO3zAkLHpXSD/zx5MQGJ+hFpGbKPBDZdUjDUlujS66+Nw
	34imNQjVkLUxfrSRh5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkX0Q-0000000C6v7-1Jt3;
	Wed, 13 Mar 2024 22:23:26 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkX0M-0000000C6uD-40Ux
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 22:23:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D03211BF204;
	Wed, 13 Mar 2024 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710368599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3LF1DgETq3+uAOl/bFUlSXoTzHAoPYEGhBrdRccuLQQ=;
	b=EoelQSV3syJ71nv3hScMYI/oP/f38N7nV2KbckHkGwKn3GP/6MVb3kUVskLwVuEv33dSpb
	S0swiDDtCYQJPmeOwt/pEmh8F3XF2lPPsfWsLs98O0L9wwaOqSNfqtaZSr+6Ga6BCPyWM+
	vus4WQYwUx0dsD2xPAs/syXMYWLvEl6ORZcJNCUTYxy0O8MeZ868zgJvn80aSO9PcvqVyX
	XkcQOcLcaGBY+CFd99rTkp9TmnWrvXnVpzKgkbdthBHoLGeYw207Z0H4k3KJe921NqZB5u
	29RdXywPV7g6Ny4IgGqZKQMDLivSZwNJC9xIFAh2vVahZFGUP8sxhGfETnXo/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Date: Wed, 13 Mar 2024 23:23:13 +0100
Message-Id: <20240313222313.800965-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2842dc9bc1a53893eec62ec9e49beb3b501702d0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_152323_323315_0E3D1569 
X-CRM114-Status: UNSURE (   6.75  )
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

On Mon, 2024-03-04 at 09:01:03 UTC, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
