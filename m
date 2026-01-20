Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C11D2ECF7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 07:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhUXEz7dZU6/cS2Wt9LVmSdr5nFrlKv59f0C/0cepqU=; b=mhrRQPseQD3SJj
	HPlMGREH8AVHiT7IKZKuh55rHjVNBKyX+2djmQzzlATaym7YaZwSPtUfYTL0BZscNrxuIEVB9hJtx
	G3uGelUwFUBNijUZRvmRM/aIVV57iSNFaGEyeBN1I3OBwVce0aYgFqK7f/xtXva3Um5JBHQOD1Tle
	mI1DbjGb/uugN0ctdjg5jhk8rUqgII7xrsXrG+Lyh5+Ccrmpyeo+yyPHR2GTiUqjoaP4b2wbGPyiW
	wWDAZjeymdnNC4w54hhaZ1kdn1NWWo+CXb9jUBGOmEmG+Qv6DU8gGlI9Wqk/5+FdaVI1UteH0rWVm
	BHNcNg6oC9jaGZAeeBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6aa-00000003NnB-19yM;
	Tue, 20 Jan 2026 07:55:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6aY-00000003NmZ-1qkP
	for linux-mtd@bombadil.infradead.org;
	Tue, 20 Jan 2026 07:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tcx8064/hGaAIMalVw9EaFRdmKraWOd4lVgzKYeyuA0=; b=HI+UoOq0yRxgtphTIrQ1HxqpVu
	4bW7DjTJJcWNEx3FfcsXKIRzD/l9r7Zu66bAl+//2QfCB2MpEomNkLj0j40kpyBq4gmFWEYWrzfdA
	rvXIfe9t9mvIBlZLE/qBvaJuFN3wWiwsklTFfb3SLK1+ffCd2TIjq0KTgb0WwHU1GoI47bvS5gBaP
	pumI+FKiW86ypa2TgRDNNApPl3py2aONUnYdVHp7ZuI5/SgqocD5zTD5bC+WrD23I1mP7Bzvk6+88
	cGcAj/Y/aoVolmK7185bBpdu8hTYNX064qA3QGEX7Qxhn/41b9onR4qPYmNuxVa4HMyFxm6HcikKi
	FXIgTUoA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6aV-0000000DWS6-2hkC
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 07:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D128540563;
	Tue, 20 Jan 2026 07:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33330C16AAE;
	Tue, 20 Jan 2026 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895739;
	bh=BBTRxbnKPyoh+nTPUz7ZafUr9MPEx37RGzF8gtkMZ6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3I6E/Nl/zHSfUZCfHsYpca4lxQuvK8u9O3KqSQo4iypJgrx3Wo0qJe34m2sIVG/9
	 e0Y8DpX1UTtGvizfEVk8c71JXlnAXmCEcpdMvLFuKf3L1JF/v7M6W10Gbsjw3zSx7d
	 mpbjMZP9HYVmaQz7MABdgd5q8hWPOSZwGGgUl2Iq+DhASzqwB4AcHpERlGj44nxL7G
	 Y70OCPuwVTrbEcHb/xLMU0v8Skp1PEXS1nRkR1nLpLjsQRYMZEo9u7uXrL9fN1BY1O
	 rZd/dCgwmMzvrJINFlGtVIeEHeGcGltIu2PKY07HOpo9NOLcGn0fOyMKvUBetmSahN
	 uYODJ+I0qRgTw==
Date: Tue, 20 Jan 2026 08:55:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 06/10] dt-bindings: mtd: partitions: Drop
 partitions.yaml
Message-ID: <20260120-ingenious-auk-of-enrichment-eae4f9@quoll>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
 <20260119-dt-mtd-partitions-v2-6-77ebb958a312@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-dt-mtd-partitions-v2-6-77ebb958a312@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_075543_923296_26719EEB 
X-CRM114-Status: GOOD (  13.22  )
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

On Mon, Jan 19, 2026 at 07:48:27PM -0600, Rob Herring (Arm) wrote:
> The partitions.yaml schema is an unusual structure in that it includes
> all possible partition types, and it disables the normal matching by
> compatible strings. As partitions.yaml has nothing to match on, it is
> only applied when explicitly referenced. The use of "oneOf" also results
> in misleading warnings which are difficult to understand. Drop
> partitions.yaml and rely on the standard compatible matching instead.
> 
> The "mmc-card" case previously allowed any partition type, but now only
> allows "fixed-partitions". There aren't any users and the original
> intent appeared to be only for "fixed-partitions".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml          | 20 ++++--------
>  Documentation/devicetree/bindings/mtd/mtd.yaml     |  2 +-
>  .../mtd/partitions/arm,arm-firmware-suite.yaml     |  2 --
>  .../mtd/partitions/brcm,bcm4908-partitions.yaml    |  2 --
>  .../partitions/brcm,bcm947xx-cfe-partitions.yaml   |  2 --
>  .../mtd/partitions/linksys,ns-partitions.yaml      |  2 --
>  .../bindings/mtd/partitions/partitions.yaml        | 36 ----------------------
>  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   |  4 ++-
>  8 files changed, 10 insertions(+), 60 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
