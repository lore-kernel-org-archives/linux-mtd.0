Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CAECCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUcXXxoL/JMDfDbhYdNTWqZAmVNCsO464hJMr3MCxcA=; b=Fgav9c57T6TBj0
	Q40eX85lpeUTYam0IXAnN2AAQOZ+CGRog8++oQc3B7gddzXrNkcKqP48qLiiw1Ckx8eq4TMFHP43e
	ZT7v0ncTh/rg0jVZapPEIEhPkGtrPs2sXJI5WHGr+mKMlRXko6/1dPo74TW0kozZEzhmLbWUsMISb
	9CTy51luy//ar7Tv686k+kVv73xkAQagonkpzXbQjEU+64rOQMYfRIxb5gOHEukS0JmLvrAk2pYII
	W4uibwbquhYAE51tC6MulnbF2LDV7wN/hmV0hcnFNc3sEXrfGiTjPvok/yfwAFmmTQilxPV/5/8Ri
	M3YHP6EkPf2G14jbIT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUog-00000002CGn-15Ai;
	Wed, 22 Oct 2025 09:07:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUoe-00000002CFm-0dXa;
	Wed, 22 Oct 2025 09:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 954E360345;
	Wed, 22 Oct 2025 09:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F861C4CEFD;
	Wed, 22 Oct 2025 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761124051;
	bh=CFgRIFMDLlRvna1V1YNxpinel1qHj26Ym1dQevPLhM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0dXllMzAkMxnW5/HCfpu5O8VnH8RRiG0N1ipd4KFgGQY8kTTafhn3lKe3yUz2jo4
	 b3CI8iQggy9x6/LpG1XyflkUFqDDr+2xBzq3b9N3BCdseLEI0bIeGS717z5P+mLIsg
	 LCfRwkRXNVCXYM6geprxjBkTuMLOpVnabM5vVxhSe7uCyk6mpLQgdoiJnNSvkrYviN
	 k2gOc5yuh4cGN78HDSwEqWfUp8f4R5zDHx3Ibkj+6czn1Qkn5Wb5vjAmGD0ddUcdin
	 vaC2ZPaA0RtTNyyLliSJ6st/5k/NJJ4m51PKxHiAfyrQW9cSBwwHvaoX4e73SuOPAC
	 gOG/SPC8CGUwg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vBUoh-000000004Ty-2gqA;
	Wed, 22 Oct 2025 11:07:36 +0200
Date: Wed, 22 Oct 2025 11:07:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] mtd: rawnand: sunxi: introduce reg_user_data in
 sunxi_nfc_caps
Message-ID: <aPie167O32Jc6BHw@hovoldconsulting.com>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-5-richard.genoud@bootlin.com>
 <87y0p3tiz9.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y0p3tiz9.fsf@bootlin.com>
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

On Wed, Oct 22, 2025 at 10:54:02AM +0200, Miquel Raynal wrote:
> On 20/10/2025 at 12:13:00 +02, Richard Genoud <richard.genoud@bootlin.com> wrote:

> > @@ -723,8 +726,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
> >  {
> >  	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
> >  
> > -	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(step)),
> > -				   oob);
> > +	sunxi_nfc_user_data_to_buf(readl(nfc->regs +
> > +					 NFC_REG_USER_DATA(nfc, step)),
> > oob);
> 
> Minor nit, column limit is 100 now, so typically for this kind of
> situation everything would fit on a single line.

Just a drive-by comment:

The preferred limit is still 80 chars, unless exceeding it significantly
increases readability.

I guess here such an exception may be warranted.

Johan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
