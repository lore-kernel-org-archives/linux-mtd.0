Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB5D3CC87
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 22:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYCr049KjDtSjAAq0MsjLLaX8a6kL5B8HFU4TT1opqw=; b=DLnZXnD3pR/mRk
	iJfV5VLOLiGe9h9f0JBuFhkOr6dNkFr9iFG0ijFH6D81uGWDw3uLqvbl2Bdd87APlHpv1W6UBWceq
	WIbLjaIcELcNY9/7fyk5pBXQR9vO/9CxT1Fv4uiTrLamEGsrNJ6t0BqX44sfayVHq5h8bUw02DCup
	pXCjjQZ4MKvDjxFH6EuKUMJ8VrcLUdkyLPgRRskfcmcnI/a5mc6vmOS/WpWclhlgypv1jOogsA5Nm
	PeyTSP37ruUimVkZLEptEcGqh5fPq0krpTijqhLUXyyL8T9h+IUKHL9gu+lZEDehIljDttyZAEy64
	KX9hmj15C9lApoazEdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9Oz-0000000AvFY-0Suh;
	Wed, 14 Jan 2026 22:31:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9Ox-0000000AvFJ-0csa;
	Wed, 14 Jan 2026 22:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 380D360051;
	Wed, 14 Jan 2026 22:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4AFC4CEF7;
	Wed, 14 Jan 2026 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768429901;
	bh=dNBHdZnRQhYECqtJiX5GeDmBx5sB8buRFZzawq9ckvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1PGSpbaumhquJg9KJB3mC0XR/FFNHh5HbwO/VHRg+sZ2SjCW8nMWz9AUwXD3+IMq
	 g79d4j3SMC3VF2c5LqCq76WZQhMP17Ln8OuuuWGsuUI4YmTC06YiHAWxRt5vvb0Sxt
	 iFOHLXwXvhEoyctSL83VMQCbJ1QRXgy5qqJedV4KEKVTUP0wj5oS8LZSOcE77LUMWF
	 fEMKLRF6W1uleyfY9ATe0Kf2lE9cgnfQOWpJSKiyJlqJJfCYYqTLxHcNlaYAf5aSmh
	 O0b1MvCxBRyK+ol6F5L75ECoLp3Jp6/vPAxF7R2ki9pcSCaiP1a1DETvoO99oDF7tG
	 I9SNmGkQujHOg==
Date: Wed, 14 Jan 2026 16:31:40 -0600
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <20260114223140.GA3306270-robh@kernel.org>
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
 <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
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

On Wed, Jan 07, 2026 at 02:04:53PM +0100, Gregory CLEMENT wrote:
> The Device Tree specification allows a "memory-region" node to have
> multiple 'reg' entries, but the current kernel implementation only
> processes the first entry. This can lead to drivers not being able to
> access all the reserved memory regions specified in the Device Tree.

This may be a case of we change the spec. Or at least say, nodes 
referenced by memory-region can only have 1 region. Are there some 
existing users needing this functionality?

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
