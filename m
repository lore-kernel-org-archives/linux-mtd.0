Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzAbS-0006YB-AS
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 19:40:18 +0000
Received: by mail-oa0-f52.google.com with SMTP id h16so16444543oag.39
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 11:39:56 -0800 (PST)
Date: Fri, 3 Jan 2014 11:39:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: omap2: use nand_base defaults for polled I/O
Message-ID: <20140103193952.GL5631@ld-irv-0074>
References: <1387272992-27948-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA5DA09@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA5DA09@DBDE04.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 06:49:51AM +0000, Pekon Gupta wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >
> >The omap_{read,write}_buf{8,16}() functions are identical to the default
> >nand_base versions. Just let nand_base assign them in the
> >NAND_OMAP_POLLED case.
> >
> >Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >---
> >Compile tested only
> 
> Tested-by: Pekon Gupta <pekon@ti.com>

Thanks.

Pushed to l2-mtd.git.

Brian
