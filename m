Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeKp3-0000Ry-Vn
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 08:20:16 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MVV00K4YWH031G0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 17:19:48 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>,
 "'Gupta, Pekon'" <pekon@ti.com>
References: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
 <001101ced6a8$a18a2c80$e49e8580$%han@samsung.com>
 <CAN8TOE9Eac0LDA+Ke_OCPc_AQGnyYB806pO8JP-qOB1Dr8N2pg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA31818@DBDE04.ent.ti.com>
 <20131107071909.GB3805@norris.computersforpeace.net>
In-reply-to: <20131107071909.GB3805@norris.computersforpeace.net>
Subject: Re: [PATCH -next] mtd: nand: omap: fix error return code in
 omap_nand_probe()
Date: Thu, 07 Nov 2013 17:19:48 +0900
Message-id: <000301cedb92$1fa1f920$5ee5eb60$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Wei Yongjun' <weiyj.lk@gmail.com>, tony@atomide.com,
 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>,
 'Linux Kernel' <linux-kernel@vger.kernel.org>,
 'Daniel Mack' <zonque@gmail.com>, yongjun_wei@trendmicro.com.cn,
 avinashphilip@ti.com, linux-mtd@lists.infradead.org,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, November 07, 2013 4:19 PM, Brian Norris wrote:
> On Wed, Nov 06, 2013 at 06:06:25PM +0000, Pekon Gupta wrote:
> > > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > > > On Thu, Oct 31, 2013 at 7:18 PM, Jingoo Han <jg1.han@samsung.com>
> > > >> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > > >>
> > > >> Fix to return a negative error code from the error handling
> > > >> case instead of 0, as done elsewhere in this function.
> > > >
> > > > Commit message is right? :-(
> > >
> > > It sounds OK by my reading. Unless you're having trouble parsing what
> > > "as done elsewhere in this function" is being applied to. (IOW, is the
> > > rest of the function returning a negative error code on the error
> > > paths, or is it returning 0? Of course the answer is the former, but
> > > it's possible to misread it.) If it helps, I can try to tweak the
> > > wording a bit when applying this patch.
> > >
> > > Pekon, can I get an Acked-by?
> > >
> > Yes sure .. Sorry I was away from both mailbox and boards.
> 
> No problem.
> 
> > Acked-by: Pekon Gupta <pekon@ti.com>
> >
> > And thanks much Wei Yongjun for fixing this .
> 
> Thanks. Pushed to l2-mtd.git with a slight tweak in the description.

Hi Norris,

I checked the patch in l2-mtd.git.
The commit message looks good.
I understand what the patch means.
Thank you.

Best regards,
Jingoo Han
