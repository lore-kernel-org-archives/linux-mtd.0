Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF31C41535
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUJJhobGGm0H0ytp/MdGLcy2uTQ33ThjE0cGmnjWWfI=; b=KiIZhWeyW7zCqK
	BZ4Kz7N7D2lBc/t+I+fB+ei7F89uKcgcM5G8N6qOGFD+MFSq7Q0WzEt0gtoG00xQ8RhC7mMD327fQ
	E8pjW7SwBr9SDUfpKdJyhTEX/IhAEAFHRt69d+9lCwryhAnXDQhAx3n/K6O7Og61d8BoImfMg8n/r
	R0k51fcSACFhNCYYhvpmfCUbHVNT1qRVQsXihpHsMJLE4dBc32NGUYqoDvpK3L2Kq7AnpHv2x3CLz
	YIpt2mQkrBSw8qt7XEZrVfvqQDbWMmegaWrg7ERLHHIuc5i1hRgBboZx5qOQ6z2PJjSe6pnGaS+2V
	uswi8/GNfb3mF2oDotbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqw-005iE7-1S;
	Fri, 22 Dec 2023 11:38:06 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqt-005i9H-1T
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 11:38:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 688F8FF809;
	Fri, 22 Dec 2023 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703245079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRjIQ33Y4rBKHEpM9iWKYgVmuHX6/2Ds55D32ZUzDJA=;
	b=oZ7CWD21HeokwA5Tbohc+ep66K+bxRxiuOJFmBxn3TAS7LWRtUORaAT1gBfX7mF1BVaLHg
	YG5pNTKux+LEyPhgAeno1Bj3kqTaIa2DozUOD5gqbq0jiFmdz53Ci+yI7eI23ZeYMbjGEW
	TEb+gqxH4kA8W5RSmpFnIo/od2teew6FfzsOiPa01bEpuUsU9DVH4EiV1TSOFlSmSUyCqa
	BKtDFWfa3uEzjrBVpUgWeDzDeMuaMmYCfo6FYOX5/0MixidnbspMBB5lfq2JQB6253LULW
	jZg+kVPe+R+TxdZsltiGRkKrtlxPjcnV8op1uQ5FFZXQLFsmtZEQF29B26nGFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: rawnand: Prevent crossing LUN boundaries during sequential reads
Date: Fri, 22 Dec 2023 12:37:53 +0100
Message-Id: <20231222113753.786809-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215123208.516590-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'acc796d0293a0aff51f543284156004d8a08bd9c'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_033803_637974_8A5F6F63 
X-CRM114-Status: UNSURE (   7.32  )
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

On Fri, 2023-12-15 at 12:32:05 UTC, Miquel Raynal wrote:
> The ONFI specification states that devices do not need to support
> sequential reads across LUN boundaries. In order to prevent such event
> from happening and possibly failing, let's introduce the concept of
> "pause" in the sequential read to handle these cases. The first/last
> pages remain the same but any time we cross a LUN boundary we will end
> and restart (if relevant) the sequential read operation.
> 
> Cc: stable@vger.kernel.org
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
