Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb3Zz-0000Xw-WA
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 08:55:57 +0000
Date: Thu, 26 Mar 2015 09:55:29 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7356B6CA7ED@NTXBOIMBX03.micron.com>
Message-ID: <alpine.DEB.2.02.1503260954140.13892@lnxricardw1.se.axis.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com>, <55000637.1030702@nod.at>
 <EACD232272DA4849B060F0828564D13B57804E2730@ntcex01.corp.netcomm.com.au>,
 <0D23F1ECC880A74392D56535BCADD7356B6C8603@NTXBOIMBX03.micron.com>
 <EACD232272DA4849B060F0828564D13B6EB7D55E72@ntcex01.corp.netcomm.com.au>,
 <0D23F1ECC880A74392D56535BCADD7356B6C89FA@NTXBOIMBX03.micron.com>
 <EACD232272DA4849B060F0828564D13B6EB7D55E7E@ntcex01.corp.netcomm.com.au>
 <alpine.DEB.2.02.1503250918420.13892@lnxricardw1.se.axis.com>
 <0D23F1ECC880A74392D56535BCADD7356B6CA7ED@NTXBOIMBX03.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 =?ISO-2022-JP?Q?Qi_Wang_=1B$B2&5=2F=1B=28J_=28qiwang=29?=
 <qiwang@micron.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Andrea Scian <rnd4@dave-tech.it>,
 =?ISO-8859-15?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 26 Mar 2015, Jeff Lauruhn (jlauruhn) wrote:

> Let me explain the read process a bit.  When we program and erase too, 
> we set a target value L0 and L1 in the case of SLC and we get a 
> ...
> registers a 0 for that cell.  The sense circuit is very simple because 
> there needs to be 2K of them so we can sense the whole page 
> simultaneously.  The type of circuitry required to measure an analog 
> value would make the die huge.  If it was possible, it would already be 
> designed in.

> Instead of measuring the cell voltage, it was easier to allow the end 
> user to move Vread to maybe compensate for the shift in distribution.

Makes perfect sense. Thanks for the response!

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
