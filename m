Received: from tomts12.bellnexxia.net ([209.226.175.56] helo=tomts12-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164NJP-00086W-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2001 14:16:16 +0000
Date: Thu, 15 Nov 2001 09:25:00 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: SHIKUILIANG <klshi_163@163.net>
cc: <shamalin@linpus.com.tw>,
   Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: =?gb2312?B?RXJhc2Ugc2l6ZSBwcm9ibGVt?=
In-Reply-To: <3BF3B9C1.21848@bjapp3>
Message-ID: <Pine.LNX.4.33.0111150920460.13060-100000@server.superbt.com>
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

Hello,

Try commenting out the 8K check in the nft_format.c.

As for the kernel compilation, make sure you removed the original
drivers/mtd , include/linux/mtd directories and copied the respective
directories from the CVS tree.  I advise against using the current version
of the patchin.sh script because it creates symbolic links named like
'*.h'.

Ilguiz

On Thu, 15 Nov 2001, SHIKUILIANG wrote:

> Erase size not 8k, I'am confused!
