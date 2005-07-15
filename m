Received: from mx2.palmsource.com ([12.7.175.14])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtTP0-0007RK-1O
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 12:51:14 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Jul 2005 09:51:04 -0700
Message-ID: <DE88BDF02F4319469812588C7950A97E931034@ussunex1.palmsource.com>
From: "Martin Fouts" <Martin.Fouts@palmsource.com>
To: "Todd Poynor" <tpoynor@mvista.com>, <tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: NAND bbt build reads wrong oob data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Todd Poynor
Sent: Friday, July 15, 2005 12:59 AM
To: tglx@linutronix.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND bbt build reads wrong oob data


> OK, this is pretty unexpected, so I'll try harder to figure out where
it goes wrong or whether=20
> I've got another board that it affects (a colleague reported some new
bad blocks messages after=20
> upgrading to the same software on a different board, will see if
there's a similar situation).

I can confirm that it happens on other boards. I have the same problem
with the same NAND chip on a P2 board.  I haven't had time to
investigate yet.

Marty
