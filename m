Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTgrO-0004a1-GE
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 21:29:35 +0000
Received: by fabs1 with SMTP id s1so1003655fab.36
 for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2011 13:29:32 -0800 (PST)
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 24 Nov 2011 23:29:24 +0200
In-Reply-To: <878vn5xml5.fsf@free.fr>
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda> <878vn5xml5.fsf@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1322170169.2216.5.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-11-24 at 22:00 +0100, Robert Jarzmik wrote:
> > I'm on linux-next.  They're all going to hit linux next soon right?
> Euh, I don't know, it's Artem decision there, as he's taking my patches.

Sorry, I've just noticed that I actually pushed out only some of your
patches. Fixed now - pushed the whole series and added Reviewed-by.
Please, check. There are a couple of sparse/gcc-4.6 warnings still there
when I apply whole series:

  CHECK   drivers/mtd/devices/docg3.c
drivers/mtd/devices/docg3.c:577:20: warning: dubious: !x | y
  CC [M]  drivers/mtd/devices/docg3.o
drivers/mtd/devices/docg3.c: In function ‘doc_write_page_ecc_init’:
drivers/mtd/devices/docg3.c:577:6: warning: suggest parentheses around operand of ‘!’ or change ‘|’ to ‘||’ or ‘!’ to ‘~’ [-Wparentheses]
drivers/mtd/devices/docg3.c: At top level:
drivers/mtd/devices/docg3.c:1050:12: warning: ‘doc_get_erase_count’ defined but not used [-Wunused-function]
  CHK     include/linux/version.h

Artem.
