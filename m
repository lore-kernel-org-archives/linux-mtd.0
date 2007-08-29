Received: from smtp4-g19.free.fr ([212.27.42.30])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQOaO-0007Fq-29
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 10:32:04 -0400
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2 rootfs mount error
Date: Wed, 29 Aug 2007 16:31:34 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708291631.34801.schane@osmozis.com>
Cc: linux-arm@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

What does the following error mean while mouting the jffs2 root file system 
image flashed on the MTD nand device ?

JFFS: Trying to mount a non-mtd device.
Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(254,0)

Thanks
Sara
