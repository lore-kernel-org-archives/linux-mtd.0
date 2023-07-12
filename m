Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D756EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hUPOkqAWOdZbuequxbehwB2vy7i8w5h7pJi4WdvAtg=; b=1PYxkbZVhDOuZb
	jxUepup+encluXJ4Di3JP5hsAML/a8WkXcWyL6iCj7gpq1hPpc5V/T8WVpTRJbzrrqeIgJcuu7K7Y
	Dc4Ld7DpY7XOETRY0nw8+gljM60ByMU/mO+Zb6a+oi9LeBAg8Grpg3JONiHmvHesDRcbQaCqnTvL2
	L7rP7UdiB+7A+XyHv8tyIYcQnqdu5NI4qUVyUikNgBgr7I2RfYoKaHMqfkcH8vOK8uKu2IrFOrWoh
	sxVrJ05sCGt+mn8sxmfJ4bUDcg6p7ouGDE635D/TQW3wfk/nj639gXH3jn8rHEjIk5GrJOjupCeV0
	e7Cr44AOM9QBNivocJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbKp-000H6K-0D;
	Wed, 12 Jul 2023 15:00:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbKa-000H0k-0B
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 15:00:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 091731BF20E;
	Wed, 12 Jul 2023 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689174034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmR2M8DvxgLuUvcgHBngldyqXTz4KXC7hMLlBcuMY0I=;
	b=oljS7e6WG2GnNVXTF1IX+A97Q7KGQif7E3Rr8w8RDa66uvs9nlSQNoYm3xBw33fuQyY9NE
	wqKwL4dZX+npC9bQqEFmxdD0EConNP+0xGgGtWweUKpX7jHO5Jws6cvpvUlcK14xUGk8mm
	FpsOmdsVQgzPxQYBd9Sm10CwRJ39fTLTLpE8mr0mP41dXTCmGmdIcsTqjCt2j+x/T9d1NS
	faXmn4slCEFxNWfa8pTgJfGKQAfm1jUNT6Iw5VOPCFpNdqdYAY6N9hGjMchU8QcOHC3iIg
	xBshacGLNSek9a5qrryYaGvkeVhXit/GL8jb4GVq4uODL5OnrUIgVHF3a2iCAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Su Hui <suhui@nfschina.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: devices: docg3: Remove unnecessary (void*) conversions
Date: Wed, 12 Jul 2023 17:00:31 +0200
Message-Id: <20230712150032.431967-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529015011.38811-1-suhui@nfschina.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'259b4d4c1308a1fa0a671be3ecd8f847c7ce2e95'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_080042_451332_AC3DE9B2 
X-CRM114-Status: UNSURE (   4.77  )
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

On Mon, 2023-05-29 at 01:50:11 UTC, Su Hui wrote:
> Pointer variables of (void*) type do not require type cast.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
