Received: from bay0-omc2-s11.bay0.hotmail.com ([65.54.246.147])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GLSYF-0008OK-TM
	for linux-mtd@lists.infradead.org; Thu, 07 Sep 2006 23:40:53 +0100
Message-ID: <BAY110-F14E8B880BD6E4506273ABABC360@phx.gbl>
In-Reply-To: <1156976978.29250.233.camel@localhost.localdomain>
From: "Han Chang" <posaune@hotmail.com>
To: tglx@linutronix.de
Subject: nand_bbt.c
Date: Thu, 07 Sep 2006 15:40:21 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Thomas,

I'm looking the nand bbt and noticed the file is written by you. I'm just 
curious in order to enable flash based bbt, what needs to be done at driver 
level. I enabled flag "NAND_USE_FLASH_BBT". Things are not quite working. 
Anything I'm missing here? Is there any doc other than the comments in the 
code that I can looked at?

Many thanks!

Han
