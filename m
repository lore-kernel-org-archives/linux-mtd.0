Received: from [211.199.110.133] (helo=impresstek.co.kr)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXUUw-000631-Fe
	for linux-mtd@lists.infradead.org; Sun, 15 May 2005 21:34:25 -0400
From: "Kim Moung-Soo" <mskim@impresstek.co.kr>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 16 May 2005 10:27:41 +0900
Message-ID: <04e801c559b6$742e79d0$180aa8c0@mskim>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: The romfs corruption problem after writing mtdblock!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using uClinux 2.4.22 on ARM board and have a problem with the romfs.
My machine has 4 partitions on the NOR flash memory like below.
mtdblock 1: boot loader
mtdblock 2: 2nd boot loader
mtdblock 3: kernel and root file system(romfs)
mtdblock 4: user data

Everything works fine until I write area of user data, mtdblock 4.
After I write something on mtdblock4, romfs on mtdblock 3 corrupts
sometimes.
The symptom is that some files have gone in the directory or content of
file is wrong.
Even it happens I think the data in flash memory is okay because after
it reboot every thing is in there.
I use open("/dev/mtdblock/4") and write() to access it directly.
Can I use open(), write() function to access mtdblock 4?
