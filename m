Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA2C76188
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+5HKQC9wgU5Kx7Pm87H4zbzVdJzr0jkvOOmh0jnoOM=; b=4x466rrLtskw8b
	wA98+l5RqsK9dSgllC4lRD3y3eqF5rpQMt7O93uxevyi7+iu+erhfKFK5tn0AARJXesS5LtizvEBQ
	bpT5SkiLKtdTmrZBx8HZaRmIUMboJ4rGRcToz0x5o8+QauavfzT/DUUmraRjTUycx2e130hUozVeq
	siTMhTu+5jyuhK2dTIO7ipst9nX+PzkJ0MdbdlPEEYcLyUp9dC7yDmGwVG/xO+H/hhXd2OxXIskmU
	zfjv3hj67mgGypsnaJjhXqaGLvEC04pRxoAJOVA34SY01P467Z2miCR6oxiu9xCbPBDUvEqfoMTan
	pCSybkngFkPMI7WCvEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMai-00Ftjn-2F;
	Mon, 03 Apr 2023 15:59:32 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMag-00Fthg-09
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 15:59:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AAD21E0005;
	Mon,  3 Apr 2023 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680537566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPOb2oJsLReltUpfhtCHFxjUhpwGqcY6PIdWLBKJAPE=;
	b=NIGQ37EycIDn6wmQSD51ITrZrfmKW/tzuF8bQQk6WmEmjSZec7Rtbhd0rjAZJrDnOHvY+M
	jQjKqI1Gi9AQ43sGVz0+MABRB6w6DMOmJTHmMiUwcaeWcWLRzwW1i3nGzsdq/nEfQOfNAt
	MyBbb+O3VvMgyFCcUqJBNPSi2C3DNXxnuJLSl4kXkIR9PgKfUv8Ugx27rjq7FzE+AXHWmo
	CpdQGR91MUB4NMpshreFaf7MmcnmO6kSNCPH+gJFnDArDxCcSDnRgc+Ly9/Ar1vkBssmiu
	svnrJs4gbnWPBnzrNinXymR3lZwsf50dvSFWgcCd9+ED1/XU3FUAOXugdlFbRQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	stable@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min
Date: Mon,  3 Apr 2023 17:59:21 +0200
Message-Id: <20230403155921.137622-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328155819.225521-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ddbb664b6ab8de7dffa388ae0c88cd18616494e5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_085930_238885_CF7673E1 
X-CRM114-Status: UNSURE (   5.55  )
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

On Tue, 2023-03-28 at 15:58:19 UTC, Christophe Kerello wrote:
> Use timings.mode value instead of checking tRC_min timing
> for EDO mode support.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
> Cc: stable@vger.kernel.org #v5.10+
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
