Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDIzZ-0003Kv-6X
 for linux-mtd@lists.infradead.org; Mon, 19 Jan 2015 20:32:09 +0000
Received: by mail-pa0-f54.google.com with SMTP id eu11so6462885pac.13
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2015 12:31:47 -0800 (PST)
Date: Mon, 19 Jan 2015 12:31:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
Message-ID: <20150119203143.GL9759@ld-irv-0074>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54BBE87C.9020705@users.sourceforge.net>
 <20150119175835.GH9759@ld-irv-0074>
 <54BD4AB6.70708@users.sourceforge.net>
 <20150119183057.GI9759@ld-irv-0074>
 <54BD55F6.6090609@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54BD55F6.6090609@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 19, 2015 at 08:07:34PM +0100, SF Markus Elfring wrote:
> >> I published scripts for static source code analysis in March 2004.

^^ That would be March 2014, not March 2004.

> > I didn't ask "when?"; where?
> 
> https://lkml.org/lkml/2014/3/5/356
> http://article.gmane.org/gmane.comp.version-control.coccinelle/3513/
> https://systeme.lip6.fr/pipermail/cocci/2014-March/000676.html
> 
> Do you get further ideas from this software analysis approach?

I suppose. I've gotten the idea that I can generate a ton of patches
using an automated tool, not test or research them, possibly add bugs to
the kernel, and still get a good percentage of my patches merged.

Now, have *you* learned anything from this approach?

Brian
