Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC40r-0003jl-6Z
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 08:43:34 +0000
Received: by mail-pd0-f182.google.com with SMTP id r10so160508pdi.41
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2013 01:43:11 -0700 (PDT)
Date: Wed, 21 Aug 2013 01:43:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/7] mtd: sm_ftl: Staticize local symbols
Message-ID: <20130821084308.GF31788@brian-ubuntu>
References: <004001ce933d$2e2c5af0$8a8510d0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004001ce933d$2e2c5af0$8a8510d0$@samsung.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 07, 2013 at 04:10:21PM +0900, Jingoo Han wrote:
> These local symbols are used only in this file.
> Fix the following sparse warnings:
> 
> drivers/mtd/sm_ftl.c:25:25: warning: symbol 'cache_flush_workqueue' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:44:9: warning: symbol 'sm_attr_show' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:57:24: warning: symbol 'sm_create_sysfs_attributes' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:110:6: warning: symbol 'sm_delete_sysfs_attributes' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:574:5: warning: symbol 'sm_get_media_info' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:881:17: warning: symbol 'sm_get_zone' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:902:6: warning: symbol 'sm_cache_init' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:912:6: warning: symbol 'sm_cache_put' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:920:5: warning: symbol 'sm_cache_get' was not declared. Should it be static?
> drivers/mtd/sm_ftl.c:931:5: warning: symbol 'sm_cache_flush' was not declared. Should it be static?
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Applied the whole series to l2-mtd.git. Thanks!

Brian
