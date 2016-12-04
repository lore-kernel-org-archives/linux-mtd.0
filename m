Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDeTH-0003XN-9M
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 21:37:20 +0000
Received: by mail-wm0-x242.google.com with SMTP id m203so11946946wma.3
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2016 13:36:58 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: ubi: fix improper return value
To: Joe Perches <joe@perches.com>, Pan Bian <bianpan201604@163.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
 <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
 <1480883619.4534.6.camel@perches.com>
Cc: linux-kernel@vger.kernel.org, Pan Bian <bianpan2016@163.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <85f33a89-f349-eac0-a072-d99867b796fb@gmail.com>
Date: Sun, 4 Dec 2016 22:36:55 +0100
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

On 12/04/2016 09:33 PM, Joe Perches wrote:
> On Sun, 2016-12-04 at 13:48 +0100, Marek Vasut wrote:
>> On 12/04/2016 07:12 AM, Pan Bian wrote:
>>> From: Pan Bian <bianpan2016@163.com>
>>>
>>> When __vmalloc() returns a NULL pointer, the region is not checked, and
>>> we cannot make sure that only 0xFF bytes are present at offset. Thus,
>>> returning 0 seems improper.
>>>
>>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=189081
>>>
>>> Signed-off-by: Pan Bian <bianpan2016@163.com>
>>> ---
>>>  drivers/mtd/ubi/io.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
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

Ah, thanks for the correction :-)

-- 
Best regards,
Marek Vasut
