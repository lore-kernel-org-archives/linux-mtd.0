Received: from john.hrz.tu-chemnitz.de ([134.109.132.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JPGkY-00047s-Gp
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 12:30:13 +0000
Received: from galba.hrz.tu-chemnitz.de ([134.109.133.156]
	helo=mailbox.hrz.tu-chemnitz.de)
	by john.hrz.tu-chemnitz.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <markus.franke@informatik.tu-chemnitz.de>)
	id 1JPGkX-0003Uw-7L
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 13:30:05 +0100
Received: from aiken.hrz.tu-chemnitz.de ([134.109.133.143] helo=localhost)
	by mailbox.hrz.tu-chemnitz.de with esmtp (Exim 4.66)
	(envelope-from <markus.franke@informatik.tu-chemnitz.de>)
	id 1JPGkX-00052P-06
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 13:30:05 +0100
Message-ID: <20080213133004.burs2nmq8cwww8ww@mail.tu-chemnitz.de>
Date: Wed, 13 Feb 2008 13:30:04 +0100
From: Markus Franke <markus.franke@informatik.tu-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: dual-port ram driver implementation as MTD device?
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear MTD developers/users,

I am working on a custom board around the MCF5484 processor and  
uClinux. The processor offers up to six chip-selects for accessing  
external memory devices. A dual-port ram is connected to CS2 and I am  
about to write a proper linux driver for this device. I came across  
MTD and I am wondering whether I should develop an MTD RAM device  
driver (similar to drivers/mtd/chips/map_ram.c) or whether a standard  
linux character device driver would be more appropriate in my  
situation. Any comments on this are appreciated.

With best regards,
Markus Franke
