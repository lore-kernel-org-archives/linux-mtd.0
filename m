Return-Path: <SRS0=Pa7a=Y3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A1ECA9EB0
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2019 13:28:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB7F20663
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2019 13:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UC43xHGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB7F20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEqiLlv/5wu6RjLxkdPupoyqv+ZHF6H6C3q4bcFfuSM=; b=UC43xHGtc41pUs
	0xirbTIYl8TPWsP1XTsut5U+rKb3Yf4NGkVl1WaCwAu3VptxoytzvXokmcAeljgT7kBJ4HDry3HBf
	DMI1QgijUbFcp1Oh8vDwnB915DcQYx9rX//Vrfh8hQflTMbB3X8iGFLOQgCiyv3wdUCxHp2u5//EY
	ektkvzjQtPTZQOv3fnGevdInDTJgiJbPVKKPJMkUG5Ocp8NydgBMqYUvDbFWk6UuhqfeSgY5jJrQ4
	aKir0C1WZM9V0vB1jPCWFvRVa7b+NNYPr8iJGN2fsnRY6s0aO2uFmmHRf7kiAusfo/XV5u8rzifXE
	4X9N5i+QX0IpUYaWipMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRFvD-0007G3-UT; Sun, 03 Nov 2019 13:27:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRFv9-0007Fd-IU
 for linux-mtd@lists.infradead.org; Sun, 03 Nov 2019 13:27:57 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9D80A28A619;
 Sun,  3 Nov 2019 13:27:46 +0000 (GMT)
Date: Sun, 3 Nov 2019 14:27:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH][RFC] mtd: spinand: fix detection of GD5FxGQ4xA flash
Message-ID: <20191103142741.7b2a2bf0@collabora.com>
In-Reply-To: <CAJsYDVJgwRfg2kfmuG4P-NCEAZ4box+=Yb53d0J+rAjLRpc3Ww@mail.gmail.com>
References: <20191016013845.23508-1-gch981213@gmail.com>
 <20191028174131.65c3d580@xps13>
 <CAJsYDVJgwRfg2kfmuG4P-NCEAZ4box+=Yb53d0J+rAjLRpc3Ww@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191103_052755_873129_41B8B9B3 
X-CRM114-Status: GOOD (  26.69  )
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
Cc: Stefan Roese <sr@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Jeff Kletsky <git-commits@allycomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 3 Nov 2019 20:03:21 +0800
Chuanhong Guo <gch981213@gmail.com> wrote:

> Hi!
> 
> On Tue, Oct 29, 2019 at 12:41 AM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> >
> > Hello,
> >
> > Chuanhong Guo <gch981213@gmail.com> wrote on Wed, 16 Oct 2019 09:38:24
> > +0800:
> >  
> > > GD5FxGQ4xA didn't follow the SPI spec to keep MISO low while slave is
> > > reading, and instead MISO is kept high. As a result, the first byte
> > > of id becomes 0xFF.
> > > Since the first byte isn't supposed to be checked at all, this patch
> > > just removed that check.
> > >
> > > While at it, redo the comment above to better explain what's happening.
> > >
> > > Fixes: cfd93d7c908e ("mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG")
> > > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > > CC: Jeff Kletsky <git-commits@allycomm.com>
> > > ---
> > > RFC:
> > > I doubt whether this patch is a proper fix for the underlying problem:
> > > The actual problem is that we have two different implementation of read id
> > > command: One replies immediately after master sending 0x9f and the other
> > > need to send 0x9f and an offset byte (found in winbond and early GD flashes.)  
> 
> Correction: Only early GigaDevice nand chips uses this implementation.
> Winbond chips uses a dummy byte instead of an address byte so there's
> no problem for Winbond chips.
> 
> > > Current code only works if SPI master is properly implemented (i.e. keep MOSI
> > > low while reading.)  
> >
> > I am not entirely against the fix, but this is a SPI host controller
> > issue, right? Can you try to fix the controller driver instead?  
> 
> I think this is a spi nand framework issue. GigaDevice uses an unusual
> READ ID implementation, and as a result, both host controller and chip
> are reading during the first byte after 0x9f command: chip is reading
> the address/offset byte and host is expecting the first ID byte.
> Here lies two problems:
> 1. According to the sequence diagram in their datasheet, MISO pin is
> in High-Z state during the 0x9f command and the offset byte, and host
> could read anything during this time instead of a fixed 0x0 or 0xff
> byte, so the check of first byte should be removed. This is what this
> patch is doing.
> 2. If there's a buggy SPI host controller that didn't keep MOSI low
> during reading operation, the chip will get 0xff as ID offset, causing
> the read vendor/device ID to be swapped. I never met such a controller
> so far, but if there is one, it will be a silicon bug that can't be
> fixed by software. To fix this one, we'll have to make a second
> read-id implementation in spi nand framework.

I realize how fragile this ID-based detection is when manufacturers
decide to not follow the standard READID semantic (one 0x9f command byte
followed by 1 or more input cycles encoding the ID). Let's imagine you
have a valid manuf ID byte in ID[0], and the device ID (ID[1]) matches
the Winbond or Gigadevice manufacturer ID, and ID[3] (extended Device ID
byte?) matches a valid Winbond/Gigadevice device ID. If you skip the
check on ID[0] you might erroneously detect a Winbond or Gigadevice
NAND, while it's actually something else.

Note that I don't really have a solution to make this detection more
robust.

> 
> The second problem only exist in theory, so my preference is to apply
> this patch and fix only the first problem for now.

I think we should fix that problem now. Maybe by doing a 3 steps
detection:

1/ READID + ID[]
2/ READID + DUMMY + ID[]
3/ READID + ADDR + ID[]

At each step we would check if the returned ID matches a valid NAND,
and if it does, stop there.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
