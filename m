Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DzrST-00056K-QI
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2005 03:45:16 -0400
Date: Tue, 2 Aug 2005 09:44:26 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050802074422.GA3988@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: HowTo read product and vendor id from CFI?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi people!

Actuall I am fiddling in drivers/cfi_flash.c to find a convenient
function for the following purpose:

I wan't to read the product and vendor id of my falsh device to choose a
proper value for burst timings to be programmed in the later step into
the device. In the future at least two different types of devices will
be soldered onto the board (intel k3 or p30) and they need different
timings to get the best from their hardware capabilities.

The flash is located at 0x10000000 and the query looks like this:

10000020 : 51 00 52 00 59 00 01 00 00 00 31 00 00 00 00 00  Q.R.Y.....1.....
10000030 : 00 00 00 00 00 00 27 00 36 00 00 00 00 00 08 00  ......'.6.......
10000040 : 09 00 0a 00 00 00 01 00 01 00 02 00 00 00 18 00  ................
10000050 : 01 00 00 00 06 00 00 00 01 00 7f 00 00 00 00 00  ................
10000060 : 02 00 50 00 52 00 49 00 31 00 31 00 e6 00 01 00  ..P.R.I.1.1.....
10000070 : 00 00 00 00 01 00 07 00 00 00 33 00 00 00 02 00  ..........3.....
10000080 : 80 00 00 00 03 00 03 00 89 00 00 00 00 00 00 00  ................
10000090 : 00 00 00 00 00 00 10 00 00 00 04 00 04 00 02 00  ................

The vendor (0x0089) and device (0x8802) id is located just before at 0x0
and the next word:

10000000 : 89 00 02 88 00 00 00 00 89 00 c3 a3 00 00 00 00  ................
10000010 : 89 00 02 88 00 00 00 00 89 00 c3 a3 00 00 00 00  ................
10000020 : 51 00 52 00 59 00 01 00 00 00 31 00 00 00 00 00  Q.R.Y.....1.....

Now i am looking for a function reading these, flash_isequal seems to
take an argument to short for my purposes:

if (flash_isequal (info, 0, 0x0, 0x89)) printf("0x0089\n");
if (flash_isequal (info, 0, 0x1, 0x8802)) printf("0x8802\n");

gives

is= cmd 89() addr 10000000 is= 0089 0089
0x0089                                  
is= cmd 2() addr 10000002 is= 8802 0002

Is there a more convenient function I overlooked or do I have to
create a new one for this purpose?
If the latter, where and how do I start to create such a function?
I am new to this part of u-boot, moved from the board/scb9328/flash.c to
the common cfi driver but now I am stuck...

Kind Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
