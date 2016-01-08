Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHbIa-0007td-DM
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 17:58:04 +0000
Received: by mail-pa0-x244.google.com with SMTP id pv5so22821242pac.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jan 2016 09:57:44 -0800 (PST)
Date: Fri, 8 Jan 2016 09:57:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Daniel Walter <dwalter@sigma-star.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] [PATCH] mtd: add tracepoints for mtd_read and mtd_write
Message-ID: <20160108175741.GO109450@google.com>
References: <20151117191448.GA5367@dw-nb.local>
 <20151117191801.GA864@dw-nb.local>
 <CAFLxGvxPHN0JcEZShS_QV869U_E+Rdk=DYTCTeUHQ-eiH4_BfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvxPHN0JcEZShS_QV869U_E+Rdk=DYTCTeUHQ-eiH4_BfA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 08, 2016 at 10:33:03AM +0100, Richard Weinberger wrote:
> On Tue, Nov 17, 2015 at 8:18 PM, Daniel Walter <dwalter@sigma-star.at> wrote:
> > Add tracepoints to mtd subsystem for read and write
> > operations. This should allow us to identify applications
> > which are generating too much reads/writes on a flash-device.
> >
> > Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
> 
> Brian, any comments on this?

Only a few. I'm not very familiar with writing trace events. I've only
barely used them! And I haven't run this patch yet.

But I thought Daniel reported having some difficulty here -- that it
isn't actually that useful to get real "user" information, since most
writing/erasing happens from background UBI tasks in practice. So is
this still the best mechanism for tracking this information? (Even if
there's better ways to get info directly out of UBI, I guess maybe it'd
still be good to have this infrastructure.)

Also, maybe I'm missing something, but it doesn't look like this
attempts to record *which* MTD is being accessed, right? I'd think
logging mtd->name could help?

Brian
