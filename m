Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsm7Q-0007xY-Fe
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 04:18:53 +0000
Received: by mail-pa0-f47.google.com with SMTP id kq14so3890402pab.34
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 20:18:29 -0800 (PST)
Date: Mon, 16 Dec 2013 20:17:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: sh_flctl: Remove unneeded CONFIG_OF
Message-ID: <20131217041756.GA12034@norris-Latitude-E6410>
References: <1386426661-24549-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386426661-24549-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 07, 2013 at 11:31:01AM -0300, Ezequiel Garcia wrote:
> Since the of_mtd header provides dummy stubs for !CONFIG_OF, it's safe
> to remove the #ifdef CONFIG_OF. Build tested only.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Looks good. Also build tested with !CONFIG_OF (the relevant case).
Pushed to l2-mtd.git. Thanks!

Brian
