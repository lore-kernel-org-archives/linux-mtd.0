Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzOmc-0008QR-6p
 for linux-mtd@lists.infradead.org; Tue, 03 Oct 2017 15:07:01 +0000
Received: by mail-qt0-x230.google.com with SMTP id e19so9626949qta.13
 for <linux-mtd@lists.infradead.org>; Tue, 03 Oct 2017 08:06:33 -0700 (PDT)
Date: Tue, 3 Oct 2017 11:06:30 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Christoph Hellwig <hch@infradead.org>
cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] cramfs: direct memory access support
In-Reply-To: <20171003145921.GA9954@infradead.org>
Message-ID: <nycvar.YSQ.7.76.1710031101500.5407@knanqh.ubzr>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-2-nicolas.pitre@linaro.org>
 <20171001082955.GA17116@infradead.org>
 <nycvar.YSQ.7.76.1710011659530.5407@knanqh.ubzr>
 <20171003145921.GA9954@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 Oct 2017, Christoph Hellwig wrote:

> On Sun, Oct 01, 2017 at 06:27:11PM -0400, Nicolas Pitre wrote:
> > If you prefer, the physical address could be specified with a Kconfig 
> > symbol just like the kernel link address. Personally I think it is best 
> > to keep it along with the other root mount args. But going all the way 
> > with a dynamic driver binding interface and a dummy intermediate name is 
> > like using a sledge hammer to kill an ant: it will work of course, but 
> > given the context it is prone to errors due to the added manipulations 
> > mentioned previously ... and a tad overkill.
> 
> As soon as a kernel enables CRAMFS_PHYSMEM this mount option is
> available, so you don't just need to think of your use case.

What other use cases do you have in mind?

> The normal way for doings this would be to specify it in the device
> tree.

And specify it how? Creating a pseudo device and passing that instead of 
the actual physical address? What is the advantage?

And what about targets that don't use DT? Yes, there are still quite a 
few out there.


Nicolas
