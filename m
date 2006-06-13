Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fq9TN-0003Ze-4l
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 10:02:57 -0400
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=[192.168.100.131])
	by postikukk.artecdesign.ee with esmtp (Exim 4.50)
	id 1Fq9TN-0000E4-Nn
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 17:02:30 +0300
Message-ID: <448EC58D.8010608@artecdesign.ee>
Date: Tue, 13 Jun 2006 17:02:53 +0300
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: cat file > /dev/mtd0 works but after position 512
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I have Samsung 64 MB NAND behind cs553x flash controller - therefore 
cs553x_nand driver.
cat file > /dev/mtd0 works reportedly (with page aligned file). But 
after board reboots the flash is empty.

dd ... bs=512 seek=1 of=/dev/mtd0  works and content stays in flash 
after reboot too (it works I mean :) )

I am debugging my own changes in cs553x_nand driver so it is up to me of 
course. But can this behavior be explained in other way than nand driver 
bug? Broken BIOS/board?

best regards,
Indrek
