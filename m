Received: from msr89.hinet.net ([168.95.4.189] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YHUX-0008IX-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 03:11:53 +0000
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id LAA23966
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 11:42:41 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Display Unchecked space...
Date: Tue, 14 Jan 2003 11:42:42 +0800
Message-ID: <000201c2bb7e$ff1e89a0$80d1a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
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

I download the latest cvs code and build it in uClinux. After running
two days, I got "kernel BUG at gc.c:136! Checked all inodes but still
0x6a0 bytes of unchecked space?" and it will continue display the
message and halt the system. I set CONFIG_JFFS2_FS_DEBUG=1, but I did
not get any useful messages. Does anyone can tell me why the kernel BUG
will display? Could I solve the system halt, even "unchecked space"
occurs? Thanks.

Steve Tsai
