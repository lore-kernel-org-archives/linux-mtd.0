Received: from [66.78.22.109] (helo=host3.hosting4everyone.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mw4Z-00028i-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 12:17:07 +0000
Date: Mon, 18 Mar 2002 7:28:26 -0000
From: Cfowler <cfowler@outpostsentinel.com@>
To: Wil Taphoorn <wil@wtms.nl>,  <linux-mtd@lists.infradead.org>
Reply-to: Cfowler <cfowler@outpostsentinel.com@>
Subject: RE: How to protect DoC 2000 from power fail?
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="iso-8859-1";
MIME-Version: 1.0
Message-Id: <E16mwFW-0006c2-00@host3.hosting4everyone.com>
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


I do not use a journalling file system.  I load a ext2 fs into memory from a
raw file on DOC2000.  If you loose power then you just reboot.  No loss of
data.  Of course only config changes not the root fs.  I store config in a
shared memory sgement.  I only write it to DOC when the user issues the
'save' command.


--------- Original message --------
From: "Wil Taphoorn" <wil@wtms.nl>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: How to protect DoC 2000 from power fail?
Date: 03-18-02 12:23

Gentlemen,

I am looking for some rigid means of power fail protection
for a DoC 2000 based embedded system. From what I have read
so far I understand that almost any brand of journalling file
system should do well but, then again, those readings also
mention raw FLASH and not DoC, in other words, I think I am
lost. Would someone be so kind to enlighten me?

The system in question runs on a customized 486 SoC, boots
from EEPROM and loads LILO from DoC. The kernel uses initrd
to load the M-sys supplied DoC driver.

Thanks,
Wil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
