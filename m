Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OgYGb-0000jm-0a
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 07:20:03 +0000
Message-ID: <4C5917E1.8070704@windriver.com>
Date: Wed, 04 Aug 2010 15:33:53 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: Re: [PATCH v3] Fix mtd-utils bugs
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>	
	<1279442414.16247.39.camel@localhost.localdomain>
	<1280905473.15689.68.camel@localhost>
In-Reply-To: <1280905473.15689.68.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for taking so long time. I am busy with our project recently.
I have seen you merged Kavin's patches. I will read them and add my 
patches based
on them as soon as possible.

Stanley.

Artem Bityutskiy wrote:
> On Sun, 2010-07-18 at 11:40 +0300, Artem Bityutskiy wrote:
>   
>> On Sun, 2010-06-20 at 20:22 +0800, Stanley.Miao wrote:
>>     
>>> Changes from V2:
>>> 1, Get the linux version via uname() according to Joakim Tjernlund.
>>> 2, Set the default version the latest version according to Joakim Tjernlund.
>>>
>>> The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
>>> is not enough for many big NAND chips. Therefore, this structure is replaced
>>> by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
>>> Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
>>>
>>> Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
>>> keep compatible with the old linux kernel, a linux version detection function
>>> is added.
>>>
>>> YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
>>> "forcejffs2", "forceyaffs" anymore. Now clean them up. 
>>>       
>> Stanley, sorry that this all takes so long time, I do not have enough
>> time. Basically, Kevin's patches are almost there, I sent him 2 other
>> patches, as soon as he reviews them, they should go in. Then you can
>> start using libmtd for your purposes as well. You'll need to extend it a
>> bit, though.
>>
>> Vs. uname() - I do not really like this idea, because kernel version
>> does not cover the case when ECCGETLAYOUT is back-ported to older
>> kernels.
>>
>> Try to use similar technique as Kevin used - just call ECCGETLAYOUT
>> ioctl, and if it returns ENOTTY, this ioctl is not supported. See also
>> offs64_ioctl flag handling in my patches to Kevin (sent 1 yesterday, and
>> 1 today).
>>     
>
> Just a reminder than now we have Kevin's patches in and you can do your
> things on top.
>
>   
