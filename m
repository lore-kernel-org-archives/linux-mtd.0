Received: from dd23508.kasserver.com ([85.13.143.21])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NIJH5-0005Fs-7x
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 09:56:03 +0000
Message-ID: <4B1F7427.10002@stud.tu-ilmenau.de>
Date: Wed, 09 Dec 2009 10:55:51 +0100
From: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS on Atmel Dataflash
References: <hfnn6u$ah1$1@ger.gmane.org>
	<1260348786.19669.1231.camel@localhost>
In-Reply-To: <1260348786.19669.1231.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

thanks for your prompt reply.

Artem Bityutskiy wrote:
> Yeah, I had a feeling we should not have assumed power of 2. But it was
> so appealing, because we can avoid (slow) divisions when aligning data
> to min. I/O unit boundary. I knew about DataFlash, but it is usually so
> small that I did not expect anyone using UBIFS there.
>
> Are you sure you want ubifs on such a tiny flash? We were really
> targeting to larger ones, say, starting from 64MiB at least.
>   
Mmh, the idea to run UBIFS came up due to a problem with JFFS2 on this
device. So I wanted to use another writeable flash fs to  find out
whether its a fs-problem or a mtd/dataflash one.

So you suggest to stick with JFFS2 in this case?

> Basically, there is not fundamental reasons not to support non-power of
> 2 min. I/O unit size, besides of optimizations. And to fix this, one
> would need to carefully look at / grep for min_io_size usage in both
> UBI/UBIFS, and change stuff like ALIGN(x, c->min_io_size) to something
> else. But there are very many of such places.
>   
Thanks for your explanation.


Best regards,

Andre
