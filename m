Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99074C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 16:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnE0UBmGYzdXbu8QHSIcBb9EbwFTcT3LWciRIMSgydQ=; b=cy4Q6RwdpKuHQs
	vSvctvh+nHF97qQkp7BjOcL3uzwNtbs0j7Ugb3Joa99ksBVz3YwrvQOuBCcTlM1hLcdpQ9rPSD1Nj
	I3Bw42AWRiVNreCcyJsDFBg+71URaySLJwbwozF5yQePzqKJxAAtRkrarTphJtUYRtSA4yn979TxK
	HipJa5MELdpNsmTTwyYS4RlgpDmLIjotrTdX9au105E3/n/d55uLQHxFMdytP/HV+JGYT7W3FhLAu
	3dWcupCPU9+c3BvRM52MWzpoMPnZt/53YoaKRPQQZchmsailZT3PvInxrrno1Mw2pgK0fRubS+htr
	j3dxHJLyL2uy2ZMrIXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTn8a-005uvJ-05; Mon, 14 Mar 2022 16:01:36 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTn7D-005uML-M5; Mon, 14 Mar 2022 16:00:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C66E200007;
 Mon, 14 Mar 2022 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647273609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcTeCSqjA30WWQNMW0gHvtlkhVvj5befvu9dAIyBttU=;
 b=B3nDZWQVGuyP1Y3ap+c4EWjrDmdWvX8VY3+6+D+TakX+BJqXi+ruTobaxoPh89pSmzaNH0
 HRhifMCrSb86dmLoektCYPhJ4Dm3i4NxrjRTtCMhs9zXjIMk9vM4ewaUyU1kAAvxj0au5M
 5rbUeel2PKMPi4nYXEWbdDg6yXQjmrPzsZxN5MGGFwKsldw08gg7azlJqupljA3dFTiLuD
 ryvwCRz4cxxzg5ipzsfitngFji5p1b9ilNDjmsMhf9AjLsTFKRM+0rSYCpwSUTtVo3/13h
 dfdOOE9Y8ps4LSPsSnB+AwFR7/1ejT/q8S4LmQwEU2xATS+nCGBSgg9BGIDczg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xin Xiong <xiongx18@fudan.edu.cn>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: yuanxzhang@fudan.edu.cn, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Xin Tan <tanxin.ctf@gmail.com>
Subject: Re: [PATCH v4] mtd: rawnand: atmel: fix refcount issue in
 atmel_nand_controller_init
Date: Mon, 14 Mar 2022 17:00:00 +0100
Message-Id: <20220314160000.77465-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220304085330.3610-1-xiongx18@fudan.edu.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fecbd4a317c95d73c849648c406bcf1b6a0ec1cf'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_090011_910637_5E6AE064 
X-CRM114-Status: UNSURE (   6.60  )
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

On Fri, 2022-03-04 at 08:53:32 UTC, Xin Xiong wrote:
> The reference counting issue happens in several error handling paths
> on a refcounted object "nc->dmac". In these paths, the function simply
> returns the error code, forgetting to balance the reference count of
> "nc->dmac", increased earlier by dma_request_channel(), which may
> cause refcount leaks.
> 
> Fix it by decrementing the refcount of specific object in those error
> paths.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Co-developed-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Co-developed-by: Xin Tan <tanxin.ctf@gmail.com>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
