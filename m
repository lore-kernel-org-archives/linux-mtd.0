Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zkiH-00088l-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 20:42:34 +0100
Message-ID: <30724FF712DFD2119E6200104B24489201197496@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'Alexander Melichenko ' <AlexanderM@lrpeople.com>
Cc: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>,
	"'s_krishna@in.ibm.com '" <s_krishna@in.ibm.com>
Subject: RE: SC520 CDP - problem with booting from BIOS Flash
Date: Tue, 15 May 2001 14:37:14 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Sorry for the delayed response. Here are some more things you can try:

1. What are the LED's showing. two of them should say b7 (or something like
that). None of them should say FF.

2. Are you watching the serial console? Is it configured?

3. How will you know when your kernel boots?

Also, I rather than clutter up the list re. non mtd/JFFS issues (as your mtd
and jffs seems to be working), I will send you a personal mail to help you
further.

Thanks

Vipin
 

-----Original Message-----
From: Alexander Melichenko
To: Vipin Malik
Cc: linux-mtd@lists.infradead.org; s_krishna@in.ibm.com
Sent: 5/15/01 9:33 AM
Subject: SC520 CDP - problem with booting from BIOS Flash

Hello, Vipin!
I work with AMD SC520 CDP. I use file sc520cdp.c from CVS (written by
Robert
Kaiser). It works good when Linux boots from HDD or FDD. I can
read/write
into mtd0,... device or work with JFFS placed into mtdblock device.
My root FS (JFFS) is placed into mtdblock0. Now I would like to place
kernel
into BIOS-flash (29F040). I followed instructions, written by You.  But
I
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
