Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WShHT-0004Pd-Aw
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 06:25:44 +0000
Received: by mail-pd0-f172.google.com with SMTP id p10so1462853pdj.3
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 23:25:21 -0700 (PDT)
Date: Tue, 25 Mar 2014 23:25:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/2] mtd: omap2: Use devm_ioremap_resource()
Message-ID: <20140326062518.GZ31517@norris-Latitude-E6410>
References: <000201cf279a$49891080$dc9b3180$%han@samsung.com>
 <000301cf279a$f9722d10$ec568730$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000301cf279a$f9722d10$ec568730$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 "'Gupta, Pekon'" <pekon@ti.com>,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 12, 2014 at 11:34:37AM +0900, Jingoo Han wrote:
> Use devm_ioremap_resource() in order to make the code simpler,
> and remove redundant return value check of platform_get_resource()
> because the value is checked by devm_ioremap_resource(). Also,
> 'unsigned long mem_size' is removed from 'struct omap_nand_info',
> because the 'mem_size' variable is not necessary anymore.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Required a bit of rebasing, since Pekon has been making a few changes.
Pushed to l2-mtd.git!

Thanks,
Brian
