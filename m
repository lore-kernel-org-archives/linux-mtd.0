Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ZnB-0002wB-Gh
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 08:33:18 +0000
Received: by wyb28 with SMTP id 28so3343255wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 01:33:16 -0700 (PDT)
Subject: Re: [PATCH] mtdswap: fix printk format warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20110329123523.74735727.randy.dunlap@oracle.com>
References: <20110329131133.c74af94d.sfr@canb.auug.org.au>
	<20110329123523.74735727.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 11:30:53 +0300
Message-ID: <1301646653.2789.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-29 at 12:35 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> The number is actually a sizeof(), so using %zu for it builds
> cleanly on 32-bit or 64-bit.
> 
> drivers/mtd/mtdswap.c:1456: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Pushed to l2-mtd-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
