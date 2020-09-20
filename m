Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935CBC43463
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 01:23:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB02F208B8
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 01:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="porsbNY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB02F208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zB8EAxX7QmZfn3GAQmtdy4e2ED4z9RvQZeZQGXWcAc=; b=porsbNY3Cm85egowkym2YBpWJ
	pgRNN+0ow+YGSn02qQ/odg1RvAShMXVKrxI1cuU86JJCBXhdJQ1y1Aoe9s4xW/TsfB11QtjEGyksU
	8I1frl+ZpuQpiEryRCjPy/O7OV1364zoOWi50Fr//Pppdg6q2/0cIkAse/ZWXUcB5L7kIEubF8k0U
	DfVQIH1V220udyzroj0yVLwfbZ5lYNiw7t3/OApRlA/LuJBPFAaSWF8EE2pyZyZmKw1CVGxjfHmIH
	cTY1N6e8MrWi1OwBz57hYi4WFD8XTsxOYAlo7VtZr9iGSkzUqnh9Qdd9arAtc9m4f+v0HjYH2n8d2
	5+3FGZ2gA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJo3i-0004yR-Ed; Sun, 20 Sep 2020 01:22:30 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJo3e-0004y3-V3
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 01:22:27 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kJo3U-00FRHl-F7; Sun, 20 Sep 2020 03:22:16 +0200
Date: Sun, 20 Sep 2020 03:22:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: ansuelsmth@gmail.com
Subject: Re: R: [PATCH v2 4/4] dt-bindings: net: Document use of
 mac-address-increment
Message-ID: <20200920012216.GE3673389@lunn.ch>
References: <20200919223026.20803-1-ansuelsmth@gmail.com>
 <20200919223026.20803-5-ansuelsmth@gmail.com>
 <20200920003128.GC3673389@lunn.ch>
 <006301d68ee6$87fcc400$97f64c00$@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <006301d68ee6$87fcc400$97f64c00$@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_212227_027608_6CBF1DE1 
X-CRM114-Status: GOOD (  24.64  )
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
Cc: devicetree@vger.kernel.org, 'Vignesh Raghavendra' <vigneshr@ti.com>,
 'Boris Brezillon' <bbrezillon@kernel.org>,
 'Richard Weinberger' <richard@nod.at>, 'Russell King' <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, 'Rob Herring' <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, 'Miquel Raynal' <miquel.raynal@bootlin.com>,
 'Jakub Kicinski' <kuba@kernel.org>, netdev@vger.kernel.org,
 'Frank Rowand' <frowand.list@gmail.com>,
 "'David S. Miller'" <davem@davemloft.net>,
 'Heiner Kallweit' <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Sep 20, 2020 at 02:39:39AM +0200, ansuelsmth@gmail.com wrote:
> 
> 
> > -----Messaggio originale-----
> > Da: Andrew Lunn <andrew@lunn.ch>
> > Inviato: domenica 20 settembre 2020 02:31
> > A: Ansuel Smith <ansuelsmth@gmail.com>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> > <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; Rob Herring
> > <robh+dt@kernel.org>; David S. Miller <davem@davemloft.net>; Jakub
> > Kicinski <kuba@kernel.org>; Heiner Kallweit <hkallweit1@gmail.com>;
> > Russell King <linux@armlinux.org.uk>; Frank Rowand
> > <frowand.list@gmail.com>; Boris Brezillon <bbrezillon@kernel.org>; linux-
> > mtd@lists.infradead.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; netdev@vger.kernel.org
> > Oggetto: Re: [PATCH v2 4/4] dt-bindings: net: Document use of mac-
> > address-increment
> > 
> > > +  mac-address-increment:
> > > +    description:
> > > +      The MAC address can optionally be increased (or decreased using
> > > +      negative values) from the original value readed (from a nvmem
> cell
> > 
> > Read is irregular, there is no readed, just read.
> > 
> > > +      for example). This can be used if the mac is readed from a
> dedicated
> > > +      partition and must be increased based on the number of device
> > > +      present in the system.
> > 
> > You should probably add there is no underflow/overflow to other bytes
> > of the MAC address. 00:01:02:03:04:ff + 1 == 00:01:02:03:04:00.
> > 
> > > +    minimum: -255
> > > +    maximum: 255
> > > +
> > > +  mac-address-increment-byte:
> > > +    description:
> > > +      If 'mac-address-increment' is defined, this will tell what byte
> of
> > > +      the mac-address will be increased. If 'mac-address-increment' is
> > > +      not defined, this option will do nothing.
> > > +    default: 5
> > > +    minimum: 0
> > > +    maximum: 5
> > 
> > Is there a real need for this? A value of 0 seems like a bad idea,
> > since a unicast address could easily become a multicast address, which
> > is not valid for an interface address. It also does not seem like a
> > good idea to allow the OUI to be changed. So i think only bytes 3-5
> > should be allowed, but even then, i don't think this is needed, unless
> > you do have a clear use case.
> > 
> >     Andrew
> 
> Honestly the mac-address-increment-byte is added to give user some control
> but I
> don't really have a use case for it. Should I limit it to 3 or just remove
> the function?

If you have no use case, just remove it and document that last byte
will be incremented. I somebody does need it, it can be added in a
backwards compatible way.

     Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
