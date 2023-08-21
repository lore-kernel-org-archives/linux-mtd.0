Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCCAEE49A5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvQcelyxGQzipeipUKUH7mCfnUC8odrywwXx9Nno2Jw=; b=eFAqwY6n6pJ4nm
	VswwsnNE9M6dqoiRs644Iy1XBSE/sASh8iTFT2SY4+iHUz1ullJJkErtxuYlK8DVTDUxvQAxL6fsv
	P/Bs0kuF4I7uK4gyPCJWkGxHKuT8jHzLFubNoa0bWgPRT63XwHizpEAqkyWHucJ55F227Iv9SfbVy
	h4ogQVcRGFSBOsn1xz/t/gkB4igFsRh0mYxPAPE3QZ7L3lw/z7Xh9IE6MnQMERkyFkzcv8JVOHkwq
	vHh9PUj+5qYOPfo5Kc9jXcMRUwlSBJhTvaCOUhqnxengyEmcQX8w9sjDN6XaPxgFJZ5hDzkaNAx6B
	+xdSIVooXezlSmI5c0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8kb-00ERbs-1N;
	Mon, 21 Aug 2023 17:31:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8kY-00ERao-1g
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 17:31:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AD5961E6B;
	Mon, 21 Aug 2023 17:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782B8C433C7;
	Mon, 21 Aug 2023 17:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692639093;
	bh=VkemwibYJ2nMzyGNc3hL2Coq8QPTF8mVnHs9ZucqfV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iKLzO+HCkli6SytGfQDyri5m6mX8il8Ygo8QkFmlAyxkATiyObOGpZFkKbUIbwvDS
	 WHNM5sFvBjO8b8ZyXtOwY3UnoPnvUyAYVZAoJIMFSLwkKytxF9mpjGu8YuVcldWcfk
	 aWljEjo7eE5/XC61hCq33NMnlRibYy0ODQNtDx8gqoKFMJri9d7oCp7O6JnYWbylZa
	 SbuKUuyX3pVCtbveJtSfcmmIkRsM8l7lD7Puo91137q2YSyJbDOJDPZt+pDbHoXXTW
	 DYO28g3tfjyB53CCXUOfvNefbys7SpkNLXCzBPTS2KYbxUP5FbyFRRSRMBbEXoUg+Y
	 ZzLkxX5F5O+2w==
Received: (nullmailer pid 2000961 invoked by uid 1000);
	Mon, 21 Aug 2023 17:31:31 -0000
Date: Mon, 21 Aug 2023 12:31:31 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: mtd: nvmem-cells: add support for
 UBI volumes
Message-ID: <169263909099.2000909.1836274572837880546.robh@kernel.org>
References: <cover.1691717480.git.daniel@makrotopia.org>
 <7df4543f5dacef006bd7067117cf959b59842d69.1691717480.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7df4543f5dacef006bd7067117cf959b59842d69.1691717480.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_103134_602786_29460A6B 
X-CRM114-Status: GOOD (  12.13  )
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


On Fri, 11 Aug 2023 02:36:55 +0100, Daniel Golle wrote:
> UBI volumes may be used to contain NVMEM bits, typically device MAC
> addresses or wireless radio calibration data.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/mtd/partitions/linux,ubi.yaml        | 3 ++-
>  .../devicetree/bindings/mtd/partitions/nvmem-cells.yaml      | 5 ++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
