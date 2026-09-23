Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5F3C98302
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2026 06:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpeWnUk9III9JfblDdqAmZrJgoPN7rt6/R5F6AyKieg=; b=waSvQTXK4H2xGm
	mkPXCzfDmUgSa7LfeeR+3XxBeaf6cLfWvn7m5vkS7y780ZuvSGDPhh0YOq4B4ayE0TwWeYH2qvTO0
	oipwzzBKLjP8aj0PWtZ2u39XxsIXAW0C5+SW4/jEiHWYZaGFHNce9u4Nii9/ZplOHpaD/3upWXPsz
	3IKEVq4BcHmKBFV6hW/3u1h9c1GyhcF7Z9Cujd7nkNsOk5sbq8KAiRuMk8OrrxMYaYtuKx1B853IW
	c00xuNCvCK1XNrBIGCdpDS0d7KNeOl4Rx6mkYBdXMnIfnDpLfXIsZSUbWng3GlpbJn+EiMpreAgbL
	eZ3RcmNt4AWJmmInQ/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GGB-00000007FkK-03qQ;
	Wed, 23 Sep 2026 06:15:15 +0000
Received: from spam01.horizon.auto ([42.62.85.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GG7-00000007Fd4-23hV
	for linux-mtd@lists.infradead.org;
	Wed, 23 Sep 2026 06:15:13 +0000
Received: from spam01.horizon.auto (bogon [10.9.15.211] (may be forged))
	by spam01.horizon.auto with ESMTPS id 68N6CHuS018985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 23 Sep 2026 14:12:17 +0800 (+08)
	(envelope-from fei.xie@horizon.auto)
Received: from server227.horizon.auto (10.9.0.252) by robotics002.hobot.cc
 (10.9.15.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 23 Sep
 2026 14:12:17 +0800
From: Fei Xie <fei.xie@horizon.auto>
To: Mark Brown <broonie@kernel.org>
CC: Fei Xie <fei.xie@horizon.auto>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Parshuram Thombare
	<pthombar@cadence.com>,
        <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
Date: Wed, 23 Sep 2026 14:12:11 +0800
Message-ID: <20260923061211.1608907-1-fei.xie@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <arFEjzkHGMbecWWV@sirena.co.uk>
References: <20260921093701.1341766-1-fei.xie@horizon.auto> <20260921093701.1341766-3-fei.xie@horizon.auto> <arFEjzkHGMbecWWV@sirena.co.uk>
MIME-Version: 1.0
X-Originating-IP: [10.9.0.252]
X-ClientProxiedBy: exchange005.hobot.cc (10.9.15.212) To robotics002.hobot.cc
 (10.9.15.211)
X-DKIM-Results: [10.9.15.211]; dkim=none;
X-DNSRBL: 
X-MAIL: spam01.horizon.auto 68N6CHuS018985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1790143945;
	bh=bCUCYlEaXgZNmby4tA1+BtoGfMqjNJTX72dC0mvaqRg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hKfO3SBG9GrxjrtfmIdjL5LUpvxoUXI5EsGIi8+DYl8pG6726oYNJM8/DGN4CS1kD
	 d7qE7ybuzlPB7QLjwADTC1OtF4C6bBR8swpP2Bv7Ke8VZMd43sV4Kvhs1w8wi2ojoW
	 ephl0kfugh3Tzye10h/1hTNFWMUpAiD5gXqEVAejLKP3lMYf2QCmi74MP+yHd4nfur
	 n4jvfBI+tDDi06dkbZpfr3qEnjpWmp3haVmRkyhmdoeBdU9UWToDTfvJqgaMYWAzqH
	 H54AfukLW11jDPBlb2egDfkI/eXVnFieXgjA1rEwQblOD+DZiTVCq7pxdiuQfPnIQv
	 aLPOkLFD2EtOQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_231512_232540_548AAC4B 
X-CRM114-Status: GOOD (  10.07  )
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

Hi Mark,

Thanks for the review.

I agree that the controller should not interpret the child driver's
private data and that this dependency should be removed.

The difficulty is that the hardware ACMD sequencer needs the complete
multi-operation sequence to be described before it is started. For
example, the SPI NAND core currently submits PAGE READ, status polling
and READ CACHE as separate spi_mem_exec_op() calls. The STIG path can
execute those operations individually, while the ACMD hardware combines
them into one programmed sequence.

Would an SPI-mem operation-sequence interface be a reasonable direction
to explore? The NAND core could describe the ordered operations and
polling condition, and the controller could either execute the sequence
in hardware or fall back to the existing individual operations. This
would keep NAND-specific knowledge out of the controller driver.

I would appreciate your guidance on the interface direction before
reworking the implementation for v2.

The implementation issues you identified, including use of the interrupt
callback, timeout cleanup, DMA handling and short transfers, will also be
addressed in the next revision.

Thanks,
Fei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
