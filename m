Received: from natpost.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WDrp-0005EN-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 09:50:53 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: JFFS2 on NAND flash
Date: Thu, 31 Jan 2002 11:04:10 +0100
References: <15998.1007200283@redhat.com>
In-Reply-To: <15998.1007200283@redhat.com>
MIME-Version: 1.0
Message-Id: <02013022481901.00763@thomas>
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

Smile !

I tried jffs2 on a NAND flash. Tracking down one ugly bug in fs/jffs2/write.c 
i got it basicly working !
Thanks to all of you, who did his job on that jffs2/nand stuff obviously 
without having access to a NAND device.

Bug description
If you write a file a empty dnode is created first.
jffs2_do_create calls 
	jfss2_write_dnode(c, f, ri, NULL, 0, phys_ofs, &writtenlen);

jfss2_write_dnode puts NULL & 0 , which is data and datalen into
	vecs[1].iov_base = (unsigned char *)data;
	vecs[1].iov_len = datalen;
and then calls 
	ret = jffs2_flash_writev(c, vecs, 2, flash_ofs, &retlen); 
2 is the number of vecs assigned to this job.

jffs2_flash_writev calls mtd->writev, if available else it calls
mtd_fake_writev. The nand driver supports writev and does not check if the 
vecs[1] entry is empty. mtd_fake_writev takes care of this.
I suggest to do the check in jffs_write_dnode (where the wrong count comes 
from), although i will include a check in nand.c.
This problem did not show up due to the fact, that obviously none of the 
FLASH drivers supports writev. (I could not find one in mtd)

Patch is committed to CVS

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
