Received: from fep04-mail.bloor.is.net.cable.rogers.com ([66.185.86.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YJun-00007s-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 05:47:09 +0000
Date: Tue, 14 Jan 2003 01:16:17 -0500 (EST)
From: Ilguiz Latypov <ilatypov@infradead.org>
To: Marcus Birkin <marcus.birkin@bigfooot.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Grub on DiskOnChip2000
In-Reply-To: <200301140544.33267.marcus.birkin@bigfooot.com>
Message-ID: <Pine.LNX.4.44.0301140109500.29365-100000@localhost.localdomain>
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

There is the README_DiskOnChip file that appears after applying the patch
from the patches/ directory.  It recommends to start these commands before
starting the configure script:

   aclocal && automake && autoconf

The above commands will re-generate the configure script and Makefile.in
files.  The patch itself won't modify the configure script and Makefile.in
just because it is possible to re-generate the latter files once their
templates are patched.

On Tue, 14 Jan 2003, Marcus Birkin wrote:

> I've got to the stage where i compile grub, it compiles with out error. But 
> theres no grub_firmware in /stage1.

-- 
Ilguiz Latypov
Montreal, Quebec
Canada

tel. +1 (514) 526 6911
