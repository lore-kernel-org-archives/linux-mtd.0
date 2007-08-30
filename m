Received: from py-out-1112.google.com ([64.233.166.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQg1f-00015A-Bh
	for linux-mtd@lists.infradead.org; Thu, 30 Aug 2007 05:09:23 -0400
Received: by py-out-1112.google.com with SMTP id a25so2833440pyi
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Aug 2007 02:09:18 -0700 (PDT)
Message-ID: <1330e3ea0708300209u4bb3c582mff21b8825712e580@mail.gmail.com>
Date: Thu, 30 Aug 2007 14:39:17 +0530
From: "Gan K" <gank79@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 mount on nor flash throws warnings.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to mount a jffs2 image on nor flash
(the flash is intel strata flash(M18)512Mbit x16 device.Part
number:PF38F5060M0Y0C0).
I am able to mount it, however i am getting lot of warning messages
during mount(pasted below).

ARM11 based target with kernel is 2.6.22 is used.

Have any one tried to mount jffs2 partition on Intelstrata flash(M18)?


thnaks in advance
gan.k


log:
____

root@target> mkfs.jffs2 -d /etc -o myjffs2 -e 0x40000 -p 0x400000;
root@target> flash_eraseall /dev/mtd/1;
root@target> cat myjffs2 > /dev/mtdblock/1;
root@target> mkdir /tmp/jffs2;mount -t jffs2 /dev/mtdblock/1 /tmp/jffs2;
CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x400
root@target> JFFS2 warning: (1700) check_node_data: MTD point returned
len too short: 74 instead of 566.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 74 instead of 566.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 267 instead of 363.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 267 instead of 363.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 978 instead of 1366.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 978 instead of 1366.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 67 instead of 127.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 67 instead of 127.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1467 instead of 1571.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 1467 instead of 1571.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 850 instead of 1038.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 850 instead of 1038.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 766 instead of 1406.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 766 instead of 1406.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 36 instead of 72.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 36 instead of 72.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 310 instead of 1170.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 310 instead of 1170.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 626 instead of 682.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 626 instead of 682.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 178 instead of 198.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 178 instead of 198.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1117 instead of 1597.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 1117 instead of 1597.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 551 instead of 671.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 551 instead of 671.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 834 instead of 1170.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 834 instead of 1170.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 41 instead of 49.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 41 instead of 49.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 606 instead of 1054.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 606 instead of 1054.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1532 instead of 1740.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 1532 instead of 1740.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 302 instead of 594.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 302 instead of 594.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 5 instead of 613.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 5 instead of 613.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1371 instead of 1963.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 1371 instead of 1963.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 436 instead of 1328.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 436 instead of 1328.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1232 instead of 1700.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 1232 instead of 1700.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 548 instead of 1472.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 548 instead of 1472.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 780 instead of 1136.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 780 instead of 1136.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1769 instead of 1781.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 1769 instead of 1781.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 919 instead of 1079.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 919 instead of 1079.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 319 instead of 1007.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 319 instead of 1007.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1292 instead of 1444.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 1292 instead of 1444.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 429 instead of 513.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 429 instead of 513.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 871 instead of 1435.
JFFS2 warning: (1700) check_node_data: Added MTD point returned len
too short: 871 instead of 1435.
JFFS2 warning: (1700) check_node_data: MTD point returned len too
short: 1415 instead of 1731.
root@target>
