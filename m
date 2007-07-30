Received: from nf-out-0910.google.com ([64.233.182.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IFTa1-0001ay-VX
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 07:38:32 -0400
Received: by nf-out-0910.google.com with SMTP id h3so143969nfh
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Jul 2007 04:38:28 -0700 (PDT)
Message-ID: <46ADCDAD.80200@googlemail.com>
Date: Mon, 30 Jul 2007 13:38:21 +0200
From: "benszau@googlemail.com" <benszau@googlemail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Issues with flashcp
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In general flashing works well, but I have issues when flashing certain
images. This problem is reproduceable:

    * The target is a MPC5200-tiny board with 16MB of Intel Strata Flash
      connected to a PPC processor.
    * First I flash a large image via bootloader (u-Boot).
    * Then I can boot the system.
    * After system has booted, i transfer a smaller, second image to the
      target /tmp folder via SCP.
    * "flashcp /tmp/<image_small.img>" /dev/mtd2 -v
    * The progess suggests, that everything went well, but when I reboot
      i get inode errors like the following:
      ...
      JFFS2 error: (1) jffs2_build_inode_pass1: child dir "tc" (ino
      #473) of dir ino #334 appears to be a hard link
      VFS: Mounted root (jffs2 filesystem).
      Freeing unused kernel memory: 92k init
      JFFS2 error: (160) jffs2_do_read_inode_internal: Argh. Special
      inode #467 with mode 0xa1ff had more than one node
      Returned error for crccheck of ino #467. Expect badness...
      ...
    * Now i am curious what went wrong. The small image works well if i
      flash using the bootloader, so it should not be an issue with the
      image itself. May it be possible that i have found a bug? Any help
      is appreciated.

Kind regards,
Simon
