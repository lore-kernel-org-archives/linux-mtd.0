Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OGmMf-00020w-1E
	for linux-mtd@lists.infradead.org; Tue, 25 May 2010 05:07:42 +0000
Subject: Re: UBIFS failed to recover master node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 25 May 2010 08:06:22 +0300
Message-ID: <1274763982.2106.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-24 at 11:22 -0400, twebb wrote:
> I've had several cases where our MLC NAND flash appears corrupted in
> such a way that one of three UBIFS volumes can not be mounted due to
> "failed to recover master node".  I haven't been able to reproduce the
> problem, but we've had at least 5 incidents where this has occurred.
> (A partial capture from one of the failures is below.)
> 
> I'm starting to investigate this problem and don't know if this is a
> UBIFS/UBI problem or a NAND driver problem.  I'm starting the process
> of back-porting the latest UBIFS code to our 2.6.29 kernel - hoping
> that new UBIFS code will solve the problem.  However, this may also be
> a driver problem and I wonder if I also need to update that driver
> (pxa3xx_nand).  Any suggestions for debugging this problem?
> 
> Thanks,
> twebb
> 
> 
> capture:
> [root@ESIedge mtd-utils]# mount -t ubifs ubi0_0 /mnt/
> [  239.605869] UBI error: ubi_io_read: error -74 while reading 516096
> bytes from PEB 4:8192, read 516096 bytes
> [  239.616317] UBIFS error (pid 676): ubifs_scan: corrupt empty space
> at LEB 2:268135
> [  239.623996] UBIFS error (pid 676): ubifs_scanned_corruption:
> corruption at LEB 2:268135
> [  239.642101] UBIFS error (pid 676): ubifs_scan: LEB 2 scanning failed
> [  239.976396] UBI error: ubi_io_read: error -74 while reading 516096
> bytes from PEB 4:8192, read 516096 bytes
> [  239.986742] UBIFS error (pid 676): ubifs_recover_master_node:
> failed to recover master node
> mount: mounting ubi0_0 on /mnt/ failed: Invalid argument

And BTW, it is a good idea not to erase/re-flash this device if you want
to fix this problem.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
