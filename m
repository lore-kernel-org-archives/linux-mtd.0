Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXJAT-0004dF-6a
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 16:42:06 +0000
Subject: Powerfail-tests and jffs2-sync-mount
From: =?ISO-8859-1?Q?Schl=E4gl?= "Manfred jun." <manfred.schlaegl@gmx.at>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 06 Mar 2008 17:41:59 +0100
Message-Id: <1204821719.3426.33.camel@lisa.alm.archives.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I did some powerfail-testing of jffs2. 

Short overview (Contact me for details):
Arch: ARM926EJ-S with 40MB rw jffs2 part on Samsung NAND-Flash
Kernel: linux-2.6.12 (a little bit out of date, i know ;-))
Test: 
 * Target-Loop
   * filesystem-consistency:
     * create dir
     * copy data(> eraseblock-size) to new file
     * delete a file
   * file-consistency:
     * logfile on jffs-part (simply appending text with echo)
 * External random-time reset:
   * external uC
   * generates reset every 120+rand(0..30) seconds
 * Run until no more space on filesystem
Results:
 * test with sync-mounted jffs2 (mount -o sync):
   * duration 4:40 hours
   * 131 generated resets
   * consistent FS
   * consistent logfile
 * test with async mounted jffs2:
   * duration 4:10 hours
   * 118 generated resets
   * consistent FS
   * corrupted logfile (bad-chars, etc.)

Now my question: Are there any non-obvious disadvantages, mounting jffs2
synchronal, except lower speed and a little(depends on usage) decreased
flash-life-time (wear-out), or is this anyway the default approach?

Best regards,
	Manfred Schlaegl
