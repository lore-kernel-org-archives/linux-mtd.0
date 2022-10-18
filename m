Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752DBC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkYjFCb6PrxNxGUzg1RNDezdbU4BMjuO874XGiO+THg=; b=3W5WK1q1jRw6Hw
	bAGtBt3axBbmovci0OKFVHsgQD5snqNWWtaI4sJS6FJtZd23Ht3bJUK4NUXORQ0nUeNdw+H9NAe6Q
	7Vm8f5xpP5iK1LNLs1gZF9ZYUOx0g24ZKUvhrlMt/xr4OP5/Il/sxe46PmhyhEAucp+/XYCbt+5kl
	mf5cZf1FPH2Vr1VI6y9NfvJWNbYK9vpiCl1mlVulayMruDJcqqvaIwXB4Yj0lLm8jctC5toR4RbRo
	WZnMgVHu3L61bnB/0H8eCUsHhQ94m/0dOaHLimH72aHh0BLUukWWbcQ/wE1fOnlWjWuCjkHrr/7+X
	Ft/gNCKFwtRs6+rBpdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLR-005PPK-2C; Tue, 18 Oct 2022 09:57:09 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjKj-005OiW-Pi
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:56:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9411510000E;
	Tue, 18 Oct 2022 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666086981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SU/eFAg8+KBTIRwD4dYWBBPE3YjTp5i/6+7PETgyslE=;
	b=HW2acJ8p39bUFqqRVZTj6RQpIC4AhxwqpQVzjIEbA4s/KkvvL64e1kPzOW63O7dL1pCpyR
	qQsjmHQxgNg7kH5jm6Mf1AuvJcTx8CElFAhIHVKLxDBHYMtwd6qVLR+RAkw8mWGfseGBqW
	Pguw612VqlqMclp26aqNyfSpI7NRqxxsAAB4mWYd8W+En/u/3IX3TJ3jyj2SFs+6C1wSJr
	vHUJs7IRL4n7J2w0jB8mrqw3IY59stGAYB00LXm91Ukp24uaaQ578h4Wd1lyAfVfx0jAXj
	Vg+pAeRpm4vEe2bFJcnUouuXt3NMnAGXzD2CGf/I2U/3nqx3Pb4XDypy/qraAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ray Zhang <sgzhang@google.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: mtdoops: add mtdoops_erase function and move mtdoops_inc_counter to after it
Date: Tue, 18 Oct 2022 11:56:18 +0200
Message-Id: <20221018095618.543259-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010045549.2221965-3-sgzhang@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'76306951cf7314e3176099756453b055dc34a298'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025625_996773_425E7EFE 
X-CRM114-Status: UNSURE (   6.35  )
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

On Mon, 2022-10-10 at 04:55:48 UTC, Ray Zhang wrote:
> Preparing for next patch with minimal code difference, add mtdoops_erase
> function and move mtdoops_inc_counter to after it, with no functional
> change.
> 
> Signed-off-by: Ray Zhang <sgzhang@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
