Received: from [202.106.187.156] (helo=sina.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18TieG-00087b-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2003 13:11:04 +0000
Date: Wed, 1 Jan 2003 21:42:3 +0800
From: "thierry" <jokyman@sina.com>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Subject: jedec probe problem
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: 7bit
Message-Id: <E18TieG-00087b-00@pentafluge.infradead.org>
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

my flash is hy29lv160 in word mode and buswidth is 16 bit.
I use jedec_probe_chip() to detect my flash.
According to the data sheet of my flash,I set:
cfi->addr_unlock1 = 0x555;
cfi->addr_unlock2 = 0x2aa;
but when it execute:
	cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X16, NULL);
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X16, NULL);
	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X16, NULL);
	cfi->mfr = jedec_read_mfr(map, base, osf);
it stop after the third cfi_send_gen_cmd and can't read the manufacture code.
Can someone point out my mistake?
Thanks!

	Thierry Zhong
