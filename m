Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7160D2ECF9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 07:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFiqHdL5CAt5PwBu8QJWFdtG19LNoGc0EKbNqsAKqQ8=; b=ePMRMOtjlXa3/L
	0ZT3K7S1D7zl94Zpy6B58v0MoA2ZrHfEMRPhd0wiSA2awwZ3GCDYErrYNyGvLeNuiv4itIvDwU78L
	a7yamq8oX/nSjrLnEEwZ8ZNE3ZnzzjFNJh3yLAYMafH1igj3CrGfJd6b6f98/EpiD0XkiiSjNs/lT
	PmucP3UXOAMXbrW8MFDyMPkk6ISFAUtKpv2caL2k583vVY/m0YptwT/ZUlmAd9qX6k5GM5brSm+Yj
	sqfxFeKNNxbZh4g1AMHsQ5Os3wBALvI82elPnrPi6+/faBFkWqyhzMrdqXfOW9YqJKhE9XBeN27Cd
	7yr8m4evV79ZKdkw1kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6ZQ-00000003NYs-1MVJ;
	Tue, 20 Jan 2026 07:54:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6ZG-00000003NY2-0OEj
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 07:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37E21600C3;
	Tue, 20 Jan 2026 07:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6480DC16AAE;
	Tue, 20 Jan 2026 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895664;
	bh=dtywpyfo8zGST6RB5ITRINgYqOsM26JAXnMDKRpEcJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhvnELd8NYlUuXA15lXZfDELufQqVoagcWtL3A+pxU/GZZ7/CK/h9PWaJnLWpq4KC
	 nIXhyQgWiLPpppZcLd6SDe76FfCzXvrYw8S5c0LxC2z5jMsHez8kHmw+i9IpsBFjF2
	 fi5ojhi1QLjNNkcUKA7+TKpivlBqaCiE1Qa+cG+iW6HR5WrAI4AFXQo3dFN/McNREo
	 MzycpzgNQFzlU/w7pubEITjbojGpnelnb4k+Sk9qoIpr3Ju+Z7+A0FzI99pqI/IKsR
	 FkY36T6Hk4UKORtl0+b49axcUGkfuRDpsy8LqYF/87vvXj3jD7ukKNjaHSa2ykETAK
	 GHXXMTOHVQ+zw==
Date: Tue, 20 Jan 2026 08:54:22 +0100
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
Subject: Re: [PATCH v2 05/10] dt-bindings: mtd: partitions: Define
 "#{address,size}-cells" in specific schemas
Message-ID: <20260120-wondrous-wapiti-from-tartarus-abf0ca@quoll>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
 <20260119-dt-mtd-partitions-v2-5-77ebb958a312@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-dt-mtd-partitions-v2-5-77ebb958a312@kernel.org>
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

On Mon, Jan 19, 2026 at 07:48:26PM -0600, Rob Herring (Arm) wrote:
> Whether "#address-cells" and "#size-cells" are used or not depends on
> the specific partition type, so drop them from partitions.yaml and
> define them in the specific partition schemas as needed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml        | 6 ++++--
>  Documentation/devicetree/bindings/mtd/partitions/partitions.yaml    | 6 ------
>  Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml   | 4 ----
>  3 files changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
