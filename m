Received: from [202.141.68.3] (helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4h2J-0006VH-Pi
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 10:05:49 -0500
Message-ID: <421F3EA1.5040506@kritikalsolutions.com>
Date: Fri, 25 Feb 2005 20:35:05 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: mattcreech@eaton.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: JFFS2 CRC err
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Mr, Matthew,

             I have been working on Atmel's AT91RM9200DK board, which is 
using serial dataflash AT45DB62. I have created a JFFS2 partition on the 
device to store my filesystem. I have been able to mount the partition 
succesfully but when i do my read/write operations sometimes i get CRC 
errors. Here are the steps that i am following

1) Using kernel linux-2.4.26 patched with 2.4.26-vrs1
2) Partitioned the dataflash into 3 parts i,e 2 MB, 3MB and 3MB by 
specifying it in the driver code in at91_dataflash.c
3) booted the system and the erased the partitions . Last partition is 
my filesystem partition, so i erased it using -j option which makes it 
jffs2. Now i mounted the last partition as "mount -t jffs2 
/dev/mtdblock/2 /tmp/" and it mounts succefully and then i copy out my 
required files in this directory. And if i run my application now it 
runs successfully without any problem. Even if i kill my application and 
launch it again it run successfully . But if i do an unmount once and 
try the same procedure of mounting again and running the application it 
shows me an error

           Data CRC 0xABCD != calculated CRC 0xWXYZ

             Please let me know where i am going wrong ? and what was 
the kernel and patch used by you ?

Narinder
