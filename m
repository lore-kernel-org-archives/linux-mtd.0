Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BcTkw-0000DC-Hp
	for linux-mtd@lists.infradead.org; Mon, 21 Jun 2004 14:43:00 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004062114533820050
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jun 2004 14:53:38 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812C9@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Mon, 21 Jun 2004 14:44:43 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC Mil Plus 32 question erase size erase shift????
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

  Trying to get the bbt stuff working for diskonchip Mil Plus 32.  Question
in nand_scan_bbt, I pass a erasesize of 8000 (32k bytes).  Is this the
correct size???  If so then I get 256 bytes of mem allocated for this->bbt
but then it fails (out of memory) when I try to allocate 88ooo bytes for the
buffer.  Is this correct?  544K bytes for that buffer.  My proc/meminfo
shows much more memory
# cat /proc/meminfo
        total:    used:    free:  shared: buffers:  cached:
Mem:  28512256  3280896 25231360        0        0  1691648
Swap:        0        0        0
MemTotal:        27844 kB
MemFree:         24640 kB
MemShared:           0 kB
Buffers:             0 kB
Cached:           1652 kB
SwapCached:          0 kB
Active:           1080 kB
Inactive:          788 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:        27844 kB
LowFree:         24640 kB
SwapTotal:           0 kB
SwapFree:            0 kB
#

What could be the cause???  Or am I not calculating something right????

Thanks,
John
