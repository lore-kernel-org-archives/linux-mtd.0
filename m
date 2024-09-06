Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27DBCE7B1E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRMjVTAi9GrphLQl9GMoyn1z9JaBPfFsIm87yLZHRLw=; b=yI2/PHSXoGi7EV
	mVEpSJrWTWJCFtlm3u4Ku1Lo02LVp9wK8RLWD6UvJZ9TuN6OCTkF3F3+H+3scJVvNJM0XkizUJ5x7
	a/CKfFjheNY/dTG5H+gpDI0kLmnJTb2lyeAR755L7JS22z3KrAHYalUEoKA7InjdGbLlbkaFHHkqt
	aDsbDi8rL4W3WEUJXLRIyOANHJNxPF0lr66kjCoD8Tb/IRWAkD2zSL4VnaWgoYT+FZjRZnMXGUGKG
	jCWVcVsJEST+Xw9GYIr6kqQA3nqeL7Z4DUspY3NA5SN2XF1fL/rJp/rb0L29zBzTRSVlbU+kpPgCr
	fAW/CeIbX/5QTwTxtUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaYL-0000000CgQz-2zc8;
	Fri, 06 Sep 2024 15:07:13 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUa-0000000Cept-00fH
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:03:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0A4D60005;
	Fri,  6 Sep 2024 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCccjhOovm+y4BYl5/I1MaJnAI11YF0uwBkACkNWcvQ=;
	b=I6rS37HvSEs5vZVHsbzyKEdQnN/4EWbqEQ6EWOxRLGiB1BjV3Wy81QNrUyGa7JFF4kOm4A
	QBUT1mK3MCyolLrIzr8i0fWi6PhI4B22Chu5EUx14oHOGxgvXnm3F/46wfMxkJMtbhVD/4
	x/3zKaQm6CJNxXnBDRBDwwlhjjGpxvTnQy/UxDAZjpWiq0GWOvB4XkkTsQ4sfSAfM02bnz
	mcrrvGZvS+GGTXIKgWd4ZWU3gFDqbPpDHWW54g5KOBSHmgra3mlLjULSj9e3AyUtQpZROT
	6iwdIMjvekcGehfuWkmTdRfqsXWn5fLrj6oG5vX0RHmIea8OZoyfOvVeGMz5Bg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/9] mtd: nand: Rename the NAND IO iteration helper
Date: Fri,  6 Sep 2024 17:03:17 +0200
Message-ID: <20240906150317.734479-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3f4c0ad490cc55db5b375a2e19c67159cb255795'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080320_207941_DD359298 
X-CRM114-Status: UNSURE (   6.87  )
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

On Mon, 2024-08-26 at 10:14:04 UTC, Miquel Raynal wrote:
> Soon a helper for iterating over blocks will be needed (for continuous
> read purposes). In order to clarify the intend of this helper, let's
> rename it with the "page" wording inside.
> 
> While at it, improve the doc and fix a typo.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
