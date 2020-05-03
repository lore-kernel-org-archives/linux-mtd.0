Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB25C28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 16:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA62820663
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 16:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/HjrNSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA62820663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Kt9jNSR8Bd+negnNUMMX6VctCU/iWpa6UknCjQqD+M=; b=C/HjrNSnpmJA8D
	SAroalxXwKilKHXqMJjSUsakW0GOl2+1ZLH7h9McmmXOm1I4hmxdWOBslSxXc6SSbMBaNpz95QpIP
	oAAaOkZ1BdHduA5KBXIjzGpiioFC80LqHn8yUAozkt601Azk1yCRM2To1EgKHNHRAC+R8bN58+2eY
	5Y1LbOW/R0wBvidEZkczYdgkncI3NYEWmP/Jx7mwJ3TxM+eyalqR79DhHehB5hMqDx7BMiqvRGy5X
	0u3pEh0JjF6B2P+wDgmuGbSHFZtztH1gRWQJE3UxFv34IvzSbRlHwfdMCaEjYBjPhu2iMiSGImuPm
	jSOlGbKmGThGmQdFGeiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVHa8-0007Ql-Qr; Sun, 03 May 2020 16:35:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVHa2-0006TS-59
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 16:35:04 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F25512A05C5;
 Sun,  3 May 2020 17:34:58 +0100 (BST)
Date: Sun, 3 May 2020 18:34:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steve deRosier <derosier@gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow erase
 issue
Message-ID: <20200503183456.31a9932a@collabora.com>
In-Reply-To: <CALLGbRJU5Hj0gxs_4WG0UUYYMDSF1MAiEjkqn0G-zenhVhnSFQ@mail.gmail.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <CALLGbRJU5Hj0gxs_4WG0UUYYMDSF1MAiEjkqn0G-zenhVhnSFQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_093502_358025_244301A8 
X-CRM114-Status: GOOD (  26.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx@linutronix.de,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Steve,

On Sun, 3 May 2020 09:10:15 -0700
Steve deRosier <derosier@gmail.com> wrote:

> > +static bool micron_nand_with_shallow_erase_issue(struct nand_chip *chip)
> > +{
> > +       /*
> > +        * The shallow erase issue has been observed with MT29F*G*A
> > +        * parts but Micron suspects that the issue can happen with
> > +        * almost all recent SLC but at such a low probability that it
> > +        * is almost invisible. Nevertheless, as we mitigate the
> > +        * performance penalty at runtime by following the number of
> > +        * written pages in a block before erasing it, we may want to
> > +        * enable this fix by default.
> > +        */
> > +       return nand_is_slc(chip);
> > +}  
> 
> 
> Whoa, let's hold our horses here!  "almost all recent" would imply
> that older SLCs aren't affected. And the likelyhood that Micron will
> fix newer parts is high - because why  would they leave in a major bug
> like that in the next mask? So, what you're saying is when someone
> goes to upgrade their older device's Linux they're going to take a
> major filesystem performance hit without knowing it (because
> realistically who reads 10,000s of patches before upgrading) when
> their chip doesn't need it.

I do agree with what you say, but... (see below).

> Because we're too lazy to get the list from Micron and code that ugliness?

Too lazy to get the list from Micron?! I can tell you we've tried hard
and they've always been reluctant to give us such a list, or a
discriminant to identify those buggy parts. They even tried to
convince us it was not a bug but a problem that's inherent to any NAND
flashes, not only theirs. They didn't go as far as claiming this was a
feature, but given the energy they spent to deny the problem I
honestly thought they would. So no, it's definitely not what you think,
and I was hoping that threatening them to merge that patch upstream
would force them to provide us this information. Looks like it never
happened.

Maybe those that had to debug those weird/hardly reproducible issues
should speak up, because that's no fun thing to spend weeks/months
chasing such bugs just to discover that Micron knows about the issue and
can provide a fix if you ask them.

> 
> We put this in and the resulting discussions for embedded systems
> designers for the next decade are going to be one of two things:
> * Oh, you want to use that SLC NAND from Micron? Well then don't use
> Linux because it performs crappy on Micron SLC NANDs.
> OR
> * Oh, you want to use Linux? Well, don't use a Micron SLC NAND then
> because they perform crappy on Linux.
> 
> Let's get a list of all chip that have this bug (and let's be clear -
> it's a bug, not a "quirk") and enable it for those chips specifically.
> Even better if there was something in the chipinfo itself that made it
> obvious which ones had the problem (because realistically it's
> probably specific to a particular geometry). In any case, it's in the
> best interest of Micron to identify to us exactly which chips have or
> are likely to have this issue and for us to be specific on which get
> assigned this quirk. It is probably listed in an errata app-note, and
> if not it should be.
> 
> Strong NAK to defaulting all Micron SLC NANDs to this - unless it
> truly is the case that _all_ Micron SLC NANDs in the past and in the
> future likely have this problem.
> 

I honestly don't have a good solution here. I guess we could blacklist
flashes one by one when people report weird issues, but when they
discover the problem is already too late, and they have plenty of units
in the wild.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
