Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMAq-0004m8-UF
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 02:45:46 +0000
Message-ID: <5634299C.6090301@cn.fujitsu.com>
Date: Sat, 31 Oct 2015 10:38:20 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: <david@sigma-star.at>, <dedekind1@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [RESEND PATCH v2 01/27] mtd-utils: Restructure the mtd-utils
 source.
References: <1444881890-4012-2-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1444882208-4455-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20151027230007.GB64073@google.com>
In-Reply-To: <20151027230007.GB64073@google.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/28/2015 07:00 AM, Brian Norris wrote:
> On Thu, Oct 15, 2015 at 12:10:08PM +0800, Dongsheng Yang wrote:
>> * There is no code modification in this commit, only moving
>> * the files to proper place.
>>
>> The user tools looks a little messy as we place almost
>> the all tools in the root directory of mtd-utils. To make
>> it more clear, I propose to introduce the following structure
>> for our source code.
>>
>> mtd-utils/
>> 	|-- lib
>> 	|-- include
>> 	|-- misc-utils
>> 	|-- flash-utils
>
> What's the difference between flash-utils and misc-utils? And don't just
> tell me it's because they were named starting with "flash" :)

Haha, I am afraid yes.
>
> Particularly, I think things like "mtdpart" and "flash_erase" are pretty
> similar levels of generic.

Agreed, I thought the flash_xxx is working in lower level than mtd_xxx.
But I found I was wrong. The are in a similar level. I will move
flash_xxx to misc-utils then.
>
> (Also, why is mtdinfo in ubi-utils still? It should be moved, IMO.)

This would be done after this restructure, then we have to move some
header files from ubi-utils to the top level and then move mtdinfo to 
misc-utils.
>
>> 	|-- jffsX-utils
>
> What makes more sense: jffsX or just jffs?

Hmmmm, I prefer jffsX for jffs and jffs2.
>
>> 	|-- nand-utils
>> 	|-- nor-utils
>
> What are specific to NOR flash? I don't even know what "rfddump" and
> "rfdformat" are. Do they really deserve their own directory?

I just read the helper of them "Formats NOR flash for resident flash
disk". Then I think there should be a nor-utils at the same time
with nand-utils.
>
>> 	|-- ubi-utils
>> 	|-- ubifs-utils
>> 	`-- tests
>
> You need to update .gitignore too.

Oh, yes, will update it.

TBH, I am not familiar with the *all* tools in our mtd-utils, so
I sent a RFC out to get more information for what I am not sure
about. But unfortunately, no response except yours.

I will send a V2 soon.

Thanx
Yang
>
> Brian
> .
>
