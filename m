Received: from mail1.bemta7.messagelabs.com ([216.82.254.108])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZrxb-0001NM-09
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2015 02:19:23 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Mon, 23 Mar 2015 13:18:52 +1100
Subject: RE: RFC: detect and manage power cut on MLC NAND
Message-ID: <EACD232272DA4849B060F0828564D13B57804E272F@ntcex01.corp.netcomm.com.au>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu>	<20150319101246.26806e95@bbrezillon>
 <EACD232272DA4849B060F0828564D13B57804E2680@ntcex01.corp.netcomm.com.au>,
 <20150320092611.2648f3d5@bbrezillon>
In-Reply-To: <20150320092611.2648f3d5@bbrezillon>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

On Fri, 20 Mar 2015 19:26:11 +1100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> You want to do that in order to avoid using 2 Jumbo pages to only
> store a few bytes ?

Yes. I'm already a little unhappy about using two whole pages
for UBI, and don't want to be guilty of doubling that.

> Artem suggested another solution to deal with that: duplicate the EC
> header in the VID header so that EC information can be recovered when
> writing to the page paired with the EC header.

Sounds good to me. It won't avoid the loss of the VID header,
but it will safeguard the EC. It's free, too.

> You'd still have to prevent any write on the page paired with the EC
> header, but you're still saving one page with this approach and avoid
> any corruption of UBI metadata caused by paired pages.

Ah, you probably meant VID header here, right?

> Maybe there are better solution, and I've been thinking about a
> different approach to avoid writing the EC and VID headers in 2
> different pages: store EC header information in a specific UBI volume
> (containing one or two LEBs).
> This volume would store a log of EC information update, so that when
> you erase a page you don't have to write the EC header right away, but
> should just add an entry in the UBI EC log.
> This way you write EC and VID information in one go when someone maps
> a LEB (attach it to a specific volume).

I like that. Maybe UBI could try grouping erases to reduce the
stress on the EC log - write the (future) ECs for a number of
PEBs to the log, then delete the PEBS at leisure, then mark
them as done in the log.

In fact, you could even go and pad the log pages with future
ECs for active PEBs, to be used in case they need erasing later.
Just never erase a PEB that doesn't have an EC log entry.

Would it be possible to push that further, and defer the writing
of the VID header until the first payload write is pending? Up to
that point, it shouldn't matter where the LEB is mapped.

I'm aware that UBIFS would have to cooperate here (first page is
64 bytes smaller), but VID and integrated EC could share the
page 0 with the first payload nodes of the LEB.


Best regards,

Iwo
