Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16axYZ-0002ac-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 11:26:36 +0000
Message-ID: <3C6A9E35.C4B8664F@sasken.com>
Date: Wed, 13 Feb 2002 17:11:17 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>,
   JFFS mailing list <jffs-dev@axis.com>
Subject: init taking 5sec
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi All,
Iam  using kernel 2.4.8 (ac12 patch)

partition sizes : 1MB (boot loafder + kernel)
                            13 MB ( cramfs as root file system)
                              2 MB (jffs2 partition)



The kernel boot up till init in 6sec and then init takes 5secs....till
i get the login prompt.
Iam using nicoramdisks init.

Is there any way i can reduce the boot time
Any pointers where i can get the init source file ( version 2.74)

Thanks and regards
ashok
