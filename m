Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GxMLd-0003FZ-PC
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 06:44:35 -0500
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=[192.168.100.183])
	by postikukk.artecdesign.ee with esmtp (Exim 4.50)
	id 1GxMNA-0001su-U1
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 13:46:20 +0200
Message-ID: <458A73AF.2040307@artecdesign.ee>
Date: Thu, 21 Dec 2006 13:44:47 +0200
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Transfer rates with NAND
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

Hi,

I am wondering which NAND transfer rates are seen in embedded Linux 
projects. What to expect from the whole hardware/software subsystem?
I have one Geode LX design with CS5536 companion chip which by using 
built-in 8-bit Flash controller on PCI bus gives me slightly over 2MB/s. 
It's almost the same with Linux MTD driver and with a self-made basic 
driver. Is the speed here the matter of flash controller only? Which is 
the fastest flash controller out there? :)

thanks in advance,
Indrek
