Received: from f24.mail.ru ([194.67.57.160])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dkz3V-0005xw-VB
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 02:49:53 -0400
Received: from mail by f24.mail.ru with local id 1Dkz3Q-0008Px-00
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 10:49:44 +0400
From: Timofey Kutergin <tkutergin@mail.ru>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Date: Wed, 22 Jun 2005 10:49:44 +0400
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Message-Id: <E1Dkz3Q-0008Px-00.tkutergin-mail-ru@f24.mail.ru>
Subject: clean marker size for NOR w/ECC
Reply-To: Timofey Kutergin <tkutergin@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all !
Currently, JFFS2 WBUF implicitly assumes that cleanmarker size is multiple number of eccsize and sets it to 16 in jffs2_nor_ecc_flash_setup(). Which in fact mean 1,2,4,8 and 16 valid values for eccsize. Newer flashes may have ECC window more than that, 1024 bytes, for example. So at least it is suggested to change

 c->cleanmarker_size = 16;
to
 c->cleanmarker_size = c->mtd->eccsize>=16 ? c->mtd->eccsize:16;

in
jffs2_nor_ecc_flash_setup()

also, when using flash_eraseall utility with -j option, it also assumes cleanmarker size of 16 (sizeof(struct jffs2_unknown_inode)).
It is suggested to put similar check there:

 isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;
 isNORECC = ((meminfo.type == MTD_NORFLASH) && ((meminfo.flags & MTD_ECC != 0))) ? 1 : 0;

....

if (!isNAND && !isNORECC)
   cleanmarker.totlen = cpu_to_je32 (sizeof (struct ffs2_unknown_node));
else if (isNORECC)
   cleanmarker.totlen = cpu_to_je32 (meminfo.eccsize >= sizeof (struct ffs2_unknown_node) ? meminfo.eccsize:sizeof (struct ffs2_unknown_node));
else {
...


Regards
Timofey
