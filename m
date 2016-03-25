Received: from cmccmta2.chinamobile.com ([221.176.66.80])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajNzj-0007SP-EJ
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 09:25:35 +0000
Date: Fri, 25 Mar 2016 17:24:41 +0800
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drivers/mtd: make several functions return bool
Message-ID: <20160325092441.GA5738@yaowei-K42JY>
References: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
 <56F4A87B.5090100@easystack.cn>
 <20160325063153.GA3319@yaowei-K42JY> <56F4EF87.4000003@nod.at>
 <20160325095821.59cdc391@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160325095821.59cdc391@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 25, 2016 at 09:58:21AM +0100, Boris Brezillon wrote:
> On Fri, 25 Mar 2016 08:57:59 +0100
> Richard Weinberger <richard@nod.at> wrote:
> 
> > Am 25.03.2016 um 07:31 schrieb Yaowei Bai:
> > > On Fri, Mar 25, 2016 at 10:54:51AM +0800, Dongsheng Yang wrote:
> > >> ccing: Brian and Richard
> > >>
> > >> Hi Yao,
> > >>     Is that really necessary? I am not sure how much benefit we can
> > >> achieve from this change.
> > >> Could you explain more?
> > > 
> > > Yes, according to these functions' name, a boolean return value is more
> > > suitable and matchable.
> > > 
> > > Also personally think this change maybe benfit function's return value 
> > > storage in the stack when called on certain architectures.
> > 
> > On which archs? And what exactly is the benefit?
> > I agree that bool might be a better choice for new functions
> > but here you're touching existing and working(!) code.
> > The only outcome is git history pollution that makes git blame
> > less efficient.
> 
> Indeed, you raised a good point. Having useless changes pollute git
> blame output may be problematic. Not sure I want to apply those patches
> anymore :-/.
> 
> Anyway, Yao, I'm sure you can find other usefull things to contribute.

OK, thanks for reviewing.

> 
> -- 
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
