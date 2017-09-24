Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dw2CG-0002xy-TG
 for linux-mtd@lists.infradead.org; Sun, 24 Sep 2017 08:23:31 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 dwmw2@infradead.org, computersforpeace@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 trivial@kernel.org
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
Date: Sun, 24 Sep 2017 10:23:25 +0200
Message-ID: <9307201.RrdVcHfbLZ@blindfold>
In-Reply-To: <20170924102006.5aa42982@bbrezillon>
References: <20170923201314.GA14742@amd>
 <b45f83d5-6a0b-64f2-2a3a-708e1a1e7f90@gmail.com>
 <20170924102006.5aa42982@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Sonntag, 24. September 2017, 10:20:06 CEST schrieb Boris Brezillon:
> On Sat, 23 Sep 2017 23:10:26 +0200
> 
> Marek Vasut <marek.vasut@gmail.com> wrote:
> > On 09/23/2017 10:13 PM, Pavel Machek wrote:
> > > C++ comments look wrong in kernel tree. Fix one.
> > 
> > AFAIR they are now (sadly) accepted, but this patch works for me.
> 
> Works for me too. Here is my
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> > Would be nice if trivial could pick it.
> 
> Hm, I'd recommend not doing that, otherwise we might end up with a
> conflict if a patch modify something in this area.

Let's carry it via MTD.
BTW: Shouldn't it be s/kernel/comment/ in the subject line?

Thanks,
//richard
