Received: from msr61.hinet.net ([168.95.4.161] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177sdz-0001Qq-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 07:52:15 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: <yuanfei@eware.com.sg>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: MTD on L7205DB and AM29LV160DT
Date: Wed, 15 May 2002 14:52:02 +0800
Message-ID: <000301c1fbdd$053ea3e0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3CE24BAC.1040005@eware.com.sg>
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

You need to probe the chip in jedec_probe.c and write own map code in
maps directory. MTD distribution does not support AM29LV160DT, so you
have to tell mtd how to recognize the flash(jedec_probe.c) and how to
use your flash(yourmap.c).

Steve Tsai

Hello, I am currently trying to turn on MTD driver for above hardware 
configuration.
I have turn on:
MTD core support
ROM chips in bus mapping
CFI support
physical mapping of flash chip.

but after boot my kernel, there is nothing happen to the MTD driver. It 
seems it does not working at all.

does any one can tell me what kinds of config I should use. to make it 
working??

thanks.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
