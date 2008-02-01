Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKwRY-0001av-BL
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 14:01:11 +0000
Message-ID: <47A32600.9000807@dave-tech.it>
Date: Fri, 01 Feb 2008 15:00:32 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: "Korolev, Alexey" <alexey.korolev@intel.com>, mattjreimer@gmail.com,
	jamie@shareable.org
Subject: Re: JFFS2: file contents in case of data CRC error
References: <47A1FD3F.2020102@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
In-Reply-To: <523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey, Matt and Jamie,

thank you all for the precious information.

> Could you please give information about how you can get this error? I
> need to know use case. 
The issue has been reported by a customer working on PPC405EP-based 
system running linux 2.4.20.
The device under test has run a temperature cycle test. The temperature 
has been varied in the whole industrial range (-40/+85 deg C). After 
completing the test, the files stored on NAND have been read back and 
compared to the original ones - written on NAND before starting the 
temperature test - and the difference in the file f.img previously 
described arose.

>> to NAND. In fact, in the middle of the file, I see a 4-kByte "hole" 
>> where all bytes are 0.
> 
> It is Ok. NAND error correction could return that data is correct even
> if it is not correct. It finds the issues with guarantee only in case of
> 1 or 2 bits errors.  
About this point I agree with catboat 
(http://article.gmane.org/gmane.linux.drivers.mtd/19463). In my opinion 
in this case JFFS2 should report an error code != 0 in order to warn the 
userland that something did not work perfectly.

>> bash-2.05# mount -t jffs2 -o ro /dev/mtdblock0 /mnt/nand0
>> mtdblock_open
>> ok
>> bash-2.05# cp -v /mnt/nand0/f.img /tmp/
>> jffs2_get_inode_nodes(): Data CRC failed on node at 0x01d55544: Read 
>> 0x80b8997f, calculated 0x57f0ea8e
>> `/mnt/nand0/f.img' -> `/tmp/f.img'
> 
> This is a bad error! How obtained you this? What you did before getting
> this?
See previous description.




-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
