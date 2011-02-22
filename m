Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Prssl-0007aG-NQ
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2011 14:06:29 +0000
Received: by qyk32 with SMTP id 32so2634172qyk.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Feb 2011 06:06:26 -0800 (PST)
MIME-Version: 1.0
From: Tiago Maluta <tiago.maluta@gmail.com>
Date: Tue, 22 Feb 2011 11:06:05 -0300
Message-ID: <AANLkTin9WY0sj5ZYNkf+CHgHabj7Z2qAmER8dfhKAQRm@mail.gmail.com>
Subject: mxc_nand support on i.MX51
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sascha Hauer <s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm having issues when trying to flash my i.MX51 board with nandwrite
[1]. This topic was previously discussed on u-boot maillist [2] and it
seems that NFC version needed by i.MX51 processor isn't supported yet.
Looking at the code [3] it seems that is already ported [4] but
Freescale code (2.6.35) [5] differs from mainline (mxc_nand.c)
although copyright seems to be more recent. I'm Cc Sascha since he is
driver creator and I'd like to ask if somebody in the list have
problems to flash NAND on i.MX51 boards? By now I can note [6] that
the _same_ u-boot.bin flashed by Freescale proprietary tool (ATK) is
different [purposely changes some bytes from original .bin file] from
flashing by "nandwrite" or even "dd" [7].

[1] nandwrite -p /dev/mtd0 u-boot.bin
[2] http://lists.denx.de/pipermail/u-boot/2011-January/084949.html
[3] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=drivers/mtd/nand/mxc_nand.c;h=ef932ba55a0b34967a8fcd48a1f6f43d75ad20b3;hb=f5412be599602124d2bdd49947b231dd77c0bf99
[4] 44: #define nfc_is_v3_2()           cpu_is_mx51()
[5] http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=IMX51ANDROID_V92&nodeId=018rH3ZrDR633B&fpsp=1&tab=Design_Tools_Tab
(link Linux 2.6.35 Source Code Files 2010.11 for i.MX51. Engineering
Release)
[6] comparing using u-boot "nand dump 0"
[7] http://farm6.static.flickr.com/5130/5320148028_7da19d3cf2_o.png

Thanks,

--tm
