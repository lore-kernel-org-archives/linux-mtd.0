Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FE2C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uj7ROYaN5Aau5eMpzisgnvUHegh7oVKKJMDmsIPO24I=; b=aA/og0Fc8KrYeu
	fnSoL6D1oY6bLbjU/XCsl+RbKFrf+8E04JPDbvWPYEJAPo71Jzqo2rHMqbgzBOg2hzrpZ+Ua5kYli
	CrpfkM04EBxNjDkxu6b/z1qeQiHPJKiWKIiFxR15t0sbXncaYvimfetPmwOOqzZ2FIgPM8pGPdEhj
	WMXPcYQ8uoQ0zvgNkUD0QLxUQKUHZdEHJhdbYq13Of0faIq7Z5Ylf1xgImCDiPxzaVNlaZotuQoFi
	3WEAgSIEcO24jaLE2ygSXwWYmwJqGaBgUB2iSR4TBAAjQKd1ZE1xp9yQqI2hs8hSdwEZ5jjW8xRBy
	lbA+oeNhyFK6zOfkRHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWe-004gRh-R0; Tue, 18 Oct 2022 09:04:41 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWN-004gAF-0p
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:04:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 73587240003;
	Tue, 18 Oct 2022 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jafh7VSLsIGbCiC7CvilxArhMrKLKSbn+m8zb4GGQH4=;
	b=AWakTaFMm0MkhFio6Z5Q06ZWYcicBqQjBplyIUyodPZSx5kLT3PCUoQBnDzzv3wUEqnVzA
	RLoK4Pz4rMzn7khN6sFi6aPFJEZf/B38XLHdBnWFECcJ+yuEO86x5cTdnyqZZIJLQdqYy3
	D+MoyAwCsej95xtF96dulooHCwDSOLH21k+SqnCYU34YiZNNk/7uIZX1UgQIhRC3C+6AUM
	IWLuVtkruevxJm7eSrJX3m4/wgmo4tFhkgJZSXyUJCJ3lWGNFSYln6ZFzci6wn46/q3W2t
	KWKeteNF92Sf70qosyaWITSKqXl828KCtYwqBb1EpVnwHeklAU1RQ7KG0Oysrw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: rawnand: lpc32xx_slc: switch to using gpiod API
Date: Tue, 18 Oct 2022 11:04:17 +0200
Message-Id: <20221018090417.466323-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928230019.2140896-2-dmitry.torokhov@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6b923db2867cb5e18ac4a1d5d5b4eecf0b619538'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020423_239929_C0313D4F 
X-CRM114-Status: UNSURE (   6.66  )
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

On Wed, 2022-09-28 at 23:00:19 UTC, Dmitry Torokhov wrote:
> This switches the driver from legacy gpio API to a newer gpiod API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
