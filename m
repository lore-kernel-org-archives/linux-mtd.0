Received: from bay10-f101.bay10.hotmail.com ([64.4.37.101] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8Gl7-0000Pl-Oy
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2004 11:46:17 +0100
From: "Luke Fimmerzane" <lukefimmerzane@hotmail.com>
To: lukefimmerzane@hotmail.com, linux-mtd@lists.infradead.org
Date: Tue, 30 Mar 2004 10:46:14 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <BAY10-F101tICGpPXhe00020b12@hotmail.com>
Subject: More information about problem with Mapping driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I dont know if I made it clear enough in my last email that I am
passing mtdparts information  on the command line to the kernel.
Having spent the last few days looking at it I think that what is
happening is that the mtparts information is not being read by the
kernel... but Im not sure.

Could someone confirm if the kernel message
"mtd: Giving out device 0 to Physically mapped flash" actually means
that the mtd subsystem is working and that it has successfully found
the Stratflash.
The respone to the cat /proc/mtd would certainly suggest to me that
it has assigned dev/0 to my strataflash....
If I'm right in my assessment that the 'mtdparts'  info is not being
read by kernel, is there any way that I can confirm this?

Thanks again,
Luke

_________________________________________________________________
Stay in touch with absent friends - get MSN Messenger 
http://www.msn.co.uk/messenger
