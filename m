Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaIuN-0008IC-PJ
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2015 07:05:52 +0000
Message-ID: <1427180716.8234.136.camel@sauron.fi.intel.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Tue, 24 Mar 2015 09:05:16 +0200
In-Reply-To: <20150323200511.545210ad@bbrezillon>
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
 <20150323200511.545210ad@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Mon, 2015-03-23 at 20:05 +0100, Boris Brezillon wrote:
> > If we sacrifice another page, we could store a copy of the VID header
> > there, in case the first copy gets corrupted. IOW, we'd have:
> > 
> > 	ECH, VIDH#1, VIDH#2, User Data.
> 
> What do you mean by 'sacrificing another page', are you talking about
> the one paired with the VID header page ?
> If that's the case, then we cannot write anything on it (even a VID
> header backup), because if the PROGRAM operation is interrupted both
> pages (VIDH#1 and #2) could be corrupted.

Just this:

Page 0: ECH
Page 1: VIDH#1 (+all the ECH data)
Page 2: VIDH#2 (same as VIDH#1)

VIDH#1 and #2 are not in paired pages, so I expect one of them to always
be good.

If pages 0,1;2,3;4,5;etc are paired, we may lose ECH sometimes, should
not be catastrophic. I wonder though, if this pairing scheme is
realistic?

In case of a larger pairing step we seem to be always OK and will always
have a valid ECH and VIDH.

Do I miss something?
