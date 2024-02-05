Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052D0C48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SV0W2co21htQm1Cl1l5EMEbeZutXGl0eru7BpdJ7mCM=; b=rxhusatBJbUyk4
	vu61J8O7aKHM+Rhx2EwyjQi9HaGFhWcKYl1sUCZxSflTzVrKjTvZ4E1wM1GFE/7vw04ZdMmL3TyMS
	eJLjVbiUrP+AKfvMnXqsA5SohNrp+Z9KNDYrP+ZZK6yF8UNd+xz+ok0qYgDLP/kDtVyYbR0the7OH
	aeozkfN8nvpH8bMLNJXL7ETPpASr6LvKKYhMERifXpTE1g8vByNYRsRrWCrqG4VA3rZZwR06S2nnI
	L4Uk8cJlms9aO3Y1Y/3f8KUYyu+xcbeopZegowpoactwtR7vtryiQR8+vxPEiaHh6THn5W2bqStr9
	m9jwMdZg9+a88ICTpWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzxB-00000003bgL-3yv5;
	Mon, 05 Feb 2024 14:28:09 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzx8-00000003bfR-42z6
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:28:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D22BB1C0006;
	Mon,  5 Feb 2024 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ0MjnPiyDEXmv9y3YHY1Sk0uYIphio8FRBQUUsA6T0=;
	b=PKnL7nW+HFuuqYWfBpu+B2VJNgN8v65dQOqIs0KQWrPKjZ9F7aSeddtOAmXhX+3h5NlRnp
	pOqYD3Eur8MNoPLn7l9Q8+MLr7oGFzQJAUbUg4HmguGJGxyv2Iro8HtrGJbVNgccq9rfeQ
	IWpA6vlohjZAMS/1f4UTxJX9JMFBtyLXTu3wWlY9ElkcsV04fcuSmV0FBKmIQ8hdqlYVWA
	Pc7CteutqwmDPIqFtDPUaX5y6rNXW8kYO+O4Wu1aedOlKcoMPOGi57nUtnzNirBvw0FRro
	GHpctKCVLvLc0vIwgm93nMjdAKNZ34+nH7wYzxRIuxCeW8qaSr35QT2rJZEg/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ezra Buehler <ezra@easyb.ch>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spinand: Add support for 5-byte IDs
Date: Mon,  5 Feb 2024 15:28:04 +0100
Message-Id: <20240205142804.466682-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125200108.24374-2-ezra@easyb.ch>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'34a956739d295de6010cdaafeed698ccbba87ea4'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_062807_165050_77DBC3A5 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, 2024-01-25 at 20:01:07 UTC, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> E.g. ESMT chips will return an identification code with a length of 5
> bytes. In order to prevent ambiguity, flash chips would actually need to
> return IDs that are up to 17 or more bytes long due to JEDEC's
> continuation scheme. I understand that if a manufacturer ID is located
> in bank N of JEDEC's database (there are currently 16 banks), N - 1
> continuation codes (7Fh) need to be added to the identification code
> (comprising of manufacturer ID and device ID). However, most flash chip
> manufacturers don't seem to implement this (correctly).
> 
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> Reviewed-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> Tested-by: Martin Kurbanov <mmkurbanov@salutedevices.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
