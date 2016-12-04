Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDdmD-0003HX-2V
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 20:52:51 +0000
Subject: Re: [PATCH 1/1] mtd: ubi: fix improper return value
To: Joe Perches <joe@perches.com>, Marek Vasut <marek.vasut@gmail.com>,
 Pan Bian <bianpan201604@163.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
 <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
 <1480883619.4534.6.camel@perches.com>
Cc: linux-kernel@vger.kernel.org, Pan Bian <bianpan2016@163.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <0446c91c-ac84-3601-203a-9c2e7057f1f9@nod.at>
Date: Sun, 4 Dec 2016 21:52:17 +0100
MIME-Version: 1.0
In-Reply-To: <1480883619.4534.6.camel@perches.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04.12.2016 21:33, Joe Perches wrote:
>>> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> []
>>> @@ -1413,7 +1413,7 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
>>>  	buf = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
>>>  	if (!buf) {
>>>  		ubi_err(ubi, "cannot allocate memory to check for 0xFFs");
>>> -		return 0;
>>> +		return -ENOMEM;
>>
>> I wonder if you shouldn't also nuke the ubi_err() , because when you run
>> out of memory, printk() will likely also fail.
> 
> No, not really.  printk doesn't allocate memory.
> 
> But the ubi_err should be removed because all memory
> allocations that fail without a specific GFP_NOWARN
> flag already have a dump_stack() call.

We should better think about how to get ubi_self_check_all_ff() fixed.
When enabled on a modern NAND, vmalloc() is likely to fail now and then
since len is the erase block size and can be up to a few mega bytes.

Thanks,
//richard
