Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZclRO-0003w1-0h
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 02:30:23 +0000
Message-ID: <55FB75A4.6040105@cn.fujitsu.com>
Date: Fri, 18 Sep 2015 10:23:32 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>,
 <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 00/27] Introduce ubifs_dump in ubifs-utils
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55F96F61.8040201@nod.at> <55FA5220.3070402@cn.fujitsu.com>
 <55FB2EEA.2010606@nod.at>
In-Reply-To: <55FB2EEA.2010606@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/18/2015 05:21 AM, Richard Weinberger wrote:
> Am 17.09.2015 um 07:39 schrieb Dongsheng Yang:
>> On 09/16/2015 09:32 PM, Richard Weinberger wrote:
>>> Yang,
>>>
>>> Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
>>>> Hi Atem, Richard and Brian,
>>>>      This patchset introduce a userspace tool named ubifs_dump
>>>> to dump data from a ubi media.
>>>>      It will dump the areas in ubifs, such as super block,
>>>> master, log, lpt and main.
>>>>      That's helpful for us to see what exactly written in
>>>> media.
>>>>      the [1/patch] is a RESEND patch, it restructures the mtd-utils.
>>>> Please Brian help to take a look at it. thanx a lot. :)
>>>>
>>>> NOTE:
>>>>      This patch set depends on a patch I sent out [ubifs: correct the size of nnode in memset]
>>>> But you can get a full code at:
>>>> https://github.com/yangdongsheng/mtd-utils.git ubifs_dump_v1
>>>
>>> I'm looking/testing right now your patches.
>>> Your tools is useful. I like the idea, maybe the can change the name to
>>> "ubifs_dump_meta"? Do you have plans to extend it?
>> Hi Richard,
>>
>> ubifs_dump_meta? Hmmm, but I also dump data nodes in it. Do you have
>> some reason to rename it? Extend it? Of course, I would like to make it
>> better and better. But the first step is making it in mtd-utils.
>
> You are right.
> Let's keep the name. It does the same as jffs2dump.
>
>>> I'm asking because I've started working on an ubifs.fsck/debugfs tool based on
>>> some scripts and hacky other tools I wrote some time ago.
>>> So, let's coordinate and avoid double work.
>>
>> Oh, sorry for sending my patch without any asking. I thought there is
>> nobody caring about it. And what's more, I am planning to do a fsck.ubifs
>> actually. Haha, so I think we can cooperate on it. Could you share more
>> about your work so far?
>
> It started as a simple tool to unpack UBIFS.
> As unpacking involves also analyzing the whole file system we can extend
> it to repair problems.
> The first version will only be able to repair minor issue but I hope
> we can add more advanced features step by step.

Similar with what's in my mind. Let me share my idea here.

(1), ubifs_dump.
As what I sent out, this tool is dumping the metadata and data of ubifs.

(2), fsck.ubifs
This tool is going to check the all nodes in media. I did not begin it.

(3), fsck.ubifs --repair
Introduce a --repair to repair problems we found in checking.

Sounds similar with what you are going to do.

Yang
>
>>>
>>> It's first feature is being able to extract all files from an UBIFS.
>>> Scanning and identifying all UBIFS nodes, as your tool does, is a subset
>>> of the needed functionality. As you sent patches first I'll happily rebase
>>> my tool to your patches.
>>
>> Thanx a lot. :)
>>> One of the major differences is that it will work without the UBI/UBIFS kernel
>>> modules. You can use /dev/ubiXY or a plain nanddump.
>>> I hope I can release the first version soon.
>>
>> Yea, sounds very interesting, although I am not sure how it can be
>> implemented. Looking forward your release.
>
> You mean using a plain nanddump? It is not that hard, all you need is a "mini-UBI"
> implementation. My current UBIFS unpacker works so far only with nanddumps.
> It's the only thing I get from customers, nobody sends me an UBIFS only image. :D
>
> Thanks,
> //richard
> .
>
