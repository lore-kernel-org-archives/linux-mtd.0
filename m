Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsHXB-0000Kc-5X
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 17:30:21 +0000
Received: by dakp5 with SMTP id p5so150682dak.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 09:30:19 -0800 (PST)
Message-ID: <4F282519.5020802@gmail.com>
Date: Tue, 31 Jan 2012 09:30:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
References: <201201040148.32847.marek.vasut@gmail.com>
 <201201050038.39448.marek.vasut@gmail.com> <4F04E558.7000002@freescale.com>
 <201201311233.06949.marek.vasut@gmail.com>
In-Reply-To: <201201311233.06949.marek.vasut@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Scott Wood <scottwood@freescale.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/31/2012 3:33 AM, Marek Vasut wrote:
>> On 01/04/2012 05:38 PM, Marek Vasut wrote:
>>> Scott Wood wrote:
>>>> On 01/04/2012 03:32 PM, Marek Vasut wrote:
>>>>> Scott Wood wrote:
>>>>>> Can we just get rid of NAND_CHIPOPTIONS_MSK and trust that drivers
>>>>>> won't set options that aren't appropriate?  Possibly replace it with
>>>>>> documentation about which options are for chips, which are for
>>>>>> drivers, and which (such as NAND_NO_SUBPAGE_WRITE) can be set by
>>>>>> either.
>>>>>
>>>>> Rather let's just adjust the mask?
>>>>
>>>> The way the mask is used means that any given option can only be chip or
>>>> driver, not both.  Though, I don't see anywhere this option is set by a
>>>> chip -- maybe we can just renumber it to be in the controller half.
>>>
>>> I suspect this was meant to allow controllers where one chip can do
>>> subpage- write and the other can not.
>>
>> What I mean is I don't see any place where this is actually used --
>> gpmi-nand is the only place I see this flag being set (though it belongs
>> on at least elbc as well).

It is used out-of-tree as well (as mentioned below).

>>>> I still don't see a whole lot of value in the mask, though -- seems to
>>>> be just causing problems, especially given that bits set by the "wrong"
>>>> component are silently discarded.
>>>
>>> Yes. Patch is welcome to remove it and separate these two ;-)
>>
>> Do they need to be separated?  Just OR them with no mask.  If either the
>> controller or the chip set the flag, then it's set, and subpage writes
>> are disallowed.  Obviously you can only do this for certain types of
>> options -- for others, just don't set the flag in an inappropriate context.
>>
>> -Scott
>
> BUMP?

There's another distinct possibility (one that I use on an out-of-tree 
driver): instead of calling "nand_scan()", separate it into its two 
sub-functions "nand_scan_ident()" and "nand_scan_tail()" so you have 
something like this

     ret = nand_scan_ident(mtd, pdata->max_chip_count, NULL);
     chip->options |= NAND_NO_SUBPAGE_WRITE;
     if (!ret)
             ret = nand_scan_tail(mtd);

That way your option is set after we mask with NAND_CHIPOPTIONS_MSK. I'm 
not sure if this solution is better than really trying to tackle the 
issue of why we have that mask and whether it is still needed, but it 
solves the problem.

Brian
