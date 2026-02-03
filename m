Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789FBE8B362
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 21:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyfJ0ISUGCH099thA4twoIOUfA+EONoVTOwuxnwNkeY=; b=gBs0pTupBZEf/b
	sacr3kKCmfRak72tGR2is+zDb6X8maSeYGb5rGWTjH/McBClQbMktBshvezu70fHhACJb7qQQ2K7w
	y8WlKi9JzK2BcQsSj8bZffaxgQSIqzUzspBPPW4JdH1DUcY54aQmyaf5QYuqRVnCpyZACReHJs5w/
	yqGuvl/jYWXPj3gzrltpjnnNoIH8jCMW2DITg7XNqWci/yUhXU1VC0zJ/ia6t5IaaulWakeVHxleb
	xVRMsaBdTgiTo3QoHJKJjwhKDz9m9PDVFzYWipGtWKpOms6zLPOpJcdQgetkPGaygzBuZ0mbG1C9C
	5rggKNxaOEINKGEpqqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNv8-00000007NEj-1jsc;
	Tue, 03 Feb 2026 21:26:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNv5-00000007NEN-0EI4
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 21:26:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5CB21A2BCC;
	Tue,  3 Feb 2026 21:26:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 805B760728;
	Tue,  3 Feb 2026 21:26:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86720119A8888;
	Tue,  3 Feb 2026 22:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770154003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/+q/af+ksPE7jzykWj7uXSqYHTn46N8s30ZmdgeaZUw=;
	b=uOqf8q9gdfCzsbKOilwihAPJ5Fjpslxn5EEJlOaKrKxhFjn4XYA4frT6Ji5iawmkc8hQru
	nG6d0X2J9FqSlTbwDDfYES1OF9+s5sFyiQiHtuCwQM7FTCYP8+IhuDC33qT54l/BFllSFa
	SbSDQtHrbA1lKX6sfNp0EGR69Ll1b5fvDMiSBgmqbpgYmg2Y3MiROunVeQjnBGzOwkQ0fa
	3o/g8RC6tUMSXE3k14cAFxZydStB9zftmUaCvfMp6EOhp7goFu9LMYD0CtPJKCldsh0Md4
	etmkVCoG3NNiGaEmlXc1YJVdoqKbJOf2D+O+3UYGRXwBVzzO8ZW2UB+S0l4kgA==
Mime-Version: 1.0
Date: Tue, 03 Feb 2026 22:26:39 +0100
Message-Id: <DG5N816NIGGQ.3NMTVNIAJP5AY@bootlin.com>
Cc: "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com>, "Michal Simek"
 <monstr@monstr.eu>, "Bernhard Frauendienst" <kernel@nospam.obeliks.de>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v16 0/3] mtd: Add support for stacked memories
X-Mailer: aerc 0.20.1
References: <20260203-mtd-virt-concat-v16-0-a112a979c813@bootlin.com>
In-Reply-To: <20260203-mtd-virt-concat-v16-0-a112a979c813@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_132647_253195_71F4E1E1 
X-CRM114-Status: GOOD (  16.29  )
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

Hello,

On Tue Feb 3, 2026 at 9:39 PM CET, Luca Ceresoli wrote:
> [TL;DR for v15: as agreed with Amit I'm sending a new iteration of his
> patches to fix the build-time failure due to a module dependency
> loop. Original cover follows.]
>
> This patch series adds stacked support by enhancing the existing mtd-concat
> driver to be more generic.
>
> As background, a few years ago, Bernhard Frauendienst initiated an effort
> [2] to achieve the same, which was later adapted by Miquel [1] to introduce
> stacked mode support. In this approach, partitions to be concatenated were
> specified using a DT property "part-concat" within the partitions
> definition, allowing two MTD devices to function as a single larger one in
> order to be able to define partitions across chip boundaries. However, the
> bindings were not accepted. As a result, the mtd-concat approach was
> dropped, and alternative DT bindings were introduced [3][4][5], describing
> the two flash devices as one. Corresponding SPI core changes to support
> these bindings were later added [6].
>
> While integrating stacked mode support into SPI-NOR, Tudor provided
> additional feedback, leading to discussions about updating the existing
> DT bindings. To address this, I sent an RFC [7] to initiate discussions on
> adapting the DT bindings as suggested by Miquel in [1]. Following that,
> I am now submitting this patch series that updates the virtual concat DT
> bindings and the driver referenced in [1], along with some minor mtdcore
> changes.
> Since I have taken ownership of this effort, I have included Bernhard and
> Miquel under the "Suggested-by" tag.
>
> [1] https://lore.kernel.org/linux-mtd/20191127105522.31445-1-miquel.raynal@bootlin.com/
> [2] https://lwn.net/ml/linux-kernel/20180907173515.19990-1-kernel@nospam.obeliks.de/
> [3] https://github.com/torvalds/linux/commit/f89504300e94524d5d5846ff8b728592ac72cec4
> [4] https://github.com/torvalds/linux/commit/eba5368503b4291db7819512600fa014ea17c5a8
> [5] https://github.com/torvalds/linux/commit/e2edd1b64f1c79e8abda365149ed62a2a9a494b4
> [6] https://github.com/torvalds/linux/commit/4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
> [7] https://lore.kernel.org/all/20241026075347.580858-1-amit.kumar-mahapatra@amd.com/
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Aargh, I forgot to add my SoB line! Please ignore this series, v17
incoming. Sorry about the mess!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
