Received: from mail-qc0-f169.google.com ([209.85.216.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0Y52-0000uC-UR
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 16:01:05 +0000
Received: by mail-qc0-f169.google.com with SMTP id w7so8765307qcr.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2014 08:00:36 -0800 (PST)
Message-ID: <548F0538.2080003@vanguardiasur.com.ar>
Date: Mon, 15 Dec 2014 12:58:48 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: UBI: Add support for scatter gather and blk-mq
References: <1416845080-16663-1-git-send-email-richard@nod.at>
 <548D85F1.5080606@vanguardiasur.com.ar> <548E0E7B.1000008@nod.at>
In-Reply-To: <548E0E7B.1000008@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 =?windows-1252?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/14/2014 07:26 PM, Richard Weinberger wrote:
> Am 14.12.2014 um 13:43 schrieb Ezequiel Garcia:
>> Hey Richard,
>>
>> On 11/24/2014 01:04 PM, Richard Weinberger wrote:
>>> This two patches implement blk-mq support for the UBI block driver.
>>> As the scatter gather part is rather generic I've moved it directl
>>> into UBI such that it can be reused later.
>>> So far only reading data into a scatter gather list is possible.
>>> After implementing  ubi_eba_read_leb_sg() we could slowly start
>>> removing a bunch of vmalloc() from the UBI core code and use scatter gather.
>>> This should lower the memory footprint of UBI.
>>>
>>> [PATCH 1/2] UBI: Add initial support for scatter gather
>>> [PATCH 2/2] UBI: Block: Add blk-mq support
>>>
>>
>> Tried to apply these to take a look and run some tests, but 2/2 got
>> rejected. Which tag did you base them?
>>
> 
> As discussed on IRC, blk-mq saw an update in -next.
> The interface as changed bit, I've adopted my patches and pushed them to:
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git ubiblock-mq
> This tree is linux-ubifs.git plus linux-block.git for-next.
> 

Great.

> I'll resend this updated patches after the merge window has closed.
> Happy testing. :-)
> 

Thanks for the update :)
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
