Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEDDECD994
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cIzlkdJCbWpLPcEKyK7iEdnBcrF0/H2ONUdfc9ZMKI=; b=uEHTwEuc3sVvPG
	quiKGy21Jno7+NzLLPdBC2UlL8ttyrxBrJvYeBTxSQWcmZmUWHmp018Q2zcD0S3KoBu5r/y89k6Xc
	bb1tvwzZV1y/GdVn0sCQf0OJYC3L/m3AK1UjHmRnIdKcWCyvJ/rqxNQfHMEkdldKzQ/okya1s8Bzl
	SkitiMNb/qutJGEBeu8OLKQdGA0cWOLAUVfh/1y5O4HB0f7qbHtniSgqenpEXMSJbKiMofJuci1ez
	/1jJRZA/wZIDxDtLccmJ9OlW0bDZE7J9XMgIFG2jLdsWUikw5vLNnkFZe8r4uA934f2N8zCG55PXW
	VQiwnTNocDEovn/ZyqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3GX-0000000AIga-0IIT;
	Thu, 05 Feb 2026 17:35:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3GU-0000000AIg5-3EsA
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:35:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6039EC243B0;
	Thu,  5 Feb 2026 17:35:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 324B86074D;
	Thu,  5 Feb 2026 17:35:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24EF6102F1B6D;
	Thu,  5 Feb 2026 18:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770312936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tV/ZLocVZdBi7hgAdczYvyRfc5thw1DladriRmwpiZY=;
	b=Cxbb8ktHo2yBQiTArWp/lYhUfxUNbY8ZX2qFF7G9B8VjboTXDRIfVru1OveyU/lvL5LDeM
	ZWXiFBI4h+vF9KM+jHRvi/c4fyQXoiigy6paI4Ab4dMRPsz17xTFsASRiixzewVNtWZ1u/
	L76AB4t3hNaNVUV088iGe1D3jafpCLkYMs6OqzdccpOWwPyfau9gtISd2z1enY6cdHlxff
	GjkU/fzlnm9YrS3wjLDsWGFt5mY4mWwzeLGfYIeHSoqMZoTqx8VELBKSDWKZve3W6uVovo
	p/JABkwcTism9riHOl5XbIEf4Fpx3LxoG5Ew/zTY5YFO0VmTbGvpO6Af2lerlg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 06/12] spi: cadence-quadspi: move
 cqspi_readdata_capture earlier
In-Reply-To: <20260113141617.1905039-7-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:11 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-7-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:35:33 +0100
Message-ID: <87pl6jgkka.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_093538_951318_43B69C58 
X-CRM114-Status: UNSURE (   5.24  )
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

On 13/01/2026 at 19:46:11 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> Move cqspi_readdata_capture() function earlier in the file. This is
> preparatory refactoring for upcoming PHY tuning support for read and
> write operations.
>
> No functional changes.
>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
