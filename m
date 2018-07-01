Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZZUo-000627-08
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 10:22:19 +0000
Date: Sun, 1 Jul 2018 12:22:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joakim.Tjernlund@infinera.com, boris.brezillon@bootlin.com,
 boris.brezillon@free-electrons.com,
 chris.packham@alliedtelesis.co.nz, computersforpeace@gmail.com,
 cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 ikegami@allied-telesis.co.jp, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, richard@nod.at
Cc: stable-commits@vger.kernel.org
Subject: Re: Patch "mtd: cfi_cmdset_0002: Change erase functions to retry for
 error" has been added to the 4.17-stable tree
Message-ID: <20180701102205.GA30410@kroah.com>
References: <1530439761164133@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530439761164133@kroah.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 01, 2018 at 12:09:21PM +0200, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     mtd: cfi_cmdset_0002: Change erase functions to retry for error
> 
> to the 4.17-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

Nope, this broke the build everywhere, so I've dropped it from all trees
now.  If you want this backported, please provide a working version.

thanks,

greg k-h
