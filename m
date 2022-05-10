Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2A4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VdDFQQ3SFzuKfLt0saiQ+VqQXWZ5ncvvusEFLJ0Aj0=; b=qT+QllhTDc+Ry5
	vp8ZDP6crm5rihEqURwTbcjiOV/+7RGfal8YNd8aRSiUwyqSENrh002Ovm1HC0z53RxyFjxRr4j6m
	yrzCBP2PfKAaFzr+3H9sku/2LAz42n3thaDWxUIiC6pDHNkFEa5QOEALJp2gwjxV1SPLfMxrQiKBG
	56+EMOLXljmEoNutD+G79GWSh4goFkrGGNTs5GqiRcopWHjB9brR2F+qlrJUZeAspJpmbFZr1vetk
	99QJgz1C2mwtYkuLUCP91vvUZBK1S+OqPpE3p0i6BYSjD37AEuN50Xs28RoKcN85oU3XNHiGBUV2m
	aMGsUmpV4uXCTnvSMqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noRl3-002iRO-6J; Tue, 10 May 2022 15:26:41 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noRkz-002iR0-GX
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 15:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1652196397;
 x=1683732397; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yUD3uwtewYu9aG509jJFvj6tNpbiQKxIslmOylkUtdk=;
 b=k+juFkF1CHzm5dkkd8MSQMyMKFQWyGZoeW6s9zbpzw8A1R80zWQ9GGDU
 eY0AlEv8itrWT3KNMTlfAKBnwO5a87BlRRZVRYMG9x2xuJsVosn2GB9EP
 1b122qrfO4QZjx3WDAJkC8ej5a8nDx7Hqio6aZ3ljCdktUUidFaNF2rKF
 TfADQlpUmf2KLLYuman+MlY3cRtONDOzDRWpF73AoPeVBNCdfYDXDoxeS
 OmR4Hq0ESgfi6fOu21IPuoUH+efJhGIRRxXesDm5D37TRB1L++nHqrr3J
 N5vMJrqQgSN1U9JT80urq2hPpGNQcwK5ZumudZonNOBHyXancaOHsl90H A==;
Date: Tue, 10 May 2022 17:26:35 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: kernel test robot <lkp@intel.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "richard@nod.at" <richard@nod.at>, "joern@lazybastard.org"
 <joern@lazybastard.org>, "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, 
 kernel <kernel@axis.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "frowand.list@gmail.com"
 <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtd: phram: Allow cached mappings
Message-ID: <20220510152635.GA17605@axis.com>
References: <20220412135302.1682890-5-vincent.whitchurch@axis.com>
 <202204131446.omJ5mC54-lkp@intel.com>
 <20220414090402.GA11067@axis.com> <20220425102816.54619c66@xps13>
 <20220425103015.1cc05f77@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425103015.1cc05f77@xps13>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_082637_909298_AFBDABD4 
X-CRM114-Status: GOOD (  10.15  )
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

On Mon, Apr 25, 2022 at 10:30:15AM +0200, Miquel Raynal wrote:
> miquel.raynal@bootlin.com wrote on Mon, 25 Apr 2022 10:28:16 +0200:
> > Looks good to me but I don't want to be the one "carrying" new compile
> > errors so I'll drop the series for now, until you get this patch
> > applied. Please then just resend the series with this thread mentioned
> > and I'll take it back.
> 
> BTW, I'm only talking about this improvement, patches 1-3 will remain.

Thank you.  I've now refactored this patch and send it out separately as
a v4, primarily to avoid the SH build problems (which look like they're
going to take a while[0] to get fixed) but also to remove some code
duplication.

[0] https://lore.kernel.org/lkml/CAMuHMdW-8HaQip+DT5W2Owq8M8kbYwHsf8_Zd-5rRfSjSjK0=g@mail.gmail.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
