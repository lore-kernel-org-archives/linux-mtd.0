Received: from dmz-mailsec-scanner-1.mit.edu ([18.9.25.12])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViG1h-00023P-V5
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 04:01:30 +0000
Date: Sun, 17 Nov 2013 23:01:00 -0500
From: Greg Price <price@MIT.EDU>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] Clarify error on directive in macro arguments (Re:
 [PATCH] jffs2: fix sparse errors: directive in argument list)
Message-ID: <20131118040100.GE8043@ringworld.MIT.EDU>
References: <20131118020746.GX16018@ringworld.MIT.EDU>
 <1384740932.5814.4.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384740932.5814.4.camel@joe-AO722>
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

On Sun, Nov 17, 2013 at 06:15:32PM -0800, Joe Perches wrote:
> On Sun, 2013-11-17 at 21:07 -0500, Greg Price wrote:
> > Perhaps the following tweak to the error message would make this
> > subtlety clearer?
> 
> Maybe, but this case isn't a macro.  It's a function.
> Dunno if differentiating when it's a macro or a
> function is difficult though.

Yeah, this error message is already only emitted for directives in
macro arguments -- in this case, pr_info.  It's in sparse's
preprocessor code; the error arises when a directive is spotted while
parsing a macro's arguments.  By the time sparse (or an idealized C
compiler) parses the arguments of a real function, the token stream is
already the output of the preprocessor and any directives are gone.

Cheers,
Greg
