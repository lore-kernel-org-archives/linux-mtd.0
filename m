Received: from smtprelay0129.hostedemail.com ([216.40.44.129]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViENd-0000xy-A0
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 02:16:01 +0000
Message-ID: <1384740932.5814.4.camel@joe-AO722>
Subject: Re: [PATCH] Clarify error on directive in macro arguments (Re:
 [PATCH] jffs2: fix sparse errors: directive in argument list)
From: Joe Perches <joe@perches.com>
To: Greg Price <price@MIT.EDU>
Date: Sun, 17 Nov 2013 18:15:32 -0800
In-Reply-To: <20131118020746.GX16018@ringworld.MIT.EDU>
References: <20131118020746.GX16018@ringworld.MIT.EDU>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Christopher Li <sparse@chrisli.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-sparse@vger.kernel.org,
 linux-mtd <linux-mtd@lists.infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>,
 dwmw2 <dwmw2@infradead.org>, Erico Nunes <nunes.erico@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-11-17 at 21:07 -0500, Greg Price wrote:
> [+linux-sparse and Chris]
> 
> On Mon, Nov 18, 2013 at 01:33:49AM +0000, Al Viro wrote:
> > On Sun, Nov 17, 2013 at 02:45:05PM -0800, Joe Perches wrote:
> > > Yes.  I think it's a defect in how sparse
> > > treats string concatenation.
> > > 
> > > That style [... with printk ...] is pretty common in the kernel sources.
> > 
> > ... and it's perfectly fine, until somebody starts playing in nasal
> > daemon country and do that in *macro* arguments.  And a nasal daemon
> > country it is - it's an undefined behaviour.  See 6.10.3p11 in C99.
> > And trying to define a semantics for that gets real ugly real fast.
> > sparse matches gcc behaviour (I hope), but it warns about such abuses.
> > It's a defect, all right - one being reported by sparse.
> 
> Perhaps the following tweak to the error message would make this
> subtlety clearer?

Maybe, but this case isn't a macro.  It's a function.
Dunno if differentiating when it's a macro or a
function is difficult though.
