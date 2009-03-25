Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmQZE-0007jB-7k
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 10:42:47 +0000
Message-ID: <49CA0AC4.9030702@nokia.com>
Date: Wed, 25 Mar 2009 12:43:16 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "Singh, Vimal" <vimalsingh@ti.com>
Subject: Re: Is high_memory check in omap2.c for OneNAND is sufficient?
References: <19F8576C6E063C45BE387C64729E73940427A869DA@dbde02.ent.ti.com>,
	<49C8FFCA.1010703@nokia.com>
	<19F8576C6E063C45BE387C64729E73940427A869DB@dbde02.ent.ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E73940427A869DB@dbde02.ent.ti.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Singh, Vimal wrote:
> From: Adrian Hunter [adrian.hunter@nokia.com]
>> Singh, Vimal wrote:
>>> There is check for 'high_memory' in 'drivers/mtd/onenand/omap2.c', always before doing 'dma_map_single'.
>>> Snippet:
>>> ----------------------
>>>         if (buf >= high_memory) {
>>>                 struct page *p1;
>>> ----------------------
>>> This check seems not sufficient. There should be a check for upper boundary too.
>>> Thinking scenario when 'buf' is less than 'high_memory', but somewhere near to it, and 'count' is big enough to beyond 'high_memory'.
>> AFAIK it is not possible to allocate memory that crosses the high_memory boundary.
> 
> Do you mean 'buf' can not cross 'high_memory' boundary?

Yes.

> But then I have seen a case where it was crossing that and BUG was reported by function 'dma_cache_maint'.

Is it possible that 'buf' or 'count' is wrong?
