Received: from wip-cdctls-mx1.wipro.com ([203.91.201.15])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eoh5l-0008J5-Kt
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2005 12:59:47 +0000
Received: from wip-cdctls-mx1.wipro.com (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with ESMTP id 443983C41BA
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Dec 2005 18:25:09 +0530 (IST)
Received: from chn-snr-bh1.wipro.com (chn-snr-bh1.wipro.com [10.145.50.91])
	by wip-cdctls-mx1.wipro.com (Postfix) with ESMTP id 38CE83C4020
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Dec 2005 18:25:09 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Dec 2005 18:29:30 +0530
Message-ID: <5DE86B4C624D4545B8A5CA1467DB9364010F98F9@PNE-HJN-MBX01.wipro.com>
From: <vinay.patel@wipro.com>
To: <linux-mtd@lists.infradead.org>
Subject: MTD driver for flash interface unit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
I have a requirement where Flash interface unit (FTU) is used to
interface with different types of flash devices (NOR/NAND).=0D
FIU can support a toggle sequence of up to some max toggle commands.
After a sequence of toggle commands are loaded, a trigger command is
used to initiate the toggle sequence. One 16-bit register is used to
store the results if a read command is issued. Note that writes are
always in 16 bits. If flash memory is 8 bits wide, then top 8 bits are
ignored.
Lets say that FTU is connected to one Samsung NAND flash, one Toshiba
NOR flash and one Atmel EEPROM. FTU has a adjustable opening of system
address space which can be mapped to any physical pages in flash or
EEPROM memory.
Can MTD frame work be used to support Flash interface unit driver? If
yes, then what all components needs to be developed and under which
folder.
=0D
Thanks,
Vinay


The information contained in this electronic message and any attachments to=
 this message are intended for the exclusive use of the addressee(s) and=
 may contain proprietary, confidential or privileged information. If you=
 are not the intended recipient, you should not disseminate, distribute or=
 copy this e-mail. Please notify the sender immediately and destroy all=
 copies of this message and any attachments.=0D

WARNING: Computer viruses can be transmitted via email. The recipient=
 should check this email and any attachments for the presence of viruses.=
 The company accepts no liability for any damage caused by any virus=
 transmitted by this email.
=0D
www.wipro.com
