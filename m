Received: from [61.11.88.62] (helo=gdaserver)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1fDq-0001vp-2q
	for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2003 05:56:22 +0100
Received: from gdaserver ([127.0.0.1])
          by gdaserver (JAMES SMTP Server 2.1.3) with SMTP ID 745
          for <linux-mtd@lists.infradead.org>;
          Tue, 23 Sep 2003 10:25:48 +0530 (IST)
From: Sivam <mg.sivam@gdatech.co.in>
To: linux-mtd@lists.infradead.org
Date: 23 Sep 2003 10:26:48 +0530
Message-Id: <1064293008.827.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: JFFS2 on SMDK2410 with Mizi Linux...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

I am trying to port JFFS2 on a SMDK2410 board based on S3c2410
processor.I am using Mizi Linux on the board but as the Mizi as only
Cramfs support i am trying to port Jffs2 as a rw system, I have included
the JFFS2 fs in my kernel and is it possible for me to mount the JFFS2
on top of a bon system like mount -t jffs2 /dev/bon/3 /mnt as a read
write partition ?.Pls advice me on this.



Thanks and Regards
sivam
