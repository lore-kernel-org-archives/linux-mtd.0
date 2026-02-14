Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB703EDF17F
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Feb 2026 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJXtQ6ewk/jx1fbL6yECSfmwRu0Wf2l3uHuE3Vni33M=; b=EdW9k7lErUEoZ3
	k602SIxJp+XwNwLSi1LK9znoVIDp2hC7b2vAgeYlv+wr6HYr2GUsLCuje1JEh32KA/B8+toMfYZAg
	q6EaDHXhj6EDKyZy1VtpaDDflB/cxN/nrTz3eBWVQOJ2LCQKw3Yp2VqOJgmEc+lA0iXIEzqwOwpdf
	RJNr0GPcW4iakgrRGC5IPQY07eefc6FMdtF5YeEMcUyzy3YuMamihPgyXjGtvU+Cwn+cpAxaHllul
	EiWpz2spIb2i9o+auLSSTIgqn9tWzpAm4LW1WoQXW3HVf9SrsEs7S5r03JZs+LxoM5r3XqenY/8wQ
	p5xpwL2m4SeWdZ4+dyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrBsg-00000004QT4-3EA0;
	Sat, 14 Feb 2026 09:24:02 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrBsd-00000004QSl-491J
	for linux-mtd@lists.infradead.org;
	Sat, 14 Feb 2026 09:24:01 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D3A186BE;
	Sat, 14 Feb 2026 10:23:45 +0100 (CET)
Mime-Version: 1.0
Date: Sat, 14 Feb 2026 10:23:45 +0100
Message-Id: <DGEKQIZX9GBQ.BLFC8598RLTO@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, <pratyush@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: remove Tudor Ambarus as SPI NOR
 maintainer
Cc: <takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org> <20260213-remove-tambarus-from-spi-nor-v1-1-6caefb1a63ae@linaro.org>
In-Reply-To: <20260213-remove-tambarus-from-spi-nor-v1-1-6caefb1a63ae@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_012400_172859_7B8F4DA7 
X-CRM114-Status: UNSURE (   6.22  )
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

On Fri Feb 13, 2026 at 6:02 PM CET, Tudor Ambarus wrote:
> I have not been actively involved in SPI NOR development recently and
> would like to step down to focus on my current day-to-day work.
>
> The subsystem remains in good hands with Pratyush and Michael.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

It was really fun to work with you. I wish you all the best!

Acked-by: Michael Walle <mwalle@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
