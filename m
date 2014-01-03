Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzAeM-0006es-7I
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 19:43:19 +0000
Received: by mail-ig0-f178.google.com with SMTP id ut6so1880916igb.5
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 11:42:55 -0800 (PST)
Date: Fri, 3 Jan 2014 11:42:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: onenand: fix warning (integer used as pointer)
Message-ID: <20140103194251.GM5631@ld-irv-0074>
References: <1387273090-28216-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387273090-28216-1-git-send-email-computersforpeace@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 01:38:10AM -0800, Brian Norris wrote:
> Fixes this sparse warning:
> 
>     CHECK   drivers/mtd/onenand/generic.c
>   drivers/mtd/onenand/generic.c:61:62: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Compile tested only

Pushed to l2-mtd.git.

Brian
