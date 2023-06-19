Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFDEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGOcAJDZExN+DrnUaQNXiE6+vHZG/yD2cDx59ZMrUnw=; b=POwe13067BTCAM
	QvfjNriNBFq3b3jpa0Hb0gKpveqi9p2n/0jA+280fQzPKqBYLu0ASFbojUM5Rk/sVi9nhs5G4td00
	hp9gQnAO4HVyvg1F/gl8KD54Wd1yQ0//l/2yhw+mAeeC0Cugs30z4MSVE32TujH0M19VqW2J9wrRm
	lGvrNyNgCYGILGCBnc1av/6flaXeb4Nj45v8whynI6McZub7vx2UK8CHiszSe1HlB+EIFGLweiYTm
	Nx2X14L6EIehUMqj8ciCOmp3utxgc1dxFgbGLyQz2NKpEazkPzJri1nha//gKcwu6So58OW4HNo75
	ipurtxihAkgyhOPIRwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQN-007qwP-21;
	Mon, 19 Jun 2023 08:39:47 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQJ-007quL-3C
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:39:45 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687163979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTDF7gvwxzrCzya064NH4YZSB1as4XuurS6P4ipH9yk=;
	b=kFXvEoeBsQxnLN2kUOJxFt7hMwL3sp9f/6mNbh+5nLHjZTLg3H3KAO4gK8CUkdLBUzaN/u
	Yb56JCqOVBQV4jbz4iWn2y+yP98dHctXnk2r2vSs9dI5Om3eOwpVy7ArTq1Ob37jpzJLSJ
	eNbAZF7wtyfb8751PRZCWIdPJcpe+MgfocuN5mNOGb4leU7TdPVfF7PsLoDB+urBPZc1kV
	odADCq4Yrk2y0zsKRpT4/UA0LmRryMAJZyg9GmnuXvd8hxvKq38VejOHl8JlcwXu+DssaN
	8Kj8xRZjwfhSL9+4X80RaYcE2wG99ZTH5pvx/1/tCkxhzQiN88KBQDKdN7wQ0w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 438D2FF80C;
	Mon, 19 Jun 2023 08:39:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: partition: Add missing type for "linux,rootfs"
Date: Mon, 19 Jun 2023 10:39:37 +0200
Message-Id: <20230619083937.2940420-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613201014.2823185-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a5e393c1e8760cd66b3f3860a8aede185733cd6d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_013944_195849_13E2C5E0 
X-CRM114-Status: UNSURE (   6.30  )
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

On Tue, 2023-06-13 at 20:10:14 UTC, Rob Herring wrote:
> "linux,rootfs" is missing a type, add it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
