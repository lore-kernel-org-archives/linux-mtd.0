Received: from web32801.mail.mud.yahoo.com ([68.142.206.31])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J7k46-0005gb-Tm
	for linux-mtd@lists.infradead.org; Thu, 27 Dec 2007 04:09:58 +0000
Date: Wed, 26 Dec 2007 20:09:40 -0800 (PST)
From: Naveen Sattigeri <naveen_j_s@yahoo.com>
Subject: Mount MTD device on host PC
To: Linux-MTD Linux <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <876668.82641.qm@web32801.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sir/Madam,

I'm facing some problem while trying to mount a
compact flash as a MTD device on my host/development
PC. I would be glad if anyone could help.

The setup which I'm using in the lab is as follows:
[1]. Host PC with RedHat 9.0 and MontaVista 4.0.
[2]. Target Compact Flash is Pretec make (128MB). 

What I want to achieve:
[1]. When I connect the target flash to the host PC
(to the IDE Slot), I want the target flash to be
detected by the host PC as a MTD device, so that I can
mount a JFFS2/EXT3 filesystem in it.
 
What I have done so far to achieve this:
[1]. I have built/compiled a customised kernel in the
Host PC.
[2]. MTD support has been enabled in the Host PC
(using command menuconfig).

My observations so far:
[1]. When the target flash is connected to the Host
PC, the Host PC detects it as a "hdd" device and not a
"mtd" device.

My Query:
[1]. What steps do I need to perform to ensure that
the Host PC detects the target flash as a MTD device,
when connected to it over IDE Slot (using FRC cable).

Regards,

Naveen Sattigeri.
Design Engineer,
Automation Campus,
Larsen & Toubro Ltd,
Mahape, 
Navi Mumbai - 400710.
Ph: 022-67226479


      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
