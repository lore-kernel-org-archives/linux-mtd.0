Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DH4Xp-00061U-6K
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 13:37:36 -0500
Message-ID: <424C43E3.3050802@dev.rtsoft.ru>
Date: Thu, 31 Mar 2005 22:39:31 +0400
From: Pavel Kiryukhin <savl@dev.rtsoft.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Pavel Kiryukhin <savl@dev.rtsoft.ru>
Subject: Protection registers and "top parameter" memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I can not write protection registers (OTP) on Intel StrataFlash Wireless 
L18 memory: otp_write reports "all ok", but I get 0xff back.
After some investigation I think I found a reason:
to initiate writing we need issue the Program Protection Register 
command at the parameter's partition base address + some offset.
My flash is so caled "Top Parameter" memory that has parameter partition 
at the top of memory map.
It seems that current driver assumes that Parameter partition starts at 
bottom of memory map.
So I simply changed the direction of "chip walk" in 
cfi_intelext_otp_walk [cfi_cmdset_0001.c] to top->bottom in case of 
Intel StrataFlash (based on cfi->id and cfi->mfr).
The first tested chip now should always correspond to parameter partition.
As I'm new to flash programming please tell me if this is a known issue 
and if not - is my approach correct?
--
I'm not in list so please answer (or cc) to savl@dev.rtsoft.ru
--
Thank you,
Pavel Kiryukhin,
RTSoft, Moscow, Russia.
