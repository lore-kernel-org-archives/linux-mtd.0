Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84BD2502E
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Jan 2026 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZHWrqewQ0ISdQx4i7PeFrQPMNgN/y27k3YE30DRGjM=; b=UG4WTMt3WFBZp5
	FGmBkcI9OF32vtqQgjgJcT4Unrshu8k2iErxj/A6ceK7R9Mtt5Ixas/ISXHUhlVPkx/4IdxHIpOi4
	H2KYDQZab28QQXyMuJD8y81ATI5Q+nCac4PTJdIX/eL4BnRa8zLsmJ2pPDgCMaai2pcwVg6FmLVIK
	PVlj79kJXlUDPDa1YczAS39/XhAWW8Jec70VqtFFcKtwdJN4gewGIv4PIZMCudDrjntHdJigwhxhJ
	A3gBFqXBkStm8yOtxNkpkDrRl8oro8hfSBWcnQ9cLk7WYDw7YUI1g3N5XsYDAW2bLxwARRFJmgVts
	JT+Q/yePw5dLUrX4z4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ves0b-000000046Eq-0sal;
	Sun, 11 Jan 2026 09:45:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ves0X-000000046ET-2FWk
	for linux-mtd@lists.infradead.org;
	Sun, 11 Jan 2026 09:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCF2140B81;
	Sun, 11 Jan 2026 09:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26673C4CEF7;
	Sun, 11 Jan 2026 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768124710;
	bh=iMeDM31hA+TKBnDpzxob+nvBPL1aNcZnT38bW8owbxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAeZzExzyMhF7j4TRwWr8LDVUBUKshw8sYhjbK1j01mWnix3nz596zYWjasHemqO2
	 pmpuMrUZZJ4kvVR0Qu7h6sfzU7KvzkmAc54AwVT7/vp7iUmI32VwfPgbg/8X9W0Dwf
	 wEMmtFygLkDEb0S7tzWeHRc38cv2a+6Xgnt5b4Ug9NrYbkkZ2sWdl32+Ibw72yejxE
	 Li+os7LzEYeR+FC6u4WjntR0YJdiKAbIY776+sOwJPsSqJDntDoz7TfokyXgIGaxNB
	 xCEpiHCwLtvxUzjEt0aVh4HFKTSSW6Njqo37koMdX1DJYR+us6PMS7E/ewEFN9TdxJ
	 QiVolSZP8uJvQ==
Date: Sun, 11 Jan 2026 10:45:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
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
Subject: Re: [PATCH 07/10] dt-bindings: mtd: Ensure partition node properties
 are documented
Message-ID: <20260111-cobra-of-hypothetical-popularity-e3dbee@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org>
 <20260109-affable-poetic-albatross-ff7fcf@quoll>
 <CAL_JsqLcVUMJqTKnYpP_r4Z16Sw1pVcQ=HCFJG0bY_O=q3psVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLcVUMJqTKnYpP_r4Z16Sw1pVcQ=HCFJG0bY_O=q3psVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_014513_602859_90C5938D 
X-CRM114-Status: UNSURE (   9.36  )
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

On Fri, Jan 09, 2026 at 06:25:32PM -0600, Rob Herring wrote:
> > > -    $ref: partitions/partition.yaml
> > > -    deprecated: true
> > > -
> > > -  "^partition@[0-9a-f]+":
> > > -    $ref: partitions/partition.yaml
> > > +  "(^partition)?@[0-9a-f]+$":
> > > +    $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
> > >      deprecated: true
> >
> > This makes partition@ deprecated. Looks unintended or needds commit msg
> > explanation.
> 
> No, the only change here is I combined the entries. "partition@" is
> deprecated when not under "partitions" node.

Indeed, I misread the diff.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
