Date: Thu, 24 Apr 2008 15:34:24 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
In-Reply-To: <4809F7EC.9010808@users.sourceforge.net>
Message-ID: <Pine.LNX.4.64.0804241524310.16953@pentafluge.infradead.org>
References: <4807B552.7090501@users.sourceforge.net>
	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>
	<20080418163536.GD31520@shareable.org>
	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>
	<48091C7A.1070709@users.sourceforge.net>
	<012501c8a1fe$4a5308e0$def91aa0$@Tjernlund@transmode.se>
	<4809F7EC.9010808@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anders,

Could you please try this patch on your platform. 
It should solve the issue. 
As I said before we also have a case which reproduces the issue.
After applying it the issue is not seen on test items which usually
fails. (However to prove that it is Ok
we need to execute whole bunch. It will be completed on next day)

diff -aurp linux-2.6.24-a/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.6.24-b/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.24-a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-02-11 08:51:11.000000000 +0300
+++ linux-2.6.24-b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-04-24 18:13:00.000000000 +0400
@@ -874,6 +874,10 @@ static void put_chip(struct map_info *ma
 		   do. */
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		/* According to recomendations from h/w experts adding wait  
+		   of 100us just after resume solves the erase suspend issues   
+		   seen on some NOR parts. */
+		udelay(100);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;


Thanks,
Alexey
