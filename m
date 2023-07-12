Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2A1EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4z/Wg+kzQ++equf0xpCuY8KQSsDACTV1C1gHcRqg2wA=; b=FQ0EJH2TpXhUEf
	wgaIE5V9KlSSfTiGHen0w76l8nmBFoRLygpir6rjzZc7DtZ9pZFsLFwv6K1W11vh2G1t4aA7J6nA6
	vWEzcx4oMfaK3uVEDRoyNj1VHtqCz5FGa/JHNEU+JM8Xz4sPI9dPUnh26rXs+6pxQuXDGuuFlv6lJ
	hg/T9flG3vIfE4EPXyvvObspCEApbXFfe7ptFF8ngnRt5Xk+BoSUZngS5zwm7M5slKJ9k3o0zASZ8
	MogTcFQ9BsbFDw1/5mRzFD1rpG+6hbjch3ikDSlnzpWwBQm+GU/3wOGLuINjdNLvXln9lYVZcAf1+
	I1PDaXYK6z2ln4pU5ePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaaq-000A7k-19;
	Wed, 12 Jul 2023 14:13:24 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaam-000A5f-1y
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:13:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B26A0E000D;
	Wed, 12 Jul 2023 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQo3IWxFrUNchxFsYrhNn0IWhqemGxFFnfeW2H+aYl8=;
	b=U8XjRlmLjynxknx8Z6r8TKB8NSc9duahwazIp9HP29+XB/7Un55MgqwSTpRF/a7+boHx5H
	ROzXne8bjrI+KnT/xSDyWA8jxJhZgEtZ2XbX4yELpRYoEZ6PtNF/l5dUQUhG8q4udFn2qD
	Cff0Et1MwNc2RYQaMUuWuZ3AVAVqGxd9rod4A309V1JoaELzPI8xOjVXFdX7mTGNJg+9md
	1p5t87S3gb4vZY9VV5ZGGSRgHckds8uyDKPvvkbZa2sp6ZZS7NyJCaILK1jw9DdU40eQKy
	ueh198ddYypV8huZ8xjoJ6ThIui6mP39e/jJlTxVgAsOKoaQOwBCp0Uxgvao5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/18] mtd: st_spi_fsm: Convert to devm_platform_ioremap_resource()
Date: Wed, 12 Jul 2023 16:13:13 +0200
Message-Id: <20230712141313.354793-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-16-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1726813c2efff24a78836dd6333cd213b28cd5fa'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071320_795771_498249F3 
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

On Fri, 2023-07-07 at 04:06:20 UTC, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
