Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KkBCx-0000mP-Sf
	for linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 05:22:08 +0000
Received: by gxk5 with SMTP id 5so10345027gxk.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Sep 2008 22:22:07 -0700 (PDT)
Message-ID: <2d23301c0809282222r33352989v7109c6a770e6c4ad@mail.gmail.com>
Date: Mon, 29 Sep 2008 13:22:07 +0800
From: "zhang y" <hitwmt@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: only the last 2 files/folders exist after umount yaffs2 filesystem
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi there

I am using yaffs2 under linux 2.6.9 on EP9302 board, and there is a
samsung nand flash K9F2G08(256M, 2k+64) on the board.

Now I can mount yaffs2 and create, delete file and folder, but when I
umount and then mount it again, I can only find the last two
file/folder there.


for example:

#mount -t yaffs2 /dev/mtdblock5 /mnt
#cd /mnt
#ls
lost_found
#mkdir 1 2 3 4        <=============here, I create 4 folders
#ls
lost-found 1 2 3 4
#cd ..
#umount /mnt

Now I will re-mount the yaffs2
#mount -t yaffs2 /dev/mtdblock5 /mnt
#ls /mnt
lost_found 3 4       <=============here, I can only get the last two folder


and, I have try many times and got the same appearance,The filesystem
just only save the last 2 files/folders on my board.

btw, I have use jffs2 on the board, it works well except the bad speed.

So, anybody can give me some advice? I will really appreciate that!

Thanks in advance!

zhang y
