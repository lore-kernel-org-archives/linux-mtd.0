Received: from school.cyberec.com ([202.153.122.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FnD7-0007Ca-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2002 03:41:13 +0100
Message-ID: <3CFECA68.6060709@emsoftltd.com>
Date: Thu, 06 Jun 2002 10:35:20 +0800
From: Jason Chan <jason@emsoftltd.com>
MIME-Version: 1.0
To: "'linux-arm-kernel@lists.arm.linux.org.uk'" <linux-arm-kernel@lists.arm.linux.org.uk>,
   linux-mtd@lists.infradead.org
Subject: Need Some help to write NandFlash Driver
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Dear all,
	I am currently implementing Samsung Nand-Flash Driver for edb7312 block on 2.4.18 kernel. I am seeking for suggestion on which method should be used to improve my nandflash driver.

It implement the Nand-Flash Driver as a block device currently.=20
When there are some "WRITE" request to write an sector, I will
1. Copy the content of the block into a buffer.
2. Update the content of the buffer of specific sector location.
3. Erase the block
4. Write the whole block back to the flash.

But I find that, when I write an whole block of buffer back to the flash, all the interrupt will be blocked during the operation. And that's cause problem of other drivers. And I want the interrupt can fully functional even when I writing flash.

Now I have following idea,
1. Not to disable interrupt when processing "WRITE" request. But how can I control the read/write operation so that I won't have some synchronization problem.

2. Use MTD Block device, I have do some initial port on that. I use MTD NandFlash support and port my own code there. I can use the "mtd-nand" char device to read/write the flash. But when I use the "mtd-block" block device to read to flash, it work fine. But it crash when I try to write to the block device. Is that the MTD block driver problem? Anyone has successful port Samsung nandflash to MTD block device.
 
3. Use JFFS2. It seems JFFS2 can support the NandFlash. Anyone have try that?
 
4. Use NTFL. But it only support DiskOnChip. Can this use Nandflash on this.

Any suggestion is welcome.


-- 
Best Regards,

Jason Chan
Emsoft Ltd.
