Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeJsN-0007Wb-BT
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 07:19:36 +0000
Received: by mail-pa0-f44.google.com with SMTP id fb1so192537pad.31
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 23:19:13 -0800 (PST)
Date: Wed, 6 Nov 2013 23:19:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH -next] mtd: nand: omap: fix error return code in
 omap_nand_probe()
Message-ID: <20131107071909.GB3805@norris.computersforpeace.net>
References: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
 <001101ced6a8$a18a2c80$e49e8580$%han@samsung.com>
 <CAN8TOE9Eac0LDA+Ke_OCPc_AQGnyYB806pO8JP-qOB1Dr8N2pg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA31818@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA31818@DBDE04.ent.ti.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, "tony@atomide.com" <tony@atomide.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Daniel Mack <zonque@gmail.com>,
 "yongjun_wei@trendmicro.com.cn" <yongjun_wei@trendmicro.com.cn>,
 "avinashphilip@ti.com" <avinashphilip@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 06, 2013 at 06:06:25PM +0000, Pekon Gupta wrote:
> > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > > On Thu, Oct 31, 2013 at 7:18 PM, Jingoo Han <jg1.han@samsung.com>
> > >> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > >>
> > >> Fix to return a negative error code from the error handling
> > >> case instead of 0, as done elsewhere in this function.
> > >
> > > Commit message is right? :-(
> > 
> > It sounds OK by my reading. Unless you're having trouble parsing what
> > "as done elsewhere in this function" is being applied to. (IOW, is the
> > rest of the function returning a negative error code on the error
> > paths, or is it returning 0? Of course the answer is the former, but
> > it's possible to misread it.) If it helps, I can try to tweak the
> > wording a bit when applying this patch.
> > 
> > Pekon, can I get an Acked-by?
> > 
> Yes sure .. Sorry I was away from both mailbox and boards.

No problem.

> Acked-by: Pekon Gupta <pekon@ti.com>
> 
> And thanks much Wei Yongjun for fixing this .

Thanks. Pushed to l2-mtd.git with a slight tweak in the description.

Brian
