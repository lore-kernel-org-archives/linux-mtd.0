Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1dEo-0007lf-Rb
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 08:11:55 +0000
Received: by fg-out-1718.google.com with SMTP id l26so1936266fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 May 2008 01:11:53 -0700 (PDT)
Message-ID: <e8775dd00805290111l40cdf6f9p5efee4005037557c@mail.gmail.com>
Date: Thu, 29 May 2008 16:11:53 +0800
From: "Jason Liu" <liu.h.jason@gmail.com>
To: linux-mtd@lists.infradead.org, "Jason Liu" <liu.h.jason@gmail.com>
Subject: JFFS2 warnning message and notice
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

Hi,All
      These days, I enconter a lot of jffs2 warning or notices when
using jffs2 file system on MLC nand flash
      with Kyungmin Park 's not use oob patches. the messages as followings,
      JFFS2 warning: (1688) jffs2_do_read_inode_internal: Truncating
ino #7568 to 20168 bytes failed because
      it only had 4096 bytes to start with!
      JFFS2 warning: (1688) jffs2_do_read_inode_internal: Truncating
ino #7573 to 883418 bytes failed because it only had 5734
      4 bytes to start with!
      JFFS2 notice: (873) check_node_data: wrong data CRC in data node
at 0x02e6c270: read 0xe6d40036, calculated 0x176f5ac1.
      JFFS2 notice: (873) check_node_data: wrong data CRC in data node
at 0x0528e7b0: read 0x8abffc49, calculated 0x6e7e8788.
      JFFS2 notice: (873) check_node_data: wrong data CRC in data node
at 0x0529f638: read 0x66e426b7, calculated 0x5eedc576.
      ....
      I don't know what cause such happen?  Is this the common case of
jffs2 file system?
