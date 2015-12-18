Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA1sR-0003cd-NQ
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 20:43:48 +0000
Received: by mail-pa0-x234.google.com with SMTP id wq6so65705193pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 12:43:26 -0800 (PST)
Date: Fri, 18 Dec 2015 12:43:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: docg4: simplify error case
Message-ID: <20151218204324.GN10460@google.com>
References: <1450467593-90957-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450467593-90957-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 18, 2015 at 11:39:53AM -0800, Brian Norris wrote:
> Other refactorings have left the 'fail' label much simpler, so it
> shouldn't have to handle the failed allocation case.
> 
> This also fixes a -Wshadow warning.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied
