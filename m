Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AFAEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uC5hHS2it4hIwoWbijto40w4iuuwjJaYa6uzxfx5wa8=; b=NzOD5esxZau96n
	EhalHG72mpjDdU8CM8jHiOU+paFpR0kOHBLEVQNCNeyImSS+mQEd9/BLEsSIyrcgAoe+dEUuBH2+q
	sd2tUnGikZjbn2panf0mo38cHfBwtTWqyd+hMZ+TbYwrmQbbjTbH7G7qETCnUYm8h1vfvaLsDyBBd
	gaFZdwMboiHCX6Q6QY5kzckx4iYJStKtKVMRL4n5qkWz+16rQX1sscksKSllyitf+k0/B4L5Iteck
	mr2whaGQ3/43z29cuHQMeY8efycEliLiCyueLw8ol11686HZ5OnV5CA/sDyT65IKXYefcP30Nu20q
	e4Ad2X3tNN6IC950zoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJabG-000AIt-1f;
	Wed, 12 Jul 2023 14:13:50 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJabD-000AEj-1o
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:13:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB0471C0008;
	Wed, 12 Jul 2023 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvVaaj10tLkFJrl+D8zsB29cOYsNisVZpzEQPRb2FZY=;
	b=Qzy7kga58/Yn+9D1+aogFnz9A6dBWk8uJ9O2NFwQl1BSheyMqU+hHcN7WdZHX/704Pojgk
	nW06dIxcP5ffeuJVDjMSlgRtJt9el2k+JLJGeTugd8EVKuuiq2PBmMd3OhmPPXzQ/p9RNH
	MCJ2KM49JgizOZdrbKhUZ08eH5gsH5DRP069JmFLOWM7/BLV8jNyeCLuHBKWurSom0IcOU
	RkDkh/6gEC5jxCXh+lHJGB//tEkDcxA2/KJhoK6nFsUtaMtTamUA4LuUZhvBDhF6/aoYje
	GKbyUZtpkCudVqYsx5ByBhGRVxJLZtLTB6Ru0eDRFvm9EDuz3orn102lYii1Cw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] mtd: plat-ram: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 12 Jul 2023 16:13:39 +0200
Message-Id: <20230712141339.354893-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-13-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0e0d59f2f6ba8f26a16081fb76d301fc369cea36'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071347_743806_CEB38B40 
X-CRM114-Status: UNSURE (   6.17  )
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

On Fri, 2023-07-07 at 04:06:17 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
