Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjexP-0001yV-Oe
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 01:55:24 +0000
Received: by mail-pa0-f52.google.com with SMTP id fa1so4377536pad.39
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 18:55:02 -0700 (PDT)
Date: Wed, 29 Oct 2014 18:54:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF chips
Message-ID: <20141030015459.GG23619@ld-irv-0074>
References: <1414020181-8855-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414020181-8855-1-git-send-email-andrea.adami@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>,
 linux-mtd@lists.infradead.org, Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 23, 2014 at 01:23:01AM +0200, Andrea Adami wrote:
> After '#echo mem > /sys/power/state' some devices can not be properly resumed
> because apparently the MTD Partition Configuration Register has been reset
> to default thus the rootfs cannot be mounted cleanly on resume.
> An example of this can be found in the SA-1100 Developer's Manual at 9.5.3.3
> where the second step of the Sleep Shutdown Sequence is described:
> "An internal reset is applied to the SA-1100. All units are reset...".
> 
> As workaround we refresh the PCR value as done initially on chip setup.
> 
> This behavior and the fix are confirmed by our tests done on 2 different Zaurus
> collie units with kernel 3.17.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Pushed to l2-mtd.git/for-3.18. Changed the author to Dmitry and added
the following:

Fixes: 812c5fa82bae: ("mtd: cfi_cmdset_0001.c: add support for Sharp LH28F640BF NOR")
Cc: <stable@vger.kernel.org> # 3.16+

Thanks,
Brian
