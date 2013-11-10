Message-ID: <527F4427.2090409@gmail.com>
Date: Sun, 10 Nov 2013 16:30:31 +0800
From: Haojian Zhuang <haojian.zhuang@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 09/27] mtd: nand: pxa3xx: Split FIFO size from
 to-be-read FIFO count
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382137374-21251-10-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131103223646.GC5896@gmail.com> <20131104121305.GD2516@localhost>
In-Reply-To: <20131104121305.GD2516@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, eric.y.miao@gmail.com,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/04/2013 08:13 PM, Ezequiel Garcia wrote:
> On Sun, Nov 03, 2013 at 05:36:50PM -0500, Huang Shijie wrote:
>> On Fri, Oct 18, 2013 at 08:02:36PM -0300, Ezequiel Garcia wrote:
>>>
>>> -	switch (host->page_size) {
>>> +	switch (info->fifo_size) {
>>>   	case 2048:
>> 	
>> there is a item in the builtin_flash_types:
>> { "4GiB 8-bit",    0xd7ec, 128, 4096,  8,  8, 8192, &timing[1] },
>>
>> The original host->page_size could be 4096, how can the old code support
>> this nand with page-size is 4096?
>>
>
> Ah, nice catch. I completely missed that line!
>
> I've rechecked the PXA3xx spec. but it makes no mention to supporting
> 4096 (and it doesn't mention the FIFO buffer's size).
>
> On the other side, and AFAIK, the 'splitted' command semantics in the
> NFCv2 (the one I'm working on) was added specifically to support
> page-size of 4096 and 8192.
>
> In other words, I'm not sure how could the old code support 4096!
> The support was adding long ago, in this commit:
>
> commit d3490dfdbc453a16bc7f3cff731c9f7851735ab3
> Author: Haojian Zhuang <haojian.zhuang@marvell.com>
> Date:   Thu Sep 10 14:33:30 2009 +0800
>
> pxa3xx_nand: add new nand chip support
>
> Support samsung 2GbX8 and 32GbX8 nand flash.
> Support micron 4GbX8 and 4GbX16 nand flash.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> Signed-off-by: Eric Miao <eric.y.miao@gmail.com>
>
> So, maybe they can provide some answers. Haojian? Eric?
>

Hi Ezequiel,

I can't remember all details. The main problem is that I failed to find 
the flash datasheet.

Regards
Haojian
