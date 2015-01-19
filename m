Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDH6h-0002KB-H6
 for linux-mtd@lists.infradead.org; Mon, 19 Jan 2015 18:31:24 +0000
Received: by mail-pd0-f169.google.com with SMTP id g10so4901120pdj.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2015 10:31:00 -0800 (PST)
Date: Mon, 19 Jan 2015 10:30:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
Message-ID: <20150119183057.GI9759@ld-irv-0074>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54BBE87C.9020705@users.sourceforge.net>
 <20150119175835.GH9759@ld-irv-0074>
 <54BD4AB6.70708@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54BD4AB6.70708@users.sourceforge.net>
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

On Mon, Jan 19, 2015 at 07:19:34PM +0100, SF Markus Elfring wrote:
> > Anyway, I'm essentially saying that I'd like to be 100% sure we have a
> > guarantee before dropping all these.
> 
> You can not be absolutely sure. There are various implementation details
> which will eventually need further considerations.

Let's consider them first. We don't ship code that is missing the
implementation details. (At least, we try not to!)

> I hope that a reasonable confidence can be achieved here.
> 
> 
> >> This issue was detected by using the Coccinelle software.
> > 
> > What script?
> 
> I published scripts for static source code analysis in March 2004.

I didn't ask "when?"; where?

> > Hand-rolled I guess?
> 
> An extended version found some update candidates in source files for Linux
> according to the software development status of "next-20141226".
> 
> My approach is still incomplete at the moment.

Then please complete it.

Thanks,
Brian
