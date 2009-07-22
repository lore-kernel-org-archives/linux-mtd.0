Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTWvS-0007O2-Oz
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 08:11:50 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KN600DT1C3IAX@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 17:11:42 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KN6009BIC3G7K@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 17:11:42 +0900 (KST)
Date: Wed, 22 Jul 2009 13:42:38 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH] OneNAND: Runtime badblock check support
To: dedekind1@gmail.com, Kyungmin Park <kmpark@infradead.org>
Message-id: <F823D0DDE73149CB894715AF022F8E00@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <20090721025303.GA3693@july> <4A659ED4.9040702@gmail.com>
	<9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>
	<9c9fda240907211939ud11b9adiae68c076bfbbe36f@mail.gmail.com>
	<1248243590.24676.17.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,


> On Wed, 2009-07-22 at 11:39 +0900, Kyungmin Park wrote:
>> Hi,
>>
>> On Tue, Jul 21, 2009 at 8:05 PM, Kyungmin 
>> Park<kmpark@infradead.org> wrote:
>> > Hi
>> >
>> > On Tue, Jul 21, 2009 at 7:56 PM, Artem 
>> > Bityutskiy<dedekind1@gmail.com> wrote:
>> >> Hi,
>> >>
>> >> On 07/21/2009 05:53 AM, Kyungmin Park wrote:
>> >>>
>> >>> At bootloader, we don't need to read full page. It 
>> >>> takes too long time.
>> >>> Instead it only read pages required for boot.
>> >>>
>> >>> Signed-off-by: Kyungmin 
>> >>> Park<kyungmin.park@samsung.com>
>> >>> ---
>> >>
>> >> I do not understand the commit message. Could you 
>> >> please provide a better
>> >> one which explains what the patch is really doing and 
>> >> why.
>> >
>> > Right, the page means all blocks. It doesn't scan all 
>> > blocks at boot
>> > time. only some block contains kernel part are read and 
>> > boot.
>> >
>> > The goal is simple, Avoid double scanning at boot time. 
>> > One time for
>> > bootloader, Another is kernel.
>> > As you know at bootloader, only load kernel in normal 
>> > case. it means
>> > we only read the kernel bad blocks and handle it.
>> > and jump to the kernel. that's all
>> >
>
> I understand the double-scanning issue. But I still do not 
> understand
> how your patch is avoiding it? If the boot-loader has 
> scanned the
> flash, it should pass the bad-block bitmap to the kernel. 
> If you have
> on-flash BBT, then probably this is not a problem.
>
>> Experimental idea.
>> How about to integrate the bbt scan and ubi scan?
>
In my opinion integrating bbt scan and ubi scan is a valid 
idea.
It will save our double scanning issue that is available in 
UBi at apresent.
> It is possible, but isn't it better to just have on-flash 
> BBT and
> forget about any scanning for bad blocks at all?
>
> We could go even further: If the boot-loader supports ubi, 
> it could do
> the scanning and pass all UBI data to the kernel, in which 
> case UBI
> would not need to do any scanning.
>
>> At ubi scan time. it scans all ubi blocks. In different 
>> from NAND,
>> OneNAND read main page and spare page both.
>> So if runtime badblock check enabled, read the page and 
>> check oob
>> first and if it's valid. use main page. If not, set it's 
>> badblock.
>> I'm not sure how much codes are modified. :)
>>
>> How to you think?
>
> It is possible, but I think the implementation will add 
> more ugliness...
> Why not to just use on-flash BBT instead?

  implmentaing on flash bab block table will save our bbt 
scan time but flash bbt table may go huge bceuase you have 
to set full
mapping table and in big device it may be to huge.
>
> -- 
> Best Regards,
> Artem Bityutskiy (????? ????????)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
