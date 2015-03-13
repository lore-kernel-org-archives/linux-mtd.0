Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWWFd-0006l5-M1
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 20:32:10 +0000
Date: Fri, 13 Mar 2015 21:31:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
Message-ID: <20150313213134.1b53430b@bbrezillon>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 Andrea Scian <rnd4@dave-tech.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jeff,

I'm joining the discussion to ask more questions about MLC NANDs ;-).

Could you tell us more about how block wear impact the voltage level
stored in NAND cells.

1/ Are all pages in a block impacted the same way ?
2/ Is wear more likely to induce voltage increase, voltage decrease
   or is it unpredictable ?
3/ Is it possible to have more than one working voltage threshold
   (read-retry mode): I did some testing on my Hynix chip (I know you
   work for Micron but that's the only MLC chip I have :-)), and I
   managed to get less bitflips by trying another read-retry mode even
   if the previous one was allowing me to successfully fix existing
   bitflips.
4/ Do you have any numbers/statistics that could
   help us choose the more appropriate read-retry mode according to the
   number of P/E cycles ?
5/ Any other things you'd like to share regarding read-retry ?


Apart from that, we're currently trying to find the most appropriate
way to deal with paired pages, and this sounds rather complicated.
The current idea is to expose paired pages information up to the UBIFS
layer, and let UBIFS decide when it should stop writing on pages paired
with already written pages.
Moreover, we have a few pages we need to protect (UBI metadata: EC and
VID headers) in order to keep UBI/UBIFS consistent.
Do you have anything to share on this topic (ideas, solutions we should
consider, constraints we're not aware of, ...)


Thanks for your valuable information.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
