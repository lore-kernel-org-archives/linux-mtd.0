Received: from web63408.mail.re1.yahoo.com ([69.147.97.48])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OcxQz-0002kj-9a
	for linux-mtd@lists.infradead.org; Sun, 25 Jul 2010 09:23:50 +0000
Message-ID: <773917.10546.qm@web63408.mail.re1.yahoo.com>
Date: Sun, 25 Jul 2010 02:23:44 -0700 (PDT)
From: Fundu <fundu_1999@yahoo.com>
Subject: nand mtd corruption linux-2.6.29
To: mtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Couple of folks at the mini2440 mailing list have encountered that when issuing 
'reboot' at console right after copying some files to a rootfs that resides on a 
NAND flash. this action results in the bootloader getting corrupt and bricking 
the board.

Looks like the SIGKILL issued from reboot isn't handled properly (mtd or fs) 
when changes are pending to be written to persistence storage (in this case the 
NAND flash) and some corruption occurs. 

can some subscriber to this list, help us out. 

Q1) has anyone seen this before, 
Q2) is there a patch/workaround that we can apply to our linux kernel (2.6.29)

here's the system detail
Kernel : 2.6.29
arm-gcc  version 4.3.2
nand 128 mb


also parallelly i'm trying a work around by not making the bootloader partition 
visible. to see if that help maybe the corruption occurs at a different 
partition. i'll share my finding. 

Any pointers would be appreciated. 

Thanks in advance !


      
