Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7C0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2x63IrGAEz73MB02wwyzgGK9ylcOz8GhTCa4RIXBno=; b=bnyfzQSYNZh++E
	gwjKlsKbQInA7sh3QvR3qJrfE7hpRioIsk1Q5B0yUt5P+fIERMA3CcY+HsD2JHMFFL7bp34ENIwNr
	MqmbxIMeUBPf/Ov02Ml5eHc5q8QDVxfPbAa/DeJzmaGjQD9BDVqhzquWFkqVkDDTTww+xVXdwNFkP
	pFJZpvg62/xgqZu0f/LiEfopt65Qe+pY+sviHvFVB42nTeamjJbdcoI4Fk95hN0spXH3uXd7qRiO3
	Za1Dr3+ujNpzT6/utTtSPZyuY4iAeeDZwNJddChH9DzJoSrvEPahnWAuh42jU/ZtYty5dKD2ufuD+
	XzBPCPqnTdiLe+l+2wYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRMk-00C3Zn-29; Thu, 21 Apr 2022 07:36:38 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRML-00C3Ea-8L
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:36:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21EA01BF20C;
 Thu, 21 Apr 2022 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcb4fNSQYUR6OWiIdyOzCplJ/DTcA5AU/+7wwXW0E90=;
 b=MOj5ny+Vw2r4F0LVZL6WM582GYT413UwNGIAbPUvPMklTVkYFZxLDyO8GI6bBnEKy4V5gB
 KkTpR1CgsUYoCCW/7vddUpcSjOrE9v1vC3CgbuPs/25jtHG76naJyO6MFmc2EfRMiWIFVb
 8EQR2OMOagscs25K9yq524dllQKWR9TEPIPkrtLUiwG+v5cvE9bems/c37Vg1uILhE/MN/
 binECpa7A928AsFGVx/9dDeycf6cGVHAs6no7X/CfFiW7ThM3wuXnYDrRXvj8NGkkSU0IJ
 bROhCPozgNknDeNQI/oCQfugBawiIUVTS7GukWGTMJMrL+wnfl5+yvsfQEl+RA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>, vigneshr@ti.com,
 richard@nod.at, miquel.raynal@bootlin.com, joern@lazybastard.org
Cc: kernel@axis.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, frowand.list@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: reserved-memory: Support MTD/block
 device
Date: Thu, 21 Apr 2022 09:36:08 +0200
Message-Id: <20220421073608.72216-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412135302.1682890-3-vincent.whitchurch@axis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9638e151eeeaeabcad4341ba20f63fe80916cd7a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003613_471114_B7E6886B 
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

On Tue, 2022-04-12 at 13:53:00 UTC, Vincent Whitchurch wrote:
> Add bindings to allow MTD/block devices to be used in reserved-memory
> regions using the "phram" (MTD in PHysical RAM) driver.
> 
> This allows things like partitioning to be specified via the existing
> devicetree bindings.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
