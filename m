Received: from mail1.bemta12.messagelabs.com ([216.82.251.2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZpbR-0001QX-6C
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2015 23:48:21 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Mon, 23 Mar 2015 10:45:33 +1100
Subject: RE: RFC: detect and manage power cut on MLC NAND
Message-ID: <EACD232272DA4849B060F0828564D13B57804E26D9@ntcex01.corp.netcomm.com.au>
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

> I've read many times that MLC pages should be programmed in ascending
> order (0, 1, 2, 3, ..., N), and if you take a look at MLC datasheet
> you'll see that paired pages are not contiguous (here is an example
> [1], page 55-56 describe how pages are paired together).
>=20
> My question is: is there a reason for interleaving paired pages with
> other pages (write disturbance mitigation ?) ?
>=20
> If there is no specific reason but to annoy software developers :-),


I don't know for sure, but it seems that groups of pages are sharing
some resources. For instance, I've seen a few bit error patterns which
looked like this (256MB SLC, pages in one block):

-------------------------------X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X

The pages marked with 'X' have a single bit error at the same bit
offset in every page.

That is, even on a SLC device, there is some sort of page interleaving
pattern at work. In this case, maybe they share a broken sense amplifier
or similar.

I currently think that the rule about the ascending order is a
generalisation for unknown NAND architecture. In my example, it
may well be slightly better to write (0,2,4,6,8,10,12,14,1,3,5,
7,9,11,13,15,16,18,20,22,24,26,28,30,17,19,21,23,25,27,29,31).

Unless someone tells me otherwise, I guess that the paired pages
probably should be written in sequence anyway (0,4,1,5,etc).
Some of the backup methods appear suggestive of this.


Best regards,

Iwo
