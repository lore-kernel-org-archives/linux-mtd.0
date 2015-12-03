Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4cW9-0007W1-Qo
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2015 22:38:26 +0000
Received: by pacej9 with SMTP id ej9so76097227pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 03 Dec 2015 14:38:04 -0800 (PST)
Date: Thu, 3 Dec 2015 14:38:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-mtd@lists.infradead.org,
 Alex Smith <alex.smith@imgtec.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: binding for jz4780-{nand,bch}
Message-ID: <20151203223801.GA64180@google.com>
References: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
 <1449144142-24004-2-git-send-email-harvey.hunt@imgtec.com>
 <20151203213812.GA32235@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151203213812.GA32235@rob-hp-laptop>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 03, 2015 at 03:38:12PM -0600, Rob Herring wrote:
> On Thu, Dec 03, 2015 at 12:02:20PM +0000, Harvey Hunt wrote:
> > v8 -> v9:
> >  - Document that partitions are represented as a child node of a NAND chip.
> 
> Don't multiple flash chips typically get interleaved in order to get 
> parallelism needed for performance? Then the view of the partitions 
> would apply across all chips.

Not in MTD so far. We have mtdconcat to do some combination of flash,
but it's not too easy to use right now. There are also some "MTD RAID"
patches submitted recently that might cover what you're talking about,
but that's brand new and unreviewed, and I don't think anyone has
considered trying to handle partitions for such a thing yet.
Partitioning of this kind isn't even that useful for NAND flash,
actually, since fixed assignment of flash ranges restricts the
flexibility of UBI's wear-leveling algorithms.

It probably makes more sense to deal with UBI volumes instead of MTD
partitions when talking about NAND flash. And those aren't specified in
DT.

> Anyway, it's optional, so:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Brian
