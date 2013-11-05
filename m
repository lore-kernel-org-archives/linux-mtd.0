Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdpNd-0007LH-NU
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 22:45:51 +0000
Date: Tue, 5 Nov 2013 19:45:27 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH -next] mtd: nand: omap: fix error return code in
 omap_nand_probe()
Message-ID: <20131105224526.GA11759@localhost>
References: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
 <001101ced6a8$a18a2c80$e49e8580$%han@samsung.com>
 <CAN8TOE9Eac0LDA+Ke_OCPc_AQGnyYB806pO8JP-qOB1Dr8N2pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE9Eac0LDA+Ke_OCPc_AQGnyYB806pO8JP-qOB1Dr8N2pg@mail.gmail.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, "tony@atomide.com" <tony@atomide.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Daniel Mack <zonque@gmail.com>, yongjun_wei@trendmicro.com.cn,
 avinashphilip@ti.com, "Gupta, Pekon" <pekon@ti.com>,
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

On Tue, Nov 05, 2013 at 01:59:25PM -0800, Brian Norris wrote:
> On Thu, Oct 31, 2013 at 7:18 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> > On Friday, November 01, 2013 9:16 AM, Wei Yongjun wrote:
> >>
> >> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >>
> >> Fix to return a negative error code from the error handling
> >> case instead of 0, as done elsewhere in this function.
> >
> > Commit message is right? :-(
> 
> It sounds OK by my reading. Unless you're having trouble parsing what
> "as done elsewhere in this function" is being applied to. (IOW, is the
> rest of the function returning a negative error code on the error
> paths, or is it returning 0? Of course the answer is the former, but
> it's possible to misread it.) If it helps, I can try to tweak the
> wording a bit when applying this patch.
> 
> Pekon, can I get an Acked-by?
> 

I guess you'd prefer Pekon's ack than mine, but anyway:

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

I'd like to point out this driver has other "mis-behaviors" in returning codes
in some other places.

In particular, this pattern can be found repeatedly:

	if (do_something()) {
		err = -ENXIO;
		goto some_other_place;
	}

Which should probably be:

	err = do_something();
	if (err)
		goto some_other_place;

Wei: maybe you'd like to prepare some more patches?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
