Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Xlms-0003XU-Ph
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2003 18:52:58 +0100
Date: Wed, 2 Jul 2003 18:53:06 +0100
Mime-Version: 1.0 (Apple Message framework v552)
To: "Alex Samoutin" <samoutin@hotbox.ru>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <000e01c340c1$73ca2800$1a00a8c0@itc.intrinsyc.com>
Message-Id: <092C59AE-ACB6-11D7-81FB-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
cc: tglx@linutronix.de
cc: linux-mtd@lists.infradead.org
cc: Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wednesday, Jul 2, 2003, at 18:43 Europe/London, Alex Samoutin wrote:
> Sorry for big delay with answer =96 I had no hardware to test. Now I =
got=20
> my
> CerfCube 405ep back and can play with it.
>
> - NAND chip Toshiba TC58256AFT
>

The timings for the 405 EBIU bus do not match the required timings for
the Toshiba chip's read cycle.  There is no good solution to this=20
problem.

We ended up putting the !RE pin onto a GPIO, but this caused (huge)
problems with interrupts and so forth.

-Jas.
