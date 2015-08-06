Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNHTh-00081X-Ue
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 09:28:46 +0000
Date: Thu, 6 Aug 2015 11:19:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>, linux-mtd@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org, Han Xu
 <b45815@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC PATCH 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
Message-ID: <20150806111901.3d2d5494@bbrezillon>
In-Reply-To: <55C067F7.3000309@nod.at>
References: <mailman.4457.1438277726.1758.linux-mtd@lists.infradead.org>
 <mailman.4457.1438277726.1758.linux-mtd.{07a3baba-0e8a-469e-82e1-92b4ef074f4f}.0@lists.infradead.org>
 <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
 <55BB48D9.6050508@dave-tech.it>
 <20150731123221.34cf601e@bbrezillon>
 <55BB7ABD.7040008@dave-tech.it>
 <20150731161032.2b155ccb@bbrezillon>
 <55BBA012.4080600@dave-tech.it>
 <20150731182709.14c345df@bbrezillon>
 <55BF4D72.8090000@dave-tech.it>
 <20150803144253.66fc6941@bbrezillon>
 <55BF6F09.9000001@dave-tech.it> <55BFC1DA.3090108@nod.at>
 <55C06379.5090705@dave-tech.it> <55C067F7.3000309@nod.at>
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

Hi Richard,

On Tue, 4 Aug 2015 09:21:27 +0200
Richard Weinberger <richard@nod.at> wrote:

> Andrea,
> 
> Am 04.08.2015 um 09:02 schrieb Andrea Scian:
> >> I'm not sure whether introducing a read-before-write check is the best solution.
> >> At least we need hard numbers for slow/old SLC NANDs too.
> > 
> > We can enable the feature only for MLC, AFAIK it has not been required for old SLC ;-)
> 
> I think this needs more discussion.
> 
> Boris, Brian, will you be at Embedded Linux Conference Europe in Dublin?
> Maybe we can discuss these issues (data retention, ff-checks, etc...) in person and figure out where to address them.
> I really want to avoid ad-hoc solutions. :)

I'll be at ELCE and I'd be happy to discuss all these NAND/MTD/UBI
related issues with you, though I think we should keep discussing
those problems on the ML too.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
