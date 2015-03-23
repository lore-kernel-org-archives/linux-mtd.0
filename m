Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZwRs-0002Tb-6l
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2015 07:06:56 +0000
Message-ID: <1427094391.8234.101.camel@sauron.fi.intel.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Mon, 23 Mar 2015 09:06:31 +0200
In-Reply-To: <EACD232272DA4849B060F0828564D13B57804E272F@ntcex01.corp.netcomm.com.au>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu>	<20150319101246.26806e95@bbrezillon>
 <EACD232272DA4849B060F0828564D13B57804E2680@ntcex01.corp.netcomm.com.au>
 ,<20150320092611.2648f3d5@bbrezillon>
 <EACD232272DA4849B060F0828564D13B57804E272F@ntcex01.corp.netcomm.com.au>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, "Jeff Lauruhn
 \(jlauruhn\)" <jlauruhn@micron.com>, Richard Weinberger <richard@nod.at>,
 Andrea Scian <rnd4@dave-tech.it>,
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

On Mon, 2015-03-23 at 13:18 +1100, Iwo Mergler wrote:
> On Fri, 20 Mar 2015 19:26:11 +1100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > You want to do that in order to avoid using 2 Jumbo pages to only
> > store a few bytes ?
> 
> Yes. I'm already a little unhappy about using two whole pages
> for UBI, and don't want to be guilty of doubling that.
> 
> > Artem suggested another solution to deal with that: duplicate the EC
> > header in the VID header so that EC information can be recovered when
> > writing to the page paired with the EC header.
> 
> Sounds good to me. It won't avoid the loss of the VID header,
> but it will safeguard the EC. It's free, too.
> 
> > You'd still have to prevent any write on the page paired with the EC
> > header, but you're still saving one page with this approach and avoid
> > any corruption of UBI metadata caused by paired pages.
> 
> Ah, you probably meant VID header here, right?

If we sacrifice another page, we could store a copy of the VID header
there, in case the first copy gets corrupted. IOW, we'd have:

	ECH, VIDH#1, VIDH#2, User Data.
