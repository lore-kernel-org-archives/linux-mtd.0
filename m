Received: from mail.imc-berlin.de ([217.110.46.186] helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18L5Pv-0002Oq-00
	for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2002 17:40:35 +0000
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de [10.0.0.13])
	by mail.berlin.imc-berlin.de (8.12.3/8.12.3) with ESMTP id gB8GD7LT000845
	for <linux-mtd@lists.infradead.org>; Sun, 8 Dec 2002 17:13:07 +0100
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id TAA16393
	for <linux-mtd@lists.infradead.org>; Sun, 8 Dec 2002 19:11:10 +0100 (CET)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3DF38B3E.CD3CA322@imc-berlin.de>
Date: Sun, 08 Dec 2002 19:11:10 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problems with BIG_ENDIAN
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi there,

I am having trouble creating a big endian image with the latest CVS version of
mkfs.jffs2!

> mkfs.jffs2 -d /tmp/initrd.tmp.5530 -o images/pFlashdisk -l -p
> hexdump -n 16 -x images/pFlashdisk 
0000000    1985    2003    000c    0000    b0b1    e41e    1985    e001

> mkfs.jffs2 -d /tmp/initrd.tmp.5530 -o images/pFlashdisk -b -p
> hexdump -n 16 -x images/pFlashdisk 
0000000    1985    2003    000c    0000    b0b1    e41e    1985    e001

Both options -l _and_ -b result in the same byteorder!!!

An older version (mkfs.jffs2 revision 1.28) shows

scholz@pinguin:~/Projekte/SELF> hexdump -n 16 -x images/pFlashdisk 
0000000    1985    e001    0032    0000    76f3    5037    0001    0000

for "-l" and 

scholz@pinguin:~/Projekte/SELF> hexdump -n 16 -x images/pFlashdisk 
0000000    8519    01e0    0000    3200    295a    e78c    0000    0100

when using "-b" !!!

Thanks,

Steven


BTW "mkfs.jffs2 -V" does _not_ work! "mkfs.jffs2 --version" works!
