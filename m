Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqWYp-0002pt-5R
 for linux-mtd@lists.infradead.org; Fri, 30 May 2014 23:50:07 +0000
Received: by mail-pb0-f44.google.com with SMTP id rq2so2230708pbb.17
 for <linux-mtd@lists.infradead.org>; Fri, 30 May 2014 16:49:45 -0700 (PDT)
Date: Fri, 30 May 2014 16:49:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: Problems in Out of tree TI SDK omap2-nand driver (Re: [PATCH
 3/3] nandtest: Introduce multiple reads & check iterations)
Message-ID: <20140530234936.GA9970@ld-irv-0074>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
 <20140505103335.GF2873@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EACA6B9@DBDE04.ent.ti.com>
 <20140505125047.GA11106@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EACA992@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACA992@DBDE04.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 05, 2014 at 06:12:55PM +0000, Pekon Gupta wrote:
> >From: Ezequiel Garcia [mailto:ezequiel@vanguardiasur.com.ar]
> >All in all, I think it's still a nice improvement on stock nandtest.
> 
> I was just presenting my view that
> With multiple re-reads nand-test may fail randomly on some devices
> due of accumulation of bitflips because of read-disturb errors.

Read disturb is not totally "random." It has definite causes, and it
should be relatively obvious if we're observing it in the controlled
environment of nandtest, rather than amidst the complexity of UBI(FS)
scrubbing, wear-leveling, etc.

> However, this may not be the case on actual file-system like UBIFS
> where upper layer performs scrubbing to avoid bit-flip accumulation.
> 
> Otherwise I have no issue with the patch. So if Artem | Brian feel okay,
> they can anyways pick the patch.

For the record, I agree with Ezequiel. This is a good (small)
improvement to the test. If for any reason, we cannot reread the same
data consistently for 4 tries immediately after programming it, then we
have a big problem. And even if read disturb is causing an accumulation
of bitflips, I think this would be a nice way to view that progression.

Brian
