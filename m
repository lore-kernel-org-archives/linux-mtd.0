Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdLG-0000pT-Kd
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 08:42:11 +0000
Received: by wwf10 with SMTP id 10so1328608wwf.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 01:42:08 -0700 (PDT)
Subject: Re: Problem with JFFS2 mount
From: Artem Bityutskiy <dedekind1@gmail.com>
To: -= KuK =- <kuk@data.pl>
Date: Fri, 14 Oct 2011 11:41:39 +0300
In-Reply-To: <4E8729C8.1050305@data.pl>
References: <4E8729C8.1050305@data.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318581705.12351.69.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-10-01 at 16:55 +0200, -= KuK =- wrote:
> Hi,
> 
> I have problem with creating image file from mounted jffs2 file system.
> 
> I have 1:1 dump from 1GB NAND which is UBI format.
> But it contains JFFS part also.
> This part can be downloaded from my server.
> www.pouchx.com/PRV/HDS/K9G8G08U0M_Samsung_1GB_NAND_Config.ini_block_JFFS.rar
> 
> Archive contains two files. One is original JFFS copy, second is same 
> file but I deleted ECC blocks.
> 
> I mount jffs image (noECC) with this script:
> 
> $ sudo apt-get install mtd-tools
> $ sudo modprobe -v mtd
> $ sudo modprobe -v jffs2
> $ sudo modprobe -v mtdram total_size=8192 erase_size=256
> $ sudo modprobe -v mtdchar
> $ sudo modprobe -v mtdblock
> $ sudo dd if=/HDS/Config.img of=/dev/mtd0
> $ sudo mount -t jffs2 /dev/mtdblock0 /HDS/JFFS

Try using nandwrite and nanddump instead - you will find them in
mtd-utils. And you do not need mtdblock to mount JFFS2 - I think mount
-t jffs2 mtd0 /HDS/JFFS will work fine.

-- 
Best Regards,
Artem Bityutskiy
