Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA07C021B6
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 23:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:
	References:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfAdOjkVcA1ggD1PIoP2uNq3SQWZmlSbV8Mhp/ePa4s=; b=LDxQivWhfCJqHF
	q8ZkcYsQrgQUI1aISNLC3Z6U0cpFlq3veJjqNZjQv9vZib8uUr08gLkreya+6f4LfLtgDSXaxxRqL
	E4kjvjI2P6nH59vfxgs7PyOKwuTirnjb0IUmMKGOexEted7rnLhf3hYtOXs/ozLpLma5t7Kfqd1It
	wcQVltRY4nrBlbkaWebezibUlYTvzMSFMoSljEFn8zosC9IWhMMF3aS0YzGy6P1rxQQhjHilj1AiL
	maRvxzE+LSqpuls1keoootu4Xn5bm5trhmjGArNBeLobm66Met3dCQKVEXZjM7uwG8TbRcNJmEGST
	gOM9M8e3rgsYU/watORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLmu-0000000Bzk7-3E79;
	Sun, 23 Feb 2025 23:53:32 +0000
Received: from baldur.buserror.net ([165.227.176.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLmC-0000000Bzgq-3eFn
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 23:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=ESEjuP0qNKG7M31LDxN5dSH9PUQiZX8A161LNfHK2gs=; b=1+v+ww0eli53gNR6dEhBDOqi2B
	mrW7UtVHR4Yzh81YhZxcdbGJtdQbX0Wu/Ew7/1BUBebZUQQ8ArhhfBhL/GJ0C1qpVgStWr8RVCCMk
	5GjYDXmpB2WORXvs59CtqCoEoNWh+fxUYKMgEsuxU7LV9qRHumXtRtcbpHRb61IuAQ/ildErwsOAH
	FJyH0AnNYosXBzEa8H9KKSFQM3sQ0+8qXyzLk8KIPl1Zb7H+jvVMtD6XvhIgW+7dEPA8EtsmFO/jE
	/4gfAdWIyG1k5Utcfe66gKke/O3HjMVSXUFscRPdrWWMViDr399GxelCcOF1PMttz5jRwigl2yYHE
	PoRjdYtQ==;
Received: from oss by baldur.buserror.net with local (Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1tmLfR-00ELyd-2y;
	Sun, 23 Feb 2025 17:45:50 -0600
Date: Sun, 23 Feb 2025 17:45:49 -0600
From: Crystal Wood <oss@buserror.net>
To: Rob Herring <robh@kernel.org>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Message-ID: <Z7uzLeXiXIdVYNM5@buserror.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
 <20250210215324.GA1040564-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210215324.GA1040564-robh@kernel.org>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: robh@kernel.org, j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-SA-Exim-Mail-From: oss@buserror.net
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_155248_909111_08080E95 
X-CRM114-Status: GOOD (  26.64  )
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

On Mon, Feb 10, 2025 at 03:53:24PM -0600, Rob Herring wrote:
> Generally, if a bus has control registers or resources like clocks, then 
> we tend not to call them 'simple-bus'. And '"specific-bus", 
> "simple-bus"' gives some problems around what driver if any do you 
> bind to. 

Isn't the general idea that you bind to the first one in the list that
you have a driver for, since it goes from most to least specific?

> If you have chip selects, then you have config registers for those. 
> Not really "simple" if you ask me. That being said, you could keep 
> 'simple-bus' here. I would tend to err on making the schema match the 
> actual .dts rather than updating the .dts files on older platforms like 
> these.

By that definition I wonder how much truly qualifies.  Even with
IMMR/CCSR, firmware needs to at least set the base register (which is
itself inside CCSR, so there's no way to avoid relying on knowledge of
what the firmware did, except on 8xx).  Though I acknowledge that eLBC is
a stretch, with FCM and UPM being exceptions.  FCM didn't exist in the
original LBC, and UPM was... kind of considered a fringe use case
until someone hooked NAND up to it.  :-P

The point back then wasn't that such registers don't exist, but that the
OS can use the devices without having to care.  But of course, there's
subjectivity there about what the OS might care about (e.g. UPM).

FWIW, on these chips (especially the later ones) there were all sorts of
things (in general, not specifically LBC-related) that firmware had to
set up to present a coherent system to the OS.  Not all the choices made
there were great, but if we tried to describe all the gory details from
the start I'm sure we would have made an even bigger mess of it.

> > For non-NAND devices this bus generally meets the definition of "an
> > internal I/O bus that cannot be probed for devices" where "devices on the
> > bus can be accessed directly without additional configuration
> > required".  NAND flash is an exception, but those devices have
> > compatibles that are specific to the bus controller.
> 
> NAND bindings have evolved quite a bit if you haven't been paying 
> attention.

I haven't, as I acknowledged... but I was describing how eLBC does it,
and just meant that we're not binding to drivers that don't know about
the bus in that case.  The NAND control registers are part of eLBC/IFC,
not a separate block (the reg in the NAND node itself is just the SRAM
used as a buffer).  I'm not sure what that would be expected to look like
these days.

-Crystal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
