Received: from wa-out-1112.google.com ([209.85.146.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IxORN-0002e3-H7
	for linux-mtd@lists.infradead.org; Wed, 28 Nov 2007 15:03:11 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1649474wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Nov 2007 07:03:03 -0800 (PST)
Message-ID: <8bf247760711280703v41a7288exad611507eecabe91@mail.gmail.com>
Date: Wed, 28 Nov 2007 20:33:02 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2 padding queries
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

Hi,
  Can mkfs.jffs2 produce an image that is a multiple of page size and
not block size. (With padding)

  My page size is 0x8000 (2K) and block size is 0x20000 (128K).

  I tried the following:
  # mkfs.jffs2 -p 0x800 -l -e 0x20000 -n -v -r rootfs/ -o /tmp/filesys.jffs2

  I tried several similar combinations to mkfs.jffs2.
  I could get an image which is either padded block size or a size
which is neither a multiple
  of page or block size (without -p param).


 I would like to get a image which is a multiple of page size after padding.

Regards,
sriram
