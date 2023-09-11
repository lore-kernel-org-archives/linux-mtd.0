Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC8AEE57DF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Vknat1CcmOQNIPx3yCeH4PhrDQTjznK22rzlHcALXU=; b=dQsGHT8bvxmR8s
	GE8/vinJri7uEH+q+GWi1+d0TGxnwZD+YTaXccmcB+aUpkg8KTewMraPy74KMYH3AeTzSSeYYdp8m
	2+EUlGjGptJU4mQV1QQhkU6psH1XvzGJazZPAIZ/HH3yj9IuIj11QV71TPPpXM3idSCXW6VdEBYJa
	InZnaDP0Aj6DlUoTLeBlx/s2vMGVCswCXBbj2fuiK0tJlUdCoUzv6fK/Ogsd9BL+woeMRooXaqh9I
	qGxpB1v1SZLfJMQOym2aX9ehh675xN1aQDTJ6+4jYSccBCXUE1xAz6BCnfZFlZD7Dd5URJ3EUhJPY
	THnH733rIUc7EiGiJb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjDT-000wPV-02;
	Mon, 11 Sep 2023 15:52:47 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjDP-000wOX-26
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 15:52:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06016E0005;
	Mon, 11 Sep 2023 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694447559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nIczPiFsqVxkWM9qeLl1vaCZnfIjagPpomfaOAgj2w=;
	b=Tt1iexBr9Kgu3zHZwCf+vi3jtB1z8LwFFO0cz8SM4KHYnGgzYIJnhjjikMZeUupdqgSiUI
	uoGnAyfuAZwB8PuuGNeAODFm8uev/2Vwb52UTBONFpq68/cQ9ydDv0uELBvMbtAKbnxUIK
	6CwK4HXnx57QqWkJSrbIvjLSwf2dIb9+qkdkU5gYuWr9mE2Ph9THHD9GRIZ0NBQcN4P0Zn
	IKZOx/UisCEppM92GdNfz690Z5b5Y0uKh1EFi8LcbOoovP8igG5ZK03jdqaMiJOAHozB1T
	R3q/BrTCh196vpuJWx+IHmLWVWpM4t2j3mdhHw6Tq67eeYA/KX5rsDKHm1rpYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	kernel@sberdevices.ru,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3] mtd: spinand: micron: correct bitmask for ecc status
Date: Mon, 11 Sep 2023 17:51:43 +0200
Message-Id: <20230911155143.610920-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905145637.139068-1-mmkurbanov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9836a987860e33943945d4b257729a4f94eae576'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085243_848001_EA615FAC 
X-CRM114-Status: UNSURE (   5.89  )
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

On Tue, 2023-09-05 at 14:56:37 UTC, Martin Kurbanov wrote:
> Valid bitmask is 0x70 in the status register.
> 
> Fixes: a508e8875e13 ("mtd: spinand: Add initial support for Micron MT29F2G01ABAGD")
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
