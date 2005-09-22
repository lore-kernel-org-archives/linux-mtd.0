Received: from bay18-f12.bay18.hotmail.com ([65.54.187.62] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIIYX-0003sj-PF
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 00:19:56 -0400
Message-ID: <BAY18-F12FD5D013FA03D0DF29370DA970@phx.gbl>
From: "Hsu sabrina" <sabrina.hsu1@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 22 Sep 2005 12:01:19 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=big5; format=flowed
Cc: sabrina.hsu1@hotmail.com
Subject: No RedBoot partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Linux gurus!
I’ve got a problem with booting my kernel. The kernel on reference board 
boots successfully while on my board fails. The only difference is a flash 
memory I use in my board. I understand that I need to make some adjustments 
but unfortunately I’m not a linux specialist. I attached the boot log and 
marked differences in booting process.
Reference board:
6 RedBoot partitions found on MTD device phys_mapped_flash"
Creating 6 MTD partitions on "phys_mapped_flash":
0x00000000-0x00040000 : "RedBoot"
0x00040000-0x00100000 : "kernel"
0x00100000-0x00e80000 : "root"
0x00e80000-0x01fe0000 : "unallocated"
0x01fe0000-0x01fff000 : "FIS directory"

My board:
No RedBoot partition table detected in phys_mapped_flash
Using physmap partition definition
Creating 3 MTD partitions on "phys_mapped_flash":
0x00000000-0x00100000 : "Bootloader"
0x00100000-0x00300000 : "Kernel"
0x00300000-0x02000000 : "UserFS"

As you can see when booting kernel it can not find partitions. Did anyone 
experience the same?
Pease help me find a solution to this problem, give an advice or link to 
resources can help me.

Thanks in advance,
Sabrina

_________________________________________________________________
立即申請 MSN Mobile 服務：在您的手機上收發 MSN Hotmail 
http://msn.com.tw/msnmobile 
