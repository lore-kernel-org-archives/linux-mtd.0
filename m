Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E2CC6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ6ZqK0yrNltHYyfqrQ3Eys0I1gLxeeQ2xHPE2Tkux4=; b=fNskuIL79mX8Cc
	ZpytYU4xUUVNIxtTSe4IGqqXh27fVJ3N9Wd8lzTgcVT5OQMU3NjH1ENmdRhpaluBIH5yGuFrC/JBY
	DgnAtomaPELDI2hk6VhAZJV4Jesb7c6pSSscO9XEVOHWdCD0ZBdCDEYMTqisYRB/F/fC13ggWSims
	kVFGCR6sIPFuOMkdEcJ1++bUItYAG8mXxUT3k2wkLMkhlSik47rWVVvT7mgik7D0aZ7+iSeClVoU/
	0Dc54MRbrWsQqTPnvt4cZ4sOWa5h8yTn543Yfga2K4A6jfz7i/az0YuBfdiVRbowCTfgQ6FvFCoTS
	hGv8IBE7R7fD3747FJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phAMr-00Emb1-03;
	Tue, 28 Mar 2023 14:32:09 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phAMm-00EmYo-2x
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 14:32:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1A90F2000D;
	Tue, 28 Mar 2023 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680013919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJsUxV1GCYJmepMN7qDxXfeGUt0LBtGmEOWRiNNJIVU=;
	b=CL/4ceslVvnWZODI6nvZVXQHAY6b1WfBFDeXLjcRMvSadFLxWx4Wh/E5ns043wxzQNLMqP
	2cuXRtayeY2QO3fczgGf4U4sn1+VGHSHHaoE4+r/7GUlTMA+nx+F1Oh4Usa+9Bkg9E+DMY
	pZw0VVSEn1mFamQaJpqUQfWivO5uYjeGfFxCj+3WPMq5uChFf+HBUmEmz0peuMi5vNscLO
	Mh0xIs/oFPfJ4VriKptstPt/MbdNiPE6gTbU5sOtOo57Q73mW0LUFSowqDHdn/V04Smswu
	8eA6LDOvrdqClOFsScPmiqLTd4wrmQG6O+GsCvPSAaxdH6Ze/9t/mokv4v+M8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	krzysztof.kozlowski@linaro.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] mtd: rawnand: stm32_fmc2: depends on ARCH_STM32 instead of MACH_STM32MP157
Date: Tue, 28 Mar 2023 16:31:56 +0200
Message-Id: <20230328143156.441625-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324155105.826063-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bb685c1f35c357e9b935880b2946b402d6860ee0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_073205_109733_32DD5B38 
X-CRM114-Status: UNSURE (   5.86  )
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

On Fri, 2023-03-24 at 15:51:05 UTC, Christophe Kerello wrote:
> To be able to compile the driver on all STM32MP SOCs, we move the
> "depends on" on ARCH_STM32.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
