Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G38OB-0004E3-Io
	for linux-mtd@lists.infradead.org; Wed, 19 Jul 2006 05:30:47 -0400
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=[192.168.100.183])
	by postikukk.artecdesign.ee with esmtp (Exim 4.50)
	id 1G38O7-0003ws-Fx
	for linux-mtd@lists.infradead.org; Wed, 19 Jul 2006 12:30:48 +0300
Message-ID: <44BDFCAE.80807@artecdesign.ee>
Date: Wed, 19 Jul 2006 12:34:38 +0300
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND behind INT13 BIOS interface
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

I have board with NAND and BIOS seems to have built-in driver for that. 
BIOS provides INT 13 interface for the NAND too.

Is there a solution to access such NAND (with the help of INT 13) as a 
usual block device from Linux?

Best regards,
Indrek
