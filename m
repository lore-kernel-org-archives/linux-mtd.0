Received: from maynard.mail.mindspring.net ([207.69.200.243])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ADrKa-0004eF-CE
	for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2003 20:17:44 +0000
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: "Karoliya, Abhishek" <Abhishek.Karoliya@fci.com>,
	<linux-mtd@lists.infradead.org>
Date: Sun, 26 Oct 2003 15:17:35 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGGEICEBAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <903E17B6FF22A24C96B4E28C2C0214D7012BB2D8@sr-bng-exc01.int.tsbu.net>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: RE: Intel K3 Flash + MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

That sounds like the status bit that you are reading back.
Most flashes give back status after you issue them commands
(like all of your unlocks, for instance).  Usually you put them 
back into "read mode" by writing a particular byte to them
after reading the status.  Try writing an FF to the flash.
Check your flash chip's datasheet for the exact sequence that
you must use to put it back in read mode.

Chuck Meade

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Karoliya,
> Abhishek
> Sent: Sunday, October 26, 2003 3:01 PM
> To: 'linux-mtd@lists.infradead.org'
> Subject: Intel K3 Flash + MTD
> 
> 
> Hi All,
>   
>      I am using an Intel 128k3 flash chips {4 chips in total with each pair
> forming a 32MB capacity} on a PMC board having powerpc 7447 + marvel 64360
> combination . I running Linux from kernel.org 2.4.20 version.
>          I can erase and write to flash without any problems . But once
> written to flash when I reboot and  read back {using the mtd utils } it just
> returns 0x80 for all location. 
>    I am pretty sure that write is successful as I burn my image and ramdisk
> into the flash from Linux and can reboot the board using these flash
> contents. Also I have taken care that the flash is unlocked every time by
> writing the unlock pattern to the flash  through the init code in the mtd
> map file.
>    Is the cache playing some havoc??
> Please provide some pointers in the direction of resolution of this problem.
> 
> thanks a million
> Abhishek
> 
>  
> 
>    
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
