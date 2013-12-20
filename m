Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtxF8-0006Gb-7N
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 10:23:43 +0000
From: Richard Weinberger <richard@nod.at>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI VID header corruption, offset data
Date: Fri, 20 Dec 2013 11:23:13 +0100
Message-ID: <3341132.5Nv0YlqARB@sandpuppy>
In-Reply-To: <EACD232272DA4849B060F0828564D13B0A7771372C@ntcex01.corp.netcomm.com.au>
References: <EACD232272DA4849B060F0828564D13B0A7771372C@ntcex01.corp.netcomm.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 20. Dezember 2013, 10:08:04 schrieb Iwo Mergler:
> > Let's start simple. Is your MTD driver sane?
> > UBI/UBIFS issues are often related to subtle NOR/NAND driver bugs.
> 
> Good point, thanks. The evidence suggests that it may not be.
> 
> So maybe I should extend the question - does anyone recall
> seeing arbitrary data offsets during NAND page writes?

If the driver is broken millions of things can get wrong.
Did you run MTD and UBI tests?

These tests often uncover issues within a MTD driver.

BTW: Is this a mainline driver?
Not that mainline drivers are better by definition, but still. ;-)

Thanks,
//richard
