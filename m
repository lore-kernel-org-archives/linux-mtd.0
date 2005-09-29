Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EL0zZ-0002xZ-M9
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 12:10:46 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <433BBB19.9060905@yandex.ru>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu>  <433BBB19.9060905@yandex.ru>
Content-Type: text/plain
Date: Thu, 29 Sep 2005 10:10:37 -0600
Message-Id: <1128010237.6926.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-29 at 13:59 +0400, Artem B. Bityutskiy wrote:
> Nevertheless, I don't believe CS will make JFFS2 usable on 256MB 
> flashes, due to memory consumprion issues. Nor it will not (IMO) make it 
> scalable, which is sad :-(

CS does, in fact, go a long way toward making 256MB flash parts usable.
The devices I am building use 256MB, 512MB, and 1024MB nand flash parts.
We have been using Ferenc's CS patch for some time now and we are able
to get sub 1 second mount times on 512+ MB filesystems. A big part of
this performance is that I have a nand flash controller that interfaces
with the nand part on my board. But nonetheless, jffs2 can be used
successfully on very large nand parts. Ferenc's EBS and CS work are
essential, IMHO, for getting there.

Pete
