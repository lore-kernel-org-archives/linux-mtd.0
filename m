Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DSWiX-00016A-Pm
	for linux-mtd@lists.infradead.org; Mon, 02 May 2005 04:55:54 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: manningc2@actrix.gen.nz
In-Reply-To: <20050501195119.2F61115607@desire.actrix.co.nz>
References: <20050429212410.49709.qmail@web54109.mail.yahoo.com>
	<20050501195119.2F61115607@desire.actrix.co.nz>
Content-Type: text/plain; charset=KOI8-R
Date: Mon, 02 May 2005 12:55:24 +0400
Message-Id: <1115024124.3483.19.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd emulation --> NAND?
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

В Пнд, 02/05/2005 в 07:51 +1200, Charles Manning пишет:
> I use a "high level"  mtd NAND emulation that I wrote for YAFFS testing. This 
> just provides the NAND mtd functions and uses none of the mtd.
> 
> I'm hoping there's a NAND emulation that emulates NAND at a very low level by 
> accepting ALE/CLE and byte read/writes. This would provide, say, emulation of 
> a 256Mbyte NAND part while exercising the whole of nand.c etc. This allows 
> complete testing of file system + mtd code without having any hardware on 
> hand.
> 
You might take a look at drivers/mtd/nand/nandsim.c

It emulates NAND in RAM but I think it will be problematic to allocate
256 MiB of memory. But you may think of some trick... Nonetheless, I
used it to emulate 64MiB flashes and it works fine and even may emulate
some delays. I also may perform logging of NAND operations.

Cheers,
Artem.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
