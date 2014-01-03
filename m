Received: from mail-qc0-x230.google.com ([2607:f8b0:400d:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzAaz-0006Wh-6k
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 19:39:49 +0000
Received: by mail-qc0-f176.google.com with SMTP id i8so14897099qcq.21
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 11:39:27 -0800 (PST)
Date: Fri, 3 Jan 2014 11:39:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand-gpio: don't waste memory for OF failure
Message-ID: <20140103193924.GK5631@ld-irv-0074>
References: <1387272830-27514-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387272830-27514-1-git-send-email-computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 01:33:50AM -0800, Brian Norris wrote:
> We shouldn't try to allocate a resource until we're sure the
> of_property_read_u64() call didn't fail. This is especially important if
> we use this code for both CONFIG_OF and !CONFIG_OF builds, since
> of_property_read_u64() will always return -ENOSYS for !CONFIG_OF.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Compile tested only

Pushed to l2-mtd.git.

Brian
