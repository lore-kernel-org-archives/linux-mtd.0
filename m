Received: from auriga.auriga.ru ([80.240.102.100])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19oiKY-0005hR-Bt
	for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2003 12:37:46 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 18 Aug 2003 15:36:56 +0400
Message-ID: <5B439D84E6653F4AA2E14A5D8898A7E1656493@auriga.auriga.ru>
From: "Eugeny Mints" <eugeny.mints@auriga.ru>
To: <samoutin@hotbox.ru>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alex, all,

>Alex Samoutin samoutin at hotbox.ru=20
>Wed Jul 2 11:43:11 BST 2003=20

>Previous message: 2nd try: [PATCH] jffs2 on DOC=20
>Next message: Fw: corrupt my NAND flash device=20
>Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]=20

>Hi Thomas,
>Sorry for big delay with answer - I had no hardware to test. Now I got
my
>CerfCube 405ep back and can play with it.
>So I had two problems

>  1.. Write verify sometimes fail
>  2.. Write operation during erase sometimes cause data corruption

Could you please describe you test which detects the first problem? I
have the same, but it arises very seldom and unstable. I'd like to be
able to reproduce the bug predictably.=20

>Hardware details :
>- NAND chip Toshiba TC58256AFT
>- ALE/CLE and CE connected to GPIO
>- R/B pin connected to GPIO and I use ready function which reads it
pin.
>- I played with different timings - even slowest setting gets  me the
same
>result

>1-st problem was solved by applying new MTD snapshot  (Jun 26). It's
look
>like nand_deselect(); nand_select() fixes the problem.

It is interesting - this fix doesn't help me:( (I have MIPS Au1100 and
Toshiba TC58256AFTI )=20
More over, I discovered that fix proposed by David in the latests
(august) snapshots (reset before write command) hangs my system during
eraseall:(


>However  after applying new MTD release the 2-nd problem still
remained.
>Then I comment out erase abort in nand_get_chip (as you suggested) and
it
>fixes my second problem!
>Could you remove this erase abort from MTD source? I think it will not
>affect much on efficiency.

My second problem is that system hangs if the device is filled once and
an attempt to re-use previously used sectors is made. Comment out erase
abort in nand_get_chip fixes my second problem too.

Regards,
		Eugeny
