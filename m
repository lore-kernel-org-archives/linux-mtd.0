Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KkD7r-0007U3-VJ
	for linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 07:25:00 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K7Y004AQ4K8H5@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 16:24:08 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K7Y00IAD4K4CE@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 16:24:07 +0900 (KST)
Date: Mon, 29 Sep 2008 12:56:37 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: only the last 2 files/folders exist after umount yaffs2 filesystem
To: zhang y <hitwmt@gmail.com>, linux-mtd@lists.infradead.org
Message-id: <7C3D985DAF924926A0F3080A31BDD667@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <2d23301c0809282222r33352989v7109c6a770e6c4ad@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Zhang

Better to discuss with Yaffs2 guys because as far i can say 
Samsung driver is not related to this issue.

Rgs
Amit
----- Original Message ----- 
From: "zhang y" <hitwmt@gmail.com>
To: <linux-mtd@lists.infradead.org>
Sent: Monday, September 29, 2008 10:52 AM
Subject: only the last 2 files/folders exist after umount 
yaffs2 filesystem


> hi there
>
> I am using yaffs2 under linux 2.6.9 on EP9302 board, and 
> there is a
> samsung nand flash K9F2G08(256M, 2k+64) on the board.
>
> Now I can mount yaffs2 and create, delete file and folder, 
> but when I
> umount and then mount it again, I can only find the last 
> two
> file/folder there.
>
>
> for example:
>
> #mount -t yaffs2 /dev/mtdblock5 /mnt
> #cd /mnt
> #ls
> lost_found
> #mkdir 1 2 3 4        <=============here, I create 4 
> folders
> #ls
> lost-found 1 2 3 4
> #cd ..
> #umount /mnt
>
> Now I will re-mount the yaffs2
> #mount -t yaffs2 /dev/mtdblock5 /mnt
> #ls /mnt
> lost_found 3 4       <=============here, I can only get 
> the last two folder
>
>
> and, I have try many times and got the same appearance,The 
> filesystem
> just only save the last 2 files/folders on my board.
>
> btw, I have use jffs2 on the board, it works well except 
> the bad speed.
>
> So, anybody can give me some advice? I will really 
> appreciate that!
>
> Thanks in advance!
>
> zhang y
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
