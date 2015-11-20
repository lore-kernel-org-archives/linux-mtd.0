Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzbkE-0007NU-6e
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 02:48:15 +0000
Received: by pacej9 with SMTP id ej9so100799628pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 18:47:53 -0800 (PST)
Date: Thu, 19 Nov 2015 18:47:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] mtd: partitions: add module_mtd_part_parser() helper
Message-ID: <20151120024750.GS64635@google.com>
References: <1447298010-7756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447298010-7756-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 11, 2015 at 07:13:29PM -0800, Brian Norris wrote:
> This can help eliminate some boilerplate by generating the module_init()
> and module_exit() functions, and by automatically assigning the module
> owner.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied both to l2-mtd.git
