Received: from mail-wj0-x243.google.com ([2a00:1450:400c:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cL9BA-00013G-CS
 for linux-mtd@lists.infradead.org; Sun, 25 Dec 2016 13:49:37 +0000
Received: by mail-wj0-x243.google.com with SMTP id hb5so12891990wjc.2
 for <linux-mtd@lists.infradead.org>; Sun, 25 Dec 2016 05:49:15 -0800 (PST)
Subject: Re: [PATCH] mtd: mtdswap: use MTDSWAP_ECNT_MIN/MAX
To: Geliang Tang <geliangtang@gmail.com>
References: <254e9f859fdb1f850c1d3bd5777e97bf468b4e5a.1482225376.git.geliangtang@gmail.com>
 <252d763e-1767-9bf9-be1a-af0c02d4078f@gmail.com>
 <20161224151854.a3xxd6jdobjviuu2@ThinkPad>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e35fcd81-726c-b272-40a2-a94b74f6d291@gmail.com>
Date: Sun, 25 Dec 2016 14:49:12 +0100
MIME-Version: 1.0
In-Reply-To: <20161224151854.a3xxd6jdobjviuu2@ThinkPad>
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

On 12/24/2016 04:18 PM, Geliang Tang wrote:
> On Fri, Dec 23, 2016 at 07:51:56PM +0100, Marek Vasut wrote:
>> On 12/20/2016 02:54 PM, Geliang Tang wrote:
>>> Since macros MTDSWAP_ECNT_MIN() and MTDSWAP_ECNT_MAX() have been
>>> defined in mtdswap.c, use them instead of open-coding.
>>>
>>> Signed-off-by: Geliang Tang <geliangtang@gmail.com>
>>
>> Sorry for getting to this so late. The patch is fine, but if you grep
>> for 'rb_first' in the mtdswap driver , you'll see you can also use the
>> MTDSWAP_ECNT_MIN macro in mtdswap_map_free_block() and in
>> mtdswap_pick_gc_blk() . Can you fix those too ?
> 
> Hi Marek,
> 
> Thanks for your review. I double checked the code and found out that we can't
> use MTDSWAP_ECNT_MIN macro in mtdswap_map_free_block() and mtdswap_pick_gc_eblk().
> Since the MTDSWAP_ECNT_MIN macro points to erase_count field of swap_eb, and
> erase_count field are not used in these two functions. Isn't it?

Ah, true, I missed that. In that case, just this patch is fine, thanks !

> -Geliang
> 
>>
>> Otherwise:
>> Acked-by: Marek Vasut <marek.vasut@gmail.com>
>>
>>> ---
>>>  drivers/mtd/mtdswap.c | 6 ++----
>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
>>> index c40e2c9..f12879a 100644
>>> --- a/drivers/mtd/mtdswap.c
>>> +++ b/drivers/mtd/mtdswap.c
>>> @@ -1235,10 +1235,8 @@ static int mtdswap_show(struct seq_file *s, void *data)
>>>  
>>>  		if (root->rb_node) {
>>>  			count[i] = d->trees[i].count;
>>> -			min[i] = rb_entry(rb_first(root), struct swap_eb,
>>> -					rb)->erase_count;
>>> -			max[i] = rb_entry(rb_last(root), struct swap_eb,
>>> -					rb)->erase_count;
>>> +			min[i] = MTDSWAP_ECNT_MIN(root);
>>> +			max[i] = MTDSWAP_ECNT_MAX(root);
>>>  		} else
>>>  			count[i] = 0;
>>>  	}
>>>
>>
>>
>> -- 
>> Best regards,
>> Marek Vasut


-- 
Best regards,
Marek Vasut
