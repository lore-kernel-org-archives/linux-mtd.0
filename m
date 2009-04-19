Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LvNBo-0006bj-F9
	for linux-mtd@lists.infradead.org; Sun, 19 Apr 2009 02:55:35 +0000
Received: by yx-out-1718.google.com with SMTP id 6so170928yxn.72
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Apr 2009 19:55:27 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 18 Apr 2009 19:55:26 -0700
Message-ID: <1c3f4270904181955g28d25ef5nef3cc3001c0d3a06@mail.gmail.com>
Subject: jffs2 filesystem/flash data integrity
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a jffs2 filesystem on NAND flash. After mounting the jffs2 fs,
I create a 2MB file and make a copy of it using "cp" command. When I
do a "diff" between two files, the files are same. Now, I unmount the
fs and re-mount it. When I do a "diff" between the two files, they
differ. Looking at the difference, I see that around 4K of data in one
file has 0s in it. This 4K hole can be anywhere in the file.  There is
no issue with a 1MB file.

I use the following command to mount:
mount -t jffs2 -osync /dev/mtdb-boot2 /mnt/jff

The NAND page size is 512 bytes and block size if 16K.

What could be going wrong? I have also tried doing a "sync" after
creating the second file. Is this a driver issue?

Any hints appreciated.
Please cc me in the reply as I am not subscribed.

Thanks.
