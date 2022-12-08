Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912AC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGwBIRf+kK8rLc8UfotzlbsUSL2FOSiYbuvw08XlFiY=; b=T0XYBNB1lg8jEV
	0HJeQKMMqpmpYHPoevv+2CWH6s/3V8vShr7cyZk6TK3kn1B0pLoYctxA+CAsblfbavOYVkZ1qDagv
	Ic947AdGtyeQZnlQIeaZBnqyDXyLa8cUHMMALpzX8xRqaPcmTyViThgjUiN/UPcNXJ5M5qUmgttuN
	Mr0AXeinTO0/lGi7R9u/rQRmryvpe3BviUoHFmdJPVqcIGt8hh1bH3/5Sls/6v7n5lLND1u71EDkg
	+EaJlgEbfaSSZXxs6q1jdidY0ttyl2y8+tB5nfnhzV45KqSJ1rF9xEOKZUoINY9xGRXRRx2VkYY3X
	uScbEMTV0MJJAVjvK7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Jk4-005AOl-2C; Thu, 08 Dec 2022 16:27:24 +0000
Received: from smtp-out-06.comm2000.it ([212.97.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Jjr-005AGA-5M; Thu, 08 Dec 2022 16:27:12 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id 863E9563354;
	Thu,  8 Dec 2022 17:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670516824;
	bh=rdeoMNE1kwBUdyuSy1B7RJ6YEuK71LUPeP7eu0W/ywQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XwxvG3+3OBpe8DbDc2YoCP8YuoV1THJlsiPBxrPbasWx+zTatEn/fgU7YqHwCINO9
	 Hl7VDpjB+EMnwXinVq5bVpmYDvQgPH1XdpCBs7tZSJ2N/khCXAL3DuxGm7uSzziSkc
	 aAcFWNVCFhFj5qaN850+bzX7dZGnJReYDgBYD+p/1YQe8uMBFNmcb5IMhanDgRfOlh
	 iTAjKn0nXSENfuliYm8h4WcVdXgMoiMr7WOyIuH1PIc2k/z/20UCh9YSkmPIAqj+aW
	 2bHciZbeL5jJ3sYGiqF5vdPLSUEzfTQqrgnaJuPbBFFGbDxTWHjzDWFA3s4IuQIRf+
	 KMZxtaJQA4mJw==
Date: Thu, 8 Dec 2022 17:26:47 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org, stable@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <Y5IQRzXBJignWMaK@francesco-nb.int.toradex.com>
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221208115124.6cc7a8bf@xps-13>
 <2a6c5a08-1649-3f80-cc37-a425f09f3a67@denx.de>
 <544539BE-F7C2-4484-9588-6428EFA8A537@dolcini.it>
 <108503ba-f4a8-a9de-20ee-f8f1f90965a2@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <108503ba-f4a8-a9de-20ee-f8f1f90965a2@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_082711_373126_06EA28B5 
X-CRM114-Status: UNSURE (   9.29  )
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

On Thu, Dec 08, 2022 at 02:54:43PM +0100, Marek Vasut wrote:
> On 12/8/22 14:49, Francesco Dolcini wrote:
> > Given that I would do the revert as an immediate first step.
> 
> Then that's fine, let's do it.
> 
> Will you also follow up on the parser fix please ?

Yep, I'll try to squeeze some time to work on it in the next weeks.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
