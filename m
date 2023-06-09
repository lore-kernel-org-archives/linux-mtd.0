Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A777C7EE2F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7J+2izknjmMirVzh1h5mg6uQYEB8mgFJeXhrpucKUs=; b=n4Q/GrlR/vantT
	NG2oX/GRCsNAhz3u5msO1GVwKWVAGn7UJUI31/1TfiWHdQTl9DpJ7z3184CBQhdqkJAKAXmbONH1Y
	jmKTjskm4DbOQFG1IvAg588bHzYMevDAE8p3eEdTfCbocWI4DBRdu9tfCAdMUgu6QtTJGfY9k4azd
	1eDk9yGOLR0owPwdU9ibDWcKBu3H/DIf2JAzeAlMM1tlAfq8Gp3UjUGRQV4gNbKzQ/xTbqINuuyxC
	7cilebwUZohgx7gSi6nX7jU3hwp80t5DGauLiclmi4W4UiymUO9AdtBfHNYZ/TW71iFRAvbTj3sSG
	3qhU3FzIt1IJdskQcfGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1i-00DRH8-2g;
	Fri, 09 Jun 2023 15:27:46 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1f-00DRFR-0M
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 15:27:44 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5xcCQGgFV8eBxBmrqSktx3CUKeTiFDUNo+4OSLOwWY=;
	b=gQArpqEion7u+nd4yvWRi/Bn51ejuyiQgLjvNCMg8EbqELRT8hX+Eyylgqv+oIE4Zm+Sam
	aMj+4iKG9jOi8GXqPF6onxFy4NGn/i3UnR+OwxaOQq8ko1XDNLlpalaCzIrZloWKtc2u8W
	yfNff8vD5vv4e89RVQVPlp/1jXzv4XwlMefpvYt+tC0iNdUvoNO6EqOAQ27YcoI6/TJaIo
	FSMO+kf/E3HHsdlqEiEubE5dO59j13Q3CDdLA1g8nOeLcJGSjt5aKiZGdlJ6WOjZtwCrvY
	Ao7Nznb+qF6YEyGFwWqfrCN/rWIsZsAtnn7IUFdzKTtC9tqWoAF1T/4rME42BQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FB681C0002;
	Fri,  9 Jun 2023 15:27:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mtdpart: Drop useless LIST_HEAD
Date: Fri,  9 Jun 2023 17:27:36 +0200
Message-Id: <20230609152736.1188482-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <547248195d87d1240d6126d13eb1364b1a0b634d.1685853690.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6db02fdfdca0cf39b4d66950451d7f22b72a9031'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082743_299369_4D359AA0 
X-CRM114-Status: UNSURE (   5.08  )
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

On Sun, 2023-06-04 at 04:42:01 UTC, Christophe JAILLET wrote:
> 'tmp_list' is unused, so drop it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
