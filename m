Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DXfLY-0000IP-Fl
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 09:09:25 -0400
Message-ID: <42889B68.3070902@yandex.ru>
Date: Mon, 16 May 2005 17:08:56 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Gianluca <gianlucarenzi@eptar.com>
References: <200505161329.17406.gianlucarenzi@eptar.com>
In-Reply-To: <200505161329.17406.gianlucarenzi@eptar.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting a mtd or a mtblock??
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As the first step you may install the last MTD tree from CVS and try it.
Can't help with wrong erasesize issue - I think this should be fixed 
somewhere in the Flash driver level. What does your 'cat /proc/mtd' say?

> Why erasing mtd[n] with flash_eraseall command and mounting mtdblock[n] with 
> mount comand?
> Why not erasing mtdblock[n] and mount mtdblock[n] as mount command uses only 
> BLOCK devices? Is this not completely *TRUE*??
Read about mtd device files in this FAQ:
http://www.linux-mtd.infradead.org/faq/nand.html

> 
> Anyway if I try to launch those commands, here is what system gives to me:
> 
> [ a very long log...]
> ...
> Empty flash at 0x003de780 ends at 0x003de784
> Empty flash at 0x003dfd3c ends at 0x003dfd40
> jffs2_scan_eraseblock(): Node at 0x003e0000 {0x1985, 0x4e76, 0x7ecf000c) has 
> invalid CRC 0x59a7b0b1 (calculated 0xa3ed5d51)
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0004: 0x000c 
> instead
> Any Help?? Any Clue?
Your flash neither contains any right data nor contains all FF. This 
confuses JFFS2. For some reasons flash_eraseall didn't erase your flash 
correctly. I think you should dig your Flash diver.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
