Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gixmx-0001Rm-Gw
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2019 08:40:09 +0000
Date: Mon, 14 Jan 2019 09:39:54 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: masonccyang@mxic.com.tw
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse
 <dwmw2@infradead.org>, Julien Su <juliensu@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh R
 <vigneshr@ti.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 zhengxunli@mxic.com.tw
Subject: Re: [PATCH RFC 18/18] mtd: spi-nor: Make sure the 8D-8D-8D can be
 selected on mx25uw51245g
Message-ID: <20190114093954.0e0b0c07@bbrezillon>
In-Reply-To: <OF3005248A.454B9B59-ON48258382.002767AE-48258382.00293E8D@mxic.com.tw>
References: <20181012084825.23697-1-boris.brezillon@bootlin.com>
 <20181012084825.23697-19-boris.brezillon@bootlin.com>
 <OF300145A1.D60E7B33-ON48258376.002EDC4B-48258376.0031A14C@LocalDomain>
 <OF3005248A.454B9B59-ON48258382.002767AE-48258382.00293E8D@mxic.com.tw>
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

On Mon, 14 Jan 2019 15:30:29 +0800
masonccyang@mxic.com.tw wrote:

> Hi Boris,
> 
> I have patched direct mapping in spi-nor.c layer based on 
> your direct mapping mode's patch [1][2] as attached file,
> spi-nor-mxic.patch.
> 
> 
> 
> 
> The read performance has got much improvement in direct mapping
> read mode w/ 8D-8D-8D DDR@25MHz compare to manual I/O mode.
> i.e,.
> 62.8 KB/s(manual I/O) is up to 21.8 MB/s(direct mapping read).
> 
> Looking forward to this direct mapping mode would be merged to mainline 
> soon. 
> 
> thanks & best regards,
> Mason
> 
> [1] https://patchwork.kernel.org/patch/10670753
> [2] https://patchwork.kernel.org/patch/10670747 

Those 2 patches have been applied already, we only miss [3] which I plan
to queue for v5.1.

[3]http://patchwork.ozlabs.org/patch/993805/
