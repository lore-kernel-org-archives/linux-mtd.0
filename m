Received: from sc-smtp1.homechoice.co.uk ([212.187.157.195] helo=sc-outsmtp1.homechoice.co.uk)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dx7l-0001jc-00
	for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2002 19:07:33 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: adr <mtd@mcmen.demon.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Help with Dreamcast flash devices
Date: Sun, 11 Aug 2002 19:08:06 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208111908.06874.mtd@mcmen.demon.co.uk>
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

I wonder if someone here might help me.

I am one of the (too) small team of developers on the Linux on Dreamcast 
project (http://sourceforge.net/projects/linuxdc). I am currently working on 
developing a driver for the flash memory devices available for this machine.

Someone else started work on this months ago, but nothing has been done for 
ages, so I'm hacking at it now.

The flash memory on the DC is "smart" - ie it's attached to an 8-bit 
micro-controller. The device communicates with the rest of the system via a 
high speed serial ("maple") protocol. The flash is not mapped into the sh4 
(main cpu) physical memory at all. (http://mc.pp.se/dc/vms/index.html leads 
to more information for those interested).

Well, the long and the short of it is that I am somewhat at sea here. Are 
there any similar mtd devices I can look at?

Is there an explanation anywhere of how mapping works and how to 'virtual' map 
something which isn't in the physical map at all?

Any other ideas (random or now) about how to make this work? Currently the 
driver fails on mapping.

Adrian
