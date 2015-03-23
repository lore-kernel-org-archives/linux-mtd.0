Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya7fo-0002ne-6c
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2015 19:06:05 +0000
Date: Mon, 23 Mar 2015 20:05:11 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: dedekind1@gmail.com
Subject: Re: RFC: detect and manage power cut on MLC NAND
Message-ID: <20150323200511.545210ad@bbrezillon>
In-Reply-To: <1427094391.8234.101.camel@sauron.fi.intel.com>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu> <20150319101246.26806e95@bbrezillon>
 <EACD232272DA4849B060F0828564D13B57804E2680@ntcex01.corp.netcomm.com.au>
 <20150320092611.2648f3d5@bbrezillon>
 <EACD232272DA4849B060F0828564D13B57804E272F@ntcex01.corp.netcomm.com.au>
 <1427094391.8234.101.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn
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

Hi Artem,

On Mon, 23 Mar 2015 09:06:31 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> > 
> > > You'd still have to prevent any write on the page paired with the EC
> > > header, but you're still saving one page with this approach and avoid
> > > any corruption of UBI metadata caused by paired pages.
> > 
> > Ah, you probably meant VID header here, right?
> 
> If we sacrifice another page, we could store a copy of the VID header
> there, in case the first copy gets corrupted. IOW, we'd have:
> 
> 	ECH, VIDH#1, VIDH#2, User Data.

What do you mean by 'sacrificing another page', are you talking about
the one paired with the VID header page ?
If that's the case, then we cannot write anything on it (even a VID
header backup), because if the PROGRAM operation is interrupted both
pages (VIDH#1 and #2) could be corrupted.

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
