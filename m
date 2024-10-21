Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC2FD0E6DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbUghgnqRwJ2ePNVqrebUwGaQSD4ksgJtm27yDFYxJg=; b=3zCIT6p7/6LQl3
	tfn7czfPsDfY3tcGjZ4gqAgs+fW9VoXMlBaC4TCh4WoU+J7djkJqbvaqhoPmWjHMPdisBFE8nfEZV
	mCzi2Uq8Om9viRshhC6h7ZKV4vS8n7ofyFt7FydBRFoswZDI9uRH/m8Ea8ZKirdw/uCzAd0XdCqfQ
	S+HH0wZRRcr0qgH44flqEYCoPT9CRLTnd66+6xhX0PJ8RieMveFZiNNue/9/Do54/bXs6YtD5kwYX
	5y7wGkCY/DsVuqeh+GmxYSgk3WfevA+PSyUnMYFFcC7eZREc4nef5fQl9g8oHowMvzSvwp6XoUQtV
	AHB/2/Cunc3BH3e+vDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pGz-00000006oKt-31jL;
	Mon, 21 Oct 2024 10:04:25 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pF9-00000006nod-1Chh
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B53AFF80B;
	Mon, 21 Oct 2024 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmFNbYry4fYR0yOVynMut4LpTiSFqticxBBNXk964So=;
	b=IccWz6LimGSApIO83TyexwmEH4wiL/30JVpMj7tUNegF+0J2RCDFKXpzCTpOlZxX/K9Kup
	ReHIGPF3el9FFjucGsi/ksA7X0SNHCIaILAIs489STsLx+QaL1uudZtjga9XR6xRWvVovr
	5AqMFPH5Dj3YbD0YVLQgfCgLexBwpQPUjuq1r9zunU5v7Xj6xazQUdhj2GqSBegZAqEhnK
	v++lC2BDLMlhmFwhaOn3fEvf2Zsnn1yasLJT5TKiGbPMbPgC6i8Hw6NgIvHAuB65Nm1Ea+
	cCRneKRCs0YfAer4Y/6znaxPeqyBjKY9cmToAmiPpbnM82Ddsj8jHgeguN2dew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nand: winbond: Fix 512GW, 01GW, 01JW and 02JW ECC information
Date: Mon, 21 Oct 2024 12:02:27 +0200
Message-ID: <20241021100228.173306-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009125002.191109-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fee9b240916df82a8b07aef0fdfe96785417a164'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030231_488865_E4C08A15 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, 2024-10-09 at 12:50:00 UTC, Miquel Raynal wrote:
> These four chips:
> * W25N512GW
> * W25N01GW
> * W25N01JW
> * W25N02JW
> all require a single bit of ECC strength and thus feature an on-die
> Hamming-like ECC engine. There is no point in filling a ->get_status()
> callback for them because the main ECC status bytes are located in
> standard places, and retrieving the number of bitflips in case of
> corrected chunk is both useless and unsupported (if there are bitflips,
> then there is 1 at most, so no need to query the chip for that).
> 
> Without this change, a kernel warning triggers every time a bit flips.
> 
> Fixes: 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
