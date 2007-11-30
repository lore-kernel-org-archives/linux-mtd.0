Received: from qb-out-0506.google.com ([72.14.204.225])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IyAkH-0001Rb-Ih
	for linux-mtd@lists.infradead.org; Fri, 30 Nov 2007 18:37:55 +0000
Received: by qb-out-0506.google.com with SMTP id e6so2327174qbe
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Nov 2007 10:37:46 -0800 (PST)
Message-ID: <45e8e6c40711301037j7dc9d695y247288ecb49c5fbb@mail.gmail.com>
Date: Fri, 30 Nov 2007 10:37:44 -0800
From: "Andrey Yurovsky" <andrey@cozybit.com>
To: linux-mtd@lists.infradead.org
Subject: sumtool doesn't add an EBS to the last erase block
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

Hello.  I have some unexpected behavior with sumtool in that it
doesn't summarize the last erase block in my image.  I have a source
directory containing two files:

$ du test/*
232     test/file0
1140    test/file1

I then make a (uncompressed) JFFS2, with 128KiB erase block size:

$ mkfs.jffs2 -n -l -e 128KiB -p -x zlib -x rtime -d test/ -o  testfs.jffs2

Finally, I create an image with erase block summaries:

$ sumtool -n -l -e 128KiB -i testfs.jffs2 -o testfs-sum.jffs2

If I run "jffs2dump -c" on the resulting image, I see that the last
inode is at 0x00169264 while the last summary inode is at a lower
offset, 0x0015e83c, which doesn't make sense to me.  Since that last
inode is in the next erase block compared to the last summary,
shouldn't there be another summary for the final erase block?

As I understand it, sumtool should add a summary to the end of each
erase block in the image, and it seems to do this but the last erase
block is not done.  Is this a bug, or am I misunderstanding how
sumtool and EBS are supposed to work?  Thanks,

  -Andrey
