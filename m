Received: from [213.165.64.20] (helo=mail.gmx.net)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSFG3-0000XJ-13
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 19:40:03 +0000
From: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/1] mtd: m25p80: Add erase timer to status polling.
Date: Tue,  5 Jan 2010 20:40:00 +0100
Message-Id: <1262720401-23480-1-git-send-email-andreas.fenkart@streamunlimited.com>
Cc: andreas.fenkart@streamunlimited.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

I experimented with adding an erase timer to delay the first
status poll after sector erase, see patch.
The erase delay is updated dynamically based on whether the flash
is idle on the first status poll:

  if (idle)
    /* favor flash latency/throughput over cpu */
    flash->erase_delay -= HZ / 20; /* 50 ms */
  else
    flash->erase_delay += HZ / 100; /* 10 ms */


performance:

Test was done with spansion s25sl12801, 16384 Kbytes.  
Erase cmd was 'flash_erase /dev/mtd1 0x0 0x15'
The cpu is an ARM926EJ-S with 300MHz
The SPI clock was set to 36MHz
Seconds as report by 'real' from time cmd
dd parameters: read blocks 29056, write blocks 2688,
 block size 512 

fibonnacci 33  |  with timer  | without
----------------------------------------
flash idle     | 1.46s        | 1.47s
flash read     | 6.21s        | 6.86s
flash erase    | 1.50s        | *3.91s*
flash write    | 3.70s        | 3.7s

flash read
---------------------------------------
cpu idle       | 12.29s       | 12.2s
cpu busy       | 30.60s       | 33.1s

flash write
---------------------------------------
cpu idle       | 5.90s        | 5.9s
cpu busy       | 11.00s       | 11.1s

flash erase
----------------------------------------
cpu idle       | 5.90s        | 5.86s
fibonnacci 100 | 6.01s        | 5.99s

Except for erase the times are similar. Erasing takes about
the same time in both cases, while the cpu is less loaded with
the patch.
