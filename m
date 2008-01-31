Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKcgP-0008P0-LW
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 16:54:44 +0000
Message-ID: <47A1FD3F.2020102@dave-tech.it>
Date: Thu, 31 Jan 2008 17:54:23 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2: file contents in case of data CRC error
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

I have a JFFS2 partition on 32MByte NAND device.
When reading a specific file - see below for details - JFFS2 reports a 
Data CRC error but function nand_correct_data never returns -1, so I 
assume ECC algorithm is able to correct errors.
However the file is not equal to the original one that has been written 
to NAND. In fact, in the middle of the file, I see a 4-kByte "hole" 
where all bytes are 0.
Anybody can help me about understanding if this is the expected 
behaviour of JFFS2?
Thanks in advance.


bash-2.05# mount -t jffs2 -o ro /dev/mtdblock0 /mnt/nand0
mtdblock_open
ok
bash-2.05# cp -v /mnt/nand0/f.img /tmp/
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01d55544: Read 
0x80b8997f, calculated 0x57f0ea8e
`/mnt/nand0/f.img' -> `/tmp/f.img'

-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
