Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTueU-0003lI-NS
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:26:47 +0000
Message-ID: <1410881182.28850.53.camel@sauron.fi.intel.com>
Subject: Re: [PATCH mtd-utils] libmtd: don't ignore "region index" parameter
 in mtd_regioninfo()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 16 Sep 2014 18:26:22 +0300
In-Reply-To: <20140915174821.GB14832@ld-irv-0074>
References: <1407294015-27884-1-git-send-email-Wei.Yang@windriver.com>
 <20140915173152.GA14832@ld-irv-0074> <20140915174821.GB14832@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Wei.Yang@windriver.com, w90p710@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-09-15 at 10:48 -0700, Brian Norris wrote:
> ioctl(MEMGETREGIONINFO) has one input parameter (regionindex) and three
> output parameters (info about the erase region). There are two problems
> in mtdinfo/libmtd here:
> 
>  1. mtdinfo.c doesn't initialize its region_info_user struct, instead
>     passing uninitialized data to mtd_regioninfo()
> 
>  2. mtd_regioninfo() fails to utilize the 'regidx' parameter to fill out
>     the regionindex parameter properly, so the garbage from mtdinfo.c is
>     propagated to the ioctl()

Thanks, I never had flashes with multiple regions so this code path was
probably never tested.

-- 
Best Regards,
Artem Bityutskiy
