Received: from mail.avantwave.com ([210.17.210.210])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBWQM-0001xd-9t
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2005 06:10:51 -0500
Message-ID: <4238154F.5070807@avantwave.com>
Date: Wed, 16 Mar 2005 19:15:27 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: Aras Vaichas <arasv@magellan-technology.com>
References: <4237B14F.1080106@avantwave.com>
	<4237BC75.50903@magellan-technology.com>
	<4237CC0A.5090003@avantwave.com>
	<4237CC31.6070409@magellan-technology.com>
	<4237D666.1020302@avantwave.com>
	<4237D78C.60506@magellan-technology.com>
In-Reply-To: <4237D78C.60506@magellan-technology.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can not mount root on mtd block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Aras Vaichas wrote:

> mike wrote:
>
>> Aras Vaichas wrote:
>>
>>> mike wrote:
>>>
>>>> Dear Aras
>>>>
>>>>>
>>>>>
>>>>> What is your kernel cmdline? The error says that it doesn't 
>>>>> understand your "root=" option.
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> kernel cmdline:
>>>> root=/dev/mtdblock2 mem=16M console=ttySMX0,115200n8
>>>>
>>>> i also tried below cmdline. But the same result
>>>> root=/dev/mtd2 mem=16M console=ttySMX0,115200n8
>>>> root=1f:02 mem=16M console=ttySMX0,115200n8
>>>
>>>
>>>
>>>
>>> what is your filesystem type?
>>>
>>> for example, my command line is:
>>> root=/dev/mtdblock4 rootfstype=yaffs ... etc
>>>
>>> I'm sure that I had this same problem once and it was simply a 
>>> cmdline problem.
>>>
>>> Aras
>>>
>> i am using cramfs, i also try rootfstype=cramfs . but same result.
>> Also, i have trace the kernel to get_sb, it return ENXIO. Is it mean 
>> that i can not parse the super block or the driver problem.
>>
>> Thanks for helping
>> Mike,Lee
>
>
> Yes, I did exactly that same thing. My problem was that I was using:
>
> mtblock/4
>
> instead of:
>
> mtdblock4
>
> It was something very simple. Good luck anyway!
>
> Aras

I also try it but same result, in my rootfs i only add note like 
mtdblock0,mtdblock1.... I do not mknod mtd node to a directory
Also, the cram root fs work with 2.4.18. Do i miss something in the root 
directory?

best regard
Mike,Lee
