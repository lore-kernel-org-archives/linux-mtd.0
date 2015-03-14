Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWjN2-0007po-4h
 for linux-mtd@lists.infradead.org; Sat, 14 Mar 2015 10:32:41 +0000
Date: Sat, 14 Mar 2015 11:32:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
Message-ID: <20150314113214.58d06f3d@bbrezillon>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973DF0B@NTXBOIMBX03.micron.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com>
 <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com>
 <55000637.1030702@nod.at> <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
 <55007B79.2090705@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
 <55016A43.3000201@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
 <20150313213134.1b53430b@bbrezillon>
 <0D23F1ECC880A74392D56535BCADD7354973DF0B@NTXBOIMBX03.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jeff,

On Fri, 13 Mar 2015 23:51:53 +0000
"Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com> wrote:
> 
> Hello Jeff,
> 
> I'm joining the discussion to ask more questions about MLC NANDs ;-).
> 
> Could you tell us more about how block wear impact the voltage level stored in NAND cells.
> 
> 1/ Are all pages in a block impacted the same way ?
> 	Yes, because of block erase, P/E cycles affect all the pages in a block.

Okay, that's what I thought.

> 2/ Is wear more likely to induce voltage increase, voltage decrease
>    or is it unpredictable ?   Wear is a very well known a NAND characteristic.   During P/E cycling there is a potential for electrons to get permanently trapped in the oxide.  The more P/E cycles the more electrons get trapped.  Over many P/E cycles cells well get to a point where they look permanent programmed and can't be erased or programmed.  As cells begin to fail, ECC can be used to recover the data.  If too many bits fail in page the device will respond with a FAIL status after a P/E cycle.

So voltage thresholds tends to increase with wear, right ?

> 	
> 3/ Is it possible to have more than one working voltage threshold
>    (read-retry mode): I did some testing on my Hynix chip (I know you
>    work for Micron but that's the only MLC chip I have :-)), and I
>    managed to get less bitflips by trying another read-retry mode even
>    if the previous one was allowing me to successfully fix existing
>    bitflips.
> Read Retry is available on some newer  products.  RR was introduced to help maintain and improve data retention and P/E cycles as geometry shrinks and bit/cell increase.  If the device supports RR, we have predefined RR Options, based on the most  likely chance of success.  Start with option 1 and step through the options until you get a successful read.  The DS usually has pretty good information.

When you say you have "predefined RR Options, based on the most  likely
chance of success", does this mean these options are internally
evolving during the NAND block lifetime, or is RR mode 0 always
encoding the same threshold config.
In the latter case, maybe we should start with a different RR mode
depending on the number of P/E cycles already done on the block, so
that we have more chance to successfully read the page on our first
read.

 

> 
> 4/ Do you have any numbers/statistics that could
>    help us choose the more appropriate read-retry mode according to the
>    number of P/E cycles ?  I don't have numbers or statistics, but I can tell you that the RR steps are generally defined based on known NAND behavior.  Go to the Micron website and put in this PN MT29F128G08CBCCB and you will find good information on RR.

Okay, I'll have a look at the datasheet you pointed out (the Hynix one
was not even talking about read-retry, I had to search in Allwinner
code to understand how to change read-retry mode).

>    
> 5/ Any other things you'd like to share regarding read-retry ? 
> RR isn't available on all devices.   From your prospective I would give them the option to use RR if it's available.

Yes, that's already done this way: we use RR on devices providing
this feature. IIRC, only Micron chips are supported so far, but I
added support for one of the Hynix chip.
The whole problem here is that each vendor implement RR in their own
way (using ONFI params for Micron, OTP area and private commands for
Hynix, and probably something else for Samsung chips).

Anyway, that's just a matter of adding a NAND chip database + vendor
specific code to deal with each read retry implementation (even if
that would have helped us a lot if chip vendors had agreed on a
standard way to control RR).

> 
> Apart from that, we're currently trying to find the most appropriate way to deal with paired pages, and this sounds rather complicated.
> The current idea is to expose paired pages information up to the UBIFS layer, and let UBIFS decide when it should stop writing on pages paired with already written pages.
> Moreover, we have a few pages we need to protect (UBI metadata: EC and VID headers) in order to keep UBI/UBIFS consistent.
> Do you have anything to share on this topic (ideas, solutions we should consider, constraints we're not aware of, ...)
> 
> This is one of the reasons I came to this site.  I have a great deal of device knowledge and I need to know more about how end users use the device.  
> 
> Most designs today employ power loss detection and employ elegant shutdown to the NAND.  In addition, we provide Write Protect, which provides an extra layer of protection against power loss.  There is still a chance that if the power event happens during a program to a page, the previously programmed shared page can also be corrupted.  It's not clear to me how to keep track of shared pages for every device out there.  It's not like a parameter page that you can read.  It's an interesting problem.

Of course, preventing page corruption is a good approach, but some
board designers are just simply not taking these constraints into
account, and detecting power loss in order to assert the WP pin is not
possible in such designs.

I think we should also find a solution to recover from corruptions
induced by paired pages write, and that's the direction we're currently
investigating.

But if someone have real examples (boards) supporting power loss
detection + WP pin control in such cases, maybe we can start thinking
about a standard way to deal with that in Linux.

Thanks again for your answers.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
