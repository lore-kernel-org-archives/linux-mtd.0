Received: from bay0-omc3-s13.bay0.hotmail.com ([65.54.246.213])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IVpFa-0003WH-Ta
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 10:01:04 -0400
Message-ID: <BLU116-W3877C7A20EC177A6825202F7C30@phx.gbl>
From: Ken Chan <ck00088@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: flash_eraseall -- JFFS2 -- NAND
Date: Thu, 13 Sep 2007 11:00:57 -0300
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello, I have a MICRON NAND Flash on my board. I am using 2.6.16 Kernel. I =
tried to do "flash_eraseall -j /dev/mtdblock8" to erase my NAND Flash. "fla=
sh_eraseall" put the cleanmarker to the NAND Flash. After it completed, I p=
ower cycle my target. In the "nand_scan" function, it kept reporting "Bad e=
raseblock" for the entire NAND Flash. Anyone knows where my problem is? I b=
elieve my low level read and write functions are working properly. Anyone c=
an provide me some hints? Thanks ken

_________________________________________________________________
News, entertainment and everything you care about at Live.com. Get it now!
http://www.live.com/getstarted.aspx=
