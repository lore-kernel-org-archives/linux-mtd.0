Received: from rproxy.gmail.com ([64.233.170.200])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CodZ4-000637-L7
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 03:09:15 -0500
Received: by rproxy.gmail.com with SMTP id z35so19965rne
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 00:09:13 -0800 (PST)
Message-ID: <f6d0cd0605011200093437bcb5@mail.gmail.com>
Date: Wed, 12 Jan 2005 13:39:12 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Mounting JFFS2 compressed Ramdisk on MTD partition
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I am using JFFS2 and MTD on our target for booting
the Ramdisk from MTD device ( Intel W18 Flash ) 

Kernel command line: root=/dev/mtdblock1 rw mem=64M 
rootfstype=jffs2 console=ttyS0,115200 ramdisk=8192

I have compressed the RAMDISK to have JFFS2 Ramdisk image and
loaded in to the Flash on the specified memory location. I have also
created a MTD partition ( /dev/mtdblock1) which is pointing to flash
memory location where the JFFS2 compressed ramdisk image is there.

My idea is to load JFFS2 RAMdisk from flash ( specified in the KERNEL
config line ) because i have a very limited memory in Flash.

Here is the logs for the same. I am getting this
error eveytime when Linux Kernel tries to mount the JFFS2
compressed Ramdisk from the Flash Device.

logs:

 INIT: Eep. Unknown node type 0080 at 00186f34 was
 marked REF_UNCHECKED
 Node header CRC failed at 00186f34. But it must have
 been OK earlier.
 Node was: { 0080, 2080, 00800080, 00800080 }
 Node totlen on flash (0x00800080) != totlen from node
 ref (0x000001b4)

and it keeps on repearing the same way.

I am formatting the flash completely. I have verified that all
the flash sectors have been erased correctly. By the way i am using
NOR Flash ( Intel W18 Flash).

Important thing to note that :

I am able to load the RAMdisk in /mnt/temp directory by issuing :

mount -t jffs2 /dev/mtdblock1 /mnt/temp.

But if i ask kernel to pick up the RAMdisk from /dev/mtdblock1 in the
kernel config line then it gives me lot of errors as mentioned above.

Do you have any idea ?

Thanks and regards
Niraj
