Received: from cursor.subgra.de ([78.46.252.50])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZh89-0006BQ-Kq
	for linux-mtd@lists.infradead.org; Wed, 18 Feb 2009 07:46:08 +0000
Date: Wed, 18 Feb 2009 08:47:39 +0100
From: Benjamin Krill <ben@codiert.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v2] Check name property to determine partition nodes.
Message-ID: <20090218074738.GC12204@codiert.org>
References: <20090123161805.GA2598@codiert.org>
	<1233720542.16867.187.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1233720542.16867.187.camel@pasglop>
Cc: linuxppc-dev@ozlabs.org, vwool@ru.mvista.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, dwg@au1.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Benjamin Herrenschmidt | 2009-02-04 15:09:02 [+1100]:
>On Fri, 2009-01-23 at 17:18 +0100, Benjamin Krill wrote:
>> SLOF has a further node which could not be evaluate
>> by the current routine. The current routine returns
>> because the node hasn't the required reg property. As
>> fix this patch adds a check to determine the partition
>> child nodes. If the node is not an partition the number
>> of total partitions will be decreased and loop continue
>> with the next nodes.
>
>Somebody on the MTD list is taking that ? David ? Or should I merge it
>via powerpc ?

Could somebody merge it for the next release?

 Ben
