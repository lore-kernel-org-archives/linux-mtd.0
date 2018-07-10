Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fctty-0004hr-Vz
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 14:46:13 +0000
Date: Tue, 10 Jul 2018 16:45:49 +0200
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
Message-ID: <20180710144549.GW1123@kroah.com>
References: <20180702025045.29896-1-ikegami@allied-telesis.co.jp>
 <20180702025045.29896-2-ikegami@allied-telesis.co.jp>
 <20180702061929.GA7611@kroah.com>
 <TY1PR01MB095431D99EEBB4D53459354BDC430@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180702072311.GA4817@kroah.com>
 <TY1PR01MB095429D459916B87806557F8DC470@TY1PR01MB0954.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB095429D459916B87806557F8DC470@TY1PR01MB0954.jpnprd01.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 06, 2018 at 10:11:39AM +0000, IKEGAMI Tokunori wrote:
> Hi Greg-san,
> 
> Let me confirm below.
> About the patches 2, 3 and 4 below still should I prepare the commit IDs for revised version?
> Or those can be added to the stable trees next time without commit IDs?
> 
> >   Patch: 2. 85a82e28b023 mtd: cfi_cmdset_0002: Change definition naming
> > to retry write operation
> >          3. 45f75b8a919a mtd: cfi_cmdset_0002: Change erase functions
> > to retry for error
> >          4. 79ca484b6130 mtd: cfi_cmdset_0002: Change erase functions
> > to check chip good only
> > 
> >   Note: The commit IDs are on mainline so there are not existed for
> > revised version patches.
> 
> I think that the patches revised version are still existing on the linux-mtd Patchwork without commit IDs.
>   <https://patchwork.ozlabs.org/project/linux-mtd/list/?series=53133&state=*>
> 
> Sorry for this confirmation but I am not sure how to resolve this to apply these revised version patches to stable trees.

Ok, I think I have it figured out now.  Look at what I have queued up to
the stable queues to verify I got it correct.

thanks,

greg k-h
