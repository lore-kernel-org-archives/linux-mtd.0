Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JLLIl-0007Xw-H3
	for linux-mtd@lists.infradead.org; Sat, 02 Feb 2008 16:33:18 +0000
Message-ID: <47A49B39.5010903@dave-tech.it>
Date: Sat, 02 Feb 2008 17:32:57 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Subject: Re: JFFS2: file contents in case of data CRC error
References: <47A1FD3F.2020102@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
	<47A32600.9000807@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
In-Reply-To: <523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, jamie@shareable.org, mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Ahh. The temperature tests. That explains a lot. 
> Probably device worked improperly in the test but test did not turn off
> device when NAND become unworkable. As result JFFS2 did not detect the
> problem of broken CRC on mount but did it on attempt to read the broken
> data and printed error message.
I was told by the customer that before starting the temperature test 
several files have been copied on NAND. During the temperature test the 
processor never accessed these files on NAND. Once the test has been 
completed, the files on NAND have been read back and compared to the 
original ones.

> So JFFS2 performed scan on read - found CRC error in node 
> -> JFFS2 marked node to be obsolete
Sure. This is the code snippet in function jffs2_get_inode_nodes:

if (crc != je32_to_cpu(node.i.data_crc)) {
	printk(KERN_NOTICE "jffs2_get_inode_nodes(): Data CRC failed on 		node
at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
        	ref_offset(ref), je32_to_cpu(node.i.data_crc), crc);
	jffs2_mark_node_obsolete(c, ref);
	spin_lock(&c->erase_completion_lock);
	continue;
	...

> -> As result hole in the file has been formed. 
> -> You read 0x0 in the middle of the file.
I can't find the function that, in case of obsolete node, zeroes the 
chunk of data passed to user space. Can you?

> I think nobody considered such tests before. I am not sure if any file
> system may be reliable in such a case with temperature tests.
Hmm ... I don't think the environmental condition may influence JFFS2 
behaviour. The NAND used in the test is industrial grade so it is 
guaranteed by manufacturer that it works in -40/+85 degC range. JFFS2 
clearly does not anything about environment temperature. On the other 
hand I'm wondering if temperature variation caused multiple bit flipping 
in one NAND block that MTD was not able to correct and this led to the 
problem we are talking about.


-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
