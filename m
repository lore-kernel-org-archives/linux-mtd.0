Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVze1-0006RJ-0e
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 09:43:10 +0000
Date: Thu, 12 Mar 2015 10:32:14 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
Message-ID: <alpine.DEB.2.02.1503121023371.7125@lnxricardw1.se.axis.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com> <55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 11 Mar 2015, Jeff Lauruhn (jlauruhn) wrote:

> IIUC can I summarize like the following
> 
> 1) power cut is one of the big problem we know about MLC NAND flash with UBI
> 2) we are unaware of other big issue with MLC NAND
> 
> Unfortunately I don't really know the MTD/UBI/UBIFS internals but 
> (correct me if I'm wrong) to me solving the power cut issue only by 
> software (by using proper data structure, redundancy, NAND flash 
> operation jornal and so on) is pretty hard to implement inside the Linux 
> MTD stack.
> 
> On the other hand, stuff like scrubbing (e.g. having a task like GC that 
> periodically scrub the required NAND erase block), paired page (e.g. 
> carefully selecting LEB to PEB mapping to avoid reading/writing data 
> into paired page in a wrong way) are still to be implemented but have, 
> somehow, less impact on the whole MTD stack.

I may be going off in the wrong direction, but there seem to be two 
principal differences between SLC and MLC nand from a software point of 
view.

1. Write endurance is much lower, like 3000 erase/write cycles for MLC
   compared to 100000 for SLC.
2. The probability of bits changing 'under your feet' are much higher,
   being it because of the data retention simply being worse due to the
   underlying technology or because of page pairing.
   - This also includes bits that look ok but which aren't e.g. from the
     result of power loss during an erase operation, which might leave
     the bits in a state which looks erased, but which on subsequent use
     will not behave accordingly.

Generally, the basic view of any memory from a software point of view is 
that if 'the data was written it will not change', which is true a lot of 
the time with SLC, given a couple of precautions (like ECC and never 
trusting an erased page unless we know the erase operation had completed 
properly), but much less so with MLC. I.e. with SLC, we can take our 'the 
data will not change' paradigm and patch on a few fixes for the relatively 
few cases where this is not true, but with MLC this will approach will 
tend to fall apart and we must rethink our approach if not from the bottom 
then a bit further down than was the case with SLC.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
