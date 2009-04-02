Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LpLK4-0006pw-L2
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 11:43:11 +0000
Subject: Re: Create, Flash and Mount UBIFS Images
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manuel Sahm <Manuel.Sahm@feig.de>
In-Reply-To: <49D4BF5A.187F.00BC.1@feig.de>
References: <49D4BF5A.187F.00BC.1@feig.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Apr 2009 14:42:28 +0300
Message-Id: <1238672548.20906.83.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2009-04-02 at 13:36 +0200, Manuel Sahm wrote:
> Hello, 
> 
> Could anybody explain me how to build an ubi.img that I could flash
> inside my system ? 
> 
> NAND Flash: Micron 256 MByte 
> Physical Eraseblock Size = 131072 
> Logical Eraseblock Size = 129024 
> Min I/O Size = 2048 
> SubPage = 512 
> 
> The Partition /dev/mtd6 is 32MByte. 
> 
> 
> I did the following steps: 
> On my host I created the file through: 
> 
> mkfs.ubifs -d /exports/ -m 2048 -e 129024 -o ubifs.img -x "none" -c
> 2047 
> ubinize -p 128KiB -m 2048 -s 512 -O 512 -o ubi.img ubi.ini 
> 
> with ubi.ini 
> [TEST] 
> mode=ubi 
> image=ubifs.img 
> vol_id=0 
> vol_size=3MiB 
> vol_type=dynamic 
> vol_alignment=1 
> vol_flags=autoresize 
> 
> Then I copy this creted ubi.img to my embedded system. 
> 
> On my embedded system I did: 
> flash_eraseall /dev/mtd6 
> ubiformat /dev/mtd6 -s 512 -f ubi.img 
> ubiattach /dev/ubi_ctrl -m6 -d6 -O512 
> mount -t ubifs ubi6_0 /mnt/ubi6 
> 
> Then at the mount command I got the error: 
> validate_sb: bad superblock 
> 
> So what´s wrong ? 

Could you please try to enable debugging, as it is asked here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

And I do not understand why you did not provide all UBIFS output.
The print is:

ubifs_err("bad superblock, error %d", err);

and you did not provide error code number.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
