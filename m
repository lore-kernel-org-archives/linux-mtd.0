Received: from [152.101.51.1] (helo=janus.hk.panelx.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196XTR-0005pZ-3N
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 16:08:22 +0100
Message-ID: <001301c305bc$17068680$6b00a8c0@mobile>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <linux-mtd@lists.infradead.org>,
	"yaffs list" <yaffs@toby-churchill.org>
Date: Fri, 18 Apr 2003 23:06:25 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: using MEMWRITEOOB problem in NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi All,
     I want to restore the oob[5] using ioctl(..,MEMWRITEOOB,..) in NAND
 flash device, but it is failure to write anything. Is any protected
 condition in NAND.C?
 
 Thanks.
 
 Paul
 
