Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A987FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 14:54:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA3764E99
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 14:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA3764E99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hmCQpC9Rur9ZEkbPgW7nhkKrzLz0kKYzyQF+bpVxRbY=; b=rAVMfJuxQ1AEgElFy9piS9q0x
	tFHgihn8KfOkof8tZZ1C6ODUxoXLpufPR2/VhJgl8Z1ZGL3IddWHkL8B84PfonEnr1Yk6AQMulGl4
	qF3DeLZ/uYFl605Utdxt0R/ksXBxoboCkIxGhZEgdlngd8ejORixCx4pd/kLvhQhcaLxcReezPqfi
	LPtRMXwFhE9gk5Jf3FaTEg3mna+gbC97KkPdo6joPegK6ct7qkHAE6WJ8fLDzcnJUKjeXYo270/Vx
	2al9Ow/UwsCcnilNk1/kJ5AmTmQpfBbh6okdtEOFtLYB9vUEqpyAaJkDDSUoxfNYMARrTFQA9kkPj
	wZfR2sh/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLoan-00GCEV-A5; Mon, 15 Mar 2021 14:53:13 +0000
Received: from smtprelay0198.hostedemail.com ([216.40.44.198]
 helo=smtprelay.hostedemail.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLoR1-00G8i5-Hq
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 14:43:13 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 42245182CF66F;
 Mon, 15 Mar 2021 14:43:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: spot91_0904ad72772d
X-Filterd-Recvd-Size: 2406
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Mon, 15 Mar 2021 14:43:03 +0000 (UTC)
Message-ID: <fb1bb7be6fad2dfb4bb3d311fddb39b13966311d.camel@perches.com>
Subject: Re: [PATCH v2 5/5] mtd: spi-nor: swp: Drop 'else' after 'return'
From: Joe Perches <joe@perches.com>
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com
Cc: vigneshr@ti.com, michael@walle.cc, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org
Date: Mon, 15 Mar 2021 07:43:01 -0700
In-Reply-To: <3ed8da81-55cc-4fbc-cb01-9405ac9709d7@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-6-tudor.ambarus@microchip.com>
 <20210308062821.wn4uqfxcg6vo3gcb@ti.com>
 <5723fabcc03455ee6624a7d223186e5fad2bf2e9.camel@perches.com>
 <3ed8da81-55cc-4fbc-cb01-9405ac9709d7@microchip.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_144308_166044_8E254B31 
X-CRM114-Status: GOOD (  17.08  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2021-03-15 at 11:24 +0000, Tudor.Ambarus@microchip.com wrote:
> On 3/15/21 8:53 AM, Joe Perches wrote:
> > On Mon, 2021-03-08 at 11:58 +0530, Pratyush Yadav wrote:
> > > On 06/03/21 11:50AM, Tudor Ambarus wrote:
> > > > else is not generally useful after a break or return.
> > > > =

> > > > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > > =

> > > Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> > > =

> > =

> > I don't think this improves the code.
> > =

> > Generally, checkpatch is a stupid little script.
> > =

> > This code uses a form like:
> > =A0=A0=A0=A0=A0=A0=A0=A0if (foo)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return bar;
> > =A0=A0=A0=A0=A0=A0=A0=A0else
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return baz;
> =

> Isn't else redundant? What are the benefits of keeping the else?

Visual consistency and it's a widely used style.

A long time ago Al Viro wrote:

https://lore.kernel.org/lkml/20140925032215.GK7996@ZenIV.linux.org.uk/

which resulted in the patch to checkpatch that tries to ignore that style.

https://lore.kernel.org/lkml/1411621434.4026.9.camel@joe-AO725/

> > I think better would be to change the code to use temporaries
> > and convert the functions to bool.

> returning one is wrong indeed, would you submit a patch for the conversion
> of the functions to bool?

Just a suggestion...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
