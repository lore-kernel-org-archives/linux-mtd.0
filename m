Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYsGS-0007Bq-VY
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 08:26:47 +0000
Date: Fri, 20 Mar 2015 09:26:11 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
Message-ID: <20150320092611.2648f3d5@bbrezillon>
In-Reply-To: <EACD232272DA4849B060F0828564D13B57804E2680@ntcex01.corp.netcomm.com.au>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu> <20150319101246.26806e95@bbrezillon>
 <EACD232272DA4849B060F0828564D13B57804E2680@ntcex01.corp.netcomm.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Andrea Scian <rnd4@dave-tech.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Andrea Marson <andrea.marson@dave.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Iwo,

On Fri, 20 Mar 2015 11:25:18 +1100
Iwo Mergler <Iwo.Mergler@netcommwireless.com> wrote:

> 
> Hi all,
> 
> 
> I've been thinking a little about the paired pages problem.
> 
> The patented mitigation methods I've seen so far are
> 
> 1)  SanDisk: Use a separate log mechanism to back up LSB page
> while writing MSB page.
> 
> 2) M-Systems: Within the block, interleave backup copies of LSB
> pages when writing MSB pages.
> 
> 3) Micron: Use as a half-capacity SLC device by writing LSB and MSB
> pages such that the levels are reinforced. Jeff mentioned this one.

All these solutions involves storing a backup of the first paired page,
before writing the 2nd one (I guess that's even worse with TLC NANDs:
you'll have to save the 2nd page when writing the 3rd one).
If that's possible, I think we should find a way to avoid this
duplication.

> 
> 
> Here is another idea. I assume it's patented already, in which case
> I'd like to hear about it. If not, consider this published as of now :-)
> 
> 
> Get UBI to map the paired pages into a single write unit. Jumbo page
> if you will.  So, instead of a block with 64 pages, we get 32 pages,
> twice as large.
> 
> Thus, the paired pages will be written in quick succession. A power
> cut during this is reduced to the unstable bits issue we already have
> with SLC.

That's actually a good idea, but I'd like to have feedback from Jeff
and/or Qi regarding the feasibility of this proposal.
I've read many times that MLC pages should be programmed in ascending
order (0, 1, 2, 3, ..., N), and if you take a look at MLC datasheet
you'll see that paired pages are not contiguous (here is an example
[1], page 55-56 describe how pages are paired together).

My question is: is there a reason for interleaving paired pages with
other pages (write disturbance mitigation ?) ?

If there is no specific reason but to annoy software developers :-),
then I think we should consider this Jumbo page approach, because it
would contain the paired pages handling in the NAND layer (instead of
exposing complexity to the UBI/UBIFS layers) while allowing us to use
almost all the NAND chip capacity.

> 
> UBI could take the risk and split the first page pair between EC and
> VID headers, replacing the EC info with average in case of unlikely
> failure.

You want to do that in order to avoid using 2 Jumbo pages to only store
a few bytes ?
Artem suggested another solution to deal with that: duplicate the EC
header in the VID header so that EC information can be recovered when
writing to the page paired with the EC header.
You'd still have to prevent any write on the page paired with the EC
header, but you're still saving one page with this approach and avoid
any corruption of UBI metadata caused by paired pages.

Maybe there are better solution, and I've been thinking about a
different approach to avoid writing the EC and VID headers in 2
different pages: store EC header information in a specific UBI volume
(containing one or two LEBs).
This volume would store a log of EC information update, so that when
you erase a page you don't have to write the EC header right away, but
should just add an entry in the UBI EC log.
This way you write EC and VID information in one go when someone maps a
LEB (attach it to a specific volume).

These are just thoughts ;-).

[1]http://www.szyuda88.com/uploadfile/cfile/2013419135343223.pdf
-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
