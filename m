Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CeAu1-000655-8J
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2004 06:31:38 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004121406321025458
	for <linux-mtd@lists.infradead.org>; Tue, 14 Dec 2004 06:32:10 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E793518138F@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 14 Dec 2004 06:31:36 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: Partitions on DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

  I have a DiskONChip 2000 128Mbyet dip.  I am having trouble writing the
boot loader to it Lilo-22.6.2.  There are two partitions on the chip the
16Kbyte BDL and the BDTL partition which is the rest of the disk space.  My
/proc/mtd shows only mtd0.  My /proc/partitions shows only inftla and
inftla1.  I am wondering what is the trick to make the chip bootable.  Do I
need to delete the BDL and create on large partition on the chip?  When I
run Lilo it warns me the inftla is not on the first disk.  Is this my
indicator as to have only on large partition?

Thanks,
John 
