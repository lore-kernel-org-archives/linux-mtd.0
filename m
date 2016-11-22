Received: from smtprelay0027.hostedemail.com ([216.40.44.27]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9Ihb-0007BG-48
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 21:34:08 +0000
Message-ID: <1479850347.1942.24.camel@perches.com>
Subject: Re: [PATCH] mtd: mtdswap: fix spelling mistake "erassure" -> "erasure"
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Colin King <colin.king@canonical.com>, David Woodhouse
 <dwmw2@infradead.org>,  Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>,  linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20161122193753.GG77253@google.com>
References: <20161028182559.7887-1-colin.king@canonical.com>
 <1477680707.7945.13.camel@perches.com> <20161122193753.GG77253@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Date: Tue, 22 Nov 2016 13:32:27 -0800
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-11-22 at 11:37 -0800, Brian Norris wrote:
> On Fri, Oct 28, 2016 at 11:51:47AM -0700, Joe Perches wrote:
> > I'd suggest as well fixing all the dev_<level> uses
> > to be a consistent form: (this also fixes the typo)
> > and a few other bits
> > 
> > o Coalesce formats
> > o Realign arguments
> > o Add missing newlines
> 
> Yeah, Colin missed this on the line he was fixing.
> 
> > o Convert printk(KERN_<LEVEL> to pr_<level>(
> > o Add #define pr_fmt, remove MTDSWAP_PREFIX
> > 
> > Reduces object size a little too
> 
> Thanks, these all look good but:
> 
>  (a) you didn't provide a Signed-off-by and
>  (b) your patch is full of non-breaking spaces (0xA0), instead of proper
>  ASCII spaces (0x20)
> 
> I feel like we've had this conversation before about your Evolution
> mailer a long time ago; you still haven't fixed that?
> 
> I'm sorry, but I just can't take your patch. I'm not going to hand-edit
> this one...

No worries, it was an unsigned patch suggestion, not
a formal patch.  I know the difference.

And have you ever looked at the evolution source code?
At best, it's pretty convoluted.
There's _no way_ I want to touch it.
