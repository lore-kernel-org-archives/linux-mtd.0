Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vbHQ-0002Iz-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 09:49:42 +0100
Message-ID: <003e01c0d46e$d5c19aa0$5502010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: SC520 CDP: When I set the CFG1 switch to ON --> nb0 command says that bank not presen
Date: Fri, 4 May 2001 11:50:06 +0400
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
I want to place the lstart16.abs file to BIOS flash memory (29F040-DIP). In
lstart16.asm I found that it necessary set the CFG1 switch to ON. But when I
run :
    z
    yi
    nb0
I see a message : bank not present.
When I set CFG1 to OFF the command "nb0" works fine :
changed to bank 0, 512 KB, Device 29F040

Would You help me?

Thank You.

     Alexander Melichenko.
