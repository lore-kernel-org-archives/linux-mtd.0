Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D739DC25B7E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjb+1cjs/hCvizUnDrd97u0I118kg5wz+1S2fjVuDN0=; b=NLg8HDsoqdCpKx
	HeSoGk/6wTX80AhOfCYdtseM9qAE0NeOPMXUczm1bCBXZq2MrCOC4A8PxKkHd5wl+5qitYQjs4by0
	wdgRqGoe5OUnWwI+/MCn9RMllE28bDsAXSf/gm5Yrha5Zr8R0haRUuqDpJIXn+HF5/DNUNkBpOugQ
	UpTX9gTRGublX+O1yDSfmKsBK55sreUEXrzph/THrDCkC4UUIkNBOBmtHi8RRPmaRFHQXUIIsBY02
	MkuwI0ektjDNZpejYjayr1qvQayol/IUcCMsgqXGpucxdLPVWC72xuHyMtD59izqRZuUmPPzffBGD
	xhUCPZ1zKkt6xCtvNPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaQm-0000000F5x4-1vYN;
	Mon, 27 May 2024 13:30:28 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJP-0000000Epvi-1wB0
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:18:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54D0260004;
	Mon, 27 May 2024 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hl3bQkHPFQ8/GmMTrEZ8jjN3v05GyKb6fkNFzKHfs8o=;
	b=klLEQzcTpq+3jqfXJZKwvnMPd9bKZdt7pcRbu5eiRCqVNiLXolAfp795pI/vjhPJwpWp2o
	zqZI0/6a+0rqVWnbZmdzku8gW0kKR1vVAQ7CIDxcIs6zwtZomYvpcK87gDAq9UsEZ+5kT2
	l4mr5tIhJr37NaFLkIuPOkckGphUitGknL0BKx7P7jwIGdeYEVsrfGyzMht1v16tCAu2Fd
	y38gy9u/vbRNrraycvGsUBWkYsvjEm3ws2wdsIwNgHD8npY3jl+fUaj0TnJN5eQ4lIwz+P
	QOeO1ntIB4cTdNH6FgbTf5w2EBs7MakdprzL1m5eG50nVZjRth+gfa77tzrgtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux@treblig.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: cadence: remove unused struct 'ecc_info'
Date: Mon, 27 May 2024 14:18:44 +0200
Message-Id: <20240527121844.178514-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240525202529.120792-1-linux@treblig.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bcd904d0da4ad2746f7a62a2f70e705b7031f906'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051847_904315_D692D64A 
X-CRM114-Status: UNSURE (   7.25  )
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

On Sat, 2024-05-25 at 20:25:29 UTC, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'ecc_info' has been unused since the original
> commit ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD
> subsystem").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
