Received: from sj-iport-6.cisco.com ([171.71.176.117])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKezR-0005l1-KW
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 19:22:32 +0000
Received: from sj-core-5.cisco.com (sj-core-5.cisco.com [171.71.177.238])
	by sj-dkim-4.cisco.com (8.12.11/8.12.11) with ESMTP id m0VJMNSd029081
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2008 11:22:23 -0800
Received: from xbh-sjc-231.amer.cisco.com (xbh-sjc-231.cisco.com
	[128.107.191.100])
	by sj-core-5.cisco.com (8.12.10/8.12.6) with ESMTP id m0VJLuqv023627
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2008 19:22:23 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Jffss2_write_super erasing all the blocks
Date: Thu, 31 Jan 2008 11:22:20 -0800
Message-ID: <ED07EE9DB42A8945877C9794BA15040801A516FF@xmb-sjc-229.amer.cisco.com>
In-Reply-To: <47A1FD3F.2020102@dave-tech.it>
From: "Nikhil Bansal (nikbansa)" <nikbansa@cisco.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a question about JFFS2 fs. In my setup, I am running JFFS2 on AMD
Spansion flash (NOR flash). What I noticed was that whenever I erase a
file from my flash, I see that jffs2_write_super function gets called
which in turn calls jffs2_erase_pending_blocks(0) which goes ahead and
deletes all the pending blocks. While this erase is going on super block
is locked and we can not perform any other operation with JFFS2.=20

Can someone please explain the logic behind this or if there is
something I am missing here?

Thanks,
Nikhil=20

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of llandre
Sent: Thursday, January 31, 2008 8:54 AM
To: linux-mtd@lists.infradead.org
Subject: JFFS2: file contents in case of data CRC error

I have a JFFS2 partition on 32MByte NAND device.
When reading a specific file - see below for details - JFFS2 reports a
Data CRC error but function nand_correct_data never returns -1, so I
assume ECC algorithm is able to correct errors.
However the file is not equal to the original one that has been written
to NAND. In fact, in the middle of the file, I see a 4-kByte "hole"=20
where all bytes are 0.
Anybody can help me about understanding if this is the expected
behaviour of JFFS2?
Thanks in advance.


bash-2.05# mount -t jffs2 -o ro /dev/mtdblock0 /mnt/nand0 mtdblock_open
ok bash-2.05# cp -v /mnt/nand0/f.img /tmp/
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01d55544: Read
0x80b8997f, calculated 0x57f0ea8e `/mnt/nand0/f.img' -> `/tmp/f.img'

--
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
