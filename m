Received: from mail22.messagelabs.com ([62.231.131.211])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A4HpV-0006Sn-8M
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 11:34:05 +0100
Received: from stevejunior (unknown [192.168.200.17])
	by netstar.stirling-dynamics.com (Postfix) with SMTP id 3D8789803
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Sep 2003 11:30:59 +0100 (BST)
Message-ID: <003b01c3873e$03131450$11c8a8c0@stevejunior>
From: "Stephen Brown" <sbrown@stirling-dynamics.com>
To: <linux-mtd@lists.infradead.org>
References: <1064826976.29857.116.camel@host35>
Date: Tue, 30 Sep 2003 11:31:29 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: raw nand on x86 - reference boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I use the p5e core module by AMPro , it is pc104 SBC and has an 8MB DOC,
only problem I would say is that they copy EEPROM bios into the boot sector,
so if your thinking about creating a boot loader might be difficult, the way
I make it work is by loading from DOS using Loadlin then after talking to
David managed to get the DOC mounted as a DOS partition , this was fine for
what I needed it to do, any specs or other information you need let me know,
if thats what your after of course.

nice to see David Woodhouse got a mention in a new book I have recently
purchased :D,

'Building Embedded Linux Systems' by Karim Yaghmour

kind regards

stephen
----- Original Message -----
From: "Daniel Toussaint" <daniel@dmhome.net>
To: <linux-mtd@lists.infradead.org>
Sent: Monday, September 29, 2003 10:16 AM
Subject: raw nand on x86 - reference boards


> Hi,
>
> Does anyone know where I can find an x86 based sbc with nand chips on
> board(NOT implemented as ide flash disk) OR maybe an ISA/pci add-on card
> of some sort ? I need it to do a proof of concept , write some drivers
> and a bootloader (x86 legacy bios extension)  ....
>
> Thanks,
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ________________________________________________________________________
> This e-mail has been scanned for all viruses by Star Internet. The
> service is powered by MessageLabs. For more information on a proactive
> anti-virus service working around the clock, around the globe, visit:
> http://www.star.net.uk
> ________________________________________________________________________
>


________________________________________________________________________
This e-mail has been scanned for all viruses by Star Internet. The
service is powered by MessageLabs. For more information on a proactive
anti-virus service working around the clock, around the globe, visit:
http://www.star.net.uk
________________________________________________________________________
