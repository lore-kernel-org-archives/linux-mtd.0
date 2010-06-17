Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OP6Ep-0007nH-71
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2010 03:58:00 +0000
Message-ID: <4C19A01E.6060607@windriver.com>
Date: Thu, 17 Jun 2010 12:10:06 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Fix mtd-utils bugs
References: <1276248975-1822-1-git-send-email-stanley.miao@windriver.com>	
	<1276422718.19028.211.camel@localhost>
	<1276424048.19028.217.camel@localhost>
In-Reply-To: <1276424048.19028.217.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Sun, 2010-06-13 at 12:51 +0300, Artem Bityutskiy wrote:
>   
>> On Fri, 2010-06-11 at 17:36 +0800, Stanley.Miao wrote:
>>     
>>> Re-send them because I didn't give a email subject in last version.
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
>> Please, make sure your submissions have proper version. I have limited
>> amount of time and do not want to spend it figuring out which patch is
>> the latest. Use the best kernel practices and apply prefix your stuff
>> with [PATCHv3] or something like that.
>>
>> Could you please re-submit your latest version?
>>     
>
> Also, it is nice to put a short changelog, but I can live without it.
>   

Sorry for the delayed reply. I was on vacation in the past 6 days.

I will re-send them soon.

Stanley.
