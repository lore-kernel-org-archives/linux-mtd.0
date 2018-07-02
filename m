Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZsBc-0006pB-8p
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 06:19:46 +0000
Date: Mon, 2 Jul 2018 08:19:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/4] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Message-ID: <20180702061929.GA7611@kroah.com>
References: <20180702025045.29896-1-ikegami@allied-telesis.co.jp>
 <20180702025045.29896-2-ikegami@allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180702025045.29896-2-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 02, 2018 at 11:50:42AM +0900, Tokunori Ikegami wrote:
> For the word write it is checked if the chip has the correct value.
> But it is not checked for the write buffer as only checked if ready.
> To make sure for the write buffer change to check the value.
> 
> It is enough as this patch is only checking the last written word.
> Since it is described by data sheets to check the operation status.
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What are the git commit ids for all of these patches, and what stable
tree do they need to go to?

thanks,

greg k-h
