Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135Z4Z-0000FW-00
	for mtd-list@infradead.org; Fri, 23 Jun 2000 20:25:03 +0100
From: Patrick Higgins <phiggins@transzap.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Date: Fri, 23 Jun 2000 13:30:56 -0600 (MDT)
Subject: Re: Possible error in doc_write_ecc
In-Reply-To: <Pine.LNX.4.10.10006031335010.16978-100000@infradead.org>
Message-ID: <Pine.LNX.4.21.0006231320560.14889-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 3 Jun 2000, David Woodhouse wrote:

> > So far I've only be looking at syndrome output of reads, but I've started
> > to look into writes as well, and it looks like doc_write_ecc doesn't
> > parallel what's in the docs.  Perhaps there's a reason, but I thought I'd
> > point it out:
> 
> Look in the NFTL code. It's immediately followed by a doc_write_oob to
> write the syndromes which were calculated and put in the buffer.
> 
> I don't particularly like the abstraction between 'driver' and 'user' code
> there - offer me a cleaner one and I'll be happy.
> 
> --
> dwmw2

OK, I think I'm beginning to understand how things are laid out, but it's
pretty confusing without good reason.  By including ECC information into
struct mtd_info I assume you hoping that two different types of hardware
might use the same ECC scheme and we could write user modules to implement
the ECC without knowing the exact hardware in question.  I'm not an expert
in the area, but after having looked into the ECC field a bit, I don't
think this sort of thing will happen frequently, if ever.  Rather than
cluttering up the entire interface, it would probably be best to just have
hardware which has a common ECC mechanism work out sharing code on their
own.

Basically, higher levels would just call mtd_info.read() and accept the
results as valid, unless an error value is returned.  They really
shouldn't have to worry about what the hardware did or didn't do to try to
correct the error, but only with the results.

-Patrick


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
