Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG3QZ-0000dm-TE
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 13:12:45 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4VDA63O118098
 for <linux-mtd@lists.infradead.org>; Wed, 31 May 2017 09:12:22 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2asw7bkrs8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 31 May 2017 09:12:21 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <paulmck@linux.vnet.ibm.com>;
 Wed, 31 May 2017 09:12:20 -0400
Date: Wed, 31 May 2017 06:12:16 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] bcm47xx: fix build regression
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170530112027.3983554-1-arnd@arndb.de>
 <7b6903a2-ce54-44f9-18ed-a14bd32069ce@broadcom.com>
 <CAK8P3a2-kO==gMDm3E6U8CR-zhwmZGztRy7Trcezf8oZxgn01g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2-kO==gMDm3E6U8CR-zhwmZGztRy7Trcezf8oZxgn01g@mail.gmail.com>
Message-Id: <20170531131216.GJ3956@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 31, 2017 at 12:21:10PM +0200, Arnd Bergmann wrote:
> On Wed, May 31, 2017 at 11:43 AM, Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
> > On 5/30/2017 1:20 PM, Arnd Bergmann wrote:
> >>
> >> An unknown change in the kernel headers caused a build regression
> >> in an MTD partition driver:
> >>
> >> In file included from drivers/mtd/bcm47xxpart.c:12:0:
> >> include/linux/bcm47xx_nvram.h: In function 'bcm47xx_nvram_init_from_mem':
> >> include/linux/bcm47xx_nvram.h:27:10: error: 'ENOTSUPP' undeclared (first
> >> use in this function)
> >>
> >> Clearly we want to include linux/errno.h here.
> >
> >
> > unfortunate that you did not find the commit that caused this build
> > regression. You could produce preprocessor output when it was working to see
> > where errno.h got implicitly included and start looking there for git
> > history.
> 
> I did a 'git bisect run make drivers/mtd/bcm47xxpart.o' now, which pointed to
> 0bc2d534708b ("rcu: Refactor #includes from include/linux/rcupdate.h").
> 
> That commit seems reasonable, it was just bad luck that it caused this
> regression. The commit is currently in the rcu/rcu/next branch of tip.git,
> so Paul could merge the patch there.

Apologies for the inconvenience, not sure why 0day test robot didn't
find this.  Probably because it cannot test each and every driver.  ;-)

This patch, correct?

	https://lkml.org/lkml/2017/5/30/348

							Thanx, Paul
