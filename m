Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA6DC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4jEm7BF7+0IzNFoV5nYnUuBHTAaZIpS2NAL68yzRJQ=; b=IDTXdVvt8Cla0E
	I4UcL0kn4n/vIfag4HLAYc9z1yfB949sggIddNX9AU6h+ExI/w6aUZqtLIHqRsFleH8SF1PIbhFrE
	OX3DjIWFbNMHUZ+4k7omnyw6TB4DEPmh7xmzcHUG72fFxnc7+DOpstozVk70bdy9RJRz+R7DG8ens
	ZOXsBe9b/fqzQjmM07nV2M0XMVXpH8XLRhfZ1kdqEAzcD7zLbjtrDI0+dhSrFnDBO1fdYrGkbGmPh
	Kh21sEIs6F+bECjZq5w3ruZvivgNptj2VUOukD/oyVozIGhW7yxSolhoSowQ8PrQwWboHBsc8g3BP
	FymVuMF7uHvTBtCDA2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYVI-00000000AMu-3DYh;
	Mon, 26 Feb 2024 10:46:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTt-000000009Sz-3nmB
	for linux-mtd@bombadil.infradead.org;
	Mon, 26 Feb 2024 10:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tYWYbEcL0LZiU1LAQRsUtVSe1ESaZH+8FD5tt71//JQ=; b=IJOk9wUtJSH54aPrs4EMkVZofz
	AbzO6u3ntQUEwsvbZXRbfh1MP9uob0I5JJlBehjpPABn4eSK2QPXQSaO8XC7zVcwlxF0h+GLWVSu4
	X/kPnLbbcpB0yAZi7Ab643cAu9QmGkM3AN4XjcLcVMCRhqMa4WmCKFw6gFWJYvJpj6E9RzSydZYny
	lNCz5CRRN9Q91HGP2CqUv2gEiwxdYedBmEvNzd3+6N03gu4p+f5gfaRXqDZIXf30QIiW1OPX5DFyX
	NTQschf2joqFmi+NzdnWsnlTxRhYa7KCxMC7kNWLD/4D8eWbAU/FyXjWtifahDB2zv7eS+j2HTNOd
	QmzeLi7A==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTq-0000000180H-32Ib
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:45:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D84DDC0003;
	Mon, 26 Feb 2024 10:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYWYbEcL0LZiU1LAQRsUtVSe1ESaZH+8FD5tt71//JQ=;
	b=YSM5//DjDEbFXDh9KyH1O/eN8heVsBdAQQZ0iqQtWj1AP0ldH9kdTgwddeTIXFmc9Ojksk
	/VTLysgF67xFxszfyivlSH/hdK0BCEPJ/vnDY7PAAiUhKiUq0hIt9ZoFQ23PcTF3papF57
	nvH5JrYa8UiZz5DGiK5jjmEr3hpVZEzQA6JmVcmShsDDD4O/zaHaynjj2JZrhvo1u7qsPI
	194ywQTXoyjqlT579aRYs2iiL3vw+N5lX5gDEaUf5k96GmFItPab69JcLC/d61JYlGwZ0p
	A2QoWIthMxKLztvhbWVtBlAgnMammBIabSzqGmK3OlqhQ4z6D8Yj7YaIyo66og==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: remove redundant assignment to variable bbtblocks
Date: Mon, 26 Feb 2024 11:45:04 +0100
Message-Id: <20240226104504.490157-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240209174019.3933233-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9367043f1c02a1e4bc3ee50df2772c7c557ce617'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104506_853952_CB5FF24B 
X-CRM114-Status: UNSURE (   6.97  )
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

On Fri, 2024-02-09 at 17:40:19 UTC, Colin Ian King wrote:
> The variable bbtblocks is being assigned a value that is never
> read. The assignment is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/mtd/nand/raw/nand_bbt.c:579:3: warning: Value stored to
> 'bbtblocks' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
