Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C03C4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Af9gGiLVRz+4zwBMZYIEmZfvxdrFSlCWoQ6BDEYOYcQ=; b=SQXa18DOEK3pga
	H1WsW0+1XzUOJvJG/0VYhBJXF0hz5K/PZfPWjgr//Jjy8jYGF6cy9zcrJoIA9pyP2q9WInW3QMF4p
	Hd308GzWO31DVIK8Zjslvp5ep4U0vYisxBGe0kogt57bhQHvTLXK0++YxwMt+1w2Gy5gcxuFDmbhs
	m3aUXm/fyA9x/NRzU9FjveH6dWgIPuL9B1D4X/x4oOd0Pw/siGCJMOUjD02FLj6U+kNoCjMIt6KOq
	hiz8Sn1erTzBJJ9IDONK7rsf/HtVxBERylOJXxifYE0RavELd+vOwpjTFs/zaMcpFAoT3Jf7imfql
	avalLbX+FaaJrBsRvDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0HI-00000003fT2-45Jh;
	Mon, 05 Feb 2024 14:48:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0HG-00000003fSS-0fMG
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:48:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEB67C0003;
	Mon,  5 Feb 2024 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707144531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5b+Q3aU6XInFhQ94IY4ze2ho1NyTKRhp+/Gz2tNwG0=;
	b=pMVYRyX4MgaRaKyDED7VIjzyPEgtQQ5Dat5YonnRM377kBUzbygFG5Y8XgC9X6zfGPjCb3
	+XKLQtyWwHGEVmxZoi3FEcWqy7h1DLrWI0MzISbFW7xxqVgVarY/X5GaHztDfDcelPm/O6
	2AqiYSZ/SyyQaxZKbNi5MJPqseKzRNA+zZCjWz5U6GZkY4+R6Ds1HqKZYQPX3nZf+KlyhS
	yCrk2lTILxOw4s59pr2EaHfS6mrzshLuGGmiFFNyE7dPENtUcBHDmazvmsN9S4//2IQfVO
	ZgH0MhHe7YbtPc0FswwMRx5cbske0oNghMfG/K5NTogX+UdN5hdF8eZEiVUWIQ==
Date: Mon, 5 Feb 2024 15:48:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhi-Jun You <hujy652@gmail.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH v2] mtd: spinand: winbond: add support for W25N04KV
Message-ID: <20240205154849.07e4dfd7@xps-13>
In-Reply-To: <20240107144120.532-1-hujy652@gmail.com>
References: <20240107144120.532-1-hujy652@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_064854_496348_31519C7A 
X-CRM114-Status: UNSURE (   6.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWmhpLUp1biwKCmh1ank2NTJAZ21haWwuY29tIHdyb3RlIG9uIFN1biwgIDcgSmFuIDIwMjQg
MTQ6NDE6MjAgKzAwMDA6Cgo+IEFkZCBzdXBwb3J0IGZvciBXMjVOMDRLVi4KPiAKPiBXMjVOMDRL
ViBoYXMgOC1iaXQgb24tZGllIEVDQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGktSnVuIFlvdSA8
aHVqeTY1MkBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
