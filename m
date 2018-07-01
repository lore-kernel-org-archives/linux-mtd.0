Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZcUq-0005aP-Dh
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 13:34:34 +0000
Date: Sun, 1 Jul 2018 15:34:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joakim.Tjernlund@infinera.com, boris.brezillon@free-electrons.com,
 chris.packham@alliedtelesis.co.nz, computersforpeace@gmail.com,
 cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 ikegami@allied-telesis.co.jp, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, richard@nod.at, stable-commits@vger.kernel.org
Subject: Re: Patch "mtd: cfi_cmdset_0002: Change erase functions to retry
 for error" has been added to the 4.17-stable tree
Message-ID: <20180701153403.6ea52135@bbrezillon>
In-Reply-To: <20180701102205.GA30410@kroah.com>
References: <1530439761164133@kroah.com>
	<20180701102205.GA30410@kroah.com>
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

Hi Greg,

On Sun, 1 Jul 2018 12:22:05 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sun, Jul 01, 2018 at 12:09:21PM +0200, gregkh@linuxfoundation.org wrote:
> > 
> > This is a note to let you know that I've just added the patch titled
> > 
> >     mtd: cfi_cmdset_0002: Change erase functions to retry for error
> > 
> > to the 4.17-stable tree which can be found at:
> >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary  
> 
> Nope, this broke the build everywhere, so I've dropped it from all trees
> now.  If you want this backported, please provide a working version.

That's not surprising, this patch depends on "mtd: cfi_cmdset_0002:
Change definition naming to retry write" which did not apply cleanly on
4.17.

To be honest, I was not convinced those 2 patches deserved to be
backported to stable releases, but Joakim and Ikegami thought they were
good candidate. I'll let Ikegami propose a revised version of those 2
patches that apply cleanly on 4.17 if he wants.

Sorry for the inconvenience.

Regards,

Boris
