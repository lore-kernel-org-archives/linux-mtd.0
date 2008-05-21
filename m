Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jyo8a-00058M-9a
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 13:13:48 +0000
Received: by fg-out-1718.google.com with SMTP id l26so2372343fgb.26
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 May 2008 06:13:46 -0700 (PDT)
Message-ID: <e8775dd00805210613n6988a534m8103b9dc4d9b8c7f@mail.gmail.com>
Date: Wed, 21 May 2008 21:13:46 +0800
From: "Jason Liu" <liu.h.jason@gmail.com>
To: "Manuel Sahm" <Manuel.Sahm@feig.de>
Subject: Re: mkfs.jffs2 ?!
In-Reply-To: <4833F626.1060600@feig.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4833F626.1060600@feig.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

before mount please erase the partition and then mount & copy files to
the mount point,
remount and see what happen. empty flash at [address] end at [address]
!!!!!!!!!!!!!!!!!!!!!!!
is no harmfull message. the wrong configration when use mkfs.jffs2
will also lead to it.
such as the erase size is not the same with your nand flash used.

2008/5/21 Manuel Sahm <Manuel.Sahm@feig.de>:
> Hello,
>
> I have lot of problems concerning my NANDflash:
>
> I?ve downloaded mtd-utils 1.1.0 and compiled it on my host pc [Suse
> Linux 10.2 - Kernel 2.6.18]
>
> I enter:
> mkfs.jffs2 -d /exports/ -p -s 0x800 -e 0x20000 -n -l -o /RFS.jffs2
>
> NAND Flash has Pagesize = 2048 Byte = 2kByte
> EraseBlockSize= 128 kByte
> oob = 64
>
> I could mount the Image on my target [linux 2.6.25.3]through:
>
> mount -rw -t jffs2 /dev/mtdblock5 /media/DATAfs
>
> BUT:
> If I want to write to the device like: touch /media/DATAfs/test.txt
> and then unmount /media/DATAfs/test.txt
> and mount -rw -t jffs2 /dev/mtdblock5 /media/DATAfs
>
>
> There?s an message:
>
> empty flash at [address] end at [address] !!!!!!!!!!!!!!!!!!!!!!!
>
>
> Please help me........
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
