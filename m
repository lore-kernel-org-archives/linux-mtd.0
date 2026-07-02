Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D6C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Mo1blXU+dNc0g1wcOl8ol2Hwp/D2AOXWrEoJw9q6hs=; b=PcKHrHKgueKDwW
	iMwNxGaE2qog2Xp8to7mEkqYb2tVp+fBjWHocF6kgP70hcx4QGXjoAlZ0JyJacSE19hS9ewfy02DC
	8RXhl6D+E95bI1PYNxhedx9o8mLdQj6DwdQp8qpwEu3Z0L8+q2DvaFitfTN1xlT2aQAWC2efvoXmY
	d80Itfv70XeyDPaqO6q7bFd/TJ3xuyYKnHg0a5EQaGvsHlxjIkxQkPxx1DnKX3n/URncrxWM5Gc2/
	/xJzAb0qynIDHe++TL7EvSHD2bV9pfMXk9MD20uqoajRuEuXgUBd5QhOu6msp9vZ2wI4Hg1iim0Dq
	m0MCiT3MIZXqscgPsU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKPm-0000000523j-4Axj;
	Thu, 02 Jul 2026 16:37:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKPk-0000000523M-3oUR;
	Thu, 02 Jul 2026 16:37:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F9F540AC0;
	Thu,  2 Jul 2026 16:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DE21F00A3A;
	Thu,  2 Jul 2026 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783010244;
	bh=JYz2t9rOB6Xr/OOk1r6hBAPIGizcFH6efsw9sdj+Wuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZST56m12/dPfMnjxUmbQmp1RfAlmgKoAVEw4PIMZ4PlBncoDVOpPHLhXYP7UxCWh
	 w2WX+KHS3/yrMGg5LCd2XYhuAdJMjDQxwlHGKGw9jqZsaKzD+/KFXkvXy7F7G5Qsg3
	 knE0Vqs2EZSNPAXhvJCivRI9fSLzOrLQ269grsez37WOv08gbDiYAht7bRYkYFPRE6
	 ISdshM4ZM+9IRGOao127qU4ICBLcYBvu8TPw2ecv6dw6wdipSuAmq03smCaRYbYvJO
	 pDlvHdbEJApBzIrzmr/WVzeLXYTFZPdGSv7hCjscCBFhpbkozKXxQQAaUzW7F3vlOu
	 CltxHKPd6Du9A==
Date: Thu, 2 Jul 2026 11:37:23 -0500
From: Rob Herring <robh@kernel.org>
To: Manikandan.M@microchip.com
Cc: krzk@kernel.org, pratyush@kernel.org, mwalle@kernel.org,
	takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, srini@kernel.org, Nicolas.Ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org,
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
Message-ID: <20260702163723.GA227454-robh@kernel.org>
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com>
 <20260702-utopian-termite-of-perfection-f1f3ec@quoll>
 <860213fd-6a4b-42d4-a8f7-7308e070f09e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <860213fd-6a4b-42d4-a8f7-7308e070f09e@microchip.com>
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

On Thu, Jul 02, 2026 at 06:55:15AM +0000, Manikandan.M@microchip.com wrote:
> Hi Krzysztof,
> 
> On 7/2/26 11:46 AM, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Tue, Jun 30, 2026 at 02:54:00PM +0530, Manikandan Muralidharan wrote:
> >> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
> >> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so its
> > 
> > What is SFDP?
> > 
> SFDP is the Serial Flash Discoverable Parameters -- a JEDEC-standardised
> (JESD216) read-only parameter table present in most SPI NOR flashes, the 
> table contents provide basic information about the flash. There are 
> standard tables which are specified by the JEDEC standard and there are 
> vendor tables.

Is SFDP present or not discoverable? Or we have a table of discoverable 
parameters that itself is not discoverable.

If it is discoverable, why does this need to be in DT?

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
