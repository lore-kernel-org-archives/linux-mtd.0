Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E45D232F8
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ea/K6SWrJymyHefFMpfw+vieR6n4fYgeAbeOOs8HHM=; b=t2svJgV2PFfVyg
	0+phfw0FtiD1PA8YXa8gypZBctcPjNkQV5EGEDZfqAN19wCqopY9ihbdIX6hoAZOQOedzJMstjyN1
	xheDxLi9xBZ2ys7Bu1v8mwcAXrDezVfeQrRmU44TQQkYigcwSfgqnczn3fWqtYsm/+8H+GLkiCwJa
	p8NnmXYqfzC4r/tGvnccKWQRjZ/187fka5HGiBDH0b9hIfMVB6ZInKYpIL4u3+qilP27CSGiyBbe8
	IcteyYKKXZzOif2aunjrqitLgDn5mremkcNnEb0HuiKcdcyBoO3wzJsz2TDA9vzzEgs2hBiB0HrUT
	zrla3/o3sKRpoS1fvXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8K3-00000001wuU-1ELS;
	Fri, 09 Jan 2026 08:58:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Jz-00000001wu0-2tmk
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 08:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F22BD41B34;
	Fri,  9 Jan 2026 08:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52239C16AAE;
	Fri,  9 Jan 2026 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767949094;
	bh=ojRtnWmofiQARBjo7qW80usOLanqMK69sII42EyQ+c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nb0ayqB/SCXA98L61KR3yBuhxUIb5T3KqLoO9s1MORr+OPktlhNuvICzGLOC7RNJy
	 F6Mmi6hEisoKXaZXsXVEGq46+lPrjwncQfvVVajBz2FxVRki4h4tVdAd4xwiGkLiDu
	 6dcK3LmWBm3bguWgXvIKRbhGoVY8hGZHaztObxn8q638ywiikcnw993nvWpmXXxCk/
	 U+zrptLJ0zUnT+bzAdNcrstJ+tUeC9cwNoSQbNWYZFFK3aznWhAmYIvWNE3Azv2HwP
	 4krcHSEvQdt+SfcPvPt8vHgI0IfrLvwkaZwAZitTOAzormvp0N+uOttVJWIHabvWG7
	 Em8XymrfSgC1Q==
Date: Fri, 9 Jan 2026 09:58:12 +0100
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
Subject: Re: [PATCH 02/10] dt-bindings: mtd: fixed-partitions: Move
 "compression" to partition node
Message-ID: <20260109-didactic-knowing-buffalo-528062@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-2-124a53ce6279@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-dt-mtd-partitions-v1-2-124a53ce6279@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_005816_555713_49F1DC61 
X-CRM114-Status: UNSURE (   9.98  )
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

On Thu, Jan 08, 2026 at 11:53:11AM -0600, Rob Herring (Arm) wrote:
> The "compression" property is defined in the wrong place as it applies
> to individual partitions nodes, not all nodes.
> 
> Fixes: 8baba8d52ff5 ("dt-bindings: mtd: fixed-partitions: Add compression property")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/mtd/partitions/fixed-partitions.yaml      | 18 ------------------
>  .../devicetree/bindings/mtd/partitions/partition.yaml  | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
