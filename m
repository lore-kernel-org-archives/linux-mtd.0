Received: from f101.pav1.hotmail.com ([64.4.31.101] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182kFL-0006no-00
	for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2002 04:25:51 +0100
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: burning s19 image to flash..
Date: Sat, 19 Oct 2002 03:25:08 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F101giwHsqhA53ZpEVm00001d7c@hotmail.com>
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

Hi Friends,

Have build s19 image for my mpc857 board. Have included mtd and cramfs.
The physical address of flash and size are given properly as 0x2800000
and 0x800000 respectively.
The flash is AMD's Am29LV320D. Have defined flash start and window size
macros in physmap.c to the one listed above.

Am trying to flash the image using codewarrior flash programmer.
Within few seconds of selecting the 'program' option, am seeing
this message..
"FlashEngine: No data in specified file falls in the programming
range of 0x2800000 to 0x3000000"
While the address range is correct, am unable to make out what
this message means!.
Am newbie to this tool. Any suggestions would be helpful.

The board has serial port. Any suggestions on how to use it to see
state of the flash / board?.

Thanks and Regards,
Vijay




_________________________________________________________________
Surf the Web without missing calls! Get MSN Broadband. 
http://resourcecenter.msn.com/access/plans/freeactivation.asp
