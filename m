Received: from host28.istor.com ([66.134.214.28]
	helo=mail1irv.inside.istor.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Atwb4-0004iA-Nq
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 22:24:42 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Feb 2004 14:23:12 -0800
Message-ID: <7D036BD3216A084DB1BD9D62BCEAF29049A3C7@mail1irv.inside.istor.com>
From: "Chris Carlson" <ccarlson@istor.com>
To: <linux-mtd@lists.infradead.org>
Subject: Old version of Linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for the long e-mail.  I'm hoping to minimize going back and forth
explaining why I'm asking what I'm asking.

My company is developing an embedded iSCSI device using Linux as one of
the core operating systems.  We are not a rich company and thus we
purchased MontaVista Linux a year or so ago and did not renew the
license.  The kernel version MontaVista provided was 2.4.17.

We have now reached the point where we need to put a file system on our
Toshiba TC58256AFT NAND flash.  The theory was that we'd update the
drivers from your group, bring up Linux and Voila!  Too bad they didn't
talk to me back when they made this decision.

Anyway, enough with the history.  I'm now stuck with getting the NAND
flash working.  Based on the errors I got when compiling the new drivers
and the responses you've given to others who had the same problems, your
solution is to upgrade the kernel to something newer.

The problem with this solution is:
  1 - We have to figure out how to merge all the enhancements MontaVista
put in.
  2 - We have to probably rebuild all of the Unix utilities and
libraries.
  3 - We have to port all of our internally written drivers to support
the new release.

My concern is that the above will be months of work (since I have to do
it by myself).

The other solution is to see if I can port your latest drivers to the
old Linux.

My question is: Is porting your latest drivers to the old Linux
something that is essentially impossible?  If not, are there any
gotcha's I should be aware of?

Thanks for your time and understanding.


Chris Carlson
iStor Networks, Inc.
