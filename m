Received: from krynn.se.axis.com ([193.13.178.10])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CIQbp-0008Fo-Uf
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2004 07:50:59 -0400
From: "Mikael Starvik" <mikael.starvik@axis.com>
To: <tglx@linutronix.de>, "Mikael Starvik" <mikael.starvik@axis.com>
Date: Fri, 15 Oct 2004 13:50:55 +0200
Message-ID: <BFECAF9E178F144FAEF2BF4CE739C66818F58F@exmail1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BFECAF9E178F144FAEF2BF4CE739C668018E2C8E@exmail1.se.axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: NAND programming bug in Linux 2.6.8?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>1. As we do only full page reads, this will never happen. The READ1 =
code
>could go away complete.

Hmm. I could swear that I have seen it at least once since my NAND model
complained about it but now I can't repeat it.

>2. If you want to read the second half of the page, then it's =
completely
>correct to issue the READ1 command, because the column address is
>shifted right by 1 later. The READ1 command selects the second half of
>the page whether the chip is in 8 or in 16 bit mode.

Ok, good! My Samsung datasheet (K9F2816U0C) is very vague on this point. =
In
the programming examples for the 16 bit device only READ0 and READ_OOB =
is
mentioned (while for the 8-bits device READ1 is also mentioned).

You clarification make my patch pointless, so just ignore it and I =
update my
NAND flash model instead.

Thanks!
/Mikael
