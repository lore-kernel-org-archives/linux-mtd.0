Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E32C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZGLxmL8B7/bRGzu5BpicUc17ejFrqtU7Fds01n5MGw=; b=k+0txiCW6l/IVt
	sKdMxorVVPMfUvCV285fOLz4IyXBKvCJHoVZQpavPLj5Tl8xDzWrzCyKVeBDInhENa2ciyhTDf3Q2
	VYqVPhPg/Pi5IzbjcgGNf3wGiLzbWTjczU1UvlOgjRtpjk76Y8i3nkT6dl91T9JlLoUaxKNrqh6fV
	kfovy/p3pu0yYS3Sw2UUb71+bbwBsqg3UW0pOcZILpgjavbysku3OBcWLb/FfFd5gxWVQJntJxCiS
	G9lB9ea8DKdAtZfXfIj8z3fJpOdamfNYsxBNriqBdY/UMivYJVSYD8scKf9HKKm0iqBaPfQXE2rNB
	T3Y+ZugwbWtw8Jpae+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmGH-00HZsg-F3; Thu, 17 Nov 2022 21:17:29 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFN-00HZ7Q-Ux
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A4CFF1C0005;
	Thu, 17 Nov 2022 21:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hczaAGIkI7wmgSB5njBigmhRWP+ft7AnHDgjVVgvIuw=;
	b=JkfqJtULcYneGzV8V86IcXwzELojd8we8/WIzgaDhd7HEojOYQikxeFpWs6bbiTEa8YfFD
	LV9whBwyHDh4OqCwE5Y8wbWbmswm2+TgLLUfQcsIX4mrT2eh1LmCRVfvLy5iMqyhWN8ZOV
	afmPHT57ZXD+xGuDNT+edFArXT0T2wC01tymPaoEEzNwggnbunEW8SYnJeKLj2SagtoLHW
	JXRdXaJiMrCANsLJ+hLsdA36QY3+SzrliDQ677tiNYMl3+KumNunpM40pzLsLI+bnin9gd
	ukSRNUB8EwKIfU3G5o5R4tuicT3TY/Y1qAJw+Qf0H8rwtMed2lq4kpH26eQjWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/17] dt-bindings: mtd: Clarify all partition subnodes
Date: Thu, 17 Nov 2022 22:16:28 +0100
Message-Id: <20221117211628.1273665-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5d96ea42eb63da72ed2eb4c1769d3181706d8cf3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131634_232209_E515B4F8 
X-CRM114-Status: UNSURE (   8.35  )
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

On Mon, 2022-11-14 at 09:02:59 UTC, Miquel Raynal wrote:
> Over time the various ways to define MTD partitions has evolved. Most of
> the controllers support several different bindings. Let's define all
> possible choices in one file and mark the legacy ones deprecated. This
> way, we can just reference this file and avoid dupplicating these
> definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
