Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zglf-0007sF-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 16:29:48 +0100
Message-ID: <003f01c0dd4c$11102e60$5502010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <linux-mtd@lists.infradead.org>,
	<s_krishna@in.ibm.com>
Subject: SC520 CDP - problem with booting from BIOS Flash
Date: Tue, 15 May 2001 18:33:48 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello, Vipin!
I work with AMD SC520 CDP. I use file sc520cdp.c from CVS (written by Robert
Kaiser). It works good when Linux boots from HDD or FDD. I can read/write
into mtd0,... device or work with JFFS placed into mtdblock device.
My root FS (JFFS) is placed into mtdblock0. Now I would like to place kernel
into BIOS-flash (29F040). I followed instructions, written by You.  But I
have some questions. My actions is :

I use lstart16.asm from AMD site with Your modifications.

BOOTCS - DIP
ROMCS1 - 8MHCS
ROMCS2 - 8MLCS

z
yi
nb0
ns lstart16.abs 7f800
ns zFlashImage 0 (zFlashImage is kernel with assigning root device
mtdblock0).
z
g

After reset I see changing some digits on the LEDs but kernel is not
booting.

Why kernel doesn't booting? This kernel boots good ( with root fs into
mtdblock0 ) when I use HDD.
Any ideas?

Thanks for any help.

Alexander Melichenko
