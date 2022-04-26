Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7755BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y63sCjZ9tsgCRd2jNexc/LSMVtmLQ6ptnkZIeljlXU8=; b=mckyuYLui4Xnh7
	Amy+N7nlgYyBA6KqUiq8OjZOKK/T3wZvTpxe4YOop2Wb/UZtIQPocqn6B+b0Uk+5JlNn2wLzD5i9E
	5tG0v8RETc90mt0ll/JZXCmKrLpI7tPWUiwjqhz62ogGwsw1re9TlONPYj8bYQZxRAEWsWG6vrqj/
	8S/R01FIldtQSBsDi2hslPtQj6RyONQKm8ooAJDm9dVcgku4gqzCGGrqaBYGmLZIqjInmZSOHdJwk
	D4YNZlpz7TxNVfsi38FQjdiTmOaTevR1cLwH+/WNbpLmeFnpox4YAQjGx4OULZdzt8Gnh7zJ5BWnJ
	4FNagrDfsvb5phcTsz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFiT-00CzLl-IO; Tue, 26 Apr 2022 07:34:33 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFiP-00CzIx-US
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 07:34:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 782F5240003;
 Tue, 26 Apr 2022 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650958466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7YqhSKrC6vTx6OTh1GjxytRJNzGy9mqDr77XFHjCPs=;
 b=mTJhjFFaz1YVlT4I4REZKOw6I09IhEYF/GucMkR+GC+Pq8BS5ApXyW+cqlY+TbiAyZ8BnV
 Mw80yYVcleIrHonCtHFZHwGojAt6mhnERa+57ZLi7kSTduitPEV8qWAvq0v/1SPsFgb+Va
 9mgQrUBNUs8XTdIsgGKwMtj31vHvGy8Lc2ZI2szNmG2TSQHEtAadO82CSPXIqsjskDhC3m
 DFr5GXb0EiEJ0gsToP0qae+3AVINE3UFLw4B7v2XfXDJ2Bzx/W19P492bpFF7+yr3pprll
 cRQMM7vU81dYe/vL0yhcs/erx4ZkIZ/lbzgaOZzdhwFRf74d0EV2t80lg5SQZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: mtdoops: Fix the size of the header read
 buffer.
Date: Tue, 26 Apr 2022 09:34:25 +0200
Message-Id: <20220426073425.37044-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421234244.2172003-2-jmeurin@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fbb83e546ea4543ab0c59dcbfc5a5a1471ea1806'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_003430_202347_6F81050A 
X-CRM114-Status: UNSURE (   6.59  )
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

On Thu, 2022-04-21 at 23:42:42 UTC, Jean-Marc Eurin wrote:
> The read buffer size depends on the MTDOOPS_HEADER_SIZE.
> 
> Tested: Changed the header size, it doesn't panic, header is still
> read/written correctly.
> 
> Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
