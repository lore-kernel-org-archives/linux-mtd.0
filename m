Received: from [200.53.172.134] (helo=localhost.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 152mUA-0006qz-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 May 2001 05:12:30 +0100
Received: from isl.net.mx (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.9.3/8.9.3) with ESMTP id XAA04003
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2001 23:14:06 -0500
Message-ID: <3B0C8A8E.F0543661@isl.net.mx>
Date: Wed, 23 May 2001 23:14:06 -0500
From: Nikolai Vladychevski <niko@isl.net.mx>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtdblock failing
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

Hi,

I have problems using mtdblock device with DoC millenium 8MB, it does
not accept reading or writing. This is the error message when I do for
example "dd if=/etc/passwd of=/dev/mtdblock0":

end_request: I/O error, dev 1f:00 (mtdblock), sector0
dd: reading `/dev/mtdblock0': Input/output error
0+0 records in
0+0 records out


/dev/mtd0 device works just perfect. I can read/write ok, I boot Linux
Bios from it and I do not complain. But I could never get to work
mtdblock device. Compiling it as module or comiling it in the kernel
gives the same result. On the console I can see

mtdblock_open
ok
mtdblock: read on "DiskOnChip Millenium" at 0x0, size 0x1000
end_request: I/O error, dev 1f:00 (mtdblock), sector 0
mtdblock_release
ok

Should I update to the lastests CVS tree? I am using version dated April
11 2001. .2.4-test12 kernel.


Thanks in advance

Nikolai
