Received: from tomts5.bellnexxia.net ([209.226.175.25] helo=tomts5-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HqBM-0008EF-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 19:15:52 +0100
Date: Tue, 11 Jun 2002 14:15:50 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
In-Reply-To: <200206111405453.SM02488@there>
Message-ID: <Pine.LNX.4.44.0206111411450.469-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Mark,

On Tue, 11 Jun 2002, Mark Meade wrote:

> Is the "erase_all" necessary?  Does this delete the Bad Block Table on the 
> DoC 2000 or Millennuim?

I agree erase_all is dangerous because it will delete the bad block table.  
The smarter way of inactivating the NFTL driver would be obfuscating the 
NFTL headers or implementing the previously mentioned ioctl() interface to 
NFTL layer or relying on the M-Sys native MS-DOS based NFTL format 
utility.

> I was able to get a Millennium booting without any "erase_all" commands.  I 
> guess I'm not clear on why this is needed.

I was afraid that the NFTL driver would keep updating the /dev/mtd0 device 
even when nftl_format was running.

Best regards,

Ilguiz
