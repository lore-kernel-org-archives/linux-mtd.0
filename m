Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZtBE-0006Fn-Dq
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 07:23:30 +0000
Date: Mon, 2 Jul 2018 09:23:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/4] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Message-ID: <20180702072311.GA4817@kroah.com>
References: <20180702025045.29896-1-ikegami@allied-telesis.co.jp>
 <20180702025045.29896-2-ikegami@allied-telesis.co.jp>
 <20180702061929.GA7611@kroah.com>
 <TY1PR01MB095431D99EEBB4D53459354BDC430@TY1PR01MB0954.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB095431D99EEBB4D53459354BDC430@TY1PR01MB0954.jpnprd01.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 02, 2018 at 07:16:47AM +0000, IKEGAMI Tokunori wrote:
> Hi Greg-san,
> 
> The commit IDs on mainline are below.
> 
>   1. dfeae1073583 mtd: cfi_cmdset_0002: Change write buffer to check correct value
>   2. 85a82e28b023 mtd: cfi_cmdset_0002: Change definition naming to retry write operation
>   3. 45f75b8a919a mtd: cfi_cmdset_0002: Change erase functions to retry for error
>   4. 79ca484b6130 mtd: cfi_cmdset_0002: Change erase functions to check chip good only
> 
> Note:
>   The patches just sent today as revised are only existing with commit IDs on my local environment.
>   Also the patches are existing on the Linux MTD development patchwork as below but the commit IDs are not assigned.
>     <https://patchwork.ozlabs.org/project/linux-mtd/list/?series=53133>
> 
>   If those revised patches should be applied anywhere to have commit IDs at first please let me know.
>   Probably it should be consulted with the MTD maintainer Boris-san.

And what stable tree(s) do you want to see these applied to?

thanks,

greg k-h
