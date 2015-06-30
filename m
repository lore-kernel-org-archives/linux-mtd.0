Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9q2v-0005ad-7F
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 07:33:33 +0000
Message-ID: <559244FB.8080507@cn.fujitsu.com>
Date: Tue, 30 Jun 2015 15:27:55 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <dedekind1@gmail.com>
Subject: Re: [RFC PATCH RESEND] mtd-utils: Restructure the mtd-utils source.
References: <1435647022-7318-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <559242F7.1020701@nod.at>
In-Reply-To: <559242F7.1020701@nod.at>
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

On 06/30/2015 03:19 PM, Richard Weinberger wrote:
> Am 30.06.2015 um 08:50 schrieb Dongsheng Yang:
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
>> 	|-- jffsX-utils
>> 	|-- nand-utils
>> 	|-- nor-utils
>> 	|-- ubi-utils
>> 	|-- ubifs-utils
>> 	`-- tests
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>
> Hmm, while I agree with you that the current directory structure is not perfect
> I'm not sure if it is worth the hassle. Because your patch hurts git blame.

Good point. But seems the git currently is smart enough to show the
right history in blame after a rename commit.

  # git blame misc-utils/mtd_debug.c|tail
f3f3a208 mtd_debug.c (Richard Genoud   2012-09-12 16:38:34 +0200 
388) 			err = erase_flash(fd, strtoul(argv[3], NULL, 0), 
strtoul(argv[4], NULL, 0));
37f40f55 mtd_debug.c (Josh Boyer       2006-10-09 20:49:57 -0500 
389) 			break;
37f40f55 mtd_debug.c (Josh Boyer       2006-10-09 20:49:57 -0500 390) 	}
37f40f55 mtd_debug.c (Josh Boyer       2006-10-09 20:49:57 -0500 391)
37f40f55 mtd_debug.c (Josh Boyer       2006-10-09 20:49:57 -0500 392) 
/* close device */
307ac3d6 mtd_debug.c (Brian Norris     2011-08-19 10:07:47 -0700 393) 
if (close(fd) < 0)
307ac3d6 mtd_debug.c (Brian Norris     2011-08-19 10:07:47 -0700 394) 	 
errmsg_die("close()");
37f40f55 mtd_debug.c (Josh Boyer       2006-10-09 20:49:57 -0500 395)
307ac3d6 mtd_debug.c (Brian Norris     2011-08-19 10:07:47 -0700 396) 
return err;
^72212c1 mtd_debug.c (David Woodhouse  2006-04-11 19:09:16 -0400 397) }

>
> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
