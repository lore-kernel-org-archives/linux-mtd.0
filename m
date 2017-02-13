Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdBS1-0007Em-4a
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 07:53:34 +0000
Date: Mon, 13 Feb 2017 08:53:11 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Mika
 Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] spi-nor: use ERR_CAST in return
Message-ID: <20170213085311.227d6398@bbrezillon>
In-Reply-To: <20170213073552.GA23235@osadl.at>
References: <1486917823-23569-1-git-send-email-der.herr@hofr.at>
 <20170212224543.34f4227a@bbrezillon>
 <20170212230410.183be6a7@bbrezillon>
 <20170213073552.GA23235@osadl.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 Feb 2017 07:35:52 +0000
Nicholas Mc Guire <der.herr@hofr.at> wrote:

> On Sun, Feb 12, 2017 at 11:04:10PM +0100, Boris Brezillon wrote:
> > +Mika
> > 
> > On Sun, 12 Feb 2017 22:45:43 +0100
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >   
> > > On Sun, 12 Feb 2017 17:43:43 +0100
> > > Nicholas Mc Guire <der.herr@hofr.at> wrote:
> > >   
> > > > This fixes a sparse warning about     
> > > 
> > > Your commit message seems to be incomplete.  
> > 
> > And here too, please change the prefix to "mtd: spi-nor: intel: ".
> >  
> 
> What Im doing for checking prefix is:
> hofrat@debian:~/git/linux-next$ git log --oneline drivers/mtd/spi-nor/intel-spi.c
> 8afda8b spi-nor: Add support for Intel SPI serial flash controller
> 
> is the method of checking the commit prefix with git log --oneline inapropriate ?

It's appropriate, except in this case. You're referring to the commit
introducing a new driver, so this is expected to not find the
'intel:' suffix, but you have 'Add support for Intel SPI serial flash
controller' to clarify the scope.

Regarding the "mtd: " prefix, I think it's better to have it, but
apparently Cyrille is not enforcing that.

> How would I have found the "mtd: spi-nor: intel:" in this case ?

Well, it's a mix of common sense and 'git log --oneline' use :-). Here
you're only modifying the intel driver, but nothing in your subject
mentions it.
