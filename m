Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVcaT-0004Ab-1v
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 09:06:13 +0000
Message-ID: <1426064733.1567.6.camel@sauron.fi.intel.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 11 Mar 2015 11:05:33 +0200
In-Reply-To: <5500037A.9010509@nod.at>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-03-11 at 09:57 +0100, Richard Weinberger wrote:
> Hi!
> 
> Am 11.03.2015 um 08:20 schrieb Artem Bityutskiy:
> > On Tue, 2015-03-10 at 13:51 +0100, Richard Weinberger wrote:
> >>> WDYT about this?
> >>> If it sounds reasonable is there any suggestion where to place such a code?
> >>
> >> Customers often use DYI uninterruptible power supplies using capacitors.
> >> But managing a power cut is the least problem you have with MLC NAND.
> > 
> > Why is it the least problem, what is the hardest one? I thought this one
> > is the hardest.
> 
> IMHO the hardest ones are the problems we don't know yet as NAND vendors
> are not really chatty about the MLC constraints.
> We don't know much about data retention for example. At least we have not
> much hard facts. Most of our knowledge is hearsay.

Well, but from the problems we know paired pages seems to be the biggest
one. E.g., what do we do if VID header gets corrupted because of an
interrupted write to the page paired with the VID header page? Sounds
like a hard problem to me.

As for other things, I am not sure. I remember back when I worked for
Nokia, vendors did tell us everything we needed to know about their
flash product.
