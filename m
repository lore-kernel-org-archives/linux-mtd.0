Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9Jpm-0005wG-Ko
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 22:46:39 +0000
Received: by mail-pg0-x242.google.com with SMTP id 3so3241986pgd.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 14:46:18 -0800 (PST)
Date: Tue, 22 Nov 2016 14:46:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Colin King <colin.king@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdswap: fix spelling mistake "erassure" -> "erasure"
Message-ID: <20161122224615.GJ77253@google.com>
References: <20161028182559.7887-1-colin.king@canonical.com>
 <1477680707.7945.13.camel@perches.com>
 <20161122193753.GG77253@google.com>
 <1479850347.1942.24.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479850347.1942.24.camel@perches.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 22, 2016 at 01:32:27PM -0800, Joe Perches wrote:
> On Tue, 2016-11-22 at 11:37 -0800, Brian Norris wrote:
> > Thanks, these all look good but:
> > 
> >  (a) you didn't provide a Signed-off-by and
> >  (b) your patch is full of non-breaking spaces (0xA0), instead of proper
> >  ASCII spaces (0x20)
> > 
> > I feel like we've had this conversation before about your Evolution
> > mailer a long time ago; you still haven't fixed that?
> > 
> > I'm sorry, but I just can't take your patch. I'm not going to hand-edit
> > this one...
> 
> No worries, it was an unsigned patch suggestion, not
> a formal patch.  I know the difference.

OK, understood.

> And have you ever looked at the evolution source code?
> At best, it's pretty convoluted.
> There's _no way_ I want to touch it.

I haven't looked. But by "fixed" I guess I meant "fixed your workflow" :)

Regards,
Brian
