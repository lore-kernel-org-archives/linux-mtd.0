Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OGZTh-0006ws-2U
	for linux-mtd@lists.infradead.org; Mon, 24 May 2010 15:22:05 +0000
Received: by iwn40 with SMTP id 40so3375931iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 May 2010 08:22:02 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 24 May 2010 11:22:02 -0400
Message-ID: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
Subject: UBIFS failed to recover master node
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've had several cases where our MLC NAND flash appears corrupted in
such a way that one of three UBIFS volumes can not be mounted due to
"failed to recover master node".  I haven't been able to reproduce the
problem, but we've had at least 5 incidents where this has occurred.
(A partial capture from one of the failures is below.)

I'm starting to investigate this problem and don't know if this is a
UBIFS/UBI problem or a NAND driver problem.  I'm starting the process
of back-porting the latest UBIFS code to our 2.6.29 kernel - hoping
that new UBIFS code will solve the problem.  However, this may also be
a driver problem and I wonder if I also need to update that driver
(pxa3xx_nand).  Any suggestions for debugging this problem?

Thanks,
twebb


capture:
[root@ESIedge mtd-utils]# mount -t ubifs ubi0_0 /mnt/
[  239.605869] UBI error: ubi_io_read: error -74 while reading 516096
bytes from PEB 4:8192, read 516096 bytes
[  239.616317] UBIFS error (pid 676): ubifs_scan: corrupt empty space
at LEB 2:268135
[  239.623996] UBIFS error (pid 676): ubifs_scanned_corruption:
corruption at LEB 2:268135
[  239.642101] UBIFS error (pid 676): ubifs_scan: LEB 2 scanning failed
[  239.976396] UBI error: ubi_io_read: error -74 while reading 516096
bytes from PEB 4:8192, read 516096 bytes
[  239.986742] UBIFS error (pid 676): ubifs_recover_master_node:
failed to recover master node
mount: mounting ubi0_0 on /mnt/ failed: Invalid argument
