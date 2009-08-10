Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaOvC-0002yK-N9
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:03:59 +0000
Subject: Re: mmotm 2009-08-06-00-30 uploaded (mtd)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Mundt <lethal@linux-sh.org>
In-Reply-To: <20090807033448.GA32592@linux-sh.org>
References: <200908060733.n767X6mN023120@imap1.linux-foundation.org>
	<20090806190233.6d4b4e28.randy.dunlap@oracle.com>
	<20090806192513.53f6488b.akpm@linux-foundation.org>
	<20090807033448.GA32592@linux-sh.org>
Content-Type: text/plain
Date: Mon, 10 Aug 2009 10:01:35 +0300
Message-Id: <1249887695.19638.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Magnus Damm <damm@igel.co.jp>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-08-07 at 12:34 +0900, Paul Mundt wrote:
> [PATCH] mtd: onenand: select MTD_PARTITIONS.
> 
> All of the onenand drivers depend on mtd partition support being compiled
> in, so just select it. Fixes up build breakage:
> 
> drivers/built-in.o: In function `generic_onenand_remove':
> generic.c:(.devexit.text+0x80): undefined reference to `del_mtd_partitions'
> 
> Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>

Hopefully someday we are going to remove this config options, remove
the mtdpart module, and make partitions mandatory. Currently it is
a mess, IMO.

I've just put this patch to my l2-mtd-2.6.git tree.

Artem.
