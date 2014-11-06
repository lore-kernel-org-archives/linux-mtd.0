Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmBHO-0001xc-HB
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 00:50:27 +0000
Date: Thu, 6 Nov 2014 08:50:37 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Zhi Li <lznuaa@gmail.com>
Subject: Re: mtd: nand: lock unlock function
Message-ID: <20141106005036.GA19030@shldeISGChi005.sh.intel.com>
References: <CAHrpEqSum1__d5Y1tysEzpa_MGuQSWfOW=m4idSxzCTdGbNKTQ@mail.gmail.com>
 <20141105205706.GP23619@ld-irv-0074>
 <CAHrpEqTQQ+YBnBY-fj9uW1bAMn-t_dmdVR9KuJR+2E+uA4vZ2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHrpEqTQQ+YBnBY-fj9uW1bAMn-t_dmdVR9KuJR+2E+uA4vZ2Q@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, White Ding <bpqw@micron.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 boris.brezillon@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 05, 2014 at 04:00:29PM -0600, Zhi Li wrote:
> On Wed, Nov 5, 2014 at 2:57 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > +
> >
> > On Wed, Nov 05, 2014 at 02:31:34PM -0600, Zhi Li wrote:
> >> Does any know the reason why there are nand_lock and nand_unlock
> >> function in nand_base.c, but
> >>
> >>         mtd->_lock = NULL;
> >>         mtd->_unlock = NULL;
> >>
> >> Not set to nand_lock and nand_unlock?
> >
> > Possible answers:
> >
> >  * Lack of testing
> >
> >  * The LOCK/UNLOCK opcodes are not supported by all vendors
> >
> >  * Even the vendors that support them don't do so consistently (not sure
> >    about this one; I know Micron supports this in some cases)
> >
> >  * The opcodes aren't even documented (again, I'm not even sure about
> >    this one; but many Micron datasheets I see don't mention LOCK/UNLOCK.
> >    I recall that other similar lock/protection implementations are
> >    secret to some extent, and are intentionally omitted from the
> >    datasheets)
> 
> Yes, we recently met a problem with micron flash. Need send unlock command.
> The datasheet I get from micron
> MT29F8G08ABACA, MT29F8G16ABACA, MT29F8G08ABBCA,
> MT29F8G16ABBCA, MT29F16G08ADACA, MT29F16G16ADACA,
> MT29F16G08ADBCA , MT29F16G16ADBCA
> 
> support it.
> But not sure if it is public document.
> 
could you please describe what is the problem?

thanks
Huang Shijie
