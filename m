Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViEgB-0001DT-Mt
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 02:35:12 +0000
Date: Mon, 18 Nov 2013 02:34:43 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] Clarify error on directive in macro arguments (Re:
 [PATCH] jffs2: fix sparse errors: directive in argument list)
Message-ID: <20131118023443.GN13318@ZenIV.linux.org.uk>
References: <20131118020746.GX16018@ringworld.MIT.EDU>
 <1384740932.5814.4.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384740932.5814.4.camel@joe-AO722>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: Christopher Li <sparse@chrisli.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Greg Price <price@MIT.EDU>,
 linux-sparse@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
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
> > > sparse matches gcc behaviour (I hope), but it warns about such abuses.
> > > It's a defect, all right - one being reported by sparse.
> > 
> > Perhaps the following tweak to the error message would make this
> > subtlety clearer?
> 
> Maybe, but this case isn't a macro.  It's a function.
> Dunno if differentiating when it's a macro or a
> function is difficult though.

In which case?  With printk() it's perfectly fine and sparse
will not complain at all.  With pr_info(), OTOH, we have
#define pr_info(fmt, ...) \
        printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
and when you start playing that kind of games with it, you get warnings.
