Received: from [61.135.145.13] (helo=websmtp03.sohu.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cMUH-0000ay-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 09:48:14 +0100
Received: from mail.sohu.com (unknown [192.168.41.41])
	by websmtp03.sohu.com (Postfix) with ESMTP id 0AB23672C6
	for <linux-mtd@lists.infradead.org>; Wed,  7 Aug 2002 16:37:30 +0800 (CST)
Message-ID: <871203.1028710084678.JavaMail.postfix@mailsrv1.mail.sohu.com>
Date: Wed, 7 Aug 2002 16:48:04 +0800 (CST)
From: <jay.s@sohu.com>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Subject: problem at boot from doc2000-with grub
Mime-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
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

hi
  I have managed to compile the kernel and the grub, now I can read/write the doc2000 and I also get the grub_firmware which is about 89664 bytes, but still I cannot make the doc boot itself up. Although a previous good how to tell me to doc_loadbios /dev/mtd0   grub_firmware, but I find the doc_firmware space is only about 49k bytes, this 88k one can not inserted into it. I've tried to use dformat5.1 /BDKL0:90k to change the firmware space but I met the old !=1 preblem, but dformat4.2 seems doesn't support the parameter, what shall I do then?
 I am using a doc-2000 in a pc104 SBC with phoenix bios.

thans
                                 jay
